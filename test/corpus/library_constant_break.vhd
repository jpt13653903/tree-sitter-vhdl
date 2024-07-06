================================================================================
Library constants used in names used to break the parser
================================================================================

architecture Behaviour of MyModule is
begin
  A <= Output.Valid;
  B <= Output.Enabled;
end Behaviour;

--------------------------------------------------------------------------------

(design_file
  (design_unit
    (architecture_definition
      (identifier)
      (name
        (identifier))
      (architecture_head)
      (concurrent_block
        (concurrent_simple_signal_assignment
          (name
            (identifier))
          (signal_assignment)
          (waveform
            (waveform_element
              (simple_expression
                (name
                  (library_constant)
                  (name_selector
                    (selection
                      (identifier))))))))
        (concurrent_simple_signal_assignment
          (name
            (identifier))
          (signal_assignment)
          (waveform
            (waveform_element
              (simple_expression
                (name
                  (library_constant)
                  (name_selector
                    (selection
                      (identifier)))))))))
      (end_architecture
        (identifier)))))

