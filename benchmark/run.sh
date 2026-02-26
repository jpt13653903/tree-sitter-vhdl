#!/usr/bin/env bash
#
# Benchmark tree-sitter-vhdl parser: master vs feature/thread-safety
#
# Builds the benchmark binary on each branch (statically linking the parser),
# then uses hyperfine for statistical comparison.
#
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BENCH_DIR="$REPO_ROOT/benchmark"
BUILD_DIR="$BENCH_DIR/build"
INPUT_SMALL="$BENCH_DIR/input_small.vhd"
INPUT_LARGE="$BENCH_DIR/input_large.vhd"

TS_INCLUDE="/opt/homebrew/Cellar/tree-sitter@0.25/0.25.10/include"
TS_LIB="/opt/homebrew/Cellar/tree-sitter@0.25/0.25.10/lib"

BRANCHES=("master" "feature/thread-safety")

export DYLD_LIBRARY_PATH="$TS_LIB${DYLD_LIBRARY_PATH:+:$DYLD_LIBRARY_PATH}"

# --- Helpers ----------------------------------------------------------------

cleanup() {
    echo "Restoring original branch..."
    git -C "$REPO_ROOT" checkout --quiet master 2>/dev/null || true
}

build_bench() {
    local branch="$1"
    local safe_name="${branch//\//_}"
    local out="$BUILD_DIR/bench_${safe_name}"

    echo "=== Building benchmark for: $branch ==="
    git -C "$REPO_ROOT" checkout --quiet "$branch"

    cc -O2 -std=c11 \
       -I "$TS_INCLUDE" \
       -I "$REPO_ROOT/src" \
       "$BENCH_DIR/bench.c" \
       "$REPO_ROOT/src/parser.c" \
       "$REPO_ROOT/src/scanner.c" \
       -L "$TS_LIB" \
       -ltree-sitter \
       -o "$out"

    echo "  -> $out"
}

# --- Generate test inputs ---------------------------------------------------

generate_inputs() {
    # Small: the example file (94 lines, ~2.5 KB)
    cp "$REPO_ROOT/examples/Screenshot.vhd" "$INPUT_SMALL"

    # Large: repeat entity/architecture blocks to get ~100KB of VHDL
    echo "-- Auto-generated large VHDL benchmark input" > "$INPUT_LARGE"
    echo "" >> "$INPUT_LARGE"
    cat >> "$INPUT_LARGE" << 'HEADER'
library IEEE;
    use IEEE.std_logic_1164.all;
    use IEEE.numeric_std.all;
HEADER

    for i in $(seq 1 200); do
        cat >> "$INPUT_LARGE" << BLOCK

entity Unit_${i} is
  generic(
    DATA_WIDTH : integer := 8;
    ADDR_WIDTH : integer := 16;
    CLK_FREQ   : integer := 100_000_000
  );
  port(
    clk       : in  std_logic;
    rst       : in  std_logic;
    data_in   : in  std_logic_vector(DATA_WIDTH-1 downto 0);
    data_out  : out std_logic_vector(DATA_WIDTH-1 downto 0);
    addr      : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
    we        : in  std_logic;
    valid     : out std_logic;
    ready     : in  std_logic
  );
end entity Unit_${i};

architecture Behavioral of Unit_${i} is
  type state_type is (IDLE, LOAD, PROCESS, STORE, DONE);
  signal current_state, next_state : state_type;
  signal data_reg   : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal addr_reg   : std_logic_vector(ADDR_WIDTH-1 downto 0);
  signal counter    : unsigned(15 downto 0);
  constant TIMEOUT  : unsigned(15 downto 0) := to_unsigned(1000, 16);
begin
  state_proc: process(clk, rst) is
  begin
    if rst = '1' then
      current_state <= IDLE;
      data_reg      <= (others => '0');
      addr_reg      <= (others => '0');
      counter       <= (others => '0');
    elsif rising_edge(clk) then
      current_state <= next_state;
      case current_state is
        when IDLE =>
          if we = '1' then
            data_reg <= data_in;
            addr_reg <= addr;
          end if;
        when LOAD =>
          counter <= counter + 1;
        when PROCESS =>
          data_reg <= std_logic_vector(unsigned(data_reg) + 1);
        when STORE =>
          counter <= (others => '0');
        when DONE =>
          null;
        when others =>
          null;
      end case;
    end if;
  end process state_proc;

  comb_proc: process(current_state, we, ready, counter) is
  begin
    next_state <= current_state;
    valid      <= '0';
    case current_state is
      when IDLE =>
        if we = '1' then
          next_state <= LOAD;
        end if;
      when LOAD =>
        if counter >= TIMEOUT then
          next_state <= PROCESS;
        end if;
      when PROCESS =>
        next_state <= STORE;
      when STORE =>
        valid <= '1';
        if ready = '1' then
          next_state <= DONE;
        end if;
      when DONE =>
        next_state <= IDLE;
      when others =>
        next_state <= IDLE;
    end case;
  end process comb_proc;

  data_out <= data_reg;
end architecture Behavioral;
BLOCK
    done

    local size
    size=$(wc -c < "$INPUT_LARGE" | tr -d ' ')
    local lines
    lines=$(wc -l < "$INPUT_LARGE" | tr -d ' ')
    echo "Generated large input: $lines lines, $((size / 1024)) KB"
}

