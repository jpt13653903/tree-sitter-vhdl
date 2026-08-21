library ieee;
use ieee.std_logic_1164.all;

entity subprogram is
  port (
    clk : in  std_logic;
    q   : out std_logic
  );
end entity;

architecture rtl of subprogram is

  function parity (v : std_logic_vector) return std_logic is
    variable acc : std_logic := '0';
  begin
    for i in v'range loop
      acc := acc xor v(i);
    end loop;
    return acc;
  end function;

  procedure pulse (signal s : out std_logic) is
  begin
    s <= '1';
  end procedure;

  signal level : std_logic;

begin

  process (clk)
  begin
    if rising_edge(clk) then
      level <= parity("10100110");
    end if;
  end process;

  q <= level;

end architecture;
