================================================================================
An entity declaration with port declarations only:
================================================================================

entity Full_Adder is
  port (X, Y, Cin: in Bit; Cout, Sum: out Bit);
end Full_Adder;

--------------------------------------------------------------------------------

(design_file
  (design_unit
    (entity_declaration
      (ENTITY)
      (identifier)
      (entity_head
        (IS)
        (port_clause
          (PORT)
          (interface_list
            (interface_declaration
              (identifier_list
                (identifier)
                (identifier)
                (identifier))
              (simple_mode_indication
                (mode
                  (IN))
                (subtype_indication
                  (name
                    (library_type)))))
            (interface_declaration
              (identifier_list
                (identifier)
                (identifier))
              (simple_mode_indication
                (mode
                  (OUT))
                (subtype_indication
                  (name
                    (library_type))))))))
      (end_entity
        (END)
        (identifier)))))

================================================================================
An entity declaration with generic declarations also:
================================================================================

entity AndGate is
  generic (N: Natural := 2);
  port( inputs: in Bit_Vector (1 to N);
        result: out Bit);
end entity AndGate;

--------------------------------------------------------------------------------

(design_file
  (design_unit
    (entity_declaration
      (ENTITY)
      (identifier)
      (entity_head
        (IS)
        (generic_clause
          (GENERIC)
          (interface_list
            (interface_declaration
              (identifier_list
                (identifier))
              (simple_mode_indication
                (subtype_indication
                  (name
                    (library_type)))
                (initialiser
                  (variable_assignment)
                  (conditional_expression
                    (simple_expression
                      (decimal_integer))))))))
        (port_clause
          (PORT)
          (interface_list
            (interface_declaration
              (identifier_list
                (identifier))
              (simple_mode_indication
                (mode
                  (IN))
                (subtype_indication
                  (name
                    (library_type)
                    (name_selector
                      (parenthesis_group
                        (association_or_range_list
                          (simple_range
                            (simple_expression
                              (decimal_integer))
                            (TO)
                            (simple_expression
                              (name
                                (identifier)))))))))))
            (interface_declaration
              (identifier_list
                (identifier))
              (simple_mode_indication
                (mode
                  (OUT))
                (subtype_indication
                  (name
                    (library_type))))))))
      (end_entity
        (END)
        (ENTITY)
        (identifier)))))

================================================================================
An entity declaration with neither:
================================================================================

entity TestBench is
end TestBench;

--------------------------------------------------------------------------------

(design_file
  (design_unit
    (entity_declaration
      (ENTITY)
      (identifier)
      (entity_head
        (IS))
      (end_entity
        (END)
        (identifier)))))

================================================================================
An entity declaration with entity declarative items:
================================================================================

entity ROM is
  port ( Addr: in Word;
         Data: out Word;
         Sel: in Bit);
  type Instruction is array (1 to 5) of Natural;
  type Program is array (Natural range <>) of Instruction;
  use Work.OpCodes.all, Work.RegisterNames.all;
  constant ROM_Code: Program :=
    (
      (STM, R14, R12, 12, R13),
      (LD, R7, 32, 0, R1 ),
      (BAL, R14, 0, 0, R7 )
      -- etc.
    ) ;
end ROM;

--------------------------------------------------------------------------------

(design_file
  (design_unit
    (entity_declaration
      (ENTITY)
      (identifier)
      (entity_head
        (IS)
        (port_clause
          (PORT)
          (interface_list
            (interface_declaration
              (identifier_list
                (identifier))
              (simple_mode_indication
                (mode
                  (IN))
                (subtype_indication
                  (name
                    (identifier)))))
            (interface_declaration
              (identifier_list
                (identifier))
              (simple_mode_indication
                (mode
                  (OUT))
                (subtype_indication
                  (name
                    (identifier)))))
            (interface_declaration
              (identifier_list
                (identifier))
              (simple_mode_indication
                (mode
                  (IN))
                (subtype_indication
                  (name
                    (library_type)))))))
        (type_declaration
          (TYPE)
          (identifier)
          (IS)
          (array_type_definition
            (ARRAY)
            (array_index_incomplete_type_list
              (index_constraint
                (simple_range
                  (simple_expression
                    (decimal_integer))
                  (TO)
                  (simple_expression
                    (decimal_integer)))))
            (OF)
            (subtype_indication
              (name
                (library_type)))))
        (type_declaration
          (TYPE)
          (identifier)
          (IS)
          (array_type_definition
            (ARRAY)
            (array_index_incomplete_type_list
              (index_subtype_definition
                (name
                  (library_type))
                (RANGE)
                (box)))
            (OF)
            (subtype_indication
              (name
                (identifier)))))
        (use_clause
          (USE)
          (selected_name
            (library_namespace)
            (identifier)
            (ALL))
          (selected_name
            (library_namespace)
            (identifier)
            (ALL)))
        (constant_declaration
          (CONSTANT)
          (identifier_list
            (identifier))
          (subtype_indication
            (name
              (identifier)))
          (initialiser
            (variable_assignment)
            (conditional_expression
              (simple_expression
                (parenthesis_expression
                  (element_association_list
                    (element_association
                      (conditional_expression
                        (simple_expression
                          (parenthesis_expression
                            (element_association_list
                              (element_association
                                (conditional_expression
                                  (simple_expression
                                    (name
                                      (identifier)))))
                              (element_association
                                (conditional_expression
                                  (simple_expression
                                    (name
                                      (identifier)))))
                              (element_association
                                (conditional_expression
                                  (simple_expression
                                    (name
                                      (identifier)))))
                              (element_association
                                (conditional_expression
                                  (simple_expression
                                    (decimal_integer))))
                              (element_association
                                (conditional_expression
                                  (simple_expression
                                    (name
                                      (identifier))))))))))
                    (element_association
                      (conditional_expression
                        (simple_expression
                          (parenthesis_expression
                            (element_association_list
                              (element_association
                                (conditional_expression
                                  (simple_expression
                                    (name
                                      (identifier)))))
                              (element_association
                                (conditional_expression
                                  (simple_expression
                                    (name
                                      (identifier)))))
                              (element_association
                                (conditional_expression
                                  (simple_expression
                                    (decimal_integer))))
                              (element_association
                                (conditional_expression
                                  (simple_expression
                                    (decimal_integer))))
                              (element_association
                                (conditional_expression
                                  (simple_expression
                                    (name
                                      (identifier))))))))))
                    (element_association
                      (conditional_expression
                        (simple_expression
                          (parenthesis_expression
                            (element_association_list
                              (element_association
                                (conditional_expression
                                  (simple_expression
                                    (name
                                      (identifier)))))
                              (element_association
                                (conditional_expression
                                  (simple_expression
                                    (name
                                      (identifier)))))
                              (element_association
                                (conditional_expression
                                  (simple_expression
                                    (decimal_integer))))
                              (element_association
                                (conditional_expression
                                  (simple_expression
                                    (decimal_integer))))
                              (element_association
                                (conditional_expression
                                  (simple_expression
                                    (name
                                      (identifier)))))))))))
                  (line_comment)))))))
      (end_entity
        (END)
        (identifier)))))

