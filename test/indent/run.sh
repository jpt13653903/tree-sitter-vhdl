#!/bin/sh
#-------------------------------------------------------------------------------
#
# Check that the Neovim indent queries reproduce the reference files.
#
# Each file in test/indent/ is already indented the way the queries are
# meant to indent it, so re-indenting with gg=G must leave it unchanged.
# Any diff is a failure.
#
# This cannot run under the parser test CI: Neovim's tree-sitter indent
# support lives in the nvim-treesitter plugin, not in the tree-sitter CLI,
# so the plugin has to be on disk.  Point NVIM_TREESITTER at a checkout.
#
#   NVIM_TREESITTER=~/.local/share/nvim/site/pack/core/opt/nvim-treesitter \
#     ./test/indent/run.sh
#
#-------------------------------------------------------------------------------

set -eu

repo=$(cd "$(dirname "$0")/../.." && pwd)

if [ -z "${NVIM_TREESITTER:-}" ]; then
    echo "NVIM_TREESITTER is not set; see the comment at the top of this script." >&2
    exit 2
fi

if [ ! -d "$NVIM_TREESITTER" ]; then
    echo "NVIM_TREESITTER does not exist: $NVIM_TREESITTER" >&2
    exit 2
fi

work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT

mkdir -p "$work/parser" "$work/queries/vhdl"

# Build the parser from this working tree, not from a release, so the test
# exercises whatever the grammar currently is.
tree-sitter build -o "$work/parser/vhdl.so" 2>/dev/null

# Neovim looks for queries under queries/<language>/ on the runtimepath,
# whereas this repository groups them by editor.
cp "$repo"/queries/Neovim/*.scm "$work/queries/vhdl/"

status=0

for ref in "$repo"/test/indent/*.vhd; do
    name=$(basename "$ref")
    got="$work/$name"

    NVIM_TS_WORK="$work" \
    NVIM_TS_PLUGIN="$NVIM_TREESITTER" \
        nvim --headless --clean -i NONE -u "$repo/test/indent/init.lua" "$ref" \
        -c "lua indent_test_guard()" \
        -c 'silent normal! gg=G' \
        -c "silent write! $got" \
        -c 'quit!'

    if diff -u "$ref" "$got" > "$work/$name.diff"; then
        echo "ok    $name"
    else
        echo "FAIL  $name"
        cat "$work/$name.diff"
        status=1
    fi
done

exit $status
