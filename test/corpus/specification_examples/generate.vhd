================================================================================
Generate statements
================================================================================

Gen: block
begin
  L1: CELL port map (Top, Bottom, A(0), B(0));
  L2: for I in 1 to 3 generate
    L3: for J in 1 to 3 generate
      L4: if I+J>4 generate
        L5: CELL port map (A(I-1),B(J-1),A(I),B(J));
      end generate;
    end generate;
  end generate;

  L6: for I in 1 to 3 generate
    L7: for J in 1 to 3 generate
      L8: if I+J<4 generate
        L9: CELL port map (A(I+1),B(J+1),A(I),B(J));
      end generate;
    end generate;
  end generate;
end block Gen;

Gen2: block
begin
  L1: case verify_mode generate
    when V_rtl: all_rtl | cpu_rtl =>
      CPU1: entity work.cpu(rtl) port map ( the_port_mapping );
    when V_bfm: others =>
        signal bfm_sig : BIT;
      begin
        CPU1: entity work.cpu(bfm) port map ( the_port_mapping );
      end V_bfm;
  end generate L1;

  L2: if A1: max_latency < 10 generate
      signal s1 : BIT;
    begin
      multiplier1: parallel_multiplier port map ( the_port_mapping );
    end A1;
  else A2: generate
      signal s1 : STD_LOGIC;
    begin
      multiplier1: sequential_multiplier port map ( the_port_mapping );
    end A2;
  end generate L2;
end block Gen2;

--------------------------------------------------------------------------------

