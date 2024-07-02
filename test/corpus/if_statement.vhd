================================================================================
If statements
================================================================================

process(all) begin
  if TEST = 1 then
    A <= B + C;
  elsif TEST = 2 then
    A <= B + C;
  elsif TEST = 3 then
    A <= B + C;
  else
    A <= B + C;
  end if;
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
        (if_statement
          (if_expression
            (IF)
            (relational_expression
              (simple_expression
                (name
                  (identifier)))
              (relational_operator)
              (simple_expression
                (decimal_integer)))
            (THEN)
            (if_statement_body
              (simple_waveform_assignment
                (name
                  (identifier))
                (signal_assignment)
                (waveform
                  (waveform_element
                    (simple_expression
                      (simple_expression
                        (name
                          (identifier)))
                      (adding_operator)
                      (simple_expression
                        (name
                          (identifier)))))))))
          (elsif_statement
            (ELSIF)
            (relational_expression
              (simple_expression
                (name
                  (identifier)))
              (relational_operator)
              (simple_expression
                (decimal_integer)))
            (THEN)
            (if_statement_body
              (simple_waveform_assignment
                (name
                  (identifier))
                (signal_assignment)
                (waveform
                  (waveform_element
                    (simple_expression
                      (simple_expression
                        (name
                          (identifier)))
                      (adding_operator)
                      (simple_expression
                        (name
                          (identifier)))))))))
          (elsif_statement
            (ELSIF)
            (relational_expression
              (simple_expression
                (name
                  (identifier)))
              (relational_operator)
              (simple_expression
                (decimal_integer)))
            (THEN)
            (if_statement_body
              (simple_waveform_assignment
                (name
                  (identifier))
                (signal_assignment)
                (waveform
                  (waveform_element
                    (simple_expression
                      (simple_expression
                        (name
                          (identifier)))
                      (adding_operator)
                      (simple_expression
                        (name
                          (identifier)))))))))
          (else_statement
            (ELSE)
            (if_statement_body
              (simple_waveform_assignment
                (name
                  (identifier))
                (signal_assignment)
                (waveform
                  (waveform_element
                    (simple_expression
                      (simple_expression
                        (name
                          (identifier)))
                      (adding_operator)
                      (simple_expression
                        (name
                          (identifier)))))))))
          (end_if
            (END)
            (IF))))
      (end_process
        (END)
        (PROCESS)))))

