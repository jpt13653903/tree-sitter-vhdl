architecture EXAMPLE of STRUCTURE is
-- <- keyword
--           ^ variable
--                   ^ keyword.operator
--                      ^ variable
--                                ^ keyword
  subtype  DIGIT is integer range 0 to 9;
-- ^ keyword.type
--         ^ variable
--               ^ keyword
--                  ^ type.builtin
--                          ^ keyword
--                                ^ number
--                                  ^ keyword.operator
--                                     ^ number
--                                      ^ punctuation.delimiters
begin
-- <- keyword
  DIGIT_A <= 3;
-- ^ variable
--        ^ operator
--           ^ number
--            ^ punctuation.delimiters
end EXAMPLE;
-- <- keyword
--  ^ variable
--         ^ punctuation.delimiters

