architecture Behaviour of MyModule is
begin
  A <= 20d"123456";  -- bit string literal
  -- A <= 5d "123345"; -- integer; unit; string (i.e. error)
  -- A <= 5d/*comment*/; -- integer; unit; comment; string (i.e. error)
  -- A <= 5d/*comment*/"123345"; -- integer; unit; comment; string (i.e. error)
  -- A <= 5 d"123345"; -- integer; unit; comment; string (i.e. error)
  -- A <= 5/*comment*/d"123345"; -- integer; unit; comment; string (i.e. error)
end Behaviour;

