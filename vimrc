" Vim Configuration (update: 22/04/2013)

" enable no-compatibility with old vi
set nocompatible
set nomodeline
set noerrorbells visualbell t_vb=

" enable unicode encoding
set encoding=utf-8
set termencoding=utf-8

" enable fast tty output and lazy screen redraw 
set ttyfast
"set lazyredraw

" disable writing swap file
set nobackup
set noswapfile

" enable mouse
set mouse=a

" enable display info ruler
set ruler

" enable display info current modes
set showmode

" enable display (partial) command
set showcmd

" enable a colors scheme, list:
" badwolf candycode crispy delek evening github iawriter ir_black
" jellybeans koehler molokai_deep mustang pyte synic vgod vividchalk
set t_Co=256
set background=light
colorscheme synic

" enable highlight non-text/showbreak chars
"highlight NonText ctermfg=bg

" enable highlight cursor current line
set cursorline
highlight CursorLine cterm=bold ctermbg=236

" enable highlight columns (avar. length of english words is 5 char)
"let &colorcolumn=join(range(76,80),",")
"autocmd BufEnter * highlight ColorColumn ctermbg=237 guibg=#2c2d27

" enable highlight overlength lines
"autocmd BufEnter,BufRead * highlight OverLength ctermfg=lightgreen
"autocmd BufEnter,BufRead * match OverLength /\%81v.\+/

" change mapleader key from "\" to ","
let g:mapleader=","

" required to be able to use keypad keys & map missed escape sequences
set esckeys

" enable wrapping lines
set wrap linebreak textwidth=0      " soft-wrap text to the size of window
set whichwrap+=<,>,[,],h,l          " allow backspace and cursor keys to wrap
set breakat=\ \|@-+;:,./?^I

" enable tab with spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

" enable automatically indent lines
set smartindent

" enable paste without autoindent
set pastetoggle=<F2>

" enable case-insensitive search
set ignorecase
set smartcase

" enable options search results
set hlsearch
set incsearch
set gdefault

" enable change special characters in search patterns
set magic

" enable show matching brackets
set showmatch

" toggle highlighting search
noremap <silent> <leader>hl :set hlsearch<CR>
noremap <silent> <leader>nhl :set nohlsearch<CR>

" enable treat all numerals as decimal
set nrformats=

" enable to keep n lines off the edges of the screen when scrolling
set scrolloff=5

" enable cursor to go in to "invalid" places
set virtualedit=block

" enable backspacing over everything in insert mode
set backspace=indent,eol,start

" enable completion longest common string, then each full match
set wildmenu
set wildmode=list:full
set completeopt+=preview

" hide buffers instead closing them & reveal already opened files
set hidden
set switchbuf=useopen,usetab

" enable sane splitting
set splitbelow
set splitright

" enable remember more commands history and undo level
set history=1700
set undolevels=1700

" enable move keys operate on display lines
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$

" enable shortcut to switch buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" toggle spell checking
nmap <silent> <F7> :set spell!<CR>

" toggle syntax highlight
nmap <silent> <F8> :if exists("g:syntax_on") <Bar>
    \   syntax off <Bar>
    \ else <Bar>
    \   syntax enable <Bar>
    \ endif <CR>

" toggle show line number
nmap <silent> <F9> :set number!<CR>

" enable add newline without enter insert mode
nmap <silent> <F10> O<Esc>
nmap <silent> <F11> o<Esc>

" enable display unprintable characters
set listchars=tab:▸-,eol:¬
set listchars+=trail:·
set listchars+=extends:»,precedes:«
nmap <silent> <F12> :set list!<CR>

" enable quick normal mode switch
inoremap jj <Esc>`^
inoremap kk <Esc>`^

" enable autoreload vimrc that already edited (or manually: ":so %")
map <leader>vimrc :tabedit $MYVIMRC<CR>
autocmd bufwritepost .vimrc source $MYVIMRC

" enable single insert from normal mode
function! RepeatChar(char, count)
   return repeat(a:char, a:count)
endfunction
nnoremap <silent> s :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap <silent> S :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>

" enable cursor jump to the last known position
if has("autocmd")
  autocmd BufReadPost * 
    \ if line("'\"") > 0 && line("'\"") <= line("$") | 
    \   exe "normal g`\"" | 
    \ endif 
endif

" try to get the correct main terminal type
if &term =~ "xterm"
    let myterm = "xterm"
elseif &term =~ "screen"
    let myterm = "screen"
else
    let myterm =  &term
