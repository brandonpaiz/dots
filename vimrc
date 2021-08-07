" Autoinstall junegunn/vim-plug if needed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'rstacruz/vim-closer'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'djoshea/vim-autoread'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-sleuth'
call plug#end()

colorscheme OceanicNext

set number                          " line numbers
set linebreak                       " visually wrap lines a bit nicer...
set nowrap                          " ...not that I usually wrap
set display+=lastline               " get rid of those @s
set mouse=a                         " its useful sometimes, okay!?
set splitright                      " split to the right by default
set updatetime=250                  " git gutter update time
set incsearch                       " search before pressing enter
set scrolloff=3                     " keep 3 lines when scrolling

set autoindent
set breakindent
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set noruler                         " eh, never really need it

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


" jj or kk to escape insert mode
inoremap jj <ESC>
inoremap kk <ESC>

" visual hjkl
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" G now centers last line
nnoremap G Gzz

" ;; for ::
inoremap ;; ::

" Save with CTRL-E
nnoremap <C-E> :w<ENTER>
inoremap <C-E> <Esc>:w<ENTER>a

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

inoremap <C-A> <ESC>A
inoremap <C-O> <ESC>o

" Show/hide invisibles
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
function! ToggleInvisibles()
  set list!
endfunction
:map <Leader>i :call ToggleInvisibles()<CR>

" Toggle Goyo
:map <Leader>g :Goyo<CR>

" Toggle spell check
map <Leader>s :set spell!<CR>

" Toggle paste
map <Leader>p :set paste!<CR>

" CTRL-X to best-guess spelling correction
nnoremap <C-X> 1z=

highlight! link SignColumn LineNr

" set foldmethod=marker   " was good for latex tho
" set foldmethod=indent   " remove when interview is done
" set foldnestmax=1
