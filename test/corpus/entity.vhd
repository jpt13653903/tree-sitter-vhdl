================================================================================
Entity declaration, with some tool directives
================================================================================

entity MyModule is port(
  signal Clk, Reset : in  std_logic;

  signal \extended identifier\       : out   std_logic;
  signal identifier_with_underscores : inout std_logic;
  signal processes  : inout std_logic; -- Contains a keyword
  signal proc       : inout std_logic; -- Starts like a keyword
  signal proc_stuff : inout std_logic; -- Almost contains a keyword
  signal integ      : inout std_logic; -- Starts with a keyword, but also contains a keyword

  signal assume_something : out std_logic; -- Starts like a keyword, but breaks just after the underscore
  signal delayed          : out std_logic; -- A pre-defined attribute, but also a valid identifier
  signal testing : in integer   := b"1001";
  signal testing : in float     := 12#1234aba#e7;
  signal testing : in std_logic := x"UX01ZWLH-";
  `testing some stuff in my entity
  `entity in progress
  `if VHDL_VERSION > "2000" then
  `warning "This version is cool"
  `else
  `error "This version is bad"
  `end if
  `protect this code...
  signal testing: in integer range 2 to 10;
  signal testing: in std_logic_vector(5 downto 1, 7 downto 5);
  signal testing: in resolved std_ulogic
); end entity MyModule;

--------------------------------------------------------------------------------

(design_file
  (design_unit
    (entity_declaration
      (ENTITY)
      (identifier)
      (entity_head
        (IS)
        (port_clause
          (PORT)
          (interface_list
            (intervace_signal_declaration
              (SIGNAL)
              (identifier_list
                (identifier)
                (identifier))
              (simple_mode_indication
                (mode
                  (IN))
                (subtype_indication
                  (name
                    (library_type)))))
            (intervace_signal_declaration
              (SIGNAL)
              (identifier_list
                (identifier))
              (simple_mode_indication
                (mode
                  (OUT))
                (subtype_indication
                  (name
                    (library_type)))))
            (intervace_signal_declaration
              (SIGNAL)
              (identifier_list
                (identifier))
              (simple_mode_indication
                (mode
                  (INOUT))
                (subtype_indication
                  (name
                    (library_type)))))
            (intervace_signal_declaration
              (SIGNAL)
              (identifier_list
                (identifier))
              (simple_mode_indication
                (mode
                  (INOUT))
                (subtype_indication
                  (name
                    (library_type)))))
            (comment)
            (intervace_signal_declaration
              (SIGNAL)
              (identifier_list
                (identifier))
              (simple_mode_indication
                (mode
                  (INOUT))
                (subtype_indication
                  (name
                    (library_type)))))
            (comment)
            (intervace_signal_declaration
              (SIGNAL)
              (identifier_list
                (identifier))
              (simple_mode_indication
                (mode
                  (INOUT))
                (subtype_indication
                  (name
                    (library_type)))))
            (comment)
            (intervace_signal_declaration
              (SIGNAL)
              (identifier_list
                (identifier))
              (simple_mode_indication
                (mode
                  (INOUT))
                (subtype_indication
                  (name
                    (library_type)))))
            (comment)
            (intervace_signal_declaration
              (SIGNAL)
              (identifier_list
                (identifier))
              (simple_mode_indication
                (mode
                  (OUT))
                (subtype_indication
                  (name
                    (library_type)))))
            (comment)
            (intervace_signal_declaration
              (SIGNAL)
              (identifier_list
                (identifier))
              (simple_mode_indication
                (mode
                  (OUT))
                (subtype_indication
                  (name
                    (library_type)))))
            (comment)
            (intervace_signal_declaration
              (SIGNAL)
              (identifier_list
                (identifier))
              (simple_mode_indication
                (mode
                  (IN))
                (subtype_indication
                  (name
                    (library_type)))
                (initialiser
                  (variable_assignment)
                  (conditional_expression
                    (simple_expression
                      (bit_string_literal))))))
            (intervace_signal_declaration
              (SIGNAL)
              (identifier_list
                (identifier))
              (simple_mode_indication
                (mode
                  (IN))
                (subtype_indication
                  (name
                    (library_type)))
                (initialiser
                  (variable_assignment)
                  (conditional_expression
                    (simple_expression
                      (based_literal_float))))))
            (intervace_signal_declaration
              (SIGNAL)
              (identifier_list
                (identifier))
              (simple_mode_indication
                (mode
                  (IN))
                (subtype_indication
                  (name
                    (library_type)))
                (initialiser
                  (variable_assignment)
                  (conditional_expression
                    (simple_expression
                      (bit_string_literal))))))
            (user_directive
              (identifier)
              (directive_body)
              (directive_body)
              (directive_body)
              (directive_body)
              (directive_body))
            (user_directive
              (identifier)
              (directive_body)
              (directive_body))
            (if_conditional_analysis
              (IF)
              (conditional_analysis_expression
                (conditional_analysis_relation
                  (library_function)
                  (string_literal)))
              (THEN))
            (warning_directive
              (directive_warning)
              (string_literal))
            (else_conditional_analysis
              (ELSE))
            (error_directive
              (directive_error)
              (string_literal))
            (end_conditional_analysis
              (END)
              (IF))
            (protect_directive
              (directive_protect)
              (directive_body)
              (directive_body))
            (intervace_signal_declaration
              (SIGNAL)
              (identifier_list
                (identifier))
              (simple_mode_indication
                (mode
                  (IN))
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
            (intervace_signal_declaration
              (SIGNAL)
              (identifier_list
                (identifier))
              (simple_mode_indication
                (mode
                  (IN))
                (subtype_indication
                  (name
                    (library_type)
                    (name_selector
                      (parenthesis_group
                        (association_or_range_list
                          (simple_range
                            (simple_expression
                              (decimal_literal))
                            (DOWNTO)
                            (simple_expression
                              (decimal_literal)))
                          (simple_range
                            (simple_expression
                              (decimal_literal))
                            (DOWNTO)
                            (simple_expression
                              (decimal_literal))))))))))
            (intervace_signal_declaration
              (SIGNAL)
              (identifier_list
                (identifier))
              (simple_mode_indication
                (mode
                  (IN))
                (subtype_indication
                  (resolution_indication
                    (name
                      (library_function)))
                  (name
                    (library_type))))))))
      (end_entity
        (END)
        (ENTITY)
        (identifier)))))

