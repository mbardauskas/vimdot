if &compatible
  set nocompatible
endif

let s:VIM_CONFIG_DIR = '~/vimdot'

let s:dein_base = '~/.cache/dein'
let s:dein_src = '~/.cache/dein/repos/github.com/Shougo/dein.vim'

execute 'set runtimepath+=' . s:dein_src

"set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

call dein#begin(s:dein_base)

call dein#add(s:dein_src)

" Generic
call dein#add('jreybert/vimagit')
call dein#add('scrooloose/nerdtree')
call dein#add('vim-airline/vim-airline')
call dein#add('tpope/vim-surround')
"call dein#add('/usr/local/opt/fzf')
"call dein#add('/usr/bin/fzf')
"call dein#add('junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'})
"call dein#add('junegunn/fzf.vim')
call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
call dein#add('octol/vim-cpp-enhanced-highlight')
call dein#add('mileszs/ack.vim')
call dein#add('mattn/emmet-vim')
call dein#add('airblade/vim-gitgutter')
call dein#add('tpope/vim-fugitive') "git blame
call dein#add('junegunn/vim-peekaboo') "helper for registers
call dein#add('AlphaMycelium/pathfinder.vim') "suggests better movements
call dein#add('blueshirts/darcula')
call dein#add('terryma/vim-smooth-scroll')

" AutoComplete
call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})

" JavaScript
call dein#add('leafgarland/typescript-vim')
call dein#add('moll/vim-node')
call dein#add('mxw/vim-jsx', { 'on_ft' : ['javascript', 'jsx'] })
call dein#add('pangloss/vim-javascript', { 'on_ft' : ['javascript'] })

" AI related stuff
call dein#add('madox2/vim-ai')

call dein#end()

" AI related stuff
let s:initial_complete_prompt =<< trim END
>>> system

You are a general coding assistant, leaning towards clean code expert.
If you attach a code block add syntax type after ``` to enable syntax highlighting.
END
let g:vim_ai_roles_config_file = '~/vimdot/vimconfig/vim-ai-roles.ini'
let g:vim_ai_complete = {
\  "prompt": "",
\  "engine": "chat",
\  "options": {
\    "model": "gpt-4-turbo",
\    "endpoint_url": "https://api.openai.com/v1/chat/completions",
\    "max_tokens": 0,
\    "max_completion_tokens": 0,
\    "temperature": 0.1,
\    "request_timeout": 20,
\    "stream": 1,
\    "enable_auth": 1,
\    "token_file_path": "",
\    "selection_boundary": "#####",
\    "initial_prompt": s:initial_complete_prompt,
\  },
\  "ui": {
\    "paste_mode": 1,
\  },
\}
let g:vim_ai_edit = {
\  "prompt": "",
\  "engine": "chat",
\  "options": {
\    "model": "gpt-4-turbo",
\    "endpoint_url": "https://api.openai.com/v1/chat/completions",
\    "max_tokens": 0,
\    "max_completion_tokens": 0,
\    "temperature": 0.1,
\    "request_timeout": 20,
\    "stream": 1,
\    "enable_auth": 1,
\    "token_file_path": "",
\    "selection_boundary": "#####",
\    "initial_prompt": s:initial_complete_prompt,
\  },
\  "ui": {
\    "paste_mode": 1,
\  },
\}
let g:vim_ai_chat = {
\  "options": {
\    "model": "gpt-4-turbo",
\    "stream": 0,
\    "max_tokens": 4000,
\    "temperature": 0.75,
\    "initial_prompt": "",
\  },
\}


filetype plugin indent on

let g:vim_dir = '~/.vim'
let g:netrw_liststyle=3

exec "source " . s:VIM_CONFIG_DIR . "/vimconfig/core-helpers.vim"
exec "source " . s:VIM_CONFIG_DIR . "/vimconfig/plugins.config.vim"
exec "source " . s:VIM_CONFIG_DIR . "/vimconfig/my-functions.vim"

" Make comma the leader key
map , <Leader>

" Disable arrow keys in normal mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" disable arrow keys in popups
inoremap <expr> <Down> pumvisible() ? "" : "\<Down>"
inoremap <expr> <Up> pumvisible() ? "" : "\<Up>"

noremap <silent> § <Esc>:noh<cr>
inoremap <silent> § <Esc>

" quick save
noremap <leader>s :write<CR>
exec "command W :echoerr 'Use the shortcut: <C-a>s'"
cabbrev w W

" vim settings
set t_Co=256
set pastetoggle=<F4>
set noswapfile
set nowritebackup
set nobackup
"set clipboard+=unnamedplus " can use clipboard
set tabstop=2             " tab width
set shiftwidth=2          " number of spaces when shifting (>> and <<)
set softtabstop=2         " delete 2 spaces when pressing backspace
set expandtab             " insert spaces when tab is pressed
set autoindent            " copy indentation of previous line if there are no file type overrides

"set mouse=a               " enable mouse in all modes
set scrolloff=3           " keep 3 lines top/bottom when scrolling

"set relativenumber        " show line numbers
set number                " show exact number on active line

set laststatus=2          " show status line always, not only with splits
set showcmd               " show command while it is being typed in in vis mode
set ruler                 " show cursor position in status bar
set showmode              " show active mode
set showmatch             " show matching brackets

set hlsearch              " highlight search results
set ignorecase            " ignore search and autocomplete case
set incsearch             " search for a pattern while it is being typed

set wildmenu              " cool command autocompletion
set wildmode=list:longest,full " command autocompletion behaviour

" set spell spelllang=en_us " spellcheck // use coc, :CocInstall coc-spell-check

set nobackup              " no backup files (default)
set wrap                  " wrap long lines, not same as break (default)
set nomodeline            " disable options for vim in last lines (security - default)
set backspace=indent,eol,start " normalize bs behavior: bs over newline, etc (default)

set splitright            " open vertical split in right instead of left
set splitbelow            " open vertical split in bottom instead of top
set encoding=UTF-8        " default file encoding
set timeoutlen=400        " shorten mapping delay so that esc reacts immediately
set list listchars=tab:»·,extends:»,precedes:«,trail:·  " display trailing whitespace and tabs with special chars & long lines
syntax enable             " enable syntax highlight
colorscheme darcula

hi Normal ctermfg=188 ctermbg=NONE cterm=NONE guifg=#a9b7c6 guibg=NONE gui=NONE

filetype plugin indent on " enable filetypes detection, plugins and indent


" change colors after 80 chars
highlight OverLength ctermbg=DarkGrey ctermfg=white guibg=#592929
match OverLength /\%81v.\+/