endif
let myterm = substitute(myterm, "cons[0-9][0-9].*$",  "linux", "")
let myterm = substitute(myterm, "cons[0-9][0-9].*$",  "linux", "")
let myterm = substitute(myterm, "vt1[0-9][0-9].*$",   "vt100", "")
let myterm = substitute(myterm, "vt2[0-9][0-9].*$",   "vt220", "")
let myterm = substitute(myterm, "\\([^-]*\\)[_-].*$", "\\1",   "")

" here we define the keys of the NumLock in keyboard transmit mode of xterm
" which misses or has not activated Alt/NumLock Modifiers, often not defined
" within termcap/terminfo and we should map the character printed on the keys
if myterm == "xterm" || myterm == "kvt" || myterm == "gnome"
    " keys in insert/command mode
    map! <ESC>Oo  :
    map! <ESC>Oj  *
    map! <ESC>Om  -
    map! <ESC>Ok  +
    map! <ESC>Ol  ,
    map! <ESC>OM  
    map! <ESC>Ow  7
    map! <ESC>Ox  8
    map! <ESC>Oy  9
    map! <ESC>Ot  4
    map! <ESC>Ou  5
    map! <ESC>Ov  6
    map! <ESC>Oq  1
    map! <ESC>Or  2
    map! <ESC>Os  3
    map! <ESC>Op  0
    map! <ESC>On  .
    " keys in normal mode
    map <ESC>Oo  :
    map <ESC>Oj  *
    map <ESC>Om  -
    map <ESC>Ok  +
    map <ESC>Ol  ,
    map <ESC>OM  
    map <ESC>Ow  7
    map <ESC>Ox  8
    map <ESC>Oy  9
    map <ESC>Ot  4
    map <ESC>Ou  5
    map <ESC>Ov  6
    map <ESC>Oq  1
    map <ESC>Or  2
    map <ESC>Os  3
    map <ESC>Op  0
    map <ESC>On  .
endif

