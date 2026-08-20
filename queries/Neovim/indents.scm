;-------------------------------------------------------------------------------
;
; Maintainer: jgonmor16, jpt13653903
; Feature Reference: https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#indentation
;-------------------------------------------------------------------------------
;
; Indentation anchors on the outermost wrapper node of each construct, not
; on its individual clauses.  Clause nodes such as elsif_statement nest
; recursively, so anchoring on them adds one indent level per clause; the
; wrapper node appears exactly once per construct regardless of how deeply
; its clauses nest.  This also keeps the query correct if the if/elsif/else
; nesting is ever flattened.
;
; Head and body nodes (entity_head, concurrent_block, sequential_block, ...)
; are deliberately not captured.  Anchoring on the wrapper covers both the
; declarative and the statement region with a single capture, and "begin"
; branches back to the wrapper's own level.  process_head and generate_body
; each have an optional-"is"/optional-"begin" form whose node starts on a
; different line in each case, so neither can be anchored directly.

[
  ; Design units
  (entity_declaration)
  (architecture_definition)
  (package_declaration)
  (package_definition)
  (component_declaration)

  ; Interface and association lists
  (port_clause)
  (generic_clause)
  (association_list)

  ; Concurrent statements
  (process_statement)
  (block_statement)
  (component_instantiation_statement)
  (for_generate_statement)
  (if_generate_statement)
  (case_generate_statement)
  (case_generate_alternative)

  ; Sequential statements
  (if_statement_block)
  (case_statement)
  (case_statement_alternative)
  (loop_statement)

  ; Subprogram and types
  (subprogram_definition)
  (record_type_definition)
] @indent.begin

[
  "begin"
  "elsif"
  "else"
  (end_entity)
  (end_architecture)
  (end_package)
  (end_package_body)
  (end_component)
  (end_process)
  (end_block)
  (end_generate)
  (end_if)
  (end_case)
  (end_loop)
  (end_record)
  (subprogram_end)
] @indent.branch

(port_clause
  ")" @indent.branch)

(generic_clause
  ")" @indent.branch)

(association_list
  ")" @indent.branch)
