architecture Behaviour of MyModule is
  signal A : std_logic;
begin
  A <= 'U' or 'X' or '0' or '1' or 'Z' or 'W' or 'L' or 'H' or '-';
--      ^ constant.builtin
--             ^ constant.builtin
--                    ^ constant.builtin
--                           ^ constant.builtin
--                                  ^ constant.builtin
--                                         ^ constant.builtin
--                                                ^ constant.builtin
--                                                       ^ constant.builtin
--                                                              ^ constant.builtin
  A <= 'A' or 'B' or '2' or '3' or '&';
--      ^ character
--             ^ character
--                    ^ character
--                           ^ character
--                                  ^ character
end Behaviour;

