library ieee;
use ieee.std_logic_1164.all;

entity interface_list is
  generic (
    WIDTH : positive := 8;
    DEPTH : positive := 4
  );
  port (
    clk : in  std_logic;
    d   : in  std_logic_vector(WIDTH - 1 downto 0);
    q   : out std_logic_vector(WIDTH - 1 downto 0)
  );
end entity;

architecture rtl of interface_list is
begin
  q <= d;
end architecture;
