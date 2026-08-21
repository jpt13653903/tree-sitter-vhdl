library ieee;
use ieee.std_logic_1164.all;

entity process_statement is
  port (
    clk : in  std_logic;
    d   : in  std_logic;
    q   : out std_logic
  );
end entity;

architecture rtl of process_statement is
  signal level : std_logic;
begin

  p_with_is : process (clk) is
    variable v : std_logic;
  begin
    if rising_edge(clk) then
      v := d;
      level <= v;
    end if;
  end process;

  p_no_is : process (clk)
    variable w : std_logic;
  begin
    if rising_edge(clk) then
      w := level;
      q <= w;
    end if;
  end process;

end architecture;
