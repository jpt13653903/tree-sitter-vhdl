;-------------------------------------------------------------------------------
;
; Maintainer: jpt13653903
; Capture Reference: https://neovim.io/doc/user/treesitter.html#treesitter-highlight-groups
;-------------------------------------------------------------------------------
;
(line_comment
  (comment_content) @comment @spell) @comment

(block_comment
  (comment_content) @comment.documentation @spell) @comment

(identifier) @variable

[
  (ACCESS)
  (AFTER)
  (ALIAS)
  (ARCHITECTURE)
  (ARRAY)
  (ASSUME)
  (ATTRIBUTE)
  (BLOCK)
  (BODY)
  (COMPONENT)
  (CONFIGURATION)
  (CONTEXT)
  (COVER)
  (DISCONNECT)
  (ENTITY)
  (FAIRNESS)
  (FILE)
  (FORCE)
  (GENERATE)
  (GENERIC)
  (GROUP)
  (LABEL)
  (LITERAL)
  (MAP)
  (NEW)
  (PACKAGE)
  (PARAMETER)
  (PORT)
  (PROPERTY)
  (RANGE)
  (REJECT)
  (RELEASE)
  (RESTRICT)
  (SEQUENCE)
  (TRANSPORT)
  (UNAFFECTED)
  (VIEW)
  (VPKG)
  (VMODE)
  (VPROP)
  (VUNIT)
] @keyword

[
  (ALL)
  (OTHERS)
  (box)
  (DEFAULT)
  (OPEN)
] @constant.builtin

[
  (IS)
  (BEGIN)
  (END)
] @keyword

(parameter_specification
  (IN) @keyword)

[
  (PROCESS)
  (WAIT)
  (ON)
  (UNTIL)
] @keyword.coroutine

(timeout_clause
  (FOR) @keyword.coroutine)

[
  (FUNCTION)
  (PROCEDURE)
] @keyword.function

[
  (TO)
  (DOWNTO)
  (OF)
] @keyword.operator

[
  (LIBRARY)
  (USE)
] @keyword.import

[
  (SUBTYPE)
  (TYPE)
  (RECORD)
  (UNITS)
  (CONSTANT)
  (SIGNAL)
  (VARIABLE)
] @keyword.type

[
  (PROTECTED)
  (PRIVATE)
  (PURE)
  (IMPURE)
  (INERTIAL)
  (POSTPONED)
  (STRONG)
  (GUARDED)
  (OUT)
  (INOUT)
  (LINKAGE)
  (BUFFER)
  (REGISTER)
  (BUS)
  (SHARED)
] @keyword.modifier

(mode
  (IN) @keyword.modifier)

(force_mode
  (IN) @keyword.modifier)

[
  (WHILE)
  (LOOP)
  (NEXT)
  (EXIT)
] @keyword.repeat

(for_loop
  (FOR) @keyword.repeat)

(block_configuration
  (FOR) @keyword)

(configuration_specification
  (FOR) @keyword)

(component_configuration
  (FOR) @keyword)

(end_for
  (FOR) @keyword)

(RETURN) @keyword.return

[
  (ASSERT)
  (REPORT)
  (SEVERITY)
] @keyword.debug

[
  (IF)
  (THEN)
  (ELSIF)
  (CASE)
] @keyword.conditional

(when_element
  (WHEN) @keyword.conditional)

(case_generate_alternative
  (WHEN) @keyword.conditional)

(else_statement
  (ELSE) @keyword.conditional)

(else_generate
  (ELSE) @keyword.conditional)

[
  (WITH)
  (SELECT)
] @keyword.conditional.ternary

(when_expression
  (WHEN) @keyword.conditional.ternary)

(else_expression
  (ELSE) @keyword.conditional.ternary)

(else_waveform
  (ELSE) @keyword.conditional.ternary)

(else_expression_or_unaffected
  (ELSE) @keyword.conditional.ternary)

(NULL) @constant.builtin

(user_directive) @keyword.directive

(protect_directive) @keyword.directive

(warning_directive) @keyword.directive

(error_directive) @keyword.directive

(if_conditional_analysis
  (IF) @keyword.directive)

(if_conditional_analysis
  (THEN) @keyword.directive)

(elsif_conditional_analysis
  (ELSIF) @keyword.directive)

(else_conditional_analysis
  (ELSE) @keyword.directive)

(end_conditional_analysis
  (END) @keyword.directive)

(end_conditional_analysis
  (IF) @keyword.directive)

(directive_body) @keyword.directive

(directive_constant_builtin) @constant.macro

(directive_error) @comment.error

(directive_protect) @keyword.directive

(directive_warning) @comment.warning

[
  (condition_conversion)
  (unary_operator)
  (logical_operator)
  (relational_operator)
  (shift_operator)
  (sign)
  (adding_operator)
  (multiplying_operator)
  (exponentiate)
  (variable_assignment)
  (signal_assignment)
] @operator

[
  "'"
  ","
  "."
  ";"
] @punctuation.delimiters

[
  "("
  ")"
  "["
  "]"
  "<<"
  ">>"
] @punctuation.bracket

[
  ":"
  "@"
  "=>"
] @punctuation.special

[
  (decimal_integer)
  (string_literal_std_logic)
] @number

(decimal_float) @number.float

(bit_string_length) @property

(bit_string_base) @type.builtin

(bit_string_value) @number

(based_literal
  (based_base) @type.builtin
  (based_integer) @number)

(based_literal
  (based_base) @type.builtin
  (based_float) @number.float)

(string_literal) @string @spell

(character_literal) @character

(library_constant_std_logic) @constant.builtin

[
  (attribute_function)
  (attribute_impure_function)
  (attribute_mode_view)
  (attribute_pure_function)
  (attribute_range)
  (attribute_signal)
  (attribute_subtype)
  (attribute_type)
  (attribute_value)
  (library_attribute)
] @attribute.builtin

(library_constant) @constant.builtin

(library_function) @function.builtin

(library_type) @type.builtin

(library_constant_boolean) @boolean

(library_constant_character) @character

(library_constant_debug) @keyword.debug

(unit) @keyword.modifier

(library_constant_unit) @keyword.modifier

(label) @label

(generic_map_aspect
  (GENERIC) @constructor
  (MAP) @constructor)

(port_map_aspect
  (PORT) @constructor
  (MAP) @constructor)

(subtype_indication
  (name
    (identifier))) @type

(selection
  (identifier) @variable.member)

(attribute_identifier) @attribute

(library_namespace) @module.builtin

(library_clause
  (logical_name_list
    (identifier) @module))

(use_clause
  (selected_name
    .
    (identifier) @module))

(instantiated_unit
  (name
    .
    (identifier) @module))

(function_specification
  (operator_symbol) @function.builtin)

(function_specification
  (identifier) @function)

(procedure_specification
  (identifier) @function.method)

(type_declaration
  (identifier) @type.definition)

(mode_view_declaration
  (identifier) @type.definition)

(record_mode_view_indication
  (name
    (identifier) @type))

(package_declaration
  (identifier) @module)

(package_definition
  (identifier) @module)

(end_package
  (identifier) @module)

(end_package_body
  (identifier) @module)

(entity_declaration
  (identifier) @module)

(end_entity
  (identifier) @module)

(architecture_definition
  (ARCHITECTURE)
  (identifier) @property
  (OF)
  (name
    (identifier) @module))

(end_architecture
  (identifier) @property)

(subprogram_end
  (identifier) @function)

(ERROR) @error