# --- Main -------------------------------------------------------------------

trap cleanup EXIT

mkdir -p "$BUILD_DIR"

echo "Generating benchmark inputs..."
generate_inputs

small_size=$(wc -c < "$INPUT_SMALL" | tr -d ' ')
large_size=$(wc -c < "$INPUT_LARGE" | tr -d ' ')
echo "Small input: $(wc -l < "$INPUT_SMALL" | tr -d ' ') lines, $((small_size / 1024)) KB"
echo ""

# Build benchmark binaries for each branch
for branch in "${BRANCHES[@]}"; do
    build_bench "$branch"
done
echo ""

BENCH_MASTER="$BUILD_DIR/bench_master"
BENCH_TS="$BUILD_DIR/bench_feature_thread-safety"

echo "================================================================"
echo "BENCHMARK 1: Parser create + destroy (token tree build cost)"
echo "================================================================"
echo ""
hyperfine \
    --warmup 3 \
    --min-runs 10 \
    -n "master" "$BENCH_MASTER create 500" \
    -n "thread-safety" "$BENCH_TS create 500"

echo ""
echo "================================================================"
echo "BENCHMARK 2: Parse throughput - small file ($(wc -l < "$INPUT_SMALL" | tr -d ' ') lines)"
echo "================================================================"
echo ""
hyperfine \
    --warmup 3 \
    --min-runs 10 \
    -n "master" "$BENCH_MASTER parse $INPUT_SMALL 2000" \
    -n "thread-safety" "$BENCH_TS parse $INPUT_SMALL 2000"

echo ""
echo "================================================================"
echo "BENCHMARK 3: Parse throughput - large file ($(wc -l < "$INPUT_LARGE" | tr -d ' ') lines)"
echo "================================================================"
echo ""
hyperfine \
    --warmup 3 \
    --min-runs 10 \
    -n "master" "$BENCH_MASTER parse $INPUT_LARGE 100" \
    -n "thread-safety" "$BENCH_TS parse $INPUT_LARGE 100"

echo ""
echo "================================================================"
echo "BENCHMARK 4: Full lifecycle - small file (create+parse+destroy)"
echo "================================================================"
echo ""
hyperfine \
    --warmup 3 \
    --min-runs 10 \
    -n "master" "$BENCH_MASTER lifecycle $INPUT_SMALL 500" \
    -n "thread-safety" "$BENCH_TS lifecycle $INPUT_SMALL 500"

echo ""
echo "================================================================"
echo "BENCHMARK 5: Full lifecycle - large file (create+parse+destroy)"
echo "================================================================"
echo ""
hyperfine \
    --warmup 3 \
    --min-runs 10 \
    -n "master" "$BENCH_MASTER lifecycle $INPUT_LARGE 50" \
    -n "thread-safety" "$BENCH_TS lifecycle $INPUT_LARGE 50"

echo ""
echo "================================================================"
echo "DONE"
echo "================================================================"
