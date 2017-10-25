set number
set linebreak
set showmatch
set mouse=a
set splitright

syntax on
hi VertSplit cterm=NONE
hi VertSplit ctermfg=BLACK
hi EndOfBuffer ctermfg=BLACK
hi StatusLine cterm=NONE
hi StatusLine ctermfg=BLUE
hi StatusLineNC ctermfg=BLACK
hi StatusLineNC ctermbg=WHITE
hi Directory ctermfg=BLUE

hi String ctermfg=2
hi LineNr ctermfg=8

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

" Auto-close curly brackets and quotes.
inoremap {<ENTER> {<CR>}<Esc>ko
inoremap (  ()<Left>
inoremap <expr> "  strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"<LEFT>"
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

" Save with CTRL-E
nnoremap <C-E> :w<ENTER>
inoremap <C-E> <Esc>:w<ENTER>i

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
" :autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" header guard snippet
imap def<TAB> #ifndef<ENTER>#define<ENTER><ENTER>#endif<UP><ENTER><ENTER><ESC>4<UP>A<SPACE>

" class snippet
imap class<TAB> class{<ENTER><ESC>jA;<ESC>2kA<LEFT><SPACE>

" main snippet
inoremap main<TAB> int main(){<ENTER><ENTER><ENTER>return 0;<ENTER>}<UP><UP><UP><TAB>

" File Explorer Settings -------------------------------------------------------
let g:netrw_banner=0
let g:netrw_winsize=20
let g:netrw_liststyle=3
"let g:netrw_list_hide='.*\.swp$'
let g:netrw_list_hide='^\..*'

" CTRL-\ to toggle explorer
nnoremap  :call VexToggle("")<CR>

" Explorer toggle functionality
fun! VexToggle(dir)
  if exists("t:vex_buf_nr")
    call VexClose()
  else
    call VexOpen(a:dir)
 endif
endf
fun! VexOpen(dir)
  let g:netrw_browse_split=2    " open files in a new vertical split
  let vex_width=10

  execute "Vexplore " . a:dir
  let t:vex_buf_nr = bufnr("%")
  wincmd H
endf
fun! VexClose()
  let cur_win_nr = winnr()
  let target_nr = ( cur_win_nr == 1 ? winnr("#") : cur_win_nr )

  1wincmd w
  close
  unlet t:vex_buf_nr
  execute (target_nr - 1) . "wincmd w"
endf
"-------------------------------------------------------------------------------

" CTRL-[,] Split Navigation
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" CTRL-A: Normalize Split Sizes
nnoremap <C-A> <C-W>=

"CTRL-D: Maximize Split Width
nnoremap <C-D> <C-W>\|

inoremap log<TAB> console.log();<LEFT><LEFT>

