library ieee;
use ieee.std_logic_1164.all;

entity loop_statement is
  port (
    clk : in  std_logic;
    d   : in  std_logic_vector(7 downto 0);
    q   : out std_logic_vector(7 downto 0)
  );
end entity;

architecture rtl of loop_statement is
begin

  process (clk)
    variable n : natural;
  begin
    if rising_edge(clk) then
      for i in 0 to 7 loop
        if d(i) = '1' then
          q(i) <= '1';
        else
          q(i) <= '0';
        end if;
      end loop;
      n := 0;
      while n < 8 loop
        n := n + 1;
      end loop;
    end if;
  end process;

end architecture;
