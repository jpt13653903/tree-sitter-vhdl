library ieee;
use ieee.std_logic_1164.all;

package indent_pkg is

  constant WIDTH : positive := 8;

  function is_set (v : std_logic) return boolean;

  procedure clear (signal s : out std_logic);

end package;

package body indent_pkg is

  function is_set (v : std_logic) return boolean is
  begin
    return v = '1';
  end function;

  procedure clear (signal s : out std_logic) is
  begin
    s <= '0';
  end procedure;

end package body;
