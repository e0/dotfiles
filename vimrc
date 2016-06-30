let &t_Co=256

if &compatible
  set nocompatible
endif

set runtimepath+=~/dotfiles/vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/dotfiles/vim/dein'))

call dein#add('Shougo/dein.vim')

call dein#add('scrooloose/nerdtree')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('ElmCast/elm-vim')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('tpope/vim-sleuth')

call dein#end()

filetype plugin indent on

syntax enable
set background=light
colorscheme solarized
set number

set backspace=indent,eol,start

set backupcopy=yes

map <silent> <C-n> :NERDTreeToggle<CR>

let g:elm_format_autosave = 1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|\.git\|deps\|_build'