(design_file
  (design_unit
    (block_statement
      (label_declaration
        (label))
      (concurrent_block
        (component_instantiation_statement
          (label_declaration
            (label))
          component: (name
            (identifier))
          (port_map_aspect
            (association_list
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
                      (identifier)
                      (parenthesis_group
                        (association_or_range_list
                          (association_element
                            (conditional_expression
                              (simple_expression
                                (decimal_integer))))))))))
              (association_element
                (conditional_expression
                  (simple_expression
                    (name
                      (identifier)
                      (parenthesis_group
                        (association_or_range_list
                          (association_element
                            (conditional_expression
                              (simple_expression
                                (decimal_integer)))))))))))))
        (for_generate_statement
          (label_declaration
            (label))
          (for_loop
            (parameter_specification
              (identifier)
              (simple_range
                (simple_expression
                  (decimal_integer))
                (simple_expression
                  (decimal_integer)))))
          (generate_body
            (generate_direct_block
              (for_generate_statement
                (label_declaration
                  (label))
                (for_loop
                  (parameter_specification
                    (identifier)
                    (simple_range
                      (simple_expression
                        (decimal_integer))
                      (simple_expression
                        (decimal_integer)))))
                (generate_body
                  (generate_direct_block
                    (if_generate_statement
                      (label_declaration
                        (label))
                      (if_generate
                        (relational_expression
                          (simple_expression
                            (simple_expression
                              (name
                                (identifier)))
                            (adding_operator)
                            (simple_expression
                              (name
                                (identifier))))
                          (relational_operator)
                          (simple_expression
                            (decimal_integer)))
                        (generate_body
                          (generate_direct_block
                            (component_instantiation_statement
                              (label_declaration
                                (label))
                              component: (name
                                (identifier))
                              (port_map_aspect
                                (association_list
                                  (association_element
                                    (conditional_expression
                                      (simple_expression
                                        (name
                                          (identifier)
                                          (parenthesis_group
                                            (association_or_range_list
                                              (association_element
                                                (conditional_expression
                                                  (simple_expression
                                                    (simple_expression
                                                      (name
                                                        (identifier)))
                                                    (adding_operator)
                                                    (simple_expression
                                                      (decimal_integer)))))))))))
                                  (association_element
                                    (conditional_expression
                                      (simple_expression
                                        (name
                                          (identifier)
                                          (parenthesis_group
                                            (association_or_range_list
                                              (association_element
                                                (conditional_expression
                                                  (simple_expression
                                                    (simple_expression
                                                      (name
                                                        (identifier)))
                                                    (adding_operator)
                                                    (simple_expression
                                                      (decimal_integer)))))))))))
                                  (association_element
                                    (conditional_expression
                                      (simple_expression
                                        (name
                                          (identifier)
                                          (parenthesis_group
                                            (association_or_range_list
                                              (association_element
                                                (conditional_expression
                                                  (simple_expression
                                                    (name
                                                      (identifier)))))))))))
                                  (association_element
                                    (conditional_expression
                                      (simple_expression
                                        (name
                                          (identifier)
                                          (parenthesis_group
                                            (association_or_range_list
                                              (association_element
                                                (conditional_expression
                                                  (simple_expression
                                                    (name
                                                      (identifier)))))))))))))))))
                      (end_generate))))
                (end_generate))))
          (end_generate))
        (for_generate_statement
          (label_declaration
            (label))
          (for_loop
            (parameter_specification
              (identifier)
              (simple_range
                (simple_expression
                  (decimal_integer))
                (simple_expression
                  (decimal_integer)))))
          (generate_body
            (generate_direct_block
              (for_generate_statement
                (label_declaration
                  (label))
                (for_loop
                  (parameter_specification
                    (identifier)
                    (simple_range
                      (simple_expression
                        (decimal_integer))
                      (simple_expression
                        (decimal_integer)))))
                (generate_body
                  (generate_direct_block
                    (if_generate_statement
                      (label_declaration
                        (label))
                      (if_generate
                        (relational_expression
                          (simple_expression
                            (simple_expression
                              (name
                                (identifier)))
                            (adding_operator)
                            (simple_expression
                              (name
                                (identifier))))
                          (relational_operator)
                          (simple_expression
                            (decimal_integer)))
                        (generate_body
                          (generate_direct_block
                            (component_instantiation_statement
                              (label_declaration
                                (label))
                              component: (name
                                (identifier))
                              (port_map_aspect
                                (association_list
                                  (association_element
                                    (conditional_expression
                                      (simple_expression
                                        (name
                                          (identifier)
                                          (parenthesis_group
                                            (association_or_range_list
                                              (association_element
                                                (conditional_expression
                                                  (simple_expression
                                                    (simple_expression
                                                      (name
                                                        (identifier)))
                                                    (adding_operator)
                                                    (simple_expression
                                                      (decimal_integer)))))))))))
                                  (association_element
                                    (conditional_expression
                                      (simple_expression
                                        (name
                                          (identifier)
                                          (parenthesis_group
                                            (association_or_range_list
                                              (association_element
                                                (conditional_expression
                                                  (simple_expression
                                                    (simple_expression
                                                      (name
                                                        (identifier)))
                                                    (adding_operator)
                                                    (simple_expression
                                                      (decimal_integer)))))))))))
                                  (association_element
                                    (conditional_expression
                                      (simple_expression
                                        (name
                                          (identifier)
                                          (parenthesis_group
                                            (association_or_range_list
                                              (association_element
                                                (conditional_expression
                                                  (simple_expression
                                                    (name
                                                      (identifier)))))))))))
                                  (association_element
                                    (conditional_expression
                                      (simple_expression
                                        (name
                                          (identifier)
                                          (parenthesis_group
                                            (association_or_range_list
                                              (association_element
                                                (conditional_expression
                                                  (simple_expression
                                                    (name
                                                      (identifier)))))))))))))))))
                      (end_generate))))
                (end_generate))))
          (end_generate)))
      (end_block
        (label)))
    (block_statement
      (label_declaration
        (label))
      (concurrent_block
        (case_generate_statement
          (label_declaration
            (label))
          (simple_expression
            (name
              (identifier)))
          (case_generate_block
            (case_generate_alternative
              (label_declaration
                (label))
              (choices
                (simple_expression
                  (name
                    (identifier)))
                (simple_expression
                  (name
                    (identifier))))
              (case_generate_body
                (case_generate_direct_block
                  (component_instantiation_statement
                    (label_declaration
                      (label))
                    (instantiated_unit
                      library: (library_namespace)
                      entity: (name
                        (identifier))
                      architecture: (identifier))
                    (port_map_aspect
                      (association_list
                        (association_element
                          (conditional_expression
                            (simple_expression
                              (name
                                (identifier)))))))))))
            (case_generate_alternative
              (label_declaration
                (label))
              (OTHERS)
              (case_generate_body
                (case_generate_head
                  (signal_declaration
                    (identifier_list
                      (identifier))
                    (subtype_indication
                      type: (name
                        (library_type)))))
                (generate_block
                  (component_instantiation_statement
                    (label_declaration
                      (label))
                    (instantiated_unit
                      library: (library_namespace)
                      entity: (name
                        (identifier))
                      architecture: (identifier))
                    (port_map_aspect
                      (association_list
                        (association_element
                          (conditional_expression
                            (simple_expression
                              (name
                                (identifier)))))))))
                (generate_block_end
                  (label)))))
          (end_generate
            (label)))
        (if_generate_statement
          (label_declaration
            (label))
          (if_generate
            (label_declaration
              (label))
            (relational_expression
              (simple_expression
                (name
                  (identifier)))
              (relational_operator)
              (simple_expression
                (decimal_integer)))
            (generate_body
              (generate_head
                (signal_declaration
                  (identifier_list
                    (identifier))
                  (subtype_indication
                    type: (name
                      (library_type)))))
              (generate_block
                (component_instantiation_statement
                  (label_declaration
                    (label))
                  component: (name
                    (identifier))
                  (port_map_aspect
                    (association_list
                      (association_element
                        (conditional_expression
                          (simple_expression
                            (name
                              (identifier)))))))))
              (generate_block_end
                (label))))
          (else_generate
            (label_declaration
              (label))
            (generate_body
              (generate_head
                (signal_declaration
                  (identifier_list
                    (identifier))
                  (subtype_indication
                    type: (name
                      (library_type)))))
              (generate_block
                (component_instantiation_statement
                  (label_declaration
                    (label))
                  component: (name
                    (identifier))
                  (port_map_aspect
                    (association_list
                      (association_element
                        (conditional_expression
                          (simple_expression
                            (name
                              (identifier)))))))))
              (generate_block_end
                (label))))
          (end_generate
            (label))))
      (end_block
        (label)))))

