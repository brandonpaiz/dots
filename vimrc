set number
set linebreak
set showmatch
set mouse=a
syntax on

set autoindent
set tabstop=4
set shiftwidth=4
set smartindent
set nowrap

" jj or kk to escape insert mode
inoremap jj <ESC>
inoremap kk <ESC>

" G now centers last line
nnoremap G Gzz

" ;; for ::
inoremap ;; ::

" Auto-close curly brackets
inoremap {<ENTER> {<CR>}<Esc>ko

" Save with CTRL-E
nnoremap <C-E> :w<ENTER>
inoremap <C-E> <Esc>:w<ENTER>i

" Quit with CTRL-W
nnoremap <C-W> :q<ENTER>
inoremap <C-W> <Esc>:q<ENTER>

" Tab Autocomplete
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

" highlight matching under cursor
":autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" header guard snippet
imap def<TAB> #ifndef<ENTER>#define<ENTER><ENTER>#endif<UP><ENTER><ENTER><ESC>4<UP>A<SPACE>

" class snippet
imap class<TAB> class{<ENTER><ESC>jA;<ESC>2kA<LEFT><SPACE>

" struct snippet
imap struct<TAB> struct{<ENTER><ESC>jA;<ESC>2kA<LEFT><SPACE>

" main snippet
imap main<TAB> int main(){<ENTER><ENTER><ENTER>return 0;<UP><UP><TAB>

" Easily move lines up or down with control j/k
nnoremap <C-j> :m .+1<CR>
nnoremap <C-k> :m .-2<CR>
inoremap <C-j> <Esc>:m .+1<CR>gi
inoremap <C-k> <Esc>:m .-2<CR>gi

" Move between tabs with ctrl 1/2
nnoremap <C-1> gT
nnoremap <C-2> gt
inoremap <C-1> <ESC>gTgi
inoremap <C-2> <ESC>gtgi
