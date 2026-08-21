library ieee;
use ieee.std_logic_1164.all;

entity block_statement is
  port (
    d : in  std_logic;
    q : out std_logic
  );
end entity;

architecture rtl of block_statement is
begin

  b_wrap : block
    signal t : std_logic;
  begin
    t <= d;
    q <= t;
  end block;

end architecture;