" xterm but without activated keyboard transmit mode
" and therefore not defined in termcap/terminfo
if myterm == "xterm" || myterm == "kvt" || myterm == "gnome"
    " keys in insert/command mode.
    map! <Esc>[H  <Home>
    map! <Esc>[F  <End>
    " Home/End: older xterms do not fit termcap/terminfo
    map! <Esc>[1~ <Home>
    map! <Esc>[4~ <End>
    " Up/Down/Right/Left
    map! <Esc>[A  <Up>
    map! <Esc>[B  <Down>
    map! <Esc>[C  <Right>
    map! <Esc>[D  <Left>
    " KP_5 (NumLock off)
    map! <Esc>[E  <Insert>
    " keys in normal mode
    map <ESC>[H  0
    map <ESC>[F  $
    " Home/End: older xterms do not fit termcap/terminfo
    map <ESC>[1~ 0
    map <ESC>[4~ $
    " Up/Down/Right/Left
    map <ESC>[A  k
    map <ESC>[B  j
    map <ESC>[C  l
    map <ESC>[D  h
    " KP_5 (NumLock off)
    map <ESC>[E  i
endif

" xterm/kvt but with activated keyboard transmit mode
" sometimes not or wrong defined within termcap/terminfo
if myterm == "xterm" || myterm == "kvt" || myterm == "gnome"
    " keys in insert/command mode
    map! <Esc>OH <Home>
    map! <Esc>OF <End>
    map! <ESC>O2H <Home>
    map! <ESC>O2F <End>
    map! <ESC>O5H <Home>
    map! <ESC>O5F <End>
    " Cursor keys which works mostly
    " map! <Esc>OA <Up>
    " map! <Esc>OB <Down>
    " map! <Esc>OC <Right>
    " map! <Esc>OD <Left>
    map! <Esc>[2;2~ <Insert>
    map! <Esc>[3;2~ <Delete>
    map! <Esc>[2;5~ <Insert>
    map! <Esc>[3;5~ <Delete>
    map! <Esc>O2A <PageUp>
    map! <Esc>O2B <PageDown>
    map! <Esc>O2C <S-Right>
    map! <Esc>O2D <S-Left>
    map! <Esc>O5A <PageUp>
    map! <Esc>O5B <PageDown>
    map! <Esc>O5C <S-Right>
    map! <Esc>O5D <S-Left>
    " KP_5 (NumLock off)
    map! <Esc>OE <Insert>
    " keys in normal mode
    map <ESC>OH  0
    map <ESC>OF  $
    map <ESC>O2H  0
    map <ESC>O2F  $
    map <ESC>O5H  0
    map <ESC>O5F  $
    " Cursor keys which works mostly
    " map <ESC>OA  k
    " map <ESC>OB  j
    " map <ESC>OD  h
    " map <ESC>OC  l
    map <Esc>[2;2~ i
    map <Esc>[3;2~ x
    map <Esc>[2;5~ i
    map <Esc>[3;5~ x
    map <ESC>O2A  ^B
    map <ESC>O2B  ^F
    map <ESC>O2D  b
    map <ESC>O2C  w
    map <ESC>O5A  ^B
    map <ESC>O5B  ^F
    map <ESC>O5D  b
    map <ESC>O5C  w
    " KP_5 (NumLock off)
    map <ESC>OE  i
endif

if myterm == "linux"
    " keys in insert/command mode
    map! <Esc>[G  <Insert>
    " KP_5 (NumLock off)
    " keys in normal mode
    " KP_5 (NumLock off)
    map <ESC>[G  i
endif

if myterm == "screen"
    map! <ESC>[1;2D <S-Left>
    map! <ESC>[1;2C <S-Right>
    map! <ESC>[1;2A <S-Up>
    map! <ESC>[1;2B <S-Down>
    map! <ESC>[1;2H <Home>
    map! <ESC>[1;2F <End>
    map! <ESC>[2;2~ <Insert>
    map! <ESC>[3;2~ <Delete>
    map! <ESC>[5;2~ <PageUp>
    map! <ESC>[6;2~ <PageDown>
    map! <ESC>[1;5D <C-Left>
    map! <ESC>[1;5C <C-Right>
    map! <ESC>[1;5A <C-Up>
    map! <ESC>[1;5B <C-Down>
    map! <ESC>[1;5H <Home>
    map! <ESC>[1;5F <End>
    map! <ESC>[2;5~ <Insert>
    map! <ESC>[3;5~ <Delete>
    map! <ESC>[5;5~ <PageUp>
    map! <ESC>[6;5~ <PageDown>
    map! <ESC>[1;3D <A-Left>
    map! <ESC>[1;3C <A-Right>
    map! <ESC>[1;3A <A-Up>
    map! <ESC>[1;3B <A-Down>
    map! <ESC>[1;3H <Home>
    map! <ESC>[1;3F <End>
    map! <ESC>[2;3~ <Insert>
    map! <ESC>[3;3~ <Delete>
    map! <ESC>[5;3~ <PageUp>
    map! <ESC>[6;3~ <PageDown>
endif

" this escape sequence is the well known ANSI sequence for
" Remove Character Under The Cursor (RCUTC)
map! <Esc>[3~ <Delete>
map  <ESC>[3~    x

" VUNDLE START
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle manages other bundles
Bundle 'gmarik/vundle'

" Github.com repos
Bundle 'mileszs/ack.vim'
"Bundle 'kien/ctrlp.vim'
"Bundle 'LaTeX-Box-Team/LaTeX-Box'
Bundle 'scrooloose/nerdtree'
"Bundle 'scrooloose/nerdcommenter'
Bundle 'ervandew/supertab'
"Bundle 'Townk/vim-autoclose'
"Bundle 'rson/vim-conque'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
"Bundle 'tpope/vim-markdown'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'Lokaltog/vim-powerline'
Bundle 'thinca/vim-quickrun'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
"Bundle 'benmills/vimux'

" Vim.org repos
Bundle 'L9'
Bundle 'bufexplorer.zip'
Bundle 'FuzzyFinder'

filetype plugin indent on
" VUNDLE END

" NERDTree
noremap <silent> <leader>nt :NERDTreeToggle<CR>

" Vim-NERDTree-Tabs
"autocmd VimEnter * NERDTreeTabsOpen
"autocmd BufEnter * NERDTreeMirrorOpen
"autocmd VimEnter * wincmd w
noremap <silent> <Leader>nb :NERDTreeTabsToggle<CR>

" Vim-Powerline
set laststatus=2
set statusline=%<%f\                    " custom statusline
set statusline+=[%{&ff}]                " show fileformat
set statusline+=%y%m%r%=
set statusline+=%-14.(%l,%c%V%)\ %P
let g:Powerline_theme="default"
let g:Powerline_colorscheme="default"
set shortmess=atI

" Vim-Gitgutter
let g:gitgutter_enabled = 0
let g:gitgutter_eager = 0
highlight clear SignColumn
noremap <silent> <leader>gt :highlight clear SignColumn <Bar> GitGutterToggle<CR>

" End of Configuration
