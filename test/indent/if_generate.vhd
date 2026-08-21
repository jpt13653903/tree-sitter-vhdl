library ieee;
use ieee.std_logic_1164.all;

entity if_generate is
  generic (
    MODE : natural := 0
  );
  port (
    d : in  std_logic_vector(7 downto 0);
    q : out std_logic_vector(7 downto 0)
  );
end entity;

architecture rtl of if_generate is
begin

  g_mode : if MODE = 0 generate
    q <= d;
  elsif MODE = 1 generate
    q <= not d;
  else generate
    q <= (others => '0');
  end generate;

end architecture;
