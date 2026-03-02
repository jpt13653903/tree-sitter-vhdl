export CC=gcc

rm -rf bindings build node_modules binding.gyp CMakeLists.txt Cargo.toml \
       Makefile Package.swift binding.gyp go.mod setup.py

npm install --save-dev tree-sitter-cli

cd autogen
py gen_token_trie.py
cd ..

node_modules/.bin/tree-sitter init --update
node_modules/.bin/tree-sitter generate && tree-sitter test --show-fields

