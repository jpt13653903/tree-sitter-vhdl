;-------------------------------------------------------------------------------
;
; ## Capture Reference
;
; https://docs.helix-editor.com/themes.html#syntax-highlighting
;
; We use a similar set of scopes as Sublime Text. See also TextMate scopes.
;
;     attribute - Class attributes, HTML tag attributes
;
;     type - Types
;         builtin - Primitive types provided by the language (int, usize)
;         parameter - Generic type parameters (T)
;         enum
;             variant
;
;     constructor
;
;     constant (TODO: constant.other.placeholder for %v)
;         builtin Special constants provided by the language (true, false, nil etc)
;             boolean
;         character
;             escape
;         numeric (numbers)
;             integer
;             float
;
;     string (TODO: string.quoted.{single, double}, string.raw/.unquoted)?
;         regexp - Regular expressions
;         special
;             path
;             url
;             symbol - Erlang/Elixir atoms, Ruby symbols, Clojure keywords
;
;     comment - Code comments
;         line - Single line comments (//)
;         block - Block comments (e.g. (/* */)
;             documentation - Documentation comments (e.g. /// in Rust)
;
;     variable - Variables
;         builtin - Reserved language variables (self, this, super, etc.)
;         parameter - Function parameters
;         other
;             member - Fields of composite data types (e.g. structs, unions)
;
;     label
;
;     punctuation
;         delimiter - Commas, colons
;         bracket - Parentheses, angle brackets, etc.
;         special - String interpolation brackets.
;
;     keyword
;         control
;             conditional - if, else
;             repeat - for, while, loop
;             import - import, export
;             return
;             exception
;         operator - or, in
;         directive - Preprocessor directives (#if in C)
;         function - fn, func
;         storage - Keywords describing how things are stored
;             type - The type of something, class, function, var, let, etc.
;             modifier - Storage modifiers like static, mut, const, ref, etc.
;
;     operator - ||, +=, >
;
;     function
;         builtin
;         method
;         macro
;         special (preprocessor in C)
;
;     tag - Tags (e.g. <body> in HTML)
;         builtin
;
;     namespace
;
;     special
;
;     markup
;         heading
;             marker
;             1, 2, 3, 4, 5, 6 - heading text for h1 through h6
;         list
;             unnumbered
;             numbered
;             checked
;             unchecked
;         bold
;         italic
;         strikethrough
;         link
;             url - URLs pointed to by links
;             label - non-URL link references
;             text - URL and image descriptions in links
;         quote
;         raw
;             inline
;             block
;
;     diff - version control changes
;         plus - additions
;             gutter - gutter indicator
;         minus - deletions
;             gutter - gutter indicator
;         delta - modifications
;             moved - renamed or moved files/changes
;             gutter - gutter indicator
; ------------------------------------------------------------------------------

(comment) @comment
(identifier) @variable

[
    (ACCESS) (AFTER) (ALIAS) (ARCHITECTURE) (ARRAY) (ASSUME)
    (ATTRIBUTE) (BLOCK) (BODY) (COMPONENT)
    (CONFIGURATION) (CONTEXT) (COVER) (DISCONNECT)
    (ENTITY) (FAIRNESS) (FILE)
    (FORCE) (GENERATE) (GENERIC) (GROUP)
    (LABEL) (LITERAL)
    (MAP) (NEW) (PACKAGE)
    (PARAMETER) (PORT) (PROPERTY)
    (RANGE) (REJECT)
    (RELEASE) (RESTRICT) (SEQUENCE)
    (TRANSPORT)
    (UNAFFECTED) (VIEW) (VPKG) (VMODE)
    (VPROP) (VUNIT)
] @keyword

[ (ALL) (OTHERS) (box) (DEFAULT) (OPEN) ] @constant.builtin

[ (IS) (BEGIN) (END) ] @keyword
(parameter_specification (IN) @keyword)

[ (PROCESS) (WAIT) (ON) (UNTIL) ] @keyword
(timeout_clause (FOR) @keyword)

[ (FUNCTION) (PROCEDURE) ] @keyword.function

[ (TO) (DOWNTO) (OF) ] @keyword.operator

[ (LIBRARY) (USE) ] @keyword.control.import

[
    (SUBTYPE) (TYPE) (RECORD) (UNITS)
    (CONSTANT) (SIGNAL) (VARIABLE)
] @keyword.storage.type

[
    (PROTECTED) (PRIVATE)
    (PURE) (IMPURE)
    (INERTIAL) (POSTPONED) (STRONG) (GUARDED)
    (OUT) (INOUT) (LINKAGE) (BUFFER)
    (REGISTER) (BUS)
    (SHARED)
] @keyword.storage.modifier
(mode (IN) @keyword.storage.modifier)
(force_mode (IN) @keyword.storage.modifier)

[ (WHILE) (LOOP) (NEXT) (EXIT) ] @keyword.control.repeat
(for_loop (FOR) @keyword.control.repeat)

(block_configuration         (FOR) @keyword)
(configuration_specification (FOR) @keyword)
(component_configuration     (FOR) @keyword)
(end_for                     (FOR) @keyword)

[ (RETURN) ] @keyword.control.return

[ (ASSERT) (REPORT) (SEVERITY) ] @keyword

[ (IF) (THEN) (ELSIF) (CASE) ] @keyword.control.conditional
(when_element              (WHEN) @keyword.control.conditional)
(case_generate_alternative (WHEN) @keyword.control.conditional)
(else_statements           (ELSE) @keyword.control.conditional)
(else_generate             (ELSE) @keyword.control.conditional)

[ (WITH) (SELECT) ] @keyword.control.conditional
(when_expression               (WHEN) @keyword.control.conditional)
(else_expression               (ELSE) @keyword.control.conditional)
(else_waveform                 (ELSE) @keyword.control.conditional)
(else_expression_or_unaffected (ELSE) @keyword.control.conditional)

[ (NULL) ] @constant.builtin

(user_directive)    @keyword.directive
(protect_directive) @keyword.directive
(warning_directive) @keyword.directive
(error_directive)   @keyword.directive

(if_conditional_analysis    (IF)    @keyword.directive)
(if_conditional_analysis    (THEN)  @keyword.directive)
(elsif_conditional_analysis (ELSIF) @keyword.directive)
(else_conditional_analysis  (ELSE)  @keyword.directive)
(end_conditional_analysis   (END)   @keyword.directive)
(end_conditional_analysis   (IF)    @keyword.directive)

(directive_body)             @keyword.directive
(directive_constant_builtin) @constant.builtin
(directive_error)            @keyword.directive
(directive_protect)          @keyword.directive
(directive_warning)          @keyword.directive

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

[ "'" "," "." ";" ] @punctuation.delimiters

[ "("  ")" "["  "]" "<<" ">>" ] @punctuation.bracket

[ ":" "@" "=>" ] @punctuation.special

[
    (decimal_literal)
    (based_literal)
    (string_literal_std_logic)
    (bit_string_literal)
] @number

[
    (decimal_literal_float)
    (based_literal_float)
] @number.float

(string_literal) @string
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
] @attribute

(library_constant)           @constant.builtin
(library_function)           @function.builtin
(library_type)               @type.builtin
(library_constant_boolean)   @constant.builtin.boolean
(library_constant_character) @character
(library_constant_debug)     @keyword.debug

(unit)                       @keyword.storage.modifier
(library_constant_unit)      @keyword.storage.modifier

(label) @label

(generic_map_aspect
    (GENERIC) @constructor
    (MAP)     @constructor)

(port_map_aspect
    (PORT) @constructor
    (MAP)  @constructor)

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
    . (identifier) @namespace))
(instantiated_unit
  (name
    . (identifier) @namespace))

(function_specification
  (operator_symbol) @function.builtin)

(function_specification
  (identifier) @function)

(procedure_specification
  (identifier) @function.method)

(type_declaration      (identifier) @type)
(mode_view_declaration (identifier) @type)
(record_mode_view_indication (name (identifier) @type))

(package_declaration (identifier) @module)
(package_definition  (identifier) @module)
(end_package         (identifier) @module)
(end_package_body    (identifier) @module)

(entity_declaration  (identifier) @module)
(end_entity          (identifier) @module)

(architecture_definition
  (ARCHITECTURE)
  (identifier) @property
  (OF)
  (name
    (identifier) @module))

(end_architecture (identifier) @property)
(subprogram_end   (identifier) @function)

(ERROR) @error

