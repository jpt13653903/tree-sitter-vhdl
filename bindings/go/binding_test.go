package tree_sitter_vhdl_test

import (
	"testing"

	tree_sitter "github.com/smacker/go-tree-sitter"
	"github.com/jpt13653903/tree-sitter-vhdl"
)

func TestCanLoadGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_vhdl.Language())
	if language == nil {
		t.Errorf("Error loading VHDL grammar")
	}
}
