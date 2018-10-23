syntax enable
au BufEnter *.py set sw=4 sts=4 et ai
filetype plugin indent on

set tabstop=4
set shiftwidth=4
set expandtab

set mouse=a

execute pathogen#infect()

set background=dark
" let g:solarized_termcolors=256
colorscheme solarized

