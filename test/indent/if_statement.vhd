library ieee;
use ieee.std_logic_1164.all;

entity if_statement is
  port (
    clk : in  std_logic;
    a   : in  std_logic;
    b   : in  std_logic;
    q   : out std_logic
  );
end entity;

architecture rtl of if_statement is
begin

  process (clk)
  begin
    if rising_edge(clk) then
      if a = '1' then
        q <= '0';
      elsif b = '1' then
        q <= '1';
      else
        q <= 'Z';
      end if;
    end if;
  end process;

end architecture;
