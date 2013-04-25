" Vim Configuration (update: 25/04/2013)

" enable no-compatibility with Vi
set nocompatible

" enable posix compliance
let g:is_posix = 1

" enable mapleader key
let g:mapleader = ","

" enable unicode encoding
set encoding=utf-8
set termencoding=utf-8

" disable modeline and error bell
set nomodeline
set noerrorbells visualbell t_vb=

" disable write backup and swap file
set nobackup
set noswapfile

" enable display info ruler and current mode
set ruler
set showmode

" enable display info message and line status
set shortmess=atI
set laststatus=2
set statusline=%<%f\                " custom statusline for Powerline
set statusline+=[%{&ff}]            " show fileformat
set statusline+=%y%m%r%=
set statusline+=%-14.(%l,%c%V%)\ %P

" enable fast terminal output
set ttyfast

" enable automatic reading
set autoread

" enable mouse
set mouse=a

" enable a colors scheme:
"   badwolf candycode crispy delek evening github iawriter ir_black
"   jellybeans koehler molokai_deep mustang pyte synic vgod vividchalk
set t_Co=256
colorscheme jellybeans

" enable highlight cursor
set cursorline
highlight CursorLine cterm=bold ctermbg=237

" enable wrapping lines
set wrap linebreak textwidth=0      " soft-wrap text to the size of window
set whichwrap+=<,>,[,],h,l          " allow backspace and cursor keys to wrap
set breakat=\ \|@-+;:,./?^I

" enable tab with spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

" enable backspacing over everything in insert mode
set backspace=indent,eol,start

" enable case-insensitive search
set ignorecase
set smartcase
set hlsearch
set incsearch
set gdefault
set magic                           " change special characters in search patterns

" enable show matching brackets
set showmatch

" enable treat all numerals as decimal
set nrformats=

" enable to keep n lines off the edges of the screen when scrolling
set scrolloff=5

" enable cursor to go in to invalid places
set virtualedit=block

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

" enable remember more command history and undo level
set history=1000
set undolevels=1000

" enable motion keys operate on display lines
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$

" enable shortcut to switch buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" enable shortcut to split line and change dir
nnoremap <silent> <C-J> gEa<CR><ESC>ew
nnoremap <silent> <leader>cd :lcd %:h<CR>:pwd<CR>

" enable shortcut to normal mode
inoremap kk <Esc>`^
inoremap jj <Esc>`^

" enable single insert from normal mode
function! RepeatChar(char, count)
   return repeat(a:char, a:count)
endfunction
nnoremap <silent> s :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap <silent> S :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>

" toggle paste without auto indent
set pastetoggle=<F2>

" toggle highlighting search
nmap <silent> <F3> :set nohlsearch!<CR>

" toggle columns color
function! ToggleColorColumn()
  if &colorcolumn != ''
    setlocal colorcolumn&
  else
    let &l:colorcolumn=join(range(76,80),",") | setlocal colorcolumn
    highlight colorcolumn ctermbg=237
  endif
endfunction
nmap <silent> <F6> :call ToggleColorColumn()<CR>

" toggle spell checking
nmap <silent> <F7> :set spell!<CR>

" toggle syntax highlight
function! ToggleSyntax()
  if exists("g:syntax_on")
    syntax off
  else
    syntax enable
  endif
endfunction
nmap <silent> <F8> :call ToggleSyntax()<CR>

" toggle show line number
nmap <silent> <F9> :set number!<CR>

" shortcut to add newline without enter insert mode
nmap <silent> <F10> O<Esc>
nmap <silent> <F11> o<Esc>

" toggle display unprintable characters
set listchars=tab:▸-,eol:¬
set listchars+=trail:·
set listchars+=extends:»,precedes:«
nmap <silent> <F12> :set list!<CR>

" enable autoreload vimrc that already edited (or manually: ":so %")
autocmd bufwritepost .vimrc source $MYVIMRC

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

" xterm but with activated keyboard transmit mode and
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

" this escape sequence is the well known ANSI sequence for
" Remove Character Under The Cursor (RCUTC)
map! <Esc>[3~ <Delete>
map  <ESC>[3~    x

" plugin configurations
source ~/.vim/bundle/plugins.vim

" End of Configuration
