" UTCS LaTeX compile and view support
" Language:     LaTeX (ft=tex)
" Maintainer:   Abdon Morales <abdon@utexas.edu>
" Version:      1.0
" Last Change:  2026 Mar 23
"
" Provides:
"   :TexCompile       - Compile current .tex file with pdflatex
"   :TexCompileFull   - Full compile: pdflatex + bibtex + pdflatex x2
"   :TexView          - Open the compiled PDF
"   :TexClean         - Remove auxiliary files (.aux, .log, .toc, etc.)
"   <Leader>ll        - Compile (normal mode)
"   <Leader>lv        - View PDF (normal mode)
"   <Leader>lc        - Clean aux files (normal mode)
"   <Leader>lf        - Full compile (normal mode)

" Only load once per buffer
if exists("b:did_ftplugin_tex_utcs")
  finish
endif
let b:did_ftplugin_tex_utcs = 1

" Avoid problems if running in 'compatible' mode.
let s:save_cpo = &cpo
set cpo&vim

" -----------------------------------------------------------------------
" Configuration variables (user can override in vimrc)
" -----------------------------------------------------------------------
if !exists('g:tex_compiler')
  let g:tex_compiler = 'pdflatex'
endif

if !exists('g:tex_compiler_flags')
  let g:tex_compiler_flags = '-interaction=nonstopmode -file-line-error -synctex=1'
endif

if !exists('g:tex_bibtex')
  let g:tex_bibtex = 'bibtex'
endif

if !exists('g:tex_viewer')
  if has('mac') || has('macunix')
    let g:tex_viewer = 'open'
  elseif has('unix')
    let g:tex_viewer = 'xdg-open'
  elseif has('win32') || has('win64')
    let g:tex_viewer = 'start'
  else
    let g:tex_viewer = 'open'
  endif
endif

" Auxiliary file extensions to clean
if !exists('g:tex_clean_extensions')
  let g:tex_clean_extensions = ['aux', 'log', 'toc', 'lof', 'lot', 'out',
        \ 'bbl', 'blg', 'idx', 'ilg', 'ind', 'nav', 'snm', 'vrb',
        \ 'fls', 'fdb_latexmk', 'synctex.gz', 'bcf', 'run.xml']
endif

" -----------------------------------------------------------------------
" Functions
" -----------------------------------------------------------------------

function! s:GetTexRoot() abort
  " Look for a magic comment '% !TEX root = ...' in the first 10 lines
  for lnum in range(1, min([10, line('$')]))
    let line = getline(lnum)
    let match = matchstr(line, '%\s*!TEX\s\+root\s*=\s*\zs.\+')
    if !empty(match)
      return fnamemodify(trim(match), ':p')
    endif
  endfor
  return expand('%:p')
endfunction

function! s:GetPdfPath() abort
  let root = s:GetTexRoot()
  return fnamemodify(root, ':r') . '.pdf'
endfunction

function! s:TexCompile() abort
  write
  let root = s:GetTexRoot()
  let dir = fnamemodify(root, ':h')
  let fname = fnamemodify(root, ':t')
  let cmd = g:tex_compiler . ' ' . g:tex_compiler_flags
        \ . ' -output-directory=' . shellescape(dir)
        \ . ' ' . shellescape(root)
  echo 'Compiling: ' . fname . ' ...'
  let output = system(cmd)
  if v:shell_error
    " Parse errors and populate quickfix list
    let errorformat_save = &errorformat
    let &errorformat = '%f:%l: %m,%-G%.%#'
    cexpr output
    let &errorformat = errorformat_save
    botright copen
    echohl ErrorMsg
    echo 'Compilation failed. See quickfix for errors.'
    echohl None
  else
    cclose
    echohl MoreMsg
    echo 'Compilation succeeded: ' . fnamemodify(s:GetPdfPath(), ':t')
    echohl None
  endif
endfunction