================================================================================
An entity declaration with statements:
================================================================================

entity Latch is
  port ( Din: in Word;
         Dout: out Word;
         Load: in Bit;
         Clk: in Bit );
  constant Setup: Time := 12 ns;
  constant PulseWidth: Time := 50 ns;
  use Work.TimingMonitors.all;
begin
  assert Clk='1' or Clk'Delayed'Stable (PulseWidth);
  CheckTiming (Setup, Din, Load, Clk);
end;

--------------------------------------------------------------------------------

(design_file
  (design_unit
    (entity_declaration
      (ENTITY)
      (identifier)
      (entity_head
        (IS)
        (port_clause
          (PORT)
          (interface_list
            (interface_declaration
              (identifier_list
                (identifier))
              (simple_mode_indication
                (mode
                  (IN))
                (subtype_indication
                  (name
                    (identifier)))))
            (interface_declaration
              (identifier_list
                (identifier))
              (simple_mode_indication
                (mode
                  (OUT))
                (subtype_indication
                  (name
                    (identifier)))))
            (interface_declaration
              (identifier_list
                (identifier))
              (simple_mode_indication
                (mode
                  (IN))
                (subtype_indication
                  (name
                    (library_type)))))
            (interface_declaration
              (identifier_list
                (identifier))
              (simple_mode_indication
                (mode
                  (IN))
                (subtype_indication
                  (name
                    (library_type)))))))
        (constant_declaration
          (CONSTANT)
          (identifier_list
            (identifier))
          (subtype_indication
            (name
              (library_type)))
          (initialiser
            (variable_assignment)
            (conditional_expression
              (simple_expression
                (decimal_integer)
                (library_constant_unit)))))
        (constant_declaration
          (CONSTANT)
          (identifier_list
            (identifier))
          (subtype_indication
            (name
              (library_type)))
          (initialiser
            (variable_assignment)
            (conditional_expression
              (simple_expression
                (decimal_integer)
                (library_constant_unit)))))
        (use_clause
          (USE)
          (selected_name
            (library_namespace)
            (identifier)
            (ALL))))
      (entity_body
        (BEGIN)
        (concurrent_assertion_statement
          (assertion
            (ASSERT)
            (logical_expression
              (relational_expression
                (simple_expression
                  (name
                    (identifier)))
                (relational_operator)
                (simple_expression
                  (name
                    (library_constant_std_logic))))
              (logical_operator)
              (simple_expression
                (name
                  (identifier)
                  (name_selector
                    (attribute
                      (attribute_signal)))
                  (name_selector
                    (attribute
                      (attribute_signal)))
                  (name_selector
                    (parenthesis_group
                      (association_or_range_list
                        (association_element
                          (conditional_expression
                            (simple_expression
                              (name
                                (identifier)))))))))))))
        (concurrent_procedure_call_statement
          (name
            (identifier)
            (name_selector
              (parenthesis_group
                (association_or_range_list
                  (association_element
                    (conditional_expression
                      (simple_expression
                        (name
                          (identifier)))))
                  (association_element
                    (conditional_expression
                      (simple_expression
                        (name
                          (identifier)))))
                  (association_element
                    (conditional_expression
                      (simple_expression
                        (name
                          (identifier)))))
                  (association_element
                    (conditional_expression
                      (simple_expression
                        (name
                          (identifier)))))))))))
      (end_entity
        (END)))))
