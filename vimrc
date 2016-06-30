let &t_Co=256

if &compatible
  set nocompatible
endif

set runtimepath+=~/dotfiles/vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/dotfiles/vim/dein'))

call dein#add('Shougo/dein.vim')

call dein#add('scrooloose/nerdtree')
call dein#add('scrooloose/syntastic')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('ElmCast/elm-vim')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('tpope/vim-sleuth')
call dein#add('neovimhaskell/haskell-vim')

call dein#end()

syntax enable
set expandtab
filetype plugin indent on
set background=light
colorscheme solarized
set number

set backspace=indent,eol,start

set backupcopy=yes

map <silent> <C-n> :NERDTreeToggle<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:elm_format_autosave = 1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|\.git\|deps\|_build'

let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
let g:haskell_classic_highlighting = 1

let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
let g:cabal_indent_section = 2
