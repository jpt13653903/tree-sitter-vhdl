-- Auto-generated large VHDL benchmark input

library IEEE;
    use IEEE.std_logic_1164.all;
    use IEEE.numeric_std.all;

entity Unit_1 is
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
end entity Unit_1;

architecture Behavioral of Unit_1 is
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

entity Unit_2 is
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
end entity Unit_2;

architecture Behavioral of Unit_2 is
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

entity Unit_3 is
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
end entity Unit_3;

architecture Behavioral of Unit_3 is
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

entity Unit_4 is
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
end entity Unit_4;

architecture Behavioral of Unit_4 is
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

entity Unit_5 is
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
end entity Unit_5;

architecture Behavioral of Unit_5 is
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

entity Unit_6 is
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
end entity Unit_6;

architecture Behavioral of Unit_6 is
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

entity Unit_7 is
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
end entity Unit_7;

architecture Behavioral of Unit_7 is
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

entity Unit_8 is
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
end entity Unit_8;

architecture Behavioral of Unit_8 is
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

entity Unit_9 is
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
end entity Unit_9;

architecture Behavioral of Unit_9 is
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

entity Unit_10 is
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
end entity Unit_10;

architecture Behavioral of Unit_10 is
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

entity Unit_11 is
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
end entity Unit_11;

architecture Behavioral of Unit_11 is
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

entity Unit_12 is
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
end entity Unit_12;

architecture Behavioral of Unit_12 is
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

entity Unit_13 is
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
end entity Unit_13;

architecture Behavioral of Unit_13 is
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

entity Unit_14 is
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
end entity Unit_14;

architecture Behavioral of Unit_14 is
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

entity Unit_15 is
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
end entity Unit_15;

architecture Behavioral of Unit_15 is
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

entity Unit_16 is
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
end entity Unit_16;

architecture Behavioral of Unit_16 is
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

entity Unit_17 is
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
end entity Unit_17;

architecture Behavioral of Unit_17 is
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

entity Unit_18 is
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
end entity Unit_18;

architecture Behavioral of Unit_18 is
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

entity Unit_19 is
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
end entity Unit_19;

architecture Behavioral of Unit_19 is
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

entity Unit_20 is
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
end entity Unit_20;

architecture Behavioral of Unit_20 is
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

entity Unit_21 is
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
end entity Unit_21;

architecture Behavioral of Unit_21 is
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

entity Unit_22 is
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
end entity Unit_22;

architecture Behavioral of Unit_22 is
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

entity Unit_23 is
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
end entity Unit_23;

architecture Behavioral of Unit_23 is
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

entity Unit_24 is
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
end entity Unit_24;

architecture Behavioral of Unit_24 is
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

entity Unit_25 is
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
end entity Unit_25;

architecture Behavioral of Unit_25 is
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

entity Unit_26 is
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
end entity Unit_26;

architecture Behavioral of Unit_26 is
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

entity Unit_27 is
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
end entity Unit_27;

architecture Behavioral of Unit_27 is
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

entity Unit_28 is
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
end entity Unit_28;

architecture Behavioral of Unit_28 is
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

entity Unit_29 is
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
end entity Unit_29;

architecture Behavioral of Unit_29 is
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

entity Unit_30 is
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
end entity Unit_30;

architecture Behavioral of Unit_30 is
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

entity Unit_31 is
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
end entity Unit_31;

architecture Behavioral of Unit_31 is
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

entity Unit_32 is
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
end entity Unit_32;

architecture Behavioral of Unit_32 is
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

entity Unit_33 is
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
end entity Unit_33;

architecture Behavioral of Unit_33 is
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

entity Unit_34 is
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
end entity Unit_34;

architecture Behavioral of Unit_34 is
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

entity Unit_35 is
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
end entity Unit_35;

architecture Behavioral of Unit_35 is
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

entity Unit_36 is
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
end entity Unit_36;

architecture Behavioral of Unit_36 is
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

entity Unit_37 is
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
end entity Unit_37;

architecture Behavioral of Unit_37 is
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

entity Unit_38 is
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
end entity Unit_38;

architecture Behavioral of Unit_38 is
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

entity Unit_39 is
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
end entity Unit_39;

