" Vim Configuration (update: 27/04/2013)

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
set nowritebackup
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

" enable mouse and cursor
set mouse=a
set cursorline

" enable text colors: badwolf candycode crispy delek evening github iawriter
" ir_black jellybeans koehler molokai_deep mustang pyte synic vgod vividchalk
set t_Co=256
colorscheme experiment

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
nmap <silent> <F3> :set hlsearch!<CR>

" toggle columns color
function! ToggleColorColumn()
  if &colorcolumn != ''
    setlocal colorcolumn&
  else
    setlocal colorcolumn=78,79,80
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
autocmd BufWritePost .vimrc source $MYVIMRC

" enable cursor jump to the last known position
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif 

" plugins configuration file
source ~/.vim/plugins.vim

" End of Configuration
