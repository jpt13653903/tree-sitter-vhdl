/*------------------------------------------------------------------------------

Header block comment
------------------------------------------------------------------------------*/

library IEEE;
    use IEEE.std_logic_1164.all;
    use IEEE.numeric_std.all;

library work;
    use work.MyConstants.all;
    use work.MyRegisters.all;
--------------------------------------------------------------------------------

`if VHDL_VERSION > "2000" then
  `warning "This version is cool"
`else
  `error "This version is bad"
`end if
--------------------------------------------------------------------------------

package interfaces is
  type streaming_bus is record               -- the record definition
    data  : std_logic_vector(7 downto 0);
    valid : std_logic;
    ready : std_logic;
  end record;

  view streaming_master of streaming_bus is  -- the mode view of the record
    valid, data : out;
    ready       : in;
  end view;

  alias streaming_slave is streaming_master'converse;

  function MyFunc (x: integer) return float;
end interfaces;
--------------------------------------------------------------------------------

package body interfaces is
  function MyFunc (x: integer) return float is
    variable a, b, c: integer;
  begin
    return float(x + a) / float(b*c);
  end function MyFunc;
end package body interfaces;
--------------------------------------------------------------------------------

entity Processor is
  port(
    clk, rst : in   std_logic;
    adc_data : view streaming_slave;
    ddc_data : view streaming_master
  );
end entity Processor;
--------------------------------------------------------------------------------

architecture Behaviour of Processor is
  signal clk, rst        : std_logic;
  signal bus_in, bus_out : streaming_bus;
begin
  producer : entity work.source port map(clk, rst, bus_in);
  consumer : entity work.sink   port map(clk, rst, bus_out);

  bus_in.ready <= bus_out.ready;

  digital_downconverter: process(clk) is
    variable temp : integer;
  begin
    if(rising_edge(clk)) then
      if(reset) then
        bus_out <= (data => (others => 'X'), valid => '0');
      else
        if(bus_out.ready) then
          -- TODO: Implement the DDC
          bus_out.data  <= bus_in.data;
          bus_out.valid <= bus_in.valid;
        else
          bus_out.valid <= '0';
        end if;
      end if;
    end if;
  end process digital_downconverter;
end Behaviour;
--------------------------------------------------------------------------------

