;-------------------------------------------------------------------------------
;
; ## Capture Reference
;
; https://neovim.io/doc/user/treesitter.html#treesitter-highlight-groups
;
; @variable                    various variable names
; @variable.builtin            built-in variable names (e.g. this, self)
; @variable.parameter          parameters of a function
; @variable.parameter.builtin  special parameters (e.g. _, it)
; @variable.member             object and struct fields
;
; @constant                    constant identifiers
; @constant.builtin            built-in constant values
; @constant.macro              constants defined by the preprocessor
;
; @module                      modules or namespaces
; @module.builtin              built-in modules or namespaces
; @label                       GOTO and other labels (e.g. label: in C), including heredoc labels
;
; @string                      string literals
; @string.documentation        string documenting code (e.g. Python docstrings)
; @string.regexp               regular expressions
; @string.escape               escape sequences
; @string.special              other special strings (e.g. dates)
; @string.special.symbol       symbols or atoms
; @string.special.path         filenames
; @string.special.url          URIs (e.g. hyperlinks)
;
; @character                   character literals
; @character.special           special characters (e.g. wildcards)
;
; @boolean                     boolean literals
; @number                      numeric literals
; @number.float                floating-point number literals
;
; @type                        type or class definitions and annotations
; @type.builtin                built-in types
; @type.definition             identifiers in type definitions (e.g. typedef <type> <identifier> in C)
;
; @attribute                   attribute annotations (e.g. Python decorators, Rust lifetimes)
; @attribute.builtin           builtin annotations (e.g. @property in Python)
; @property                    the key in key/value pairs
;
; @function                    function definitions
; @function.builtin            built-in functions
; @function.call               function calls
; @function.macro              preprocessor macros
;
; @function.method             method definitions
; @function.method.call        method calls
;
; @constructor                 constructor calls and definitions
; @operator                    symbolic operators (e.g. +, *)
;
; @keyword                     keywords not fitting into specific categories
; @keyword.coroutine           keywords related to coroutines (e.g. go in Go, async/await in Python)
; @keyword.function            keywords that define a function (e.g. func in Go, def in Python)
; @keyword.operator            operators that are English words (e.g. and, or)
; @keyword.import              keywords for including modules (e.g. import, from in Python)
; @keyword.type                keywords defining composite types (e.g. struct, enum)
; @keyword.modifier            keywords defining type modifiers (e.g. const, static, public)
; @keyword.repeat              keywords related to loops (e.g. for, while)
; @keyword.return              keywords like return and yield
; @keyword.debug               keywords related to debugging
; @keyword.exception           keywords related to exceptions (e.g. throw, catch)
;
; @keyword.conditional         keywords related to conditionals (e.g. if, else)
; @keyword.conditional.ternary ternary operator (e.g. ?, :)
;
; @keyword.directive           various preprocessor directives and shebangs
; @keyword.directive.define    preprocessor definition directives
;
; @punctuation.delimiter       delimiters (e.g. ;, ., ,)
; @punctuation.bracket         brackets (e.g. (), {}, [])
; @punctuation.special         special symbols (e.g. {} in string interpolation)
;
; @comment                     line and block comments
; @comment.documentation       comments documenting code
;
; @comment.error               error-type comments (e.g. ERROR, FIXME, DEPRECATED)
; @comment.warning             warning-type comments (e.g. WARNING, FIX, HACK)
; @comment.todo                todo-type comments (e.g. TODO, WIP)
; @comment.note                note-type comments (e.g. NOTE, INFO, XXX)
;
; @markup.strong               bold text
; @markup.italic               italic text
; @markup.strikethrough        struck-through text
; @markup.underline            underlined text (only for literal underline markup!)
;
; @markup.heading              headings, titles (including markers)
; @markup.heading.1            top-level heading
; @markup.heading.2            section heading
; @markup.heading.3            subsection heading
; @markup.heading.4            and so on
; @markup.heading.5            and so forth
; @markup.heading.6            six levels ought to be enough for anybody
;
; @markup.quote                block quotes
; @markup.math                 math environments (e.g. $ ... $ in LaTeX)
;
; @markup.link                 text references, footnotes, citations, etc.
; @markup.link.label           link, reference descriptions
; @markup.link.url             URL-style links
;
; @markup.raw                  literal or verbatim text (e.g. inline code)
; @markup.raw.block            literal or verbatim text as a stand-alone block
;
; @markup.list                 list markers
; @markup.list.checked         checked todo-style list markers
; @markup.list.unchecked       unchecked todo-style list markers
;
; @diff.plus                   added text (for diff files)
; @diff.minus                  deleted text (for diff files)
; @diff.delta                  changed text (for diff files)
;
; @tag                         XML-style tag names (e.g. in XML, HTML, etc.)
; @tag.builtin                 XML-style tag names (e.g. HTML5 tags)
; @tag.attribute               XML-style tag attributes
; @tag.delimiter               XML-style tag delimiters
; ------------------------------------------------------------------------------

