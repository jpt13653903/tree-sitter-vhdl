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

================================================================================
Library constants used as association targets
================================================================================

architecture Behaviour of MyModule is
begin
  process begin
    foo(true => whatnot);
    foo(false => whatnot);

    foo(nul => whatnot);
    foo(soh => whatnot);
    foo(stx => whatnot);
    foo(etx => whatnot);
    foo(eot => whatnot);
    foo(enq => whatnot);
    foo(ack => whatnot);
    foo(bel => whatnot);
    foo(bs => whatnot);
    foo(ht => whatnot);
    foo(lf => whatnot);
    foo(vt => whatnot);
    foo(ff => whatnot);
    foo(cr => whatnot);
    foo(so => whatnot);
    foo(si => whatnot);
    foo(dle => whatnot);
    foo(dc1 => whatnot);
    foo(dc2 => whatnot);
    foo(dc3 => whatnot);
    foo(dc4 => whatnot);
    foo(nak => whatnot);
    foo(syn => whatnot);
    foo(etb => whatnot);
    foo(can => whatnot);
    foo(em => whatnot);
    foo(sub => whatnot);
    foo(esc => whatnot);
    foo(fsp => whatnot);
    foo(gsp => whatnot);
    foo(rsp => whatnot);
    foo(usp => whatnot);
    foo(del => whatnot);
    foo(c128 => whatnot);
    foo(c129 => whatnot);
    foo(c130 => whatnot);
    foo(c131 => whatnot);
    foo(c132 => whatnot);
    foo(c133 => whatnot);
    foo(c134 => whatnot);
    foo(c135 => whatnot);
    foo(c136 => whatnot);
    foo(c137 => whatnot);
    foo(c138 => whatnot);
    foo(c139 => whatnot);
    foo(c140 => whatnot);
    foo(c141 => whatnot);
    foo(c142 => whatnot);
    foo(c143 => whatnot);
    foo(c144 => whatnot);
    foo(c145 => whatnot);
    foo(c146 => whatnot);
    foo(c147 => whatnot);
    foo(c148 => whatnot);
    foo(c149 => whatnot);
    foo(c150 => whatnot);
    foo(c151 => whatnot);
    foo(c152 => whatnot);
    foo(c153 => whatnot);
    foo(c154 => whatnot);
    foo(c155 => whatnot);
    foo(c156 => whatnot);
    foo(c157 => whatnot);
    foo(c158 => whatnot);
    foo(c159 => whatnot);

    foo(note => whatnot);
    foo(warning => whatnot);
    foo(error => whatnot);
    foo(failure => whatnot);

    foo(ascending => whatnot);
    foo(descending => whatnot);

    foo(read_mode => whatnot);
    foo(write_mode => whatnot);
    foo(append_mode => whatnot);
    foo(read_write_mode => whatnot);

    foo(open_ok => whatnot);
    foo(name_error => whatnot);
    foo(mode_error => whatnot);

    foo(state_open => whatnot);
    foo(state_closed => whatnot);

    foo(file_origin_begin => whatnot);
    foo(file_origin_current => whatnot);
    foo(file_origin_end => whatnot);

    foo(fs => whatnot);
    foo(ps => whatnot);
    foo(ns => whatnot);
    foo(us => whatnot);
    foo(ms => whatnot);
    foo(sec => whatnot);
    foo(min => whatnot);
    foo(hr => whatnot);

    foo(rising_edge => whatnot);
    foo(falling_edge => whatnot);
    foo(now => whatnot);
    foo(to_ostring => whatnot);
    foo(to_hstring => whatnot);

    foo(to_bstring => whatnot);
    foo(to_binary_string => whatnot);
    foo(to_octal_string => whatnot);
    foo(to_hex_string => whatnot);

    foo(foreign => whatnot);

    foo(sunday => whatnot);
    foo(monday => whatnot);
    foo(tuesday => whatnot);
    foo(wednesday => whatnot);
    foo(thursday => whatnot);
    foo(friday => whatnot);
    foo(saturday => whatnot);

    foo(status_ok => whatnot);
    foo(status_not_found => whatnot);
    foo(status_no_directory => whatnot);
    foo(status_access_denied => whatnot);
    foo(status_item_exists => whatnot);
    foo(status_not_empty => whatnot);
    foo(status_no_file => whatnot);
    foo(status_error => whatnot);

    foo(dir_separator => whatnot);
  end process;
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
          (sequential_block
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_boolean))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_boolean))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_character))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_debug))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_debug))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_debug))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_debug))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_standard))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_standard))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_standard))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_standard))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_standard))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_standard))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_standard))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_standard))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_standard))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_standard))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_standard))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_standard))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_standard))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_standard))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_function))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_function))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_function))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_function))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_function))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_function))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_function))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_function))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_function))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_env))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_env))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_env))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_env))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_env))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_env))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_env))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_env))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_env))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_env))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_env))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_env))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_env))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_env))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_env))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (library_constant_env))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier))))))))))
          (end_process)))
      (end_architecture
        architecture: (identifier)))))


================================================================================
Library constants used as association sources
================================================================================