function! s:TexCompileFull() abort
  write
  let root = s:GetTexRoot()
  let dir = fnamemodify(root, ':h')
  let base = fnamemodify(root, ':t:r')
  let flags = g:tex_compiler_flags
        \ . ' -output-directory=' . shellescape(dir)
  echo 'Full compile pass 1/4: pdflatex ...'
  call system(g:tex_compiler . ' ' . flags . ' ' . shellescape(root))
  echo 'Full compile pass 2/4: bibtex ...'
  call system('cd ' . shellescape(dir) . ' && '
        \ . g:tex_bibtex . ' ' . shellescape(base))
  echo 'Full compile pass 3/4: pdflatex ...'
  call system(g:tex_compiler . ' ' . flags . ' ' . shellescape(root))
  echo 'Full compile pass 4/4: pdflatex ...'
  let output = system(g:tex_compiler . ' ' . flags . ' ' . shellescape(root))
  if v:shell_error
    let errorformat_save = &errorformat
    let &errorformat = '%f:%l: %m,%-G%.%#'
    cexpr output
    let &errorformat = errorformat_save
    botright copen
    echohl ErrorMsg
    echo 'Full compilation failed. See quickfix for errors.'
    echohl None
  else
    cclose
    echohl MoreMsg
    echo 'Full compilation succeeded: ' . fnamemodify(s:GetPdfPath(), ':t')
    echohl None
  endif
endfunction

function! s:TexView() abort
  let pdf = s:GetPdfPath()
  if !filereadable(pdf)
    echohl WarningMsg
    echo 'PDF not found: ' . pdf . '  (compile first with :TexCompile)'
    echohl None
    return
  endif
  echo 'Opening: ' . fnamemodify(pdf, ':t')
  call system(g:tex_viewer . ' ' . shellescape(pdf) . ' &')
endfunction

function! s:TexClean() abort
  let root = s:GetTexRoot()
  let dir = fnamemodify(root, ':h')
  let base = fnamemodify(root, ':t:r')
  let removed = 0
  for ext in g:tex_clean_extensions
    let f = dir . '/' . base . '.' . ext
    if filereadable(f)
      call delete(f)
      let removed += 1
    endif
  endfor
  echohl MoreMsg
  echo 'Cleaned ' . removed . ' auxiliary file(s).'
  echohl None
endfunction

" -----------------------------------------------------------------------
" Commands
" -----------------------------------------------------------------------
command! -buffer TexCompile     call s:TexCompile()
command! -buffer TexCompileFull call s:TexCompileFull()
command! -buffer TexView        call s:TexView()
command! -buffer TexClean       call s:TexClean()

" -----------------------------------------------------------------------
" Mappings (buffer-local, only if <Leader>l* is not already mapped)
" -----------------------------------------------------------------------
if !hasmapto('<Plug>TexCompile')
  nmap <buffer> <Leader>ll <Plug>TexCompile
endif
if !hasmapto('<Plug>TexCompileFull')
  nmap <buffer> <Leader>lf <Plug>TexCompileFull
endif
if !hasmapto('<Plug>TexView')
  nmap <buffer> <Leader>lv <Plug>TexView
endif
if !hasmapto('<Plug>TexClean')
  nmap <buffer> <Leader>lc <Plug>TexClean
endif

nnoremap <buffer> <silent> <Plug>TexCompile     :TexCompile<CR>
nnoremap <buffer> <silent> <Plug>TexCompileFull  :TexCompileFull<CR>
nnoremap <buffer> <silent> <Plug>TexView         :TexView<CR>
nnoremap <buffer> <silent> <Plug>TexClean        :TexClean<CR>

" -----------------------------------------------------------------------
" Buffer settings useful for LaTeX editing
" -----------------------------------------------------------------------
setlocal textwidth=80
setlocal spell
setlocal conceallevel=2

" Set errorformat for LaTeX log parsing
setlocal errorformat=%f:%l:\ %m,%-G%.%#

" -----------------------------------------------------------------------
" Undo
" -----------------------------------------------------------------------
let b:undo_ftplugin = get(b:, 'undo_ftplugin', '')
      \ . '| setl tw< spell< cole< efm<'
      \ . '| delcommand TexCompile'
      \ . '| delcommand TexCompileFull'
      \ . '| delcommand TexView'
      \ . '| delcommand TexClean'
      \ . '| nunmap <buffer> <Leader>ll'
      \ . '| nunmap <buffer> <Leader>lf'
      \ . '| nunmap <buffer> <Leader>lv'
      \ . '| nunmap <buffer> <Leader>lc'
      \ . '| unlet! b:did_ftplugin_tex_utcs'

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:sts=2:sw=2:et
