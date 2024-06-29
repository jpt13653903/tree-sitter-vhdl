================================================================================
Basic architecture, testing blocks
================================================================================

/*------------------------------------------------------------------------------

A multi-line block comment
------------------------------------------------------------------------------*/

architecture EXAMPLE of STRUCTURE is
  subtype  DIGIT is integer range 0 to 9;
begin
  DIGIT_A <= 3; -- A line-comment
end EXAMPLE;

--------------------------------------------------------------------------------

(design_file
  (block_comment)
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
              (decimal_integer))
            (TO)
            (simple_expression
              (decimal_integer)))))))
    (concurrent_block
      (BEGIN)
      (concurrent_simple_signal_assignment
        (name
        (identifier))
      (signal_assignment)
      (waveform
        (waveform_element
          (simple_expression
            (decimal_integer))))))
    (line_comment)
    (end_architecture
      (END)
      (identifier)))))