architecture Behavioral of Unit_39 is
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

entity Unit_40 is
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
end entity Unit_40;

architecture Behavioral of Unit_40 is
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

entity Unit_41 is
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
end entity Unit_41;

architecture Behavioral of Unit_41 is
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

entity Unit_42 is
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
end entity Unit_42;

architecture Behavioral of Unit_42 is
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

entity Unit_43 is
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
end entity Unit_43;

architecture Behavioral of Unit_43 is
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

entity Unit_44 is
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
end entity Unit_44;

architecture Behavioral of Unit_44 is
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

entity Unit_45 is
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
end entity Unit_45;

architecture Behavioral of Unit_45 is
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

entity Unit_46 is
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
end entity Unit_46;

architecture Behavioral of Unit_46 is
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

entity Unit_47 is
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
end entity Unit_47;

architecture Behavioral of Unit_47 is
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

entity Unit_48 is
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
end entity Unit_48;

architecture Behavioral of Unit_48 is
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

entity Unit_49 is
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
end entity Unit_49;

architecture Behavioral of Unit_49 is
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

entity Unit_50 is
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
end entity Unit_50;

architecture Behavioral of Unit_50 is
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

entity Unit_51 is
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
end entity Unit_51;

architecture Behavioral of Unit_51 is
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

entity Unit_52 is
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
end entity Unit_52;

architecture Behavioral of Unit_52 is
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

entity Unit_53 is
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
end entity Unit_53;

architecture Behavioral of Unit_53 is
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

entity Unit_54 is
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
end entity Unit_54;

architecture Behavioral of Unit_54 is
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

entity Unit_55 is
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
end entity Unit_55;

architecture Behavioral of Unit_55 is
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

entity Unit_56 is
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
end entity Unit_56;

architecture Behavioral of Unit_56 is
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

entity Unit_57 is
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
end entity Unit_57;

architecture Behavioral of Unit_57 is
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

entity Unit_58 is
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
end entity Unit_58;

architecture Behavioral of Unit_58 is
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

entity Unit_59 is
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
end entity Unit_59;

architecture Behavioral of Unit_59 is
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

entity Unit_60 is
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
end entity Unit_60;

architecture Behavioral of Unit_60 is
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

entity Unit_61 is
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
end entity Unit_61;

architecture Behavioral of Unit_61 is
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

entity Unit_62 is
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
end entity Unit_62;

architecture Behavioral of Unit_62 is
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

entity Unit_63 is
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
end entity Unit_63;

architecture Behavioral of Unit_63 is
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

entity Unit_64 is
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
end entity Unit_64;

architecture Behavioral of Unit_64 is
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

entity Unit_65 is
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
end entity Unit_65;

architecture Behavioral of Unit_65 is
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

entity Unit_66 is
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
end entity Unit_66;

architecture Behavioral of Unit_66 is
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

entity Unit_67 is
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
end entity Unit_67;

architecture Behavioral of Unit_67 is
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

entity Unit_68 is
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
end entity Unit_68;

architecture Behavioral of Unit_68 is
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

entity Unit_69 is
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
end entity Unit_69;

architecture Behavioral of Unit_69 is
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

entity Unit_70 is
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
end entity Unit_70;

architecture Behavioral of Unit_70 is
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

entity Unit_71 is
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
end entity Unit_71;

architecture Behavioral of Unit_71 is
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

entity Unit_72 is
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
end entity Unit_72;

architecture Behavioral of Unit_72 is
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

entity Unit_73 is
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
end entity Unit_73;

architecture Behavioral of Unit_73 is
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

entity Unit_74 is
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
end entity Unit_74;

architecture Behavioral of Unit_74 is
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

entity Unit_75 is
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
end entity Unit_75;

architecture Behavioral of Unit_75 is
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

entity Unit_76 is
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
end entity Unit_76;

architecture Behavioral of Unit_76 is
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

entity Unit_77 is
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
end entity Unit_77;

architecture Behavioral of Unit_77 is
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

entity Unit_78 is
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
end entity Unit_78;

architecture Behavioral of Unit_78 is
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

entity Unit_79 is
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
end entity Unit_79;

architecture Behavioral of Unit_79 is
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

