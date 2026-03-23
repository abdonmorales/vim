" Name:         longhorn
" Description:  UT Austin Longhorn colorscheme - Burnt Orange and dark tones
" Author:       Abdon Morales <abdon@utexas.edu>
" Maintainer:   Abdon Morales <abdon@utexas.edu>
" License:      Vim License (see `:help license`)
" Last Change:  2026 Mar 23
"
" Official UT Austin colors:
"   Burnt Orange  #BF5700
"   White         #FFFFFF
"   Charcoal      #333F48
"   Limestone     #D6D2C4

set background=dark

hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = 'longhorn'

let s:t_Co = has('gui_running') ? 16777216 : str2nr(&t_Co)
let s:tgc = has('termguicolors') && &termguicolors

" Terminal ANSI colors (burnt orange accent palette)
let g:terminal_ansi_colors = ['#1a1e24', '#d75f5f', '#87af5f', '#BF5700', '#5f87af', '#af87af', '#5fafaf', '#D6D2C4', '#333F48', '#ff875f', '#afd787', '#d7875f', '#87afd7', '#d7afd7', '#87d7d7', '#FFFFFF']

" --- Links ---
hi! link Boolean Constant
hi! link Character Constant
hi! link Conditional Statement
hi! link CurSearch Search
hi! link CursorLineFold CursorLine
hi! link CursorLineSign CursorLine
hi! link Debug Special
hi! link Define PreProc
hi! link Delimiter Special
hi! link EndOfBuffer NonText
hi! link Exception Statement
hi! link Float Constant
hi! link Function Identifier
hi! link Include PreProc
hi! link Keyword Statement
hi! link Label Statement
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
hi! link Macro PreProc
hi! link MessageWindow Pmenu
hi! link Number Constant
hi! link Operator Statement
hi! link PopupNotification Todo
hi! link PreCondit PreProc
hi! link Repeat Statement
hi! link SpecialChar Special
hi! link SpecialComment Special
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi! link StorageClass Type
hi! link Structure Type
hi! link TabPanel Normal
hi! link TabPanelFill EndOfBuffer
hi! link Tag Special
hi! link Terminal Normal
hi! link Typedef Type
hi! link lCursor Cursor

" ===================================================================
" Highlight groups
" ===================================================================

" --- Editor UI ---
"                                                guifg       guibg       gui
hi Normal          guifg=#D6D2C4 guibg=#1a1e24 guisp=NONE gui=NONE   ctermfg=187  ctermbg=234  cterm=NONE  term=NONE
hi NormalFloat     guifg=#D6D2C4 guibg=#252a31 guisp=NONE gui=NONE   ctermfg=187  ctermbg=235  cterm=NONE  term=NONE
hi Cursor          guifg=#1a1e24 guibg=#BF5700 guisp=NONE gui=NONE   ctermfg=234  ctermbg=166  cterm=NONE  term=reverse
hi CursorIM        guifg=#1a1e24 guibg=#ff875f guisp=NONE gui=NONE   ctermfg=234  ctermbg=209  cterm=NONE  term=NONE
hi CursorLine      guifg=NONE    guibg=#252a31 guisp=NONE gui=NONE   ctermfg=NONE ctermbg=235  cterm=NONE  term=underline
hi CursorColumn    guifg=NONE    guibg=#252a31 guisp=NONE gui=NONE   ctermfg=NONE ctermbg=235  cterm=NONE  term=NONE
hi CursorLineNr    guifg=#BF5700 guibg=#252a31 guisp=NONE gui=bold   ctermfg=166  ctermbg=235  cterm=bold  term=bold
hi LineNr          guifg=#5f6773 guibg=NONE    guisp=NONE gui=NONE   ctermfg=242  ctermbg=NONE cterm=NONE  term=NONE
hi SignColumn      guifg=#5f6773 guibg=NONE    guisp=NONE gui=NONE   ctermfg=242  ctermbg=NONE cterm=NONE  term=NONE
hi FoldColumn      guifg=#87653a guibg=NONE    guisp=NONE gui=NONE   ctermfg=137  ctermbg=NONE cterm=NONE  term=NONE
hi Folded          guifg=#87653a guibg=#252a31 guisp=NONE gui=NONE   ctermfg=137  ctermbg=235  cterm=NONE  term=NONE
hi ColorColumn     guifg=NONE    guibg=#2a2024 guisp=NONE gui=NONE   ctermfg=NONE ctermbg=236  cterm=NONE  term=reverse
hi VertSplit       guifg=#333F48 guibg=NONE    guisp=NONE gui=NONE   ctermfg=238  ctermbg=NONE cterm=NONE  term=reverse
hi NonText         guifg=#333F48 guibg=NONE    guisp=NONE gui=NONE   ctermfg=238  ctermbg=NONE cterm=NONE  term=NONE
hi EndOfBuffer     guifg=#333F48 guibg=NONE    guisp=NONE gui=NONE   ctermfg=238  ctermbg=NONE cterm=NONE  term=NONE
hi Conceal         guifg=#5f6773 guibg=NONE    guisp=NONE gui=NONE   ctermfg=242  ctermbg=NONE cterm=NONE  term=NONE

