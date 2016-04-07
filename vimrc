set number
set linebreak
set showmatch
set mouse=a
syntax on

set autoindent
set tabstop=4
set shiftwidth=4
set smartindent

inoremap def<TAB> #ifndef<Esc>o#define<Esc>o<ENTER>#endif

" jj to escape insert mode
inoremap jj <ESC>

" G now centers last line
nnoremap G Gzz

" Auto-close curly brackets
inoremap {<ENTER> {<CR>}<Esc>ko

" Save by CTRL-W
nnoremap <C-W> :w<ENTER>
inoremap <C-W> <Esc>:w<ENTER>i

" Quit by CTRL-E
nnoremap <C-E> :q<ENTER>
inoremap <C-E> <Esc>:q<ENTER>

" Tab Autocomplete
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
