" Vim color file
" Maintainer:	The Vim Project <https://github.com/vim/vim>
" Last Change:	2023 Aug 10
" Former Maintainer:	Bram Moolenaar <Bram@vim.org>
"
" The original Vim default color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.
"
" In UTCS Vim, use ":colorscheme classic" to revert to the standard Vim
" appearance.  See ":help longhorn" for the default UTCS theme.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "classic"

" vim: sw=2
