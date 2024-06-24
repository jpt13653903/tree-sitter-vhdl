library work;
    use work.whatnot.all;

library std;
    use std.whatnot.all;

library ieee;
    use ieee.whatnot.all;

entity Full_Adder is
  port(
    Clk   : in  std_logic;
    Reset : in  std_logic
  );
end entity Full_Adder;

-- A body of entity Full_Adder:
architecture DataFlow of Full_Adder is
  signal A,B: Bit;

  function "-"    (A : std_logic) return integer;
  function MyFunc (A : std_logic) return integer;
  function "??"   (A : std_logic) return integer;
  function "and"  (A : std_logic) return integer;
  function "or"   (A : std_logic) return integer;
  function "nand" (A : std_logic) return integer;
  function "nor"  (A : std_logic) return integer;
  function "xor"  (A : std_logic) return integer;
  function "xnor" (A : std_logic) return integer;
  function "="    (A : std_logic) return integer;
  function "/="   (A : std_logic) return integer;
  function "<"    (A : std_logic) return integer;
  function "<="   (A : std_logic) return integer;
  function ">"    (A : std_logic) return integer;
  function ">="   (A : std_logic) return integer;
  function "?="   (A : std_logic) return integer;
  function "?/="  (A : std_logic) return integer;
  function "?<"   (A : std_logic) return integer;
  function "?<="  (A : std_logic) return integer;
  function "?>"   (A : std_logic) return integer;
  function "?>="  (A : std_logic) return integer;
  function "sll"  (A : std_logic) return integer;
  function "srl"  (A : std_logic) return integer;
  function "sla"  (A : std_logic) return integer;
  function "sra"  (A : std_logic) return integer;
  function "rol"  (A : std_logic) return integer;
  function "ror"  (A : std_logic) return integer;
  function "+"    (A : std_logic) return integer;
  function "-"    (A : std_logic) return integer;
  function "&"    (A : std_logic) return integer;
  function "*"    (A : std_logic) return integer;
  function "/"    (A : std_logic) return integer;
  function "mod"  (A : std_logic) return integer;
  function "rem"  (A : std_logic) return integer;
  function "**"   (A : std_logic) return integer;
  function "abs"  (A : std_logic) return integer;
  function "not"  (A : std_logic) return integer;
begin
  MyInstance: entity work.Whatnot port map(
    Clock => Clk,
    Reset => Reset
  );

  A    <= X xor Y;
  B    <= A and Cin;
  Sum  <= A xor Cin;
  Cout <= B or (X and Y);

  process(A, B, C) is
    constant B : float := 8.291;
    variable A : integer := 5;
  begin
    if(rising_edge(Clk)) then
        A <= 5;
    else
        C <= 7;
    end if;
    for n in 0 to 3 loop
      case(WrRegisters.BenchTesting.HBW_Select(n)) is
        when "01"   => opHBW_SEL(n+1) <= '1';
        when "10"   => opHBW_SEL(n+1) <= '0';
        when others => opHBW_SEL(n+1) <= ipUSER_DIP(n);
      end case;
    end loop;
  end process;
  opHBW_SEL_N <= not(opHBW_SEL);
end architecture DataFlow;