architecture Behaviour of MyModule is
begin
  process begin
    foo(whatnot => true);
    foo(whatnot => false);

    foo(whatnot => nul);
    foo(whatnot => soh);
    foo(whatnot => stx);
    foo(whatnot => etx);
    foo(whatnot => eot);
    foo(whatnot => enq);
    foo(whatnot => ack);
    foo(whatnot => bel);
    foo(whatnot => bs);
    foo(whatnot => ht);
    foo(whatnot => lf);
    foo(whatnot => vt);
    foo(whatnot => ff);
    foo(whatnot => cr);
    foo(whatnot => so);
    foo(whatnot => si);
    foo(whatnot => dle);
    foo(whatnot => dc1);
    foo(whatnot => dc2);
    foo(whatnot => dc3);
    foo(whatnot => dc4);
    foo(whatnot => nak);
    foo(whatnot => syn);
    foo(whatnot => etb);
    foo(whatnot => can);
    foo(whatnot => em);
    foo(whatnot => sub);
    foo(whatnot => esc);
    foo(whatnot => fsp);
    foo(whatnot => gsp);
    foo(whatnot => rsp);
    foo(whatnot => usp);
    foo(whatnot => del);
    foo(whatnot => c128);
    foo(whatnot => c129);
    foo(whatnot => c130);
    foo(whatnot => c131);
    foo(whatnot => c132);
    foo(whatnot => c133);
    foo(whatnot => c134);
    foo(whatnot => c135);
    foo(whatnot => c136);
    foo(whatnot => c137);
    foo(whatnot => c138);
    foo(whatnot => c139);
    foo(whatnot => c140);
    foo(whatnot => c141);
    foo(whatnot => c142);
    foo(whatnot => c143);
    foo(whatnot => c144);
    foo(whatnot => c145);
    foo(whatnot => c146);
    foo(whatnot => c147);
    foo(whatnot => c148);
    foo(whatnot => c149);
    foo(whatnot => c150);
    foo(whatnot => c151);
    foo(whatnot => c152);
    foo(whatnot => c153);
    foo(whatnot => c154);
    foo(whatnot => c155);
    foo(whatnot => c156);
    foo(whatnot => c157);
    foo(whatnot => c158);
    foo(whatnot => c159);

    foo(whatnot => note);
    foo(whatnot => warning);
    foo(whatnot => error);
    foo(whatnot => failure);

    foo(whatnot => ascending);
    foo(whatnot => descending);

    foo(whatnot => read_mode);
    foo(whatnot => write_mode);
    foo(whatnot => append_mode);
    foo(whatnot => read_write_mode);

    foo(whatnot => open_ok);
    foo(whatnot => name_error);
    foo(whatnot => mode_error);

    foo(whatnot => state_open);
    foo(whatnot => state_closed);

    foo(whatnot => file_origin_begin);
    foo(whatnot => file_origin_current);
    foo(whatnot => file_origin_end);

    foo(whatnot => fs);
    foo(whatnot => ps);
    foo(whatnot => ns);
    foo(whatnot => us);
    foo(whatnot => ms);
    foo(whatnot => sec);
    foo(whatnot => min);
    foo(whatnot => hr);

    foo(whatnot => rising_edge);
    foo(whatnot => falling_edge);
    foo(whatnot => now);
    foo(whatnot => to_ostring);
    foo(whatnot => to_hstring);

    foo(whatnot => to_bstring);
    foo(whatnot => to_binary_string);
    foo(whatnot => to_octal_string);
    foo(whatnot => to_hex_string);

    foo(whatnot => foreign);

    foo(whatnot => sunday);
    foo(whatnot => monday);
    foo(whatnot => tuesday);
    foo(whatnot => wednesday);
    foo(whatnot => thursday);
    foo(whatnot => friday);
    foo(whatnot => saturday);

    foo(whatnot => status_ok);
    foo(whatnot => status_not_found);
    foo(whatnot => status_no_directory);
    foo(whatnot => status_access_denied);
    foo(whatnot => status_item_exists);
    foo(whatnot => status_not_empty);
    foo(whatnot => status_no_file);
    foo(whatnot => status_error);

    foo(whatnot => dir_separator);
  end process;
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
          (sequential_block
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_boolean))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_boolean))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_character))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (name
                            (library_constant_debug)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (name
                            (library_constant_debug)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (name
                            (library_constant_debug)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (name
                            (library_constant_debug)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_standard))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_standard))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_standard))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_standard))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_standard))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_standard))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_standard))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_standard))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_standard))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_standard))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_standard))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_standard))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_standard))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_standard))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (name
                            (library_function)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (name
                            (library_function)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (name
                            (library_function)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (name
                            (library_function)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (name
                            (library_function)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (name
                            (library_function)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (name
                            (library_function)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (name
                            (library_function)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (name
                            (library_function)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (name
                            (identifier)))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_env))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_env))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_env))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_env))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_env))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_env))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_env))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_env))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_env))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_env))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_env))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_env))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_env))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_env))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_env))))))))
            (procedure_call_statement
              (name
                (identifier)
                (parenthesis_group
                  (association_or_range_list
                    (association_element
                      (name
                        (identifier))
                      (conditional_expression
                        (simple_expression
                          (library_constant_env)))))))))
          (end_process)))
      (end_architecture
        architecture: (identifier)))))
