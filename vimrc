" PLUGINS
call plug#begin('~/dotfiles/vim/plugged')

Plug 'cloudhead/neovim-fuzzy'
Plug 'terryma/vim-multiple-cursors'
Plug 'pbrisbin/vim-mkdir'
Plug 'ap/vim-css-color'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-sleuth'
Plug 'github/copilot.vim'
Plug 'vimpostor/vim-lumen'
" Plug 'lifepillar/vim-solarized8'
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sainnhe/everforest'
Plug 'itchyny/lightline.vim'

Plug 'jparise/vim-graphql'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'chr4/nginx.vim'
Plug 'neo4j-contrib/cypher-vim-syntax'
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'neoclide/jsonc.vim'
Plug 'elel-dev/vim-astro-syntax'
Plug 'hashivim/vim-terraform'

call plug#end()

" Map <leader> to `,`
let mapleader=','

if &compatible
  set nocompatible
endif

syntax enable
set background=light
" colorscheme solarized8_high
" colorscheme dracula
let g:everforest_background = 'hard'
let g:everforest_better_performance = 1
let g:everforest_enable_italic = 1
colorscheme everforest


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

nnoremap <C-p> :FuzzyOpen<CR>

" let g:lightline = { 'colorscheme': 'dracula' }
" let g:lightline = { 'colorscheme': 'solarized' }
let g:lightline = { 'colorscheme': 'everforest' }

command! -nargs=0 Prettier :CocCommand prettier.formatFile
command WW noa w
cabbrev ww WW

" python
let g:pymode_python = 'python3'
let g:pymode_options_max_line_length = 88
let g:pymode_lint_ignore = ["E501", "W",]

" typescript
 let g:vim_svelte_plugin_use_typescript = 1

