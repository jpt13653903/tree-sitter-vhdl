library ieee;
use ieee.std_logic_1164.all;

entity case_generate is
  generic (
    MODE : natural := 0
  );
  port (
    d : in  std_logic_vector(7 downto 0);
    q : out std_logic_vector(7 downto 0)
  );
end entity;

architecture rtl of case_generate is
begin

  g_mode : case MODE generate
    when 0 =>
      q <= d;
    when 1 =>
      q <= not d;
    when others =>
      q <= (others => '0');
  end generate;

end architecture;
