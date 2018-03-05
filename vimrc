let &t_Co=256

if &compatible
  set nocompatible
endif

call plug#begin('~/dotfiles/vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'iCyMind/NeoSolarized'
Plug 'editorconfig/editorconfig-vim'
Plug 'pbrisbin/vim-mkdir'
Plug 'ap/vim-css-color'

Plug 'tpope/vim-sleuth'
Plug 'elixir-lang/vim-elixir'
Plug 'ElmCast/elm-vim'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'leafgarland/typescript-vim'
Plug 'digitaltoad/vim-pug'
Plug 'keith/swift.vim'
Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

call plug#end()

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

" Prettier
let g:prettier#config#single_quote = 'false' 
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#parser = 'babylon'
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
