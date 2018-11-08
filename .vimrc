if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Generic
  call dein#add('jreybert/vimagit')
  call dein#add('scrooloose/nerdtree')
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  call dein#add('honza/vim-snippets')
  call dein#add('vim-airline/vim-airline')
  "call dein#add('gabrielelana/vim-markdown')
  call dein#add('tpope/vim-surround')
  "call dein#add('tpope/vim-repeat')
  call dein#add('jeffkreeftmeijer/vim-numbertoggle')
  call dein#add('ctrlpvim/ctrlp.vim')
  "call dein#add('flazz/vim-colorschemes')
  call dein#add('octol/vim-cpp-enhanced-highlight')
  call dein#add('mileszs/ack.vim')
  call dein#add('mattn/emmet-vim')
  call dein#add('airblade/vim-gitgutter')
  "call dein#add('sbdchd/neoformat')
  "call dein#add('gertjanreynaert/cobalt2-vim-theme')
  call dein#add('blueshirts/darcula')
  "call dein#add('flazz/vim-colorschemes')

  " Linter
  call dein#add('w0rp/ale')

  "AutoComplete
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add('autozimu/LanguageClient-neovim', {
  \ 'rev': 'next',
  \ 'build': 'bash install.sh',
  \ })

  call dein#add('ludovicchabant/vim-gutentags')
  call dein#add('kristijanhusak/vim-js-file-import')

  "JavaScript
  call dein#add('maksimr/vim-jsbeautify', { 'on_ft' : ['javascript', 'vim', 'json', 'xml', 'html'] })
  call dein#add('mxw/vim-jsx', { 'on_ft' : ['javascript', 'jsx'] })
  call dein#add('pangloss/vim-javascript', { 'on_ft' : ['javascript'] })

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on

" linter options
let g:ale_sign_column_always = 1
let g:ale_lint_delay = 300
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s'

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'javascript.jsx': ['eslint'],
\   'typescript': ['tslint'],
\}

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver'],
\   'json': ['jsonlint'],
\}

" cache dir
let g:vim_dir = '~/.vim'

function! _ensure_path(path, ...)
    let l:is_file = a:0 > 0 && a:1 == 1 ? 1 : 0
    let l:path = resolve(expand(a:path))
    let l:dir = l:is_file ? fnamemodify(l:path, ':h') : l:path
    if !isdirectory(l:dir) | call mkdir(l:dir, 'p') | endif
    return l:path
endfunction

function! _cache_dir(path)
    return _ensure_path(g:vim_dir . '/cache/' . a:path)
endfunction

" AutoComplete
let g:deoplete#enable_at_startup = 1

let g:gutentags_cache_dir = _cache_dir('gutentags')
let g:gutentags_file_list_command = 'rg --files'
let g:gutentags_generate_on_new = 0
let g:gutentags_project_root_finder = 'GutenTagsProjectRootFinder'
let g:gutentags_define_advanced_commands = 1
let g:gutentags_init_user_func = 'GutenTagsInit'

function! GutenTagsProjectRootFinder(path) abort
   if &filetype =~ 'script'
    let l:file = ale#path#FindNearestFile(bufnr('%'), 'package.json')
    if !empty(l:file)
      return fnamemodify(l:file, ':p:h')
    endif
   endif
   let g:gutentags_project_root_finder = ''
   let l:path = gutentags#get_project_root(a:path)
   let g:gutentags_project_root_finder = 'GutenTagsProjectRootFinder'
   return l:path
endfunction

function! GutenTagsInit(path) abort
  if a:path =~ '\(fugitive\|.git/index\)'
    return 0
  endif
  return 1
endfunction


" language server
" npm i -g typescript-language-server
" npm i -g typescript
let g:LanguageClient_autoStart = 1
let g:LanguageClient_changeThrottle = 0.5
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'python': ['pyls'],
    \ 'typescript': ['typescript-language-server', '--stdio'],
    \ 'typescript.tsx': ['typescript-language-server', '--stdio'],
    \ 'javascript': ['typescript-language-server', '--stdio'],
    \ 'javascript.jsx': ['typescript-language-server', '--stdio'],
    \ }
nnoremap <silent> <leader>gd :call LanguageClient_textDocument_definition()<CR>:normal! m`<CR>
nnoremap <silent> <leader>b <C-o>

nnoremap <silent> <leader>rr :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <leader>fr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> <leader>h :call LanguageClient#textDocument_hover()<CR>

" GitGutter settings
cmap uh GitGutterUndoHunk

" Use ag instead of ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" C++ highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" Find file in NERDtree
map <C-z> :NERDTreeFind<CR>
" the same with shorter command
cmap nf NERDTreeFind
" Toggle NERDtree
map <C-Z> :NERDTreeToggle<CR>

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
"call neobundle#end()



" Disable arrow keys in normal mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

set t_Co=256
set pastetoggle=<F4>
"set clipboard+=unnamedplus " can use clipboard
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

" Function to rename the variable under the cursor
function! RenameVariable()
  let word_to_replace = expand("<cword>")
  let replacement = input("new name: ")
  execute '%s/\(\W\)' . word_to_replace . '\(\W\)/\1' . replacement . '\2/gc'
endfunction
noremap fr :call RenameVariable()<enter>

" Function to write testID to file
function! ReplaceTestID() range
  let [line_start, column_start] = getpos("'<")[1:2]
  let [line_end, column_end] = getpos("'>")[1:2]
  let lines = getline(line_start, line_end)
  if len(lines) == 0
      return ''
  endif
  let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][column_start - 1:]
  let selected_text = join(lines, "\n")
  let replacement = input("new testID: ")
  let replacement_const = substitute(replacement, '[{,}]', '', 'g')
  execute "silent !echo '" . replacement . ": " . selected_text . ",' >> ~/testIDs.js"
  execute "%s/" . selected_text . '/\{' . replacement . '\}/g'
  execute "redraw!"
endfunction
noremap td :call ReplaceTestID()<enter>


let g:netrw_liststyle=3
let g:jsx_ext_required=0

autocmd FileType json setlocal conceallevel=0

" only show files that are not ignored by git
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_extensions = ['line']
let g:ctrlp_use_caching = 0

" shorten mapping delay so that esc reacts immediately
set timeoutlen=400

map <expr> <A-w> emmet#expandAbbrIntelligent('<A-w>')

let g:user_emmet_install_global = 0
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\    'extends' : 'jsx',
\  },
\  'typescript.tsx' : {
\    'extends' : 'jsx',
\  }
\}

autocmd FileType html,css,scss,javascript.jsx,typescript.tsx EmmetInstall

highlight OverLength ctermbg=DarkGrey ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
