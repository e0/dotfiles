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
call dein#add('iCyMind/NeoSolarized')
call dein#add('editorconfig/editorconfig-vim')
call dein#add('pbrisbin/vim-mkdir')
call dein#add('ap/vim-css-color')

call dein#add('tpope/vim-sleuth')
call dein#add('elixir-lang/vim-elixir')
call dein#add('ElmCast/elm-vim')
call dein#add('joukevandermaas/vim-ember-hbs')
call dein#add('leafgarland/typescript-vim')
call dein#add('digitaltoad/vim-pug')
call dein#add('keith/swift.vim')
call dein#add('posva/vim-vue')
call dein#add('pangloss/vim-javascript')
call dein#add('mxw/vim-jsx')

call dein#end()

syntax enable
set number
filetype plugin indent on

colorscheme NeoSolarized
"set background=dark

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set mouse=a
set backspace=indent,eol,start
set backupcopy=yes

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](\.git|node_modules|\.sass-cache|bower_components|bui‌​ld)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:elm_format_autosave = 1

let g:ariline#extensions#tabline#enabled = 1
let g:airline_theme = 'solarized'

let g:jsx_ext_required = 0
