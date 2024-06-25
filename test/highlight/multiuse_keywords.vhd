entity MyModule is
  port(
    signal Clk   : in std_logic;
--                 ^ keyword.modifier
    signal Reset : in std_logic
--                 ^ keyword.modifier
  );
end MyModule;

architecture Behaviour of MyModule is
begin
  process(Clk) begin
    if(rising_edge(Clk)) then
      for n in 1 to 7 loop
--    ^ keyword.repeat
--          ^ keyword
        A <= B + C;
      end loop;
    end if;

    wait for 3 ns;
--       ^ keyword.coroutine
  end process;
end Behaviour;

