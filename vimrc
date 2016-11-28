let &t_Co=256

if &compatible
  set nocompatible
endif

set runtimepath+=~/dotfiles/vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/dotfiles/vim/dein'))

call dein#add('Shougo/dein.vim')

call dein#add('neomake/neomake')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('terryma/vim-multiple-cursors')

call dein#add('tpope/vim-sleuth')
call dein#add('elixir-lang/vim-elixir')
call dein#add('ElmCast/elm-vim')
call dein#add('joukevandermaas/vim-ember-hbs')

call dein#end()

syntax enable
set number
filetype plugin indent on

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set background=light
colorscheme solarized

set backspace=indent,eol,start
set backupcopy=yes


let g:elm_format_autosave = 1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|\.git\|deps\|_build'

let g:ariline#extensions#tabline#enabled = 1
let g:airline_theme = 'solarized'