entity Unit_80 is
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
end entity Unit_80;

architecture Behavioral of Unit_80 is
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

entity Unit_81 is
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
end entity Unit_81;

architecture Behavioral of Unit_81 is
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

entity Unit_82 is
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
end entity Unit_82;

architecture Behavioral of Unit_82 is
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

entity Unit_83 is
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
end entity Unit_83;

architecture Behavioral of Unit_83 is
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

entity Unit_84 is
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
end entity Unit_84;

architecture Behavioral of Unit_84 is
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

entity Unit_85 is
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
end entity Unit_85;

architecture Behavioral of Unit_85 is
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

entity Unit_86 is
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
end entity Unit_86;

architecture Behavioral of Unit_86 is
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

entity Unit_87 is
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
end entity Unit_87;

architecture Behavioral of Unit_87 is
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

entity Unit_88 is
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
end entity Unit_88;

architecture Behavioral of Unit_88 is
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

entity Unit_89 is
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
end entity Unit_89;

architecture Behavioral of Unit_89 is
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

entity Unit_90 is
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
end entity Unit_90;

architecture Behavioral of Unit_90 is
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

entity Unit_91 is
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
end entity Unit_91;

architecture Behavioral of Unit_91 is
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

entity Unit_92 is
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
end entity Unit_92;

architecture Behavioral of Unit_92 is
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

entity Unit_93 is
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
end entity Unit_93;

architecture Behavioral of Unit_93 is
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

entity Unit_94 is
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
end entity Unit_94;

architecture Behavioral of Unit_94 is
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

entity Unit_95 is
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
end entity Unit_95;

architecture Behavioral of Unit_95 is
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

entity Unit_96 is
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
end entity Unit_96;

architecture Behavioral of Unit_96 is
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

entity Unit_97 is
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
end entity Unit_97;

architecture Behavioral of Unit_97 is
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

entity Unit_98 is
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
end entity Unit_98;

architecture Behavioral of Unit_98 is
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

entity Unit_99 is
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
end entity Unit_99;

architecture Behavioral of Unit_99 is
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

entity Unit_100 is
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
end entity Unit_100;

architecture Behavioral of Unit_100 is
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

entity Unit_101 is
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
end entity Unit_101;

architecture Behavioral of Unit_101 is
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

entity Unit_102 is
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
end entity Unit_102;

architecture Behavioral of Unit_102 is
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

entity Unit_103 is
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
end entity Unit_103;

architecture Behavioral of Unit_103 is
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

entity Unit_104 is
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
end entity Unit_104;

architecture Behavioral of Unit_104 is
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

entity Unit_105 is
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
end entity Unit_105;

architecture Behavioral of Unit_105 is
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

entity Unit_106 is
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
end entity Unit_106;

architecture Behavioral of Unit_106 is
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

entity Unit_107 is
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
end entity Unit_107;

architecture Behavioral of Unit_107 is
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

entity Unit_108 is
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
end entity Unit_108;

architecture Behavioral of Unit_108 is
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

entity Unit_109 is
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
end entity Unit_109;

architecture Behavioral of Unit_109 is
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

entity Unit_110 is
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
end entity Unit_110;

architecture Behavioral of Unit_110 is
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

entity Unit_111 is
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
end entity Unit_111;

architecture Behavioral of Unit_111 is
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

entity Unit_112 is
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
end entity Unit_112;

architecture Behavioral of Unit_112 is
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

entity Unit_113 is
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
end entity Unit_113;

architecture Behavioral of Unit_113 is
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

entity Unit_114 is
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
end entity Unit_114;

architecture Behavioral of Unit_114 is
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

entity Unit_115 is
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
end entity Unit_115;

architecture Behavioral of Unit_115 is
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

entity Unit_116 is
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
end entity Unit_116;

architecture Behavioral of Unit_116 is
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

entity Unit_117 is
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
end entity Unit_117;

architecture Behavioral of Unit_117 is
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

entity Unit_118 is
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
end entity Unit_118;

architecture Behavioral of Unit_118 is
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

entity Unit_119 is
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
end entity Unit_119;

architecture Behavioral of Unit_119 is
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

