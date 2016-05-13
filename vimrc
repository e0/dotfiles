let &t_Co=256

if &compatible
  set nocompatible
endif

set runtimepath+=~/dotfiles/vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/dotfiles/vim/dein'))

call dein#add('Shougo/dein.vim')

call dein#add('scrooloose/nerdtree')
call dein#add('kien/ctrlp.vim')
call dein#add('ElmCast/elm-vim')

call dein#end()

filetype plugin indent on

syntax enable
set background=light
colorscheme solarized
set number

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

map <silent> <C-n> :NERDTreeToggle<CR>
