export CC=gcc

rm -rf bindings build node_modules binding.gyp CMakeLists.txt Cargo.toml \
       Makefile Package.swift binding.gyp go.mod setup.py

npm install --save-dev tree-sitter-cli

node_modules/.bin/tree-sitter init --update
node_modules/.bin/tree-sitter generate --abi 14 && tree-sitter test --show-fields

