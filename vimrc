" Vim Configuration (update: 24/04/2016)

" enable no-compatibility with vi
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
set nofsync

" enable display info ruler, modes, and window title
set ruler
set showmode
set title

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

" enable mouse and cursor line
set mouse=a

" enable line number and syntax highlight
set number
syntax on

" colors: badwolf bronco candycode crispy diablo3 darkspectrum delek desert experiment ir_black
" jellybeans koehler molokai_deep mustang pyte spacegray synic vgod vividchalk wombat256
set t_Co=256
colorscheme spacegray

" enable wrapping lines
set wrap linebreak textwidth=0     " soft-wrap text to the size of window, textwidth=0 to disable
set whichwrap+=<,>,[,],h,l          " allow backspace and cursor keys to wrap
set breakat=\ \|@-+;:,./?^I

" enable tabs for indentation, spaces for alignment
set tabstop=4
"set shiftwidth=4
"set softtabstop=2
"set expandtab
"set smarttab
"set preserveindent
"set copyindent
"set smartindent
"set autoindent
"set shiftround

" virtual tabstops using spaces
let my_tab=4
execute "set shiftwidth=".my_tab
execute "set softtabstop=".my_tab
set expandtab
" allow toggling between local and default mode
function! ToggleTab()
  if &expandtab
    set shiftwidth=4
    set softtabstop=0
    set noexpandtab
  else
    execute "set shiftwidth=".g:my_tab
    execute "set softtabstop=".g:my_tab
    set expandtab
  endif
endfunction
nmap <silent> <F12> :call ToggleTab()<CR>

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
set matchtime=2

" enable treat all numerals as decimal
set nrformats=

" enable to keep n lines off the edges when scrolling
"set scrolloff=999
"set scrolloff=8

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
set history=1100
set undolevels=1100

" toggle paste without auto indent
set pastetoggle=<F2>

" toggle highlighting search results
nmap <silent> <F3> :set hlsearch!<CR>

" toggle highlight cursor line
nmap <silent> <F4> :set cursorline!<CR>

" toggle highlight columns
function! ToggleColorColumn()
  if &colorcolumn != ''
    setlocal colorcolumn&
  else
    setlocal colorcolumn=78,79,80
  endif
endfunction
nmap <silent> <F6> :call ToggleColorColumn()<CR>

" toggle spell checking
nmap <silent> <F7> :set spell!<CR>

" toggle show unprintable characters
set listchars=tab:▸-,eol:¬
set listchars+=trail:·
set listchars+=extends:»,precedes:«
nmap <silent> <F8> :set list!<CR>

" toggle syntax highlight
function! ToggleSyntax()
  if exists("g:syntax_on")
    syntax off
  else
    syntax enable
  endif
endfunction
nmap <silent> <F9> :call ToggleSyntax()<CR>

" toggle show line number
nmap <silent> <F10> :set number!<CR>

" enable autoreload vimrc that already edited (or manually: ":so %")
autocmd BufWritePost .vimrc source $MYVIMRC

" enable cursor jump to the last known position
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif 

" enable motion keys operate on display lines
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$

" enable shortcut to switch buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>

" enable shortcut to split line, change dir, create ctags, and open new tab
nnoremap <silent> <leader>j gEa<CR><ESC>ew
nnoremap <silent> <leader>cd :lcd %:h<CR>:pwd<CR>
nnoremap <silent> <leader>ct :!ctags -R .<CR><CR>
nnoremap <silent> <C-W>t :tabnew<CR>

" plugins configuration file
source ~/.vim/plugins.vim

" disable continuation of comments
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" End of Configuration
