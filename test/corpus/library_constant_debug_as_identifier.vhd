================================================================================
Severity-level keywords used as signal names (_identifier rule)
================================================================================

architecture Behaviour of MyModule is
  signal note    : std_logic;
  signal warning : std_logic;
  signal error   : std_logic;
  signal failure : std_logic;
begin
end Behaviour;

--------------------------------------------------------------------------------

(design_file
  (design_unit
    (architecture_definition
      architecture: (identifier)
      entity: (name
        (identifier))
      (architecture_head
        (signal_declaration
          (identifier_list
            (identifier))
          (subtype_indication
            type: (name
              (library_type))))
        (signal_declaration
          (identifier_list
            (identifier))
          (subtype_indication
            type: (name
              (library_type))))
        (signal_declaration
          (identifier_list
            (identifier))
          (subtype_indication
            type: (name
              (library_type))))
        (signal_declaration
          (identifier_list
            (identifier))
          (subtype_indication
            type: (name
              (library_type)))))
      (concurrent_block)
      (end_architecture
        architecture: (identifier)))))

================================================================================
Severity-level keyword used as a process label (_label rule)
================================================================================

architecture Behaviour of MyModule is
begin
  note    : process is begin end process note;
  warning : process is begin end process warning;
  error   : process is begin end process error;
  failure : process is begin end process failure;
end Behaviour;

--------------------------------------------------------------------------------

(design_file
  (design_unit
    (architecture_definition
      architecture: (identifier)
      entity: (name
        (identifier))
      (architecture_head)
      (concurrent_block
        (process_statement
          (label_declaration
            (label))
          (process_head)
          (sequential_block)
          (end_process
            (label)))
        (process_statement
          (label_declaration
            (label))
          (process_head)
          (sequential_block)
          (end_process
            (label)))
        (process_statement
          (label_declaration
            (label))
          (process_head)
          (sequential_block)
          (end_process
            (label)))
        (process_statement
          (label_declaration
            (label))
          (process_head)
          (sequential_block)
          (end_process
            (label))))
      (end_architecture
        architecture: (identifier)))))

================================================================================
Severity-level keyword used as an attribute name (_attribute rule)
================================================================================

architecture Behaviour of MyModule is
  attribute note    : string;
  attribute warning : string;
  attribute error   : string;
  attribute failure : string;
begin
end Behaviour;

--------------------------------------------------------------------------------

(design_file
  (design_unit
    (architecture_definition
      architecture: (identifier)
      entity: (name
        (identifier))
      (architecture_head
        (attribute_declaration
          attribute: (library_constant_debug)
          type: (name
            (library_type)))
        (attribute_declaration
          attribute: (library_constant_debug)
          type: (name
            (library_type)))
        (attribute_declaration
          attribute: (library_constant_debug)
          type: (name
            (library_type)))
        (attribute_declaration
          attribute: (library_constant_debug)
          type: (name
            (library_type))))
      (concurrent_block)
      (end_architecture
        architecture: (identifier)))))

================================================================================
Severity-level keyword used as a port map formal (_identifier rule)
================================================================================

architecture Behaviour of MyModule is
begin
  u1 : MyComp port map (
    note    => sig_a,
    warning => sig_b,
    error   => sig_c,
    failure => sig_d
  );
end Behaviour;

--------------------------------------------------------------------------------

(design_file
  (design_unit
    (architecture_definition
      architecture: (identifier)
      entity: (name
        (identifier))
      (architecture_head)
      (concurrent_block
        (component_instantiation_statement
          (label_declaration
            (label))
          component: (name
            (identifier))
          (port_map_aspect
            (association_list
              (association_element
                (name
                  (library_constant_debug))
                (conditional_expression
                  (simple_expression
                    (name
                      (identifier)))))
              (association_element
                (name
                  (library_constant_debug))
                (conditional_expression
                  (simple_expression
                    (name
                      (identifier)))))
              (association_element
                (name
                  (library_constant_debug))
                (conditional_expression
                  (simple_expression
                    (name
                      (identifier)))))
              (association_element
                (name
                  (library_constant_debug))
                (conditional_expression
                  (simple_expression
                    (name
                      (identifier)))))))))
      (end_architecture
        architecture: (identifier)))))

