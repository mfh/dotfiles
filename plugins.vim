" Plugins Configuration (update: 28/04/2013)

" ----- 
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" github.com
Bundle 'gmarik/vundle'
Bundle 'airblade/vim-gitgutter'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'wikitopian/hardmode'
" vim.org
Bundle 'bufexplorer.zip'

filetype plugin indent on
" -----

" Hardmode
noremap <silent> <leader>hm :call ToggleHardMode()<CR>

" NERDTree
noremap <silent> <leader>nt :NERDTreeToggle<CR>

" Syntastic
let g:syntastic_mode_map = { "mode": "passive" }
let g:syntastic_quiet_warnings = 1
let g:syntastic_enable_highlighting = 0
noremap <silent> <leader>sc :SyntasticCheck<CR>

" Tagbar
noremap <silent> <leader>tc :TagbarToggle<cr>

" Vim-Fugitive
noremap <leader>gs :Gstatus<cr>
noremap <leader>gc :Gcommit<cr>
noremap <leader>ga :Gwrite<cr>
noremap <leader>gl :Glog<cr>
noremap <leader>gd :Gdiff<cr>
noremap <leader>gb :Gblame<cr>

" Vim-Gitgutter
let g:gitgutter_enabled = 0
let g:gitgutter_eager = 0
noremap <silent> <leader>gt :GitGutterToggle<CR>

" Vim-Powerline
let g:Powerline_theme = "sanity"
let g:Powerline_colorscheme = "sanity"

" End of Configuration
