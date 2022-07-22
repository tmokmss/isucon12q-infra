set nocompatible

nnoremap ; :
nnoremap : ;

set backspace=start,eol,indent
set whichwrap=b,s,[,],,~
syntax on

set number
set cursorline

set autoindent
set shiftwidth=2
set tabstop=2
set expandtab
inoremap <silent> jj <ESC>

set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch

let _curfile=expand("%:r")
if _curfile == 'Makefile'
  set noexpandtab
endif
