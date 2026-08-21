library ieee;
use ieee.std_logic_1164.all;

entity component_instantiation is
  port (
    clk : in  std_logic;
    q   : out std_logic
  );
end entity;

architecture struct of component_instantiation is

  component child is
    generic (
      WIDTH : positive := 8
    );
    port (
      clk : in  std_logic;
      q   : out std_logic
    );
  end component;

begin

  u_child : child
    generic map (
      WIDTH => 4
    )
    port map (
      clk => clk,
      q   => q
    );

end architecture;
