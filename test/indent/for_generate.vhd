library ieee;
use ieee.std_logic_1164.all;

entity for_generate is
  generic (
    WIDTH : positive := 8
  );
  port (
    d  : in  std_logic_vector(WIDTH - 1 downto 0);
    q1 : out std_logic_vector(WIDTH - 1 downto 0);
    q2 : out std_logic_vector(WIDTH - 1 downto 0)
  );
end entity;

architecture rtl of for_generate is
  signal buf : std_logic_vector(WIDTH - 1 downto 0);
begin

  g_simple : for i in 0 to WIDTH - 1 generate
    buf(i) <= d(i);
    q1(i) <= buf(i);
  end generate;

  g_declarative : for i in 0 to WIDTH - 1 generate
    signal t : std_logic;
  begin
    t <= buf(i);
    q2(i) <= t;
  end generate;

end architecture;
