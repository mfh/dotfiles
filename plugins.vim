" Plugins Configuration (update: 27/04/2013)

" VUNDLE START
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle manages other plugins
Bundle 'gmarik/vundle'

" Github.com repos
Bundle 'airblade/vim-gitgutter'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'Lokaltog/vim-powerline'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
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

" Syntastic
let g:syntastic_mode_map = { "mode": "passive" }
let g:syntastic_quiet_warnings = 1
let g:syntastic_enable_highlighting = 0

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
noremap <silent> <leader>gt :GitGutterToggle<CR>

" Vim-NERDTree-Tabs
noremap <silent> <Leader>nb :NERDTreeTabsToggle<CR>

" Vim-Powerline
let g:Powerline_theme = "sanity"
let g:Powerline_colorscheme = "sanity"

" End of Configuration
