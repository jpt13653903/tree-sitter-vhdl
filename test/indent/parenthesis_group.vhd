-- Ref https://github.com/jpt13653903/tree-sitter-vhdl/issues/81

architecture rtl of top is

  type axi4lite_slave_in_intf is record
    AWVALID : std_logic;
    AWADDR : std_logic_vector;
    AWPROT : std_logic_vector(2 downto 0);

    WVALID : std_logic;
    WDATA : std_logic_vector;
    WSTRB : std_logic_vector;

    BREADY : std_logic;

    ARVALID : std_logic;
    ARADDR : std_logic_vector;
    ARPROT : std_logic_vector(2 downto 0);

    RREADY : std_logic;
  end record axi4lite_slave_in_intf;

  signal s_axil_i : axi4lite_slave_in_intf(
    AWADDR(6 downto 0),
    WDATA(31 downto 0),
    WSTRB(3 downto 0),
    ARADDR(6 downto 0)
  );

begin
end architecture;
