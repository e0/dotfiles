let &t_Co=256

if &compatible
  set nocompatible
endif

call plug#begin('~/dotfiles/vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'rakr/vim-one'
Plug 'iCyMind/NeoSolarized'
Plug 'editorconfig/editorconfig-vim'
Plug 'pbrisbin/vim-mkdir'
Plug 'ap/vim-css-color'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] }

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

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
Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-hindent'
Plug 'jparise/vim-graphql'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

call plug#end()

syntax enable
set number
filetype plugin indent on

if (empty($TMUX))
  if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
" colorscheme one
colorscheme NeoSolarized
let g:one_allow_italics = 1
set background=light

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
" let g:airline_theme = 'onedark'
let g:airline_theme = 'solarized'

let g:jsx_ext_required = 0

" hindent
let g:hindent_command = "hindent -XRecursiveDo"

" prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier
