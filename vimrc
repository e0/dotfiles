" PLUGINS
call plug#begin('~/dotfiles/vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'iCyMind/NeoSolarized'
Plug 'pbrisbin/vim-mkdir'
Plug 'ap/vim-css-color'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" deoplete js
Plug 'carlitux/deoplete-ternjs', { 'do': 'yarn global add tern' }

" deoplete ts
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': 'yarn global add neovim typescript && ./install.sh'}

" deoplete python
Plug 'deoplete-plugins/deoplete-jedi'

Plug 'tpope/vim-sleuth'
Plug 'leafgarland/typescript-vim'
Plug 'jparise/vim-graphql'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'psf/black'

call plug#end()



let &t_Co=256

if &compatible
  set nocompatible
endif

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
colorscheme NeoSolarized
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
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']


let g:ariline#extensions#tabline#enabled = 1
let g:airline_theme = 'solarized'

" prettier
let g:prettier#config#single_quote = 'false'
let g:prettier#autoformat = 0
let g:prettier#exec_cmd_async = 1
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier

" python
let g:pymode_python = 'python3'
let g:pymode_lint_ignore = ["E501", "W",]
autocmd BufWritePre *.py execute ':Black'

