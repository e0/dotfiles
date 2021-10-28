" PLUGINS
call plug#begin('~/dotfiles/vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'iCyMind/NeoSolarized'
Plug 'pbrisbin/vim-mkdir'
Plug 'ap/vim-css-color'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-sleuth'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'jparise/vim-graphql'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'chr4/nginx.vim'
Plug 'neo4j-contrib/cypher-vim-syntax'
Plug 'leafOfTree/vim-svelte-plugin'

call plug#end()

" Map <leader> to `,`
let mapleader=','

let &t_Co=256

if &compatible
  set nocompatible
endif

syntax enable
colorscheme dracula
set background=dark
set number
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
filetype plugin indent on

if (empty($TMUX))
  if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set mouse=a
set backspace=indent,eol,start
set backupcopy=yes
set clipboard+=unnamedplus

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](\.git|node_modules|\.sass-cache|bower_components|bui‌​ld)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']


let g:ariline#extensions#tabline#enabled = 1
let g:airline_theme = 'dracula'

command! -nargs=0 Prettier :CocCommand prettier.formatFile
command WW noa w
cabbrev ww WW

" python
let g:pymode_python = 'python3'
let g:pymode_options_max_line_length = 88
let g:pymode_lint_ignore = ["E501", "W",]