(comment) @comment @spell
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

[ (PROCESS) (WAIT) (ON) (UNTIL) ] @keyword.coroutine
(timeout_clause (FOR) @keyword.coroutine)

[ (FUNCTION) (PROCEDURE) ] @keyword.function

[ (TO) (DOWNTO) (OF) ] @keyword.operator

[ (LIBRARY) (USE) ] @keyword.import

[
    (SUBTYPE) (TYPE) (RECORD) (UNITS)
    (CONSTANT) (SIGNAL) (VARIABLE)
] @keyword.type

[
    (PROTECTED) (PRIVATE)
    (PURE) (IMPURE)
    (INERTIAL) (POSTPONED) (STRONG) (GUARDED)
    (OUT) (INOUT) (LINKAGE) (BUFFER)
    (REGISTER) (BUS)
    (SHARED)
] @keyword.modifier
(mode (IN) @keyword.modifier)
(force_mode (IN) @keyword.modifier)

[ (WHILE) (LOOP) (NEXT) (EXIT) ] @keyword.repeat
(for_loop (FOR) @keyword.repeat)

(block_configuration         (FOR) @keyword)
(configuration_specification (FOR) @keyword)
(component_configuration     (FOR) @keyword)
(end_for                     (FOR) @keyword)

[ (RETURN) ] @keyword.return

[ (ASSERT) (REPORT) (SEVERITY) ] @keyword.debug

[ (IF) (THEN) (ELSIF) (CASE) ] @keyword.conditional
(when_element              (WHEN) @keyword.conditional)
(case_generate_alternative (WHEN) @keyword.conditional)
(else_statements           (ELSE) @keyword.conditional)
(else_generate             (ELSE) @keyword.conditional)

[ (WITH) (SELECT) ] @keyword.conditional.ternary
(when_expression               (WHEN) @keyword.conditional.ternary)
(else_expression               (ELSE) @keyword.conditional.ternary)
(else_waveform                 (ELSE) @keyword.conditional.ternary)
(else_expression_or_unaffected (ELSE) @keyword.conditional.ternary)

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
(directive_constant_builtin) @constant.macro
(directive_error)            @comment.error
(directive_protect)          @keyword.directive
(directive_warning)          @comment.warning

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
    (bit_string_literal)
] @number

[
    (decimal_literal_float)
    (based_literal_float)
] @number.float

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

(library_constant)           @constant.builtin
(library_function)           @function.builtin
(library_type)               @type.builtin
(library_constant_boolean)   @boolean
(library_constant_character) @character
(library_constant_debug)     @keyword.debug

(unit)                       @keyword.modifier
(library_constant_unit)      @keyword.modifier

(label) @label

(generic_map_aspect
    (GENERIC) @constructor
    (MAP)     @constructor )

(port_map_aspect
    (PORT) @constructor
    (MAP)  @constructor )

(subtype_indication
  (name
    (identifier))) @type

(selection
  (identifier) @variable.member )

(attribute_identifier) @attribute

(library_namespace) @module.builtin

(library_clause
  (logical_name_list
    (identifier) @module ))
(use_clause
  (selected_name
    . (identifier) @module ))
(instantiated_unit
  (name
    . (identifier) @module ))

(function_specification
  (operator_symbol) @function.builtin)

(function_specification
  (identifier) @function)

(procedure_specification
  (identifier) @function.method)

(type_declaration      (identifier) @type.definition)
(mode_view_declaration (identifier) @type.definition)
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

