library ieee;
use ieee.std_logic_1164.all;

entity case_statement is
  port (
    clk : in  std_logic;
    sel : in  std_logic_vector(1 downto 0);
    q   : out std_logic
  );
end entity;

architecture rtl of case_statement is
begin

  process (clk)
  begin
    if rising_edge(clk) then
      case sel is
        when "00" =>
          q <= '0';
        when "01" =>
          q <= '1';
        when others =>
          q <= 'Z';
      end case;
    end if;
  end process;

end architecture;
