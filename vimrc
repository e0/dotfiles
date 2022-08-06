" PLUGINS
call plug#begin('~/dotfiles/vim/plugged')

Plug 'cloudhead/neovim-fuzzy'
Plug 'terryma/vim-multiple-cursors'
Plug 'iCyMind/NeoSolarized'
Plug 'pbrisbin/vim-mkdir'
Plug 'ap/vim-css-color'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-sleuth'
Plug 'github/copilot.vim'
Plug 'amdt/sunset'
Plug 'lifepillar/vim-solarized8'
Plug 'itchyny/lightline.vim'

Plug 'jparise/vim-graphql'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'chr4/nginx.vim'
Plug 'neo4j-contrib/cypher-vim-syntax'
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'neoclide/jsonc.vim'
Plug 'elel-dev/vim-astro-syntax'

call plug#end()

" Map <leader> to `,`
let mapleader=','

if &compatible
  set nocompatible
endif

syntax enable
set background=light
colorscheme solarized8_high
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

let g:sunset_latitude = 57.708870
let g:sunset_longitude = 11.974560

set mouse=a
set backspace=indent,eol,start
set backupcopy=yes
set clipboard+=unnamedplus

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

nnoremap <C-p> :FuzzyOpen<CR>

let g:lightline = { 'colorscheme': 'solarized' }

command! -nargs=0 Prettier :CocCommand prettier.formatFile
command WW noa w
cabbrev ww WW

" python
let g:pymode_python = 'python3'
let g:pymode_options_max_line_length = 88
let g:pymode_lint_ignore = ["E501", "W",]

" typescript
 let g:vim_svelte_plugin_use_typescript = 1

