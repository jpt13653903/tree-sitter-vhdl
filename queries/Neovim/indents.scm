[
  (entity_declaration)
  (architecture_definition)
  (process_statement)
  (if_statement_block)
  (case_statement)
  (case_statement_alternative)
  (loop_statement)
  (port_clause)
  (generic_clause)
] @indent.begin

[
  "begin"
  "elsif"
  "else"
  (end_entity)
  (end_architecture)
  (end_process)
  (end_if)
  (end_case)
  (end_loop)
] @indent.branch

(port_clause ")" @indent.branch)
(generic_clause ")" @indent.branch)
