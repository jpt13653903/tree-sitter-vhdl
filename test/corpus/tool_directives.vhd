================================================================================
Tool directives inside process blocks
================================================================================

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

--------------------------------------------------------------------------------

(design_file
  (design_unit
    (process_statement
      (PROCESS)
      (sensitivity_specification
        (ALL))
      (sequential_block
        (BEGIN)
        (if_conditional_analysis
          (IF)
          (conditional_analysis_expression
            (conditional_analysis_relation
              (identifier)
              (string_literal)))
          (THEN))
        (loop_statement
          (for_loop
            (FOR)
            (parameter_specification
              (identifier)
              (IN)
              (simple_range
                (simple_expression
                  (decimal_integer))
                (TO)
                (simple_expression
                  (decimal_integer)))))
          (loop_body
            (LOOP)
            (simple_variable_assignment
              (name
                (identifier))
              (variable_assignment)
              (conditional_or_unaffected_expression
                (simple_expression
                  (simple_expression
                    (name
                      (identifier)))
                  (adding_operator)
                  (simple_expression
                    (name
                      (identifier)
                      (name_selector
                        (parenthesis_group
                          (association_or_range_list
                            (association_element
                              (conditional_expression
                                (simple_expression
                                  (name
                                    (identifier))))))))))))))
          (end_loop
            (END)
            (LOOP)))
        (else_conditional_analysis
          (ELSE))
        (loop_statement
          (for_loop
            (FOR)
            (parameter_specification
              (identifier)
              (IN)
              (simple_range
                (simple_expression
                  (decimal_integer))
                (TO)
                (simple_expression
                  (decimal_integer)))))
          (loop_body
            (LOOP)
            (simple_variable_assignment
              (name
                (identifier))
              (variable_assignment)
              (conditional_or_unaffected_expression
                (simple_expression
                  (simple_expression
                    (name
                      (identifier)))
                  (adding_operator)
                  (simple_expression
                    (name
                      (identifier)
                      (name_selector
                        (parenthesis_group
                          (association_or_range_list
                            (association_element
                              (conditional_expression
                                (simple_expression
                                  (name
                                    (identifier))))))))))))))
          (end_loop
            (END)
            (LOOP))))
      (end_conditional_analysis
        (END)
        (IF))
      (end_process
        (END)
        (PROCESS)))))

