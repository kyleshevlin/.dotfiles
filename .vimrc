" Allow vim to break compatibility with vi
" Must come first, required
set nocompatible

" vim-plug, place plugins between here and the end call
call plug#begin('~/.vim/plugged')

" NerdTree, file directory tree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Open the tree directory with ctrl-n
map <C-n> :NERDTreeToggle<CR>

" Color Scheme
Plug 'mhartington/oceanic-next'

" Make tab handle all completions
Plug 'ervandew/supertab'

" Fancy statusline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

set number

" Set tabs to 2 spaces
set tabstop=2
set expandtab
set shiftwidth=2
set autoindent
set smartindent

" Smart backspacing
set backspace=indent,eol,start

" Enable theming
syntax enable

" for vim 7
set t_Co=256

" for vim 8
if (has('termguicolors'))
  set termguicolors
endif

let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

colorscheme OceanicNext

" Disable the arrow keys to force myself to learn to use other commands
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

