================================================================================
Basic architecture, testing blocks
================================================================================

architecture EXAMPLE of STRUCTURE is
  subtype  DIGIT is integer range 0 to 9;
begin
  DIGIT_A <= 3;
end EXAMPLE;

--------------------------------------------------------------------------------

(design_file
  (design_unit
    (architecture_definition
      (ARCHITECTURE)
      (identifier)
      (OF)
      (name
      (identifier))
    (architecture_head
      (IS)
      (subtype_declaration
        (SUBTYPE)
        (identifier)
        (IS)
        (subtype_indication
          (name
          (library_type))
        (range_constraint
          (RANGE)
          (simple_range
            (simple_expression
              (decimal_literal))
            (TO)
            (simple_expression
              (decimal_literal)))))))
    (concurrent_block
      (BEGIN)
      (concurrent_simple_signal_assignment
        (name
        (identifier))
      (signal_assignment)
      (waveform
        (waveform_element
          (simple_expression
            (decimal_literal))))))
    (end_architecture
      (END)
      (identifier)))))

