module.exports = grammar({
    name: 'vhdl',

    /* The external scanner tokenises all lexical elements (i.e. section 15 of
     * the VHDL-2019 standard), which makes handling case insensitivity and
     * multiple look-ahead easier.
     *
     * In addition to the lexical elements, it also tokenises often-used
     * library identifiers and built-in attributes.
     *
     * It also makes all searches binary, in contrast to parser.c that mostly
     * use linear searches (probably because it has to preserve priority).
     */
    externals: $ => [
        $.identifier,

        $._ABS,
        $.ACCESS,
        $.AFTER,
        $.ALIAS,
        $.ALL,
        $._AND,
        $.ARCHITECTURE,
        $.ARRAY,
        $.ASSERT,
        $.ASSUME, // Not used -- PSL keyword
        $.ATTRIBUTE,
        $.BEGIN,
        $.BLOCK,
        $.BODY,
        $.BUFFER,
        $.BUS,
        $.CASE,
        $.COMPONENT,
        $.CONFIGURATION,
        $.CONSTANT,
        $.CONTEXT,
        $.COVER, // Not used -- PSL keyword
        $.DEFAULT,
        $.DISCONNECT,
        $.DOWNTO,
        $.ELSE,
        $.ELSIF,
        $.END,
        $.ENTITY,
        $.EXIT,
        $.FAIRNESS, // Not used -- PSL keyword
        $.FILE,
        $.FOR,
        $.FORCE,
        $.FUNCTION,
        $.GENERATE,
        $.GENERIC,
        $.GROUP,
        $.GUARDED,
        $.IF,
        $.IMPURE,
        $.IN,
        $.INERTIAL,
        $.INOUT,
        $.IS,
        $.LABEL,
        $.LIBRARY,
        $.LINKAGE,
        $.LITERAL,
        $.LOOP,
        $.MAP,
        $._MOD,
        $._NAND,
        $.NEW,
        $.NEXT,
        $._NOR,
        $._NOT,
        $.NULL,
        $.OF,
        $.ON,
        $.OPEN,
        $._OR,
        $.OTHERS,
        $.OUT,
        $.PACKAGE,
        $.PARAMETER,
        $.PORT,
        $.POSTPONED,
        $.PROCEDURE,
        $.PROCESS,
        $.PROPERTY,
        $.PROTECTED,
        $.PRIVATE,
        $.PURE,
        $.RANGE,
        $.RECORD,
        $.REGISTER,
        $.REJECT,
        $.RELEASE,
        $._REM,
        $.REPORT,
        $.RESTRICT, // Not used -- PSL keyword
        $.RETURN,
        $._ROL,
        $._ROR,
        $.SELECT,
        $.SEQUENCE,
        $.SEVERITY,
        $.SIGNAL,
        $.SHARED,
        $._SLA,
        $._SLL,
        $._SRA,
        $._SRL,
        $.STRONG, // Not used -- PSL keyword
        $.SUBTYPE,
        $.THEN,
        $.TO,
        $.TRANSPORT,
        $.TYPE,
        $.UNAFFECTED,
        $.UNITS,
        $.UNTIL,
        $.USE,
        $.VARIABLE,
        $.VIEW,
        $.VMODE, // Not used -- PSL keyword
        $.VPKG,  // Not used -- PSL keyword
        $.VPROP, // Not used -- PSL keyword
        $.VUNIT,
        $.WAIT,
        $.WHEN,
        $.WHILE,
        $.WITH,
        $._XNOR,
        $._XOR,

        $.reserved_end_marker, // Scanner internal use only

        $.directive_body,
        $.directive_constant_builtin,
        $.directive_error,
        $._directive_newline,
        $.directive_protect,
        $.directive_warning,

        $.directive_end_marker, // Scanner internal use only

        $._grave_accent,
        $.box,

        $.delimiter_end_marker, // Scanner internal use only

        $.decimal_literal,
        $.decimal_literal_float,
        $.based_literal,
        $.based_literal_float,
        $.character_literal,
        $.string_literal,
        $.bit_string_literal,
        $.operator_symbol,
        $.comment,

        $.token_end_marker, // Scanner internal use only

        $.attribute_function,
        $.attribute_impure_function,
        $.attribute_mode_view,
        $.attribute_pure_function,
        $.attribute_range,
        $.attribute_signal,
        $.attribute_subtype,
        $.attribute_type,
        $.attribute_value,

        $.library_attribute,
        $.library_constant,
        $.library_constant_boolean,
        $.library_constant_character,
        $.library_constant_debug,
        $.library_constant_unit,
        $.library_function,
        $.library_namespace,
        $.library_type,

        $._end_of_file,

        $.error_sentinel,
    ],

    extras: $ => [
        $.comment,
        $._tool_directive,
        /\s+/
    ],

    conflicts: $ => [ ],

    rules: {
        // Design File
            design_file: $ => seq(
                repeat($.design_unit), $._end_of_file
            ),

            design_unit: $ => choice(
                $._context_item,
                $._library_unit
            ),

        // Context Items
            _context_item: $ => choice(
                $.library_clause,
                $.use_clause,
                $.context_reference
            ),

            library_clause: $ => seq(
                $.LIBRARY, $.logical_name_list, ";"
            ),

            use_clause: $ => seq(
                $.USE, $.selected_name, repeat(seq(",", $.selected_name)), ";"
            ),

            context_reference: $ => seq(
                $.CONTEXT, $.selected_name_list, ";"
            ),

            logical_name_list: $ => seq(
                $._logical_name, repeat(seq(",", $._logical_name))
            ),

            _logical_name: $ => choice(
                $.library_namespace,
                $.identifier
            ),

            selected_name_list: $ => seq(
                $.selected_name, repeat(seq(",", $.selected_name))
            ),

            selected_name: $ => seq(
                $._logical_name, repeat(seq(".", choice($.identifier, $.ALL)))
            ),

        // Library Units
            _library_unit: $ => choice(
                $.entity_declaration,
                $.configuration_declaration,
                $.package_declaration,
                $.package_instantiation_declaration,
                $.context_declaration,

                $.architecture_definition,
                $.package_definition
            ),

            entity_declaration: $ => seq(
                $.ENTITY, $.identifier, $.entity_head, optional($.entity_body), $.end_entity, ";"
            ),

            entity_head: $ => seq(
                $.IS, optional($.generic_clause), optional($.port_clause), repeat($._entity_declarative_item)
            ),

            port_clause: $ => seq(
                $.PORT, "(", $.interface_list, ")", ";"
            ),

            entity_body: $ => seq(
                $.BEGIN, repeat($._entity_statement)
            ),

            end_entity: $ => seq(
                $.END, optional($.ENTITY), optional($.identifier)
            ),

            configuration_declaration: $ => seq(
                $.CONFIGURATION, $.identifier, $.OF, $.name, $.configuration_head, $.block_configuration, $.end_configuration, ";"
            ),

            configuration_head: $ => seq(
                $.IS, repeat($._configuration_declarative_item), repeat(seq($.verification_unit_binding_indication, ";"))
            ),

            end_configuration: $ => seq(
                $.END, optional($.CONFIGURATION), optional($.identifier)
            ),

            package_declaration: $ => seq(
                $.PACKAGE, $.identifier, $.package_declaration_body, $.end_package, ";"
            ),

            package_declaration_body: $ => seq(
                $.IS, optional($.package_header), repeat($._package_declarative_item)
            ),

            end_package: $ => seq(
                $.END, optional($.PACKAGE), optional($.identifier)
            ),

            package_instantiation_declaration: $ => seq(
                $.PACKAGE, $.identifier, $.IS, $.NEW, $.name, optional($.generic_map_aspect), ";"
            ),

            interface_package_declaration: $ => seq(
                $.PACKAGE, $.identifier, $.IS, $.NEW, $.name, $._interface_package_generic_map_aspect
            ),

            context_declaration: $ => seq(
                $.CONTEXT, $.identifier, $.context_declaration_body, $.end_context, ";"
            ),

            context_declaration_body: $ => seq(
                $.IS, repeat($._context_item)
            ),

            end_context: $ => seq(
                $.END, optional($.CONTEXT), optional($.identifier)
            ),

            architecture_definition: $ => seq(
                $.ARCHITECTURE, $.identifier, $.OF, $.name, $.architecture_head, $.concurrent_block, $.end_architecture, ";"
            ),

            architecture_head: $ => seq(
                $.IS, repeat($._block_declarative_item)
            ),

            end_architecture: $ => seq(
                $.END, optional($.ARCHITECTURE), optional($.identifier)
            ),

            package_definition: $ => seq(
                $.PACKAGE, $.BODY, $.identifier, $.package_definition_body, $.end_package_body, ";"
            ),

            package_definition_body: $ => seq(
                $.IS, repeat($._package_body_declarative_item)
            ),

            end_package_body: $ => seq(
                $.END, optional(seq($.PACKAGE, $.BODY)), optional($.identifier)
            ),

        // Declaration Item Lists
            _entity_declarative_item: $ => choice(
                $.subprogram_declaration,
                $.subprogram_definition,
                $.subprogram_instantiation_declaration,
                $.package_declaration,
                $.package_definition,
                $.package_instantiation_declaration,
                $.type_declaration,
                $.subtype_declaration,
                $.mode_view_declaration,
                $.constant_declaration,
                $.signal_declaration,
                $.variable_declaration,
                $.file_declaration,
                $.alias_declaration,
                $.attribute_declaration,
                $.attribute_specification,
                $.disconnection_specification,
                $.use_clause,
                $.group_template_declaration,
                $.group_declaration
            ),

            _package_declarative_item: $ => choice(
                $.subprogram_declaration,
                $.subprogram_instantiation_declaration,
                $.package_declaration,
                $.package_instantiation_declaration,
                $.type_declaration,
                $.subtype_declaration,
                $.mode_view_declaration,
                $.constant_declaration,
                $.signal_declaration,
                $.variable_declaration,
                $.file_declaration,
                $.alias_declaration,
                $.component_declaration,
                $.attribute_declaration,
                $.attribute_specification,
                $.disconnection_specification,
                $.use_clause,
                $.group_template_declaration,
                $.group_declaration
            ),

            _package_body_declarative_item: $ => choice(
                $.subprogram_declaration,
                $.subprogram_definition,
                $.subprogram_instantiation_declaration,
                $.package_declaration,
                $.package_definition,
                $.package_instantiation_declaration,
                $.type_declaration,
                $.subtype_declaration,
                $.constant_declaration,
                $.variable_declaration,
                $.file_declaration,
                $.alias_declaration,
                $.attribute_declaration,
                $.attribute_specification,
                $.use_clause,
                $.group_template_declaration,
                $.group_declaration
            ),

            _protected_type_declarative_item: $ => choice(
                $.subprogram_declaration,
                $.subprogram_instantiation_declaration,
                $.attribute_specification,
                $.use_clause,
                $.private_variable_declaration,
                $.alias_declaration
            ),

            _protected_type_body_declarative_item: $ => choice(
                $.subprogram_declaration,
                $.subprogram_definition,
                $.subprogram_instantiation_declaration,
                $.package_declaration,
                $.package_definition,
                $.package_instantiation_declaration,
                $.type_declaration,
                $.subtype_declaration,
                $.constant_declaration,
                $.variable_declaration,
                $.file_declaration,
                $.alias_declaration,
                $.attribute_declaration,
                $.attribute_specification,
                $.use_clause,
                $.group_template_declaration,
                $.group_declaration
            ),

            _process_declarative_item: $ => choice(
                $.subprogram_declaration,
                $.subprogram_definition,
                $.subprogram_instantiation_declaration,
                $.package_declaration,
                $.package_definition,
                $.package_instantiation_declaration,
                $.type_declaration,
                $.subtype_declaration,
                $.constant_declaration,
                $.variable_declaration,
                $.file_declaration,
                $.alias_declaration,
                $.attribute_declaration,
                $.attribute_specification,
                $.use_clause,
                $.group_template_declaration,
                $.group_declaration
            ),

            _subprogram_declarative_item: $ => choice(
                $.subprogram_declaration,
                $.subprogram_definition,
                $.subprogram_instantiation_declaration,
                $.package_declaration,
                $.package_definition,
                $.package_instantiation_declaration,
                $.type_declaration,
                $.subtype_declaration,
                $.constant_declaration,
                $.variable_declaration,
                $.file_declaration,
                $.alias_declaration,
                $.attribute_declaration,
                $.attribute_specification,
                $.use_clause,
                $.group_template_declaration,
                $.group_declaration
            ),

            _block_declarative_item: $ => prec(1, choice(
                $.subprogram_declaration,
                $.subprogram_definition,
                $.subprogram_instantiation_declaration,
                $.package_declaration,
                $.package_definition,
                $.package_instantiation_declaration,
                $.type_declaration,
                $.subtype_declaration,
                $.mode_view_declaration,
                $.constant_declaration,
                $.signal_declaration,
                $.variable_declaration,
                $.file_declaration,
                $.alias_declaration,
                $.component_declaration,
                $.attribute_declaration,
                $.attribute_specification,
                $.configuration_specification,
                $.disconnection_specification,
                $.use_clause,
                $.group_template_declaration,
                $.group_declaration
            )),

        // Declarations
            subprogram_declaration: $ => seq(
                $._subprogram_specification, ";"
            ),

            subprogram_definition: $ => seq(
                $._subprogram_specification, $.subprogram_head, $.sequential_block, $.subprogram_end, ";"
            ),

            subprogram_head: $ => seq(
                $.IS, repeat($._subprogram_declarative_item)
            ),

            subprogram_end: $ => seq(
                $.END, optional(choice($.PROCEDURE, $.FUNCTION)), optional($._designator)
            ),

            subprogram_instantiation_declaration: $ => seq(
                choice($.PROCEDURE, $.FUNCTION), $._designator, $.IS, $.NEW, $.name, optional($.signature), optional($.generic_map_aspect), ";"
            ),

            type_declaration: $ => seq(
                $.TYPE, $.identifier, optional(seq($.IS, $._type_definition)), ";"
            ),

            subtype_declaration: $ => seq(
                $.SUBTYPE, $.identifier, $.IS, $.subtype_indication, ";"
            ),

            mode_view_declaration: $ => seq(
                $.VIEW, $.identifier, $.OF, $.subtype_indication, $.mode_view_body, $.end_view, ";"
            ),

            mode_view_body: $ => seq(
                $.IS, repeat($.mode_view_element_definition)
            ),

            end_view: $ => seq(
                $.END, $.VIEW, optional($.identifier)
            ),

            constant_declaration: $ => seq(
                $.CONSTANT, $.identifier_list, ":", $.subtype_indication, optional($.initialiser), ";"
            ),

            signal_declaration: $ => seq(
                $.SIGNAL, $.identifier_list, ":", $.subtype_indication, optional($.signal_kind), optional($.initialiser), ";"
            ),

            signal_kind: $ => choice(
                $.REGISTER,
                $.BUS
            ),

            variable_declaration: $ => seq(
                optional($.SHARED), $.VARIABLE, $.identifier_list, ":", $.subtype_indication, optional($.generic_map_aspect), optional($.initialiser), ";"
            ),

            initialiser: $ => seq(
                $.variable_assignment, $.conditional_expression
            ),

            file_declaration: $ => seq(
                $.FILE, $.identifier_list, ":", $.subtype_indication, optional($.file_open_information), ";"
            ),

            interface_file_declaration: $ => seq(
                $.FILE, $.identifier_list, ":", $.subtype_indication
            ),

            alias_declaration: $ => seq(
                $.ALIAS, $._alias_designator, optional(seq(":", $.subtype_indication)), $.IS, $.name, ";"
            ),

            component_declaration: $ => seq(
                $.COMPONENT, $.identifier, optional($.component_body), $.end_component, ";"
            ),

            component_body: $ => choice(
                seq($.IS, optional($.generic_clause), optional($.port_clause)),
                seq($.generic_clause, optional($.port_clause)),
                seq($.port_clause)
            ),

            end_component: $ => seq(
                $.END, optional($.COMPONENT), optional($.identifier)
            ),

            attribute_declaration: $ => seq(
                $.ATTRIBUTE, $.identifier, ":", $.name, ";"
            ),

            attribute_specification: $ => seq(
                $.ATTRIBUTE, $._attribute_designator, $.OF, $.entity_specification, $.IS, $.conditional_expression, ";"
            ),

            disconnection_specification: $ => seq(
                $.DISCONNECT, $.guarded_signal_specification, $.AFTER, $._expression, ";"
            ),

            group_template_declaration: $ => seq(
                $.GROUP, $.identifier, $.IS, "(", $.entity_class_entry_list, ")", ";"
            ),

            group_declaration: $ => seq(
                $.GROUP, $.identifier, ":", $.name, "(", $.group_constituent_list, ")", ";"
            ),

            private_variable_declaration: $ => seq(
                $.PRIVATE, $.variable_declaration
            ),

        // Type Definitions
            _interface_type_indication: $ => choice(
                $.subtype_indication,
                $.unspecified_type_indication
            ),

            unspecified_type_indication: $ => seq(
                $.TYPE, $.IS, $._incomplete_type_definition
            ),

            interface_type_declaration: $ => seq(
                $.TYPE, $.identifier, optional(seq($.IS, $._incomplete_type_definition))
            ),

            _incomplete_type_definition: $ => choice(
                $.private_incomplete_type_definition,
                $.scalar_incomplete_type_definition,
                $.discrete_incomplete_type_definition,
                $.integer_incomplete_type_definition,
                $.physical_incomplete_type_definition,
                $.floating_incomplete_type_definition,
                $.array_type_definition,
                $.access_incomplete_type_definition,
                $.file_incomplete_type_definition
            ),

            private_incomplete_type_definition: $ => $.PRIVATE,

            scalar_incomplete_type_definition: $ => $.box,

            discrete_incomplete_type_definition: $ => seq(
                "(", $.box, ")"
            ),

            integer_incomplete_type_definition: $ => seq(
                $.RANGE, $.box
            ),

            physical_incomplete_type_definition: $ => seq(
                $.UNITS, $.box
            ),

            floating_incomplete_type_definition: $ => seq(
                $.RANGE, $.box, ".", $.box
            ),

            array_type_definition: $ => choice(
                seq($.ARRAY, "(", $.array_index_incomplete_type_list, ")", $.OF, $._incomplete_subtype_indication),
                seq($.ARRAY, $.index_constraint, $.OF, $.subtype_indication)
            ),

            array_index_incomplete_type_list: $ => seq(
                $._array_index_incomplete_type, repeat(seq(",", $._array_index_incomplete_type))
            ),

            _array_index_incomplete_type: $ => choice(
                $.index_subtype_definition,
                $.index_constraint,
                $.unspecified_type_indication
            ),

            index_constraint: $ => prec.left(seq(
                $._range, repeat(seq(",", $._range))
            )),

            index_subtype_definition: $ => seq(
                $.name, $.RANGE, $.box
            ),

            access_type_definition: $ => seq(
                $.ACCESS, $.subtype_indication, optional($.generic_map_aspect)
            ),

            access_incomplete_type_definition: $ => seq(
                $.ACCESS, $._incomplete_subtype_indication
            ),

            file_type_definition: $ => seq(
                $.FILE, $.OF, $.name
            ),

            file_incomplete_type_definition: $ => seq(
                $.FILE, $.OF, $.incomplete_type_mark
            ),

            subtype_indication: $ => seq(
                optional($.resolution_indication), $.name, optional($.range_constraint)
            ),

            resolution_indication: $ => choice(
                $.name,
                seq("(", $._element_resolution, ")")
            ),

            _element_resolution: $ => choice(
                $.resolution_indication,
                $.record_resolution
            ),

            record_resolution: $ => seq(
                $.record_element_resolution, repeat(seq(",", $.record_element_resolution))
            ),

            record_element_resolution: $ => seq(
                $.identifier, $.resolution_indication
            ),

            _incomplete_subtype_indication: $ => choice(
                $.subtype_indication,
                $.unspecified_type_indication
            ),

            incomplete_type_mark: $ => choice(
                $.name,
                $.unspecified_type_indication
            ),

        // Statement Blocks
            concurrent_block: $ => seq(
                $.BEGIN, repeat($._concurrent_statement)
            ),

            sequential_block: $ => seq(
                $.BEGIN, repeat($._sequential_statement)
            ),

            generate_body: $ => choice(
                $.generate_direct_block,
                seq($.generate_head, $.generate_block, $.generate_block_end)
            ),

            generate_head: $ => seq(
                $.GENERATE, repeat($._block_declarative_item)
            ),

            generate_direct_block: $ => seq(
                $.GENERATE, repeat($._concurrent_statement)
            ),

            case_generate_alternative: $ => prec.left(seq(
                $.WHEN, optional($.label_declaration), $._element, $.case_generate_body
            )),

            case_generate_body: $ => choice(
                $.case_generate_direct_block,
                seq($.case_generate_head, $.generate_block, $.generate_block_end)
            ),

            case_generate_head: $ => seq(
                "=>", repeat($._block_declarative_item)
            ),

            case_generate_direct_block: $ => seq(
                "=>", repeat($._concurrent_statement)
            ),

            generate_block: $ => seq(
                $.BEGIN, repeat($._concurrent_statement)
            ),

            generate_block_end: $ => seq(
                $.END, optional(alias($.identifier, $.label)), ";"
            ),

        // Statements
            _entity_statement: $ => choice(
                $.concurrent_assertion_statement,
                $.concurrent_procedure_call_statement,
                $.process_statement
            ),

            _concurrent_statement: $ => choice(
                $.component_instantiation_statement,

                $.for_generate_statement,
                $.if_generate_statement,
                $.case_generate_statement,

                $.concurrent_assertion_statement,
                $.concurrent_procedure_call_statement,
                $.concurrent_simple_signal_assignment,
                $.concurrent_conditional_signal_assignment,
                $.concurrent_selected_signal_assignment,

                $.block_statement,
                $.process_statement
            ),

            _sequential_statement: $ => choice(
                $.assertion_statement,
                $.case_statement,
                $.exit_statement,
                $.if_statement,
                $.loop_statement,
                $.next_statement,
                $.null_statement,
                $.procedure_call_statement,
                $.report_statement,
                $.return_statement,
                $.sequential_block_statement,
                $.simple_waveform_assignment,
                $.simple_force_assignment,
                $.simple_release_assignment,
                $.conditional_signal_assignment,
                $.selected_waveform_assignment,
                $.selected_force_assignment,
                $.simple_variable_assignment,
                $.selected_variable_assignment,
                $.wait_statement
            ),

            block_statement: $ => seq(
                $.label_declaration, $.BLOCK, optional($.guard_condition), optional($.block_head), $.concurrent_block, $.end_block, ";"
            ),

            guard_condition: $ => seq(
                "(", $._expression, ")"
            ),

            block_head: $ => choice(
                seq($.IS, optional(seq($.generic_clause, optional(seq($.generic_map_aspect, ";")))), optional(seq($.port_clause, optional(seq($.port_map_aspect, ";")))), repeat($._block_declarative_item)),
                seq($.generic_clause, optional(seq($.generic_map_aspect, ";")), optional(seq($.port_clause, optional(seq($.port_map_aspect, ";")))), repeat($._block_declarative_item)),
                seq($.port_clause, optional(seq($.port_map_aspect, ";")), repeat($._block_declarative_item)),
                seq(repeat1($._block_declarative_item))
            ),

            end_block: $ => seq(
                $.END, $.BLOCK, optional(alias($.identifier, $.label))
            ),

            sequential_block_statement: $ => seq(
                optional($.label_declaration), $.BLOCK, optional($.sequential_block_head), $.sequential_block, $.end_block, ";"
            ),

            sequential_block_head: $ => choice(
                seq($.IS, repeat($._process_declarative_item)),
                seq(repeat1($._process_declarative_item))
            ),

            component_instantiation_statement: $ => choice(
                seq($.label_declaration, $.instantiated_unit, optional($.generic_map_aspect), optional($.port_map_aspect), ";"),
                seq($.label_declaration, $.name,              optional($.generic_map_aspect),          $.port_map_aspect,  ";")
            ),

            instantiated_unit: $ => choice(
                seq($.COMPONENT, $.name), // Optional "component" covered by procedure call
                seq($.ENTITY, optional(seq($.library_namespace, ".")), $.name, optional($.architecture_identifier)),
                seq($.CONFIGURATION, $.name)
            ),

            architecture_identifier: $ => seq(
                "(", $.identifier, ")"
            ),

            process_statement: $ => seq(
                optional($.label_declaration), optional($.POSTPONED), $.PROCESS, optional($.sensitivity_specification), optional($.process_head), $.sequential_block, $.end_process, ";"
            ),

            sensitivity_specification: $ => seq(
                "(", $._process_sensitivity_list, ")"
            ),

            process_head: $ => choice(
                seq($.IS, repeat($._process_declarative_item)),
                seq(     repeat1($._process_declarative_item)),
            ),

            end_process: $ => seq(
                $.END, optional($.POSTPONED), $.PROCESS, optional(alias($.identifier, $.label))
            ),

            case_generate_statement: $ => seq(
                $.label_declaration, $.CASE, $._expression, $.case_generate_block, $.end_generate, ";"
            ),

            case_generate_block: $ => seq(
                $.GENERATE, repeat1($.case_generate_alternative)
            ),

            for_generate_statement: $ => seq(
                $.label_declaration, $.for_loop, $.generate_body, $.end_generate, ";"
            ),

            if_generate_statement: $ => seq(
                $.label_declaration, $.if_generate, $.generate_body, repeat($.elsif_generate), optional($.else_generate), $.end_generate, ";"
            ),

            if_generate: $ => seq(
                $.IF, optional($.label_declaration), $._expression
            ),

            elsif_generate: $ => seq(
                $.ELSIF, optional($.label_declaration), $._expression, $.generate_body
            ),

            else_generate: $ => seq(
                $.ELSE, optional($.label_declaration), $.generate_body
            ),

            end_generate: $ => seq(
                $.END, $.GENERATE, optional(alias($.identifier, $.label))
            ),

            assertion_statement: $ => seq(
                optional($.label_declaration), $.assertion, ";"
            ),

            concurrent_assertion_statement: $ => seq(
                optional($.label_declaration), optional($.POSTPONED), $.assertion, ";"
            ),

            assertion: $ => seq(
                $.ASSERT, $._expression, optional($.report_expression), optional($.severity_expression)
            ),

            report_expression: $ => seq(
                $.REPORT, $._expression
            ),

            severity_expression: $ => seq(
                $.SEVERITY, $._expression
            ),

            case_statement: $ => seq(
                optional($.label_declaration), $.case_expression, $.case_body, $.end_case, ";"
            ),

            case_expression: $ => seq(
                $.CASE, optional("?"), $._expression
            ),

            case_body: $ => seq(
                $.IS, repeat1($.case_statement_alternative)
            ),

            end_case: $ => seq(
                $.END, $.CASE, optional("?"), optional(alias($.identifier, $.label))
            ),

            exit_statement: $ => seq(
                optional($.label_declaration), $.EXIT, optional(alias($.identifier, $.label)), optional($.when_expression), ";"
            ),

            when_expression: $ => seq(
                $.WHEN, $._expression
            ),

            if_statement: $ => seq(
                optional($.label_declaration), $.if_expression, $.then_statements, repeat($.elsif_statements), optional($.else_statements), $.end_if, ";"
            ),

            if_expression: $ => seq(
                $.IF, $._expression
            ),

            then_statements: $ => seq(
                $.THEN, repeat($._sequential_statement)
            ),

            elsif_statements: $ => seq(
                $.ELSIF, $._expression, $.then_statements
            ),

            else_statements: $ => seq(
                $.ELSE, repeat($._sequential_statement)
            ),

            end_if: $ => seq(
                $.END, $.IF, optional(alias($.identifier, $.label))
            ),

            loop_statement: $ => seq(
                optional($.label_declaration), optional($._iteration_scheme), $.loop_body, $.end_loop, ";"
            ),

            _iteration_scheme: $ => choice(
                $.while_loop,
                $.for_loop
            ),

            loop_body: $ => seq(
                $.LOOP, repeat($._sequential_statement)
            ),

            end_loop: $ => seq(
                $.END, $.LOOP, optional(alias($.identifier, $.label))
            ),

            next_statement: $ => seq(
                optional($.label_declaration), $.NEXT, optional(alias($.identifier, $.label)), optional($.when_expression), ";"
            ),

            null_statement: $ => seq(
                optional($.label_declaration), $.NULL, ";"
            ),

            procedure_call_statement: $ => seq(
                optional($.label_declaration), $.name, ";"
            ),

            concurrent_procedure_call_statement: $ => seq(
                optional($.label_declaration), optional($.POSTPONED), $.name, ";"
            ),

            report_statement: $ => seq(
                optional($.label_declaration), $.report_expression, optional($.severity_expression), ";"
            ),

            return_statement: $ => choice(
                seq(optional($.label_declaration), $.RETURN, optional($.when_expression), ";"),
                seq(optional($.label_declaration), $.RETURN, $.conditional_or_unaffected_expression, ";")
            ),

            signal_assignment: $ => "<=",

            simple_waveform_assignment: $ => seq(
                optional($.label_declaration), $._target, $.signal_assignment, optional($.delay_mechanism), $.waveform, ";"
            ),

            variable_assignment: $ => ":=",

            simple_variable_assignment: $ => seq(
                optional($.label_declaration), $._target, $.variable_assignment, $.conditional_or_unaffected_expression, ";"
            ),

            concurrent_simple_signal_assignment: $ => seq(
                optional($.label_declaration), optional($.POSTPONED), $._target, $.signal_assignment, optional($.GUARDED), optional($.delay_mechanism), $.waveform, ";"
            ),

            simple_force_assignment: $ => seq(
                optional($.label_declaration), $._target, $.signal_assignment, $.FORCE, optional($.force_mode), $.conditional_or_unaffected_expression, ";"
            ),

            simple_release_assignment: $ => seq(
                optional($.label_declaration), $._target, $.signal_assignment, $.RELEASE, optional($.force_mode), ";"
            ),

            conditional_signal_assignment: $ => seq(
                optional($.label_declaration), $._target, $.signal_assignment, optional($.delay_mechanism), $.conditional_waveforms, ";"
            ),

            concurrent_conditional_signal_assignment: $ => seq(
                optional($.label_declaration), optional($.POSTPONED), $._target, $.signal_assignment, optional($.GUARDED), optional($.delay_mechanism), $.conditional_waveforms, ";"
            ),

            selected_waveform_assignment: $ => seq(
                optional($.label_declaration), $.with_expression, $.select_target, $.signal_assignment, optional($.delay_mechanism), $.selected_waveforms, ";"
            ),

            concurrent_selected_signal_assignment: $ => seq(
                optional($.label_declaration), optional($.POSTPONED), $.with_expression, $.select_target, $.signal_assignment, optional($.GUARDED), optional($.delay_mechanism), $.selected_waveforms, ";"
            ),

            selected_force_assignment: $ => seq(
                optional($.label_declaration), $.with_expression, $.select_target, $.signal_assignment, $.FORCE, optional($.force_mode), $.selected_expressions, ";"
            ),

            selected_variable_assignment: $ => seq(
                optional($.label_declaration), $.with_expression, $.select_target, $.variable_assignment, $.selected_expressions, ";"
            ),

            with_expression: $ => seq(
                $.WITH, $._expression
            ),

            select_target: $ => seq(
                $.SELECT, optional("?"), $._target
            ),

            wait_statement: $ => seq(
                optional($.label_declaration), $.WAIT, optional($.sensitivity_clause), optional($.condition_clause), optional($.timeout_clause), ";"
            ),

        // Expressions
            conditional_expression: $ => prec(9, seq(
                $._expression, repeat(seq($.when_expression, $.else_expression))
            )),

            else_expression: $ => seq(
                $.ELSE, $._expression
            ),

            _expression: $ => prec(10, choice(
                $.condition_expression,
                $.logical_expression,
                $.relational_expression,
                $.shift_expression,
                $.simple_expression
            )),

            condition_expression: $ => prec(11, seq(
                $.condition_conversion, $._expression,
            )),

            condition_conversion: $ => "??",

            logical_expression: $ => prec.left(12, seq(
                $._expression, $.logical_operator, $._expression,
            )),

            relational_expression: $ => prec.left(13, seq(
                $._expression, $.relational_operator, $._expression,
            )),

            shift_expression: $ => prec.left(14, seq(
                $._expression, $.shift_operator, $._expression,
            )),

            simple_expression: $ => choice(
                prec.left(15, seq($._expression, $.adding_operator,      $._expression)),
                prec     (16, seq(               $.sign,                 $._expression)),
                prec.left(17, seq($._expression, $.multiplying_operator, $._expression)),
                prec.left(18, seq($._expression, $.exponentiate,         $._expression)),
                prec     (19, seq(               $.unary_operator,       $._expression)),
                prec     (20, $._primary)
            ),

            unary_operator: $ => choice(
                $._ABS,
                $._NOT,
                $._AND,
                $._OR,
                $._NAND,
                $._NOR,
                $._XOR,
                $._XNOR
            ),

            logical_operator: $ => choice(
                $._AND,
                $._OR,
                $._NAND,
                $._NOR,
                $._XOR,
                $._XNOR
            ),

            relational_operator: $ => choice(
                "=",
                "/=",
                "<",
                "<=",
                ">",
                ">=",
                "?=",
                "?/=",
                "?<",
                "?<=",
                "?>",
                "?>="
            ),

            shift_operator: $ => choice(
                $._SLL,
                $._SRL,
                $._SLA,
                $._SRA,
                $._ROL,
                $._ROR
            ),

            sign: $ => choice(
                "+",
                "-"
            ),

            adding_operator: $ => choice(
                "+",
                "-",
                "&"
            ),

            multiplying_operator: $ => choice(
                "*",
                "/",
                $._MOD,
                $._REM
            ),

            exponentiate: $ => "**",

            _primary: $ => choice(
                $.name,
                $._literal,
                $.allocator,
                $.parenthesis_expression
            ),

            name: $ => prec.left(21, seq(
                seq($._direct_name, repeat($.name_selector)),
            )),

            _direct_name: $ => prec.left(choice(
                $.identifier,
                $.operator_symbol,
                $.character_literal,
                $.library_function,
                $.library_type,
                $._external_name,
            )),

            name_selector: $ => choice(
                $.function_call,
                $.parenthesis_group,
                $.attribute,
                $.signature,
                $.selection
            ),

            _external_name: $ => choice(
                $.external_constant_name,
                $.external_signal_name,
                $.external_variable_name
            ),

            external_constant_name: $ => seq(
                "<<", $.CONSTANT, $._external_pathname, ":", $._interface_type_indication, ">>"
            ),

            external_signal_name: $ => seq(
                "<<", $.SIGNAL, $._external_pathname, ":", $._interface_type_indication, ">>"
            ),

            external_variable_name: $ => seq(
                "<<", $.VARIABLE, $._external_pathname, ":", $._interface_type_indication, ">>"
            ),

            _external_pathname: $ => choice(
                $.package_pathname,
                $.absolute_pathname,
                $.relative_pathname
            ),

            package_pathname: $ => seq(
                "@", $.identifier, ".", $.identifier, ".", repeat(seq($.identifier, ".")), $.identifier
            ),

            absolute_pathname: $ => seq(
                ".", $.partial_pathname
            ),

            relative_pathname: $ => seq(
                repeat(seq("^", ".")), $.partial_pathname
            ),

            partial_pathname: $ => seq(
                repeat(seq($.pathname_element, ".")), $.identifier
            ),

            pathname_element: $ => seq(
              $.identifier, optional(seq("(", $._expression, ")"))
            ),

            function_call: $ => prec.right(choice(
                seq(optional($.generic_map_aspect), $.PARAMETER, $.MAP, $.parenthesis_group),
                seq($.generic_map_aspect, optional(seq(optional(seq($.PARAMETER, $.MAP)), $.parenthesis_group)))
            )),

            parenthesis_group: $ => seq(
                "(",
                optional($.association_or_range_list),
                ")",
            ),

            association_or_range_list: $ => seq(
                $._association_or_range, repeat(seq(",", $._association_or_range))
            ),

            _association_or_range: $ => choice(
                $.association_element,
                $._range
            ),

            association_element: $ => choice(
                $._actual_part,
                prec.left(6, seq($.name, "=>", $._actual_part))
            ),

            _actual_part: $ => prec(21, choice(
                seq(optional($.INERTIAL), $.conditional_expression),
                $.OPEN
            )),

            attribute: $ => seq(
                "'",
                choice(
                    $._attribute_designator,
                    $.parenthesis_expression // qualified_expression
                ),
            ),

            _attribute_designator: $ => choice(
                alias($.identifier, $.attribute_identifier),
                $.attribute_function,
                $.attribute_impure_function,
                $.attribute_mode_view,
                $.attribute_pure_function,
                $.attribute_range,
                $.attribute_signal,
                $.attribute_subtype,
                $.attribute_type,
                $.attribute_value,
                $.library_attribute
            ),

            signature: $ => seq(
                "[", optional(seq($.name, repeat(seq(",", $.name)))), optional(seq($.RETURN, $.name)), "]"
            ),

            selection: $ => seq(
                ".", $._suffix
            ),

            _suffix: $ => choice(
                $.identifier,
                $.character_literal,
                $.operator_symbol,
                $.ALL
            ),

            _literal: $ => choice(
                seq($._abstract_literal, optional($._unit)),
                $.bit_string_literal,
                $.string_literal,
                $.library_constant,
                $.library_constant_boolean,
                $.library_constant_character,
                $.library_constant_debug,
                $.NULL
            ),

            _abstract_literal: $ => choice(
                $.decimal_literal,
                $.decimal_literal_float,
                $.based_literal,
                $.based_literal_float
            ),

            _unit: $ => choice(
                alias($.identifier, $.unit),
                $.library_constant_unit
            ),

            allocator: $ => seq(
                $.NEW, $.name
            ),

            parenthesis_expression: $ => seq(
                "(", $.element_association_list, ")",
            ),

            element_association_list: $ => seq(
                $.element_association, repeat(seq(",", $.element_association))
            ),

            element_association: $ => choice(
                $.conditional_expression,
                prec(6, seq($._element, "=>", $.conditional_expression))
            ),

            _element: $ => choice(
                $.simple_expression,
                $._range,
                $.OTHERS,
                $.choices
            ),

            choices: $ => prec.left(7, seq(
                $._element, "|", $._element
            )),

            _range: $ => choice(
                $._expression,
                $.simple_range
            ),

            simple_range: $ => prec.left(8, seq(
                $.simple_expression, $._direction, $.simple_expression
            )),

            _direction: $ => choice(
                $.TO,
                $.DOWNTO
            ),

        // Tool Directives
            _tool_directive: $ => seq(
                $._grave_accent, $._directive, $._directive_newline
            ),

            _directive: $ => choice(
                $.user_directive,
                $.protect_directive,
                $.warning_directive,
                $.error_directive,

                $.if_conditional_analysis,
                $.elsif_conditional_analysis,
                $.else_conditional_analysis,
                $.end_conditional_analysis
            ),

            user_directive: $ => seq(
                $.identifier, repeat($.directive_body)
            ),

            protect_directive: $ => seq(
                $.directive_protect, repeat($.directive_body),
            ),

            warning_directive: $ => seq(
                $.directive_warning, $.string_literal,
            ),

            error_directive: $ => seq(
                $.directive_error, $.string_literal,
            ),

            if_conditional_analysis: $ => seq(
                $.IF, $.conditional_analysis_expression, $.THEN
            ),

            elsif_conditional_analysis: $ => seq(
                $.ELSIF, $.conditional_analysis_expression, $.THEN
            ),

            else_conditional_analysis: $ => seq(
                $.ELSE
            ),

            end_conditional_analysis: $ => seq(
                $.END, optional($.IF)
            ),

            conditional_analysis_expression: $ => seq(
                $.conditional_analysis_relation, repeat(seq($.logical_operator, $.conditional_analysis_relation))
            ),

            conditional_analysis_relation: $ => choice(
                seq(optional(alias($._NOT, $.unary_operator)), "(", $.conditional_analysis_expression, ")"),
                seq($._conditional_analysis_identifier, $._conditional_analysis_operator, $.string_literal)
            ),

            _conditional_analysis_operator: $ => choice(
                "=",
                "/=",
                "<",
                "<=",
                ">",
                ">="
            ),

            _conditional_analysis_identifier: $ => choice(
                $.directive_constant_builtin,
                $.identifier
            ),

        // Configuration
            _configuration_declarative_item: $ => choice(
                $.use_clause,
                $.attribute_specification,
                $.group_declaration
            ),

            _configuration_item: $ => choice(
                $.block_configuration,
                $.component_configuration
            ),

            block_configuration: $ => seq(
                $.FOR, $.name, repeat($.use_clause), repeat($._configuration_item), $.end_for, ";"
            ),

            component_configuration: $ => seq(
                $.FOR, $.component_specification, optional($.binding_indication), repeat(seq($.verification_unit_binding_indication, ";")), optional($.block_configuration), $.end_for, ";"
            ),

            end_for: $ => seq(
                $.END, $.FOR
            ),

        // Interface Declaration
            interface_list: $ => seq(
                $._interface_declaration, repeat(seq(";", $._interface_declaration)), optional(";")
            ),

            _interface_declaration: $ => choice(
                $.interface_declaration,
                $.intervace_constant_declaration,
                $.intervace_signal_declaration,
                $.intervace_variable_declaration,
                $.interface_file_declaration,

                $.interface_type_declaration,
                $.interface_subprogram_declaration,
                $.interface_package_declaration
            ),

            interface_declaration: $ => seq(
                $.identifier, ":", $._mode_indication
            ),

            intervace_constant_declaration: $ => seq(
                $.CONSTANT, $.identifier, ":", $._mode_indication
            ),

            intervace_signal_declaration: $ => seq(
                $.SIGNAL, $.identifier, ":", $._mode_indication
            ),

            intervace_variable_declaration: $ => seq(
                $.VARIABLE, $.identifier, ":", $._mode_indication
            ),

            interface_subprogram_declaration: $ => seq(
                $._interface_subprogram_specification, optional(seq($.IS, $._interface_subprogram_default))
            ),

            _interface_subprogram_specification: $ => choice(
                $.interface_procedure_specification,
                $.interface_function_specification
            ),

            procedure_specification: $ => prec.left(seq(
                $.PROCEDURE, $._designator, optional($.subprogram_header), optional($.parameter_list_specification)
            )),

            interface_procedure_specification: $ => seq(
                $.PROCEDURE, $._designator, optional($.parameter_list_specification)
            ),

            function_specification: $ => seq(
                optional(choice($.PURE, $.IMPURE)), $.FUNCTION, $._designator, optional($.subprogram_header), optional($.parameter_list_specification), $.RETURN, optional(seq($.identifier, $.OF)), $.name
            ),

            interface_function_specification: $ => seq(
                optional(choice($.PURE, $.IMPURE)), $.FUNCTION, $._designator, optional($.parameter_list_specification), $.RETURN, $.name
            ),

            _interface_package_generic_map_aspect: $ => choice(
                $.generic_map_any,
                $.generic_map_default,
                $.generic_map_aspect
            ),

            generic_map_any: $ => seq(
                $.GENERIC, $.MAP, "(", $.box, ")"
            ),

            generic_map_default: $ => seq(
                $.GENERIC, $.MAP, "(", $.DEFAULT, ")"
            ),

            generic_map_aspect: $ => seq(
                $.GENERIC, $.MAP, $.association_list
            ),

            port_map_aspect: $ => seq(
                $.PORT, $.MAP, $.association_list
            ),

            association_list: $ => seq(
                "(", $.association_element, repeat(seq(",", $.association_element)), ")"
            ),

            _interface_subprogram_default: $ => choice(
                $.name,
                $.box
            ),

            _designator: $ => choice(
                $.identifier,
                $.operator_symbol
            ),

            identifier_list: $ => seq(
                $.identifier, repeat(seq(",", $.identifier))
            ),

            _mode_indication: $ => choice(
                $.simple_mode_indication,
                $._mode_view_indication
            ),

            simple_mode_indication: $ => seq(
                optional($.mode), $._interface_type_indication, optional($.BUS), optional($.initialiser)
            ),

            _mode_view_indication: $ => choice(
                $.record_mode_view_indication,
                $.array_mode_view_indication
            ),

            record_mode_view_indication: $ => seq(
                $.VIEW, $.name, optional(seq($.OF, $.subtype_indication))
            ),

            array_mode_view_indication: $ => seq(
                $.VIEW, "(", $.name, ")", optional(seq($.OF, $.subtype_indication))
            ),

            mode_view_element_definition: $ => seq(
                $.record_element_list, ":", $._element_mode_indication, ";"
            ),

            record_element_list: $ => seq(
                $.identifier, repeat(seq(",", $.identifier))
            ),

            _element_mode_indication: $ => choice(
                $.mode,
                $._element_mode_view_indication
            ),

            _element_mode_view_indication: $ => choice(
                $.element_record_mode_view_indication,
                $.element_array_mode_view_indication
            ),

            element_record_mode_view_indication: $ => seq(
                $.VIEW, $.name
            ),

            element_array_mode_view_indication: $ => seq(
                $.VIEW, "(", $.name, ")"
            ),

            mode: $ => choice(
                $.IN,
                $.OUT,
                $.INOUT,
                $.BUFFER,
                $.LINKAGE
            ),

        // Others
            range_constraint: $ => seq(
                $.RANGE, $._range
            ),

            group_constituent_list: $ => seq(
                $.name, repeat(seq(",", $.name))
            ),

            entity_class_entry_list: $ => seq(
                $.entity_class_entry, repeat(seq(",", $.entity_class_entry))
            ),

            entity_class_entry: $ => seq(
                $._entity_class, optional($.box)
            ),

            guarded_signal_specification: $ => seq(
                $.signal_list, ":", $.name
            ),

            signal_list: $ => choice(
                seq($.name, repeat(seq(",", $.name))),
                $.OTHERS,
                $.ALL
            ),

            entity_specification: $ => seq(
                $.entity_name_list, ":", $._entity_class
            ),

            _entity_class: $ => choice(
                $.ENTITY,
                $.ARCHITECTURE,
                $.CONFIGURATION,
                $.PROCEDURE,
                $.FUNCTION,
                $.PACKAGE,
                $.TYPE,
                $.SUBTYPE,
                $.CONSTANT,
                $.SIGNAL,
                $.VARIABLE,
                $.COMPONENT,
                $.LABEL,
                $.LITERAL,
                $.UNITS,
                $.GROUP,
                $.FILE,
                $.PROPERTY,
                $.SEQUENCE,
                $.VIEW
            ),

            entity_name_list: $ => choice(
                seq($.entity_designator, repeat(seq(",", $.entity_designator))),
                $.OTHERS,
                $.ALL
            ),

            entity_designator: $ => seq(
                $._entity_tag, optional($.signature)
            ),

            _entity_tag: $ => choice(
                $.identifier,
                $.character_literal,
                $.operator_symbol
            ),

            _alias_designator: $ => choice(
                $.identifier,
                $.character_literal,
                $.operator_symbol
            ),

            file_open_information: $ => seq(
                optional(seq($.OPEN, $._expression)), $.IS, $.file_logical_name
            ),

            file_logical_name: $ => $._expression,

            package_header: $ => seq(
                $.generic_clause, optional(seq($.generic_map_aspect, ";"))
            ),

            generic_clause: $ => seq(
                $.GENERIC, "(", $.interface_list, ")", ";"
            ),

            subprogram_header: $ => seq(
                $.GENERIC, "(", $.interface_list, ")", optional($.generic_map_aspect)
            ),

            _subprogram_specification: $ => choice(
                $.procedure_specification,
                $.function_specification
            ),

            parameter_list_specification: $ => seq(
                optional($.PARAMETER), "(", $.interface_list, ")"
            ),

            _type_definition: $ => choice(
                $.enumeration_type_definition,
                $.range_constraint,
                $.physical_type_definition,
                $.array_type_definition,
                $.record_type_definition,
                $.access_type_definition,
                $.file_type_definition,
                $.protected_type_declaration,
                $.protected_type_body,
                $.protected_type_instantiation_definition
            ),

            protected_type_instantiation_definition: $ => seq(
                $.NEW, $.subtype_indication, optional($.generic_map_aspect)
            ),

            protected_type_declaration: $ => seq(
                $.PROTECTED, optional($.protected_type_header), repeat($._protected_type_declarative_item), $.protected_type_declaration_end
            ),

            protected_type_declaration_end: $ => seq(
                $.END, $.PROTECTED, optional($.identifier)
            ),

            protected_type_header: $ => seq(
                $.generic_clause, optional(seq($.generic_map_aspect, ";"))
            ),

            protected_type_body: $ => seq(
                $.PROTECTED, $.BODY, repeat($._protected_type_body_declarative_item), $.protected_type_body_end
            ),

            protected_type_body_end: $ => seq(
                $.END, $.PROTECTED, $.BODY, optional($.identifier)
            ),

            while_loop: $ => seq(
                $.WHILE, $._expression
            ),

            for_loop: $ => seq(
                $.FOR, $.parameter_specification
            ),

            parameter_specification: $ => seq(
                $.identifier, $.IN, $._range
            ),

            case_statement_alternative: $ => seq(
                $.when_element, "=>", repeat($._sequential_statement)
            ),

            selected_waveforms: $ => seq(
                repeat(seq($.waveform, $.when_element, ",")), $.waveform, $.when_element
            ),

            waveform: $ => choice(
                seq($.waveform_element, repeat(seq(",", $.waveform_element))),
                $.UNAFFECTED
            ),

            waveform_element: $ => seq(
                $._expression, optional(seq($.AFTER, $._expression)),
            ),

            force_mode: $ => choice(
                $.IN,
                $.OUT
            ),

            selected_expressions: $ => seq(
                repeat(seq($._expression, $.when_element, ",")), $._expression, $.when_element
            ),

            when_element: $ => seq(
                $.WHEN, $._element
            ),

            conditional_waveforms: $ => seq(
                $.waveform, $.when_expression, repeat(seq($.else_waveform, $.when_expression)), optional($.else_waveform)
            ),

            else_waveform: $ => seq(
                $.ELSE, $.waveform
            ),

            delay_mechanism: $ => choice(
                $.TRANSPORT,
                seq(optional(seq($.REJECT, $._expression)), $.INERTIAL)
            ),

            _target: $ => choice(
                $.name,
                $.aggregate
            ),

            aggregate: $ => seq(
                "(",
                $.element_association, repeat(seq(",", choice($.element_association))),
                ")"
            ),

            conditional_or_unaffected_expression: $ => seq(
                $._expression_or_unaffected, repeat(seq($.when_expression, $.else_expression_or_unaffected)), optional($.when_expression)
            ),

            else_expression_or_unaffected: $ => seq(
                $.ELSE, $._expression_or_unaffected
            ),

            _expression_or_unaffected: $ => choice(
                $._expression,
                $.UNAFFECTED
            ),

            label_declaration: $ => seq(
                alias($.identifier, $.label), ":"
            ),

            sensitivity_clause: $ => seq(
                $.ON, $.sensitivity_list
            ),

            sensitivity_list: $ => seq(
                $.name, repeat(seq(",", $.name))
            ),

            condition_clause: $ => seq(
                $.UNTIL, $._expression
            ),

            timeout_clause: $ => seq(
                $.FOR, $._expression
            ),

            physical_type_definition: $ => seq(
                $.range_constraint, $.UNITS, $.primary_unit_declaration, repeat($.secondary_unit_declaration), $.end_units
            ),

            primary_unit_declaration: $ => seq(
                $.identifier, ";"
            ),

            secondary_unit_declaration: $ => seq(
                $.identifier, "=", seq(optional($._abstract_literal), choice($.name, $.library_constant_unit)), ";"
            ),

            end_units: $ => seq(
                $.END, $.UNITS, optional($.identifier)
            ),

            enumeration_type_definition: $ => seq(
                "(", $.enumeration_literal, repeat(seq(",", $.enumeration_literal)), ")"
            ),

            enumeration_literal: $ => choice(
                $.identifier,
                $.character_literal
            ),

            record_type_definition: $ => seq(
                $.RECORD, repeat($.element_declaration), $.end_record
            ),

            end_record: $ => seq(
                $.END, $.RECORD, optional($.identifier)
            ),

            element_declaration: $ => seq(
                $.identifier_list, ":", $.subtype_indication, ";"
            ),

            _process_sensitivity_list: $ => choice(
                $.ALL,
                $.sensitivity_list
            ),

            configuration_specification: $ => prec.left(choice(
                seq($.FOR, $.component_specification, $.binding_indication, optional(seq($.end_for, ";"))),
                seq($.FOR, $.component_specification, $.binding_indication, $.verification_unit_binding_indication, ";", repeat(seq($.verification_unit_binding_indication, ";")), $.end_for, ";")
            )),

            verification_unit_binding_indication: $ => seq(
                $.USE, $.VUNIT, $.verification_unit_list
            ),

            verification_unit_list: $ => seq(
                $.name, repeat(seq(",", $.name))
            ),

            component_specification: $ => seq(
                $.instantiation_list, ":", $.name
            ),

            instantiation_list: $ => choice(
                seq(alias($.identifier, $.label), repeat(seq(",", alias($.identifier, $.label)))),
                $.OTHERS,
                $.ALL
            ),

            binding_indication: $ => seq(
                optional(seq($.USE, $.entity_aspect)), optional($.generic_map_aspect), optional($.port_map_aspect), ";"
            ),

            entity_aspect: $ => choice(
                seq($.ENTITY, $.name, optional(seq("(", $.identifier, ")"))),
                seq($.CONFIGURATION, $.name),
                $.OPEN
            ),
    }
});

