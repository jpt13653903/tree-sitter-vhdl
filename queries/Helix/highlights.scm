;-------------------------------------------------------------------------------
;
; Maintainer: Chris44442
; Capture Reference: https://docs.helix-editor.com/themes.html#syntax-highlighting
;-------------------------------------------------------------------------------
;
(line_comment) @comment.line

(block_comment) @comment.block

(identifier) @variable

[
  "access"
  "after"
  "alias"
  "architecture"
  "array"
  ; "assume"
  "attribute"
  "block"
  "body"
  "component"
  "configuration"
  "context"
  ; "cover"
  "disconnect"
  "entity"
  ; "fairness"
  "file"
  "force"
  "generate"
  "generic"
  "group"
  "label"
  "literal"
  "map"
  "new"
  "package"
  "parameter"
  "port"
  "property"
  "range"
  "reject"
  "release"
  ; "restrict"
  "sequence"
  "transport"
  "unaffected"
  "view"
  ; "vmode"
  ; "vpkg"
  ; "vprop"
  "vunit"
] @keyword

[
  (ALL)
  (OTHERS)
  "<>"
  (DEFAULT)
  (OPEN)
] @constant.builtin

[
  "is"
  "begin"
  "end"
] @keyword

(parameter_specification
  "in" @keyword)

[
  "process"
  "wait"
  "on"
  "until"
] @keyword

(timeout_clause
  "for" @keyword)

[
  "function"
  "procedure"
] @keyword.function

[
  "to"
  "downto"
  "of"
] @keyword.operator

[
  "library"
  "use"
] @keyword.control.import

[
  "subtype"
  "type"
  "record"
  "units"
  "constant"
  "signal"
  "variable"
] @keyword.storage.type

[
  "protected"
  "private"
  "pure"
  "impure"
  "inertial"
  "postponed"
  ; "strong"
  "guarded"
  "out"
  "inout"
  "linkage"
  "buffer"
  "register"
  "bus"
  "shared"
] @keyword.storage.modifier

(mode
  "in" @keyword.storage.modifier)

(force_mode
  "in" @keyword.storage.modifier)

[
  "while"
  "loop"
  "next"
  "exit"
] @keyword.control.repeat

(for_loop
  "for" @keyword.control.repeat)

(block_configuration
  "for" @keyword)

(configuration_specification
  "for" @keyword)

(component_configuration
  "for" @keyword)

(end_for
  "for" @keyword)

"return" @keyword.control.return

[
  "assert"
  "report"
  "severity"
] @keyword

[
  "if"
  "then"
  "elsif"
  "case"
] @keyword.control.conditional

(when_element
  "when" @keyword.control.conditional)

(case_generate_alternative
  "when" @keyword.control.conditional)

(else_statement
  "else" @keyword.control.conditional)

(else_generate
  "else" @keyword.control.conditional)

[
  "with"
  "select"
] @keyword.control.conditional

(when_expression
  "when" @keyword.control.conditional)

(else_expression
  "else" @keyword.control.conditional)

(else_waveform
  "else" @keyword.control.conditional)

(else_expression_or_unaffected
  "else" @keyword.control.conditional)

"null" @constant.builtin

(user_directive) @keyword.directive

(protect_directive) @keyword.directive

(warning_directive) @keyword.directive

(error_directive) @keyword.directive

(if_conditional_analysis
  "if" @keyword.directive)

(if_conditional_analysis
  "then" @keyword.directive)

(elsif_conditional_analysis
  "elsif" @keyword.directive)

(else_conditional_analysis
  "else" @keyword.directive)

(end_conditional_analysis
  "end" @keyword.directive)

(end_conditional_analysis
  "if" @keyword.directive)

(directive_body) @keyword.directive

(directive_constant_builtin) @constant.builtin

(directive_error) @keyword.directive

(directive_protect) @keyword.directive

(directive_warning) @keyword.directive

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
] @constant.numeric.integer

(decimal_float) @constant.numeric.float

(bit_string_length) @type.parameter

(bit_string_base) @type.builtin

(bit_string_value) @constant.numeric.integer

(based_literal
  (based_base) @type.builtin
  (based_integer) @constant.numeric.integer)

(based_literal
  (based_base) @type.builtin
  (based_float) @constant.numeric.float)

(string_literal) @string

(character_literal) @constant.character

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
] @attribute

(library_constant) @constant.builtin

(library_function) @function.builtin

(library_type) @type.builtin

(library_constant_boolean) @constant.builtin.boolean

(library_constant_character) @character

(library_constant_debug) @keyword.debug

(unit) @keyword.storage.modifier

(library_constant_unit) @keyword.storage.modifier

(label) @label

(generic_map_aspect
  "generic" @constructor
  "map" @constructor)

(port_map_aspect
  "port" @constructor
  "map" @constructor)

(subtype_indication
  (name
    (identifier))) @type

(selection
  (identifier) @variable.other.member)

(attribute_identifier) @attribute

(library_namespace) @namespace

(library_clause
  (logical_name_list
    (identifier) @namespace))

(use_clause
  (selected_name
    .
    (identifier) @namespace))

(instantiated_unit
  (name
    .
    (identifier) @namespace))

(function_specification
  (operator_symbol) @function.builtin)

(function_specification
  (identifier) @function)

(procedure_specification
  (identifier) @function.method)

(type_declaration
  (identifier) @type)

(mode_view_declaration
  (identifier) @type)

(record_mode_view_indication
  (name
    (identifier) @type))

(package_declaration
  (identifier) @namespace)

(package_definition
  (identifier) @namespace)

(end_package
  (identifier) @namespace)

(end_package_body
  (identifier) @namespace)

(entity_declaration
  (identifier) @namespace)

(end_entity
  (identifier) @namespace)

(architecture_definition
  "architecture"
  (identifier) @type.parameter
  "of"
  (name
    (identifier) @namespace))

(end_architecture
  (identifier) @type.parameter)

(subprogram_end
  (identifier) @function)

(ERROR) @error
