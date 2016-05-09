if &compatible
  set nocompatible
endif
set runtimepath^=~/dotfiles/vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.cache/dein'))

call dein#add('~/dotfiles/vim/dein/repos/github.com/Shougo/dein.vim')
call dein#add('Shougo/neocomplete.vim')

call dein#add('scrooloose/nerdtree')
call dein#add('kien/ctrlp')

call dein#end()

filetype plugin indent on

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
