;-------------------------------------------------------------------------------
;
; Maintainer: jpt13653903
; Capture Reference: https://neovim.io/doc/user/treesitter.html#_treesitter-language-injections
;-------------------------------------------------------------------------------
;
((line_comment) @injection.content
  (#set! injection.language "comment"))

((block_comment) @injection.content
  (#set! injection.language "comment"))