entity Unit_120 is
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
end entity Unit_120;

architecture Behavioral of Unit_120 is
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

entity Unit_121 is
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
end entity Unit_121;

architecture Behavioral of Unit_121 is
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

entity Unit_122 is
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
end entity Unit_122;

architecture Behavioral of Unit_122 is
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

entity Unit_123 is
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
end entity Unit_123;

architecture Behavioral of Unit_123 is
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

entity Unit_124 is
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
end entity Unit_124;

architecture Behavioral of Unit_124 is
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

entity Unit_125 is
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
end entity Unit_125;

architecture Behavioral of Unit_125 is
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

entity Unit_126 is
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
end entity Unit_126;

architecture Behavioral of Unit_126 is
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

entity Unit_127 is
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
end entity Unit_127;

architecture Behavioral of Unit_127 is
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

entity Unit_128 is
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
end entity Unit_128;

architecture Behavioral of Unit_128 is
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

entity Unit_129 is
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
end entity Unit_129;

architecture Behavioral of Unit_129 is
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

entity Unit_130 is
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
end entity Unit_130;

architecture Behavioral of Unit_130 is
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

entity Unit_131 is
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
end entity Unit_131;

architecture Behavioral of Unit_131 is
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

entity Unit_132 is
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
end entity Unit_132;

architecture Behavioral of Unit_132 is
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

entity Unit_133 is
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
end entity Unit_133;

architecture Behavioral of Unit_133 is
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

entity Unit_134 is
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
end entity Unit_134;

architecture Behavioral of Unit_134 is
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

entity Unit_135 is
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
end entity Unit_135;

architecture Behavioral of Unit_135 is
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

entity Unit_136 is
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
end entity Unit_136;

architecture Behavioral of Unit_136 is
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

entity Unit_137 is
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
end entity Unit_137;

architecture Behavioral of Unit_137 is
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

entity Unit_138 is
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
end entity Unit_138;

architecture Behavioral of Unit_138 is
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

entity Unit_139 is
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
end entity Unit_139;

architecture Behavioral of Unit_139 is
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

entity Unit_140 is
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
end entity Unit_140;

architecture Behavioral of Unit_140 is
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

entity Unit_141 is
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
end entity Unit_141;

architecture Behavioral of Unit_141 is
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

entity Unit_142 is
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
end entity Unit_142;

architecture Behavioral of Unit_142 is
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

entity Unit_143 is
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
end entity Unit_143;

architecture Behavioral of Unit_143 is
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

entity Unit_144 is
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
end entity Unit_144;

architecture Behavioral of Unit_144 is
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

entity Unit_145 is
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
end entity Unit_145;

architecture Behavioral of Unit_145 is
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

entity Unit_146 is
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
end entity Unit_146;

architecture Behavioral of Unit_146 is
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

entity Unit_147 is
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
end entity Unit_147;

architecture Behavioral of Unit_147 is
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

entity Unit_148 is
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
end entity Unit_148;

architecture Behavioral of Unit_148 is
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

entity Unit_149 is
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
end entity Unit_149;

architecture Behavioral of Unit_149 is
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

entity Unit_150 is
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
end entity Unit_150;

architecture Behavioral of Unit_150 is
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

entity Unit_151 is
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
end entity Unit_151;

architecture Behavioral of Unit_151 is
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

entity Unit_152 is
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
end entity Unit_152;

architecture Behavioral of Unit_152 is
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

entity Unit_153 is
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
end entity Unit_153;

architecture Behavioral of Unit_153 is
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

entity Unit_154 is
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
end entity Unit_154;

architecture Behavioral of Unit_154 is
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

entity Unit_155 is
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
end entity Unit_155;

architecture Behavioral of Unit_155 is
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

entity Unit_156 is
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
end entity Unit_156;

architecture Behavioral of Unit_156 is
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

entity Unit_157 is
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
end entity Unit_157;

architecture Behavioral of Unit_157 is
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

entity Unit_158 is
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
end entity Unit_158;

architecture Behavioral of Unit_158 is
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

entity Unit_159 is
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
end entity Unit_159;

architecture Behavioral of Unit_159 is
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

entity Unit_160 is
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
end entity Unit_160;