" --- Status line / Tab line (Burnt Orange accent) ---
hi StatusLine      guifg=#1a1e24 guibg=#BF5700 guisp=NONE gui=bold   ctermfg=234  ctermbg=166  cterm=bold  term=bold,reverse
hi StatusLineNC    guifg=#D6D2C4 guibg=#333F48 guisp=NONE gui=NONE   ctermfg=187  ctermbg=238  cterm=NONE  term=reverse
hi TabLine         guifg=#D6D2C4 guibg=#333F48 guisp=NONE gui=NONE   ctermfg=187  ctermbg=238  cterm=NONE  term=underline
hi TabLineSel      guifg=#1a1e24 guibg=#BF5700 guisp=NONE gui=bold   ctermfg=234  ctermbg=166  cterm=bold  term=bold
hi TabLineFill     guifg=NONE    guibg=#1a1e24 guisp=NONE gui=NONE   ctermfg=NONE ctermbg=234  cterm=NONE  term=reverse
hi WildMenu        guifg=#1a1e24 guibg=#d7875f guisp=NONE gui=bold   ctermfg=234  ctermbg=173  cterm=bold  term=standout

" --- Messages ---
hi ModeMsg         guifg=#BF5700 guibg=NONE    guisp=NONE gui=bold   ctermfg=166  ctermbg=NONE cterm=bold  term=bold
hi MoreMsg         guifg=#87af5f guibg=NONE    guisp=NONE gui=bold   ctermfg=107  ctermbg=NONE cterm=bold  term=NONE
hi WarningMsg      guifg=#d7875f guibg=NONE    guisp=NONE gui=NONE   ctermfg=173  ctermbg=NONE cterm=NONE  term=standout
hi ErrorMsg        guifg=#FFFFFF guibg=#d75f5f guisp=NONE gui=bold   ctermfg=231  ctermbg=167  cterm=bold  term=bold,reverse
hi Error           guifg=#d75f5f guibg=#1a1e24 guisp=NONE gui=bold,reverse ctermfg=167 ctermbg=234 cterm=bold,reverse term=bold,reverse
hi Question        guifg=#BF5700 guibg=NONE    guisp=NONE gui=bold   ctermfg=166  ctermbg=NONE cterm=bold  term=standout
hi Title           guifg=#BF5700 guibg=NONE    guisp=NONE gui=bold   ctermfg=166  ctermbg=NONE cterm=bold  term=bold

" --- Popup menu ---
hi Pmenu           guifg=#D6D2C4 guibg=#333F48 guisp=NONE gui=NONE   ctermfg=187  ctermbg=238  cterm=NONE  term=NONE
hi PmenuSel        guifg=#1a1e24 guibg=#BF5700 guisp=NONE gui=NONE   ctermfg=234  ctermbg=166  cterm=NONE  term=NONE
hi PmenuSbar       guifg=NONE    guibg=#252a31 guisp=NONE gui=NONE   ctermfg=NONE ctermbg=235  cterm=NONE  term=NONE
hi PmenuThumb      guifg=NONE    guibg=#BF5700 guisp=NONE gui=NONE   ctermfg=NONE ctermbg=166  cterm=NONE  term=NONE

" --- Search / Selection ---
hi Search          guifg=#1a1e24 guibg=#d7875f guisp=NONE gui=NONE   ctermfg=234  ctermbg=173  cterm=NONE  term=reverse
hi IncSearch       guifg=#1a1e24 guibg=#BF5700 guisp=NONE gui=bold   ctermfg=234  ctermbg=166  cterm=bold  term=bold,reverse,underline
hi Visual          guifg=NONE    guibg=#3a3024 guisp=NONE gui=NONE   ctermfg=NONE ctermbg=237  cterm=NONE  term=NONE
hi VisualNOS       guifg=NONE    guibg=#3a3024 guisp=NONE gui=underline ctermfg=NONE ctermbg=237 cterm=underline term=underline,bold
hi MatchParen      guifg=#BF5700 guibg=NONE    guisp=NONE gui=bold   ctermfg=166  ctermbg=NONE cterm=bold  term=bold,underline

