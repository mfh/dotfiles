" Plugins Configuration

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

" NERDTree
noremap <silent> <leader>nt :NERDTreeToggle<CR>

" Vim-NERDTree-Tabs
noremap <silent> <Leader>nb :NERDTreeTabsToggle<CR>

" Vim-Powerline
let g:Powerline_theme = "sanity"
let g:Powerline_colorscheme = "sanity"

" Vim-Gitgutter
let g:gitgutter_enabled = 0
let g:gitgutter_eager = 0
noremap <silent> <leader>gt :highlight clear SignColumn <Bar> GitGutterToggle<CR>

" End of Configuration