architecture Behavioral of Unit_160 is
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

entity Unit_161 is
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
end entity Unit_161;

architecture Behavioral of Unit_161 is
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

entity Unit_162 is
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
end entity Unit_162;

architecture Behavioral of Unit_162 is
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

entity Unit_163 is
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
end entity Unit_163;

architecture Behavioral of Unit_163 is
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

entity Unit_164 is
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
end entity Unit_164;

architecture Behavioral of Unit_164 is
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

entity Unit_165 is
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
end entity Unit_165;

architecture Behavioral of Unit_165 is
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

entity Unit_166 is
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
end entity Unit_166;

architecture Behavioral of Unit_166 is
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

entity Unit_167 is
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
end entity Unit_167;

architecture Behavioral of Unit_167 is
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

entity Unit_168 is
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
end entity Unit_168;

architecture Behavioral of Unit_168 is
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

entity Unit_169 is
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
end entity Unit_169;

architecture Behavioral of Unit_169 is
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

entity Unit_170 is
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
end entity Unit_170;

architecture Behavioral of Unit_170 is
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

entity Unit_171 is
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
end entity Unit_171;

architecture Behavioral of Unit_171 is
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

entity Unit_172 is
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
end entity Unit_172;

architecture Behavioral of Unit_172 is
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

entity Unit_173 is
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
end entity Unit_173;

architecture Behavioral of Unit_173 is
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

entity Unit_174 is
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
end entity Unit_174;

architecture Behavioral of Unit_174 is
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

entity Unit_175 is
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
end entity Unit_175;

architecture Behavioral of Unit_175 is
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

entity Unit_176 is
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
end entity Unit_176;

architecture Behavioral of Unit_176 is
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

entity Unit_177 is
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
end entity Unit_177;

architecture Behavioral of Unit_177 is
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

entity Unit_178 is
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
end entity Unit_178;

architecture Behavioral of Unit_178 is
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

entity Unit_179 is
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
end entity Unit_179;

architecture Behavioral of Unit_179 is
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

entity Unit_180 is
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
end entity Unit_180;

architecture Behavioral of Unit_180 is
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

entity Unit_181 is
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
end entity Unit_181;

architecture Behavioral of Unit_181 is
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

entity Unit_182 is
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
end entity Unit_182;

architecture Behavioral of Unit_182 is
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

entity Unit_183 is
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
end entity Unit_183;

architecture Behavioral of Unit_183 is
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

entity Unit_184 is
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
end entity Unit_184;

architecture Behavioral of Unit_184 is
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

entity Unit_185 is
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
end entity Unit_185;

architecture Behavioral of Unit_185 is
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

entity Unit_186 is
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
end entity Unit_186;

architecture Behavioral of Unit_186 is
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

entity Unit_187 is
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
end entity Unit_187;

architecture Behavioral of Unit_187 is
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

entity Unit_188 is
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
end entity Unit_188;

architecture Behavioral of Unit_188 is
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

entity Unit_189 is
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
end entity Unit_189;

architecture Behavioral of Unit_189 is
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

entity Unit_190 is
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
end entity Unit_190;

architecture Behavioral of Unit_190 is
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

entity Unit_191 is
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
end entity Unit_191;

architecture Behavioral of Unit_191 is
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

entity Unit_192 is
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
end entity Unit_192;

architecture Behavioral of Unit_192 is
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

entity Unit_193 is
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
end entity Unit_193;

architecture Behavioral of Unit_193 is
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

entity Unit_194 is
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
end entity Unit_194;

architecture Behavioral of Unit_194 is
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

entity Unit_195 is
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
end entity Unit_195;

architecture Behavioral of Unit_195 is
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

entity Unit_196 is
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
end entity Unit_196;

architecture Behavioral of Unit_196 is
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

entity Unit_197 is
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
end entity Unit_197;

architecture Behavioral of Unit_197 is
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

entity Unit_198 is
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
end entity Unit_198;

architecture Behavioral of Unit_198 is
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

entity Unit_199 is
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
end entity Unit_199;

architecture Behavioral of Unit_199 is
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

entity Unit_200 is
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
end entity Unit_200;

architecture Behavioral of Unit_200 is
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
