library ieee;
use ieee.std_logic_1164.all;

package record_type_pkg is

  type axis_t is record
    tdata  : std_logic_vector(7 downto 0);
    tvalid : std_logic;
    tready : std_logic;
  end record;

  type control_t is record
    enable : std_logic;
    mode   : natural;
  end record;

end package;
