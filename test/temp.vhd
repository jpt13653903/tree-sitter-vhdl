process(all) begin
  `if DEBUG = "Yes" then
    for n in 1 to 10 loop
      A := A + B(n);
    end loop;
  `else
    for n in 1 to 15 loop
      A := A + B(n);
    end loop;
  `end if
end process;
