================================================================================
Normal array
================================================================================

architecture EXAMPLE of STRUCTURE is
  type foo_t is array(0 to 1) of std_logic;
begin
end EXAMPLE;
--------------------------------------------------------------------------------

(design_file
  (design_unit
    (architecture_definition
      architecture: (identifier)
      entity: (name
        (identifier))
      (architecture_head
        (type_declaration
          type: (identifier)
          (array_type_definition
            (array_index_incomplete_type_list
              (index_constraint
                (simple_range
                  (simple_expression
                    (decimal_integer))
                  (simple_expression
                    (decimal_integer)))))
            (subtype_indication
              type: (name
                (library_type))))))
      (concurrent_block)
      (end_architecture
        architecture: (identifier)))))

================================================================================
Index subtype definition
================================================================================

architecture EXAMPLE of STRUCTURE is
  type foo_t is array(natural range <>) of std_logic;
begin
end EXAMPLE;
--------------------------------------------------------------------------------

(design_file
  (design_unit
    (architecture_definition
      architecture: (identifier)
      entity: (name
        (identifier))
      (architecture_head
        (type_declaration
          type: (identifier)
          (array_type_definition
            (array_index_incomplete_type_list
              (index_subtype_definition
                type: (name
                  (library_type))))
            (subtype_indication
              type: (name
                (library_type))))))
      (concurrent_block)
      (end_architecture
        architecture: (identifier)))))

================================================================================
Discrete subtype indication
================================================================================

architecture EXAMPLE of STRUCTURE is
  type foo_t is array(natural range 0 to 1) of std_logic;
begin
end EXAMPLE;
--------------------------------------------------------------------------------

(design_file
  (design_unit
    (architecture_definition
      architecture: (identifier)
      entity: (name
        (identifier))
      (architecture_head
        (type_declaration
          type: (identifier)
          (array_type_definition
            (array_index_incomplete_type_list
              (index_constraint
                (subtype_indication
                  type: (name
                    (library_type))
                  (range_constraint
                    (simple_range
                      (simple_expression
                        (decimal_integer))
                      (simple_expression
                        (decimal_integer)))))))
            (subtype_indication
              type: (name
                (library_type))))))
      (concurrent_block)
      (end_architecture
        architecture: (identifier)))))

