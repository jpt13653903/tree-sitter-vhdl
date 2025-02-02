export CC=gcc

# touch grammar.js
# touch src/scanner.c

tree-sitter generate --abi 14 && tree-sitter test --show-fields

# tree-sitter generate && tree-sitter parse test/temp.vhd
# tree-sitter generate && tree-sitter parse test/entity.vhd
# tree-sitter generate && tree-sitter parse test/corpus/specification_examples/entity.vhd
# tree-sitter generate && tree-sitter parse test/conditional_expression.vhd
# tree-sitter generate && tree-sitter parse test/corpus/specification_examples/architecture.vhd

