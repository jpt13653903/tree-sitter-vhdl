================================================================================
Severity-level keywords used as signal names (_identifier rule)
================================================================================

architecture Behaviour of MyModule is
  signal error   : std_logic;
  signal warning : std_logic;
  signal note    : std_logic;
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
  error : process is
  begin
  end process error;
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
            (label))))
      (end_architecture
        architecture: (identifier)))))

================================================================================
Severity-level keyword used as an attribute name (_attribute rule)
================================================================================

architecture Behaviour of MyModule is
  attribute error : string;
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
          attribute: (identifier)
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
  u1 : MyComp port map (error => sig_a, warning => sig_b);
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
                  (identifier))
                (conditional_expression
                  (simple_expression
                    (name
                      (identifier)))))
              (association_element
                (name
                  (identifier))
                (conditional_expression
                  (simple_expression
                    (name
                      (identifier)))))))))
      (end_architecture
        architecture: (identifier)))))

