" Plugins Configuration (update: 25/04/2013)

" VUNDLE START
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle manages other plugins
Bundle 'gmarik/vundle'

" Github.com repos
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'justincampbell/vim-eighties'
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'Lokaltog/vim-powerline'
Bundle 'thinca/vim-quickrun'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'

" Vim.org repos
Bundle 'L9'
Bundle 'bufexplorer.zip'
Bundle 'FuzzyFinder'

filetype plugin indent on
" VUNDLE END

" Ack
noremap <leader>f :Ack<space>

" NERDTree
noremap <silent> <leader>nt :NERDTreeToggle<CR>

" Vim-Eighties
let g:eighties_extra_width = 7

" Vim-Fugitive
noremap <silent> <leader>gs :Gstatus<cr>
noremap <silent> <leader>gc :Gcommit<cr>
noremap <silent> <leader>ga :Gwrite<cr>
noremap <silent> <leader>gl :Glog<cr>
noremap <silent> <leader>gd :Gdiff<cr>
noremap <silent> <leader>gb :Gblame<cr>

" Vim-Gitgutter
let g:gitgutter_enabled = 0
let g:gitgutter_eager = 0
noremap <silent> <leader>gg :highlight clear SignColumn <Bar> GitGutterToggle<CR>

" Vim-NERDTree-Tabs
noremap <silent> <Leader>nb :NERDTreeTabsToggle<CR>

" Vim-Powerline
let g:Powerline_theme = "sanity"
let g:Powerline_colorscheme = "sanity"

" End of Configuration
