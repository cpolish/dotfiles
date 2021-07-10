" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()

source ~/.cocrc

filetype plugin indent on

" makes autocomplete more readable
highlight Pmenu ctermbg=237 ctermfg=White
highlight PmenuSel ctermbg=25 ctermfg=White

" fixes delete key on built-in keyboard
set backspace=indent,eol,start

" show existing tab with 4 spaces width
set tabstop=4

" when indenting with '>', use 4 spaces width
set shiftwidth=4

" shows line numbers
set number

" enable syntax highlighting
syntax on

" enable mouse support
set mouse=a