" --- Diff ---
hi DiffAdd         guifg=#87af5f guibg=#1a2a1a guisp=NONE gui=NONE   ctermfg=107  ctermbg=22   cterm=NONE  term=reverse
hi DiffChange      guifg=#5f87af guibg=#1a1e2a guisp=NONE gui=NONE   ctermfg=67   ctermbg=17   cterm=NONE  term=NONE
hi DiffDelete      guifg=#d75f5f guibg=#2a1a1a guisp=NONE gui=NONE   ctermfg=167  ctermbg=52   cterm=NONE  term=reverse
hi DiffText        guifg=#D6D2C4 guibg=#333F48 guisp=NONE gui=bold   ctermfg=187  ctermbg=238  cterm=bold  term=reverse

" --- Spell ---
hi SpellBad        guifg=NONE    guibg=NONE    guisp=#d75f5f gui=undercurl ctermfg=NONE ctermbg=167  cterm=underline term=reverse
hi SpellCap        guifg=NONE    guibg=NONE    guisp=#5f87af gui=undercurl ctermfg=NONE ctermbg=67   cterm=underline term=reverse
hi SpellRare       guifg=NONE    guibg=NONE    guisp=#af87af gui=undercurl ctermfg=NONE ctermbg=139  cterm=underline term=reverse
hi SpellLocal      guifg=NONE    guibg=NONE    guisp=#5fafaf gui=undercurl ctermfg=NONE ctermbg=73   cterm=underline term=underline

" --- Syntax groups ---
hi Comment         guifg=#5f6773 guibg=NONE    guisp=NONE gui=italic  ctermfg=242  ctermbg=NONE cterm=NONE  term=bold
hi Constant        guifg=#d7875f guibg=NONE    guisp=NONE gui=NONE   ctermfg=173  ctermbg=NONE cterm=NONE  term=NONE
hi String          guifg=#87af5f guibg=NONE    guisp=NONE gui=NONE   ctermfg=107  ctermbg=NONE cterm=NONE  term=NONE
hi Identifier      guifg=#D6D2C4 guibg=NONE    guisp=NONE gui=NONE   ctermfg=187  ctermbg=NONE cterm=NONE  term=NONE
hi Statement       guifg=#BF5700 guibg=NONE    guisp=NONE gui=bold   ctermfg=166  ctermbg=NONE cterm=bold  term=bold
hi PreProc         guifg=#d7875f guibg=NONE    guisp=NONE gui=NONE   ctermfg=173  ctermbg=NONE cterm=NONE  term=NONE
hi Type            guifg=#5f87af guibg=NONE    guisp=NONE gui=NONE   ctermfg=67   ctermbg=NONE cterm=NONE  term=NONE
hi Special         guifg=#af87af guibg=NONE    guisp=NONE gui=NONE   ctermfg=139  ctermbg=NONE cterm=NONE  term=NONE
hi Underlined      guifg=#5fafaf guibg=NONE    guisp=NONE gui=underline ctermfg=73 ctermbg=NONE cterm=underline term=underline
hi Ignore          guifg=NONE    guibg=NONE    guisp=NONE gui=NONE   ctermfg=NONE ctermbg=NONE cterm=NONE  term=NONE
hi Todo            guifg=#BF5700 guibg=NONE    guisp=NONE gui=bold   ctermfg=166  ctermbg=NONE cterm=bold  term=standout
hi Added           guifg=#87af5f guibg=NONE    guisp=NONE gui=NONE   ctermfg=107  ctermbg=NONE cterm=NONE  term=NONE
hi Changed         guifg=#5f87af guibg=NONE    guisp=NONE gui=NONE   ctermfg=67   ctermbg=NONE cterm=NONE  term=NONE
hi Removed         guifg=#d75f5f guibg=NONE    guisp=NONE gui=NONE   ctermfg=167  ctermbg=NONE cterm=NONE  term=NONE
hi SpecialKey      guifg=#5f6773 guibg=NONE    guisp=NONE gui=NONE   ctermfg=242  ctermbg=NONE cterm=NONE  term=bold
hi Directory       guifg=#BF5700 guibg=NONE    guisp=NONE gui=NONE   ctermfg=166  ctermbg=NONE cterm=NONE  term=bold

" --- Terminal ---
hi StatusLineTerm  guifg=#1a1e24 guibg=#87af5f guisp=NONE gui=bold   ctermfg=234  ctermbg=107  cterm=bold  term=bold,reverse
hi StatusLineTermNC guifg=#D6D2C4 guibg=#333F48 guisp=NONE gui=NONE  ctermfg=187  ctermbg=238  cterm=NONE  term=reverse

" --- Toolbar ---
hi ToolbarLine     guifg=NONE    guibg=#252a31 guisp=NONE gui=NONE   ctermfg=NONE ctermbg=235  cterm=NONE  term=underline
hi ToolbarButton   guifg=#1a1e24 guibg=#BF5700 guisp=NONE gui=bold   ctermfg=234  ctermbg=166  cterm=bold  term=bold

" vim:sts=2:sw=2:et
