"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-obsession'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'jeffkreeftmeijer/vim-numbertoggle'
NeoBundle 'ctrlpvim/ctrlp.vim'
"NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'isRuslan/vim-es6'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'moll/vim-node'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'othree/yajs.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'othree/javascript-libraries-syntax.vim'
let g:used_javascript_libs = 'jquery,underscore,angular,react,jasmine,chai'

NeoBundle 'gertjanreynaert/cobalt2-vim-theme'
NeoBundle 'blueshirts/darcula'

" You can specify revision/branch/tag.
"NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------


" Minimalist VIM config
" Type [:help 'optionname'] for more info about each option

set nocompatible          " no vi compatibility (usually off by default)

" Core options

" Disable arrow keys in normal mode
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>

set t_Co=256
set pastetoggle=<F4>
set clipboard+=unnamedplus " can use clipboard
set tabstop=2             " tab width
set shiftwidth=2          " number of spaces when shifting (>> and <<)
set softtabstop=2         " delete 2 spaces when pressing backspace
set expandtab             " insert spaces when tab is pressed
set autoindent            " copy indentation of previous line if there are no file type overrides

set mouse=a               " enable mouse in all modes
set scrolloff=3           " keep 3 lines top/bottom when scrolling

set relativenumber        " show line numbers
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

set nobackup              " no backup files (default)
set wrap                  " wrap long lines, not same as break (default)
set nomodeline            " disable options for vim in last lines (security - default)
set backspace=indent,eol,start " normalize bs behavior: bs over newline, etc (default)

set splitright            " open vertical split in right instead of left
set splitbelow            " open vertical split in bottom instead of top

set encoding=UTF-8        " default file encoding

syntax enable             " enable syntax highlight
colorscheme darcula

filetype plugin indent on " enable filetypes detection, plugins and indent

" display trailing whitespace and tabs with special chars & long lines

set list listchars=tab:»·,extends:»,precedes:«,trail:·

" remappings

"noremap j gj              " when scrolling down in wrapped line scroll screen line
"noremap k gk              " when scrolling up in wrapped line scroll screen line

let g:netrw_liststyle=3
let g:jsx_ext_required=0
