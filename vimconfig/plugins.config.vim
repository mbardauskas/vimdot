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
" sh: npm i -g typescript-language-server
" sh: npm i -g typescript
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
let g:LanguageClient_rootMarkers = {
    \ 'javascript': ['package.json'],
    \ 'javascript.jsx': ['package.json'],
    \ 'typescript': ['package.json'],
    \ 'typescript.tsx': ['package.json'],
    \ }
nnoremap <silent> <leader>gd :call LanguageClient_textDocument_definition()<CR>:normal! m`<CR>
nnoremap <silent> <leader>b <C-o>

nnoremap <silent> <leader>rr :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <leader>fr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> <leader>h :call LanguageClient#textDocument_hover()<CR>


" C++ highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" JSX config
let g:jsx_ext_required=0


" GIT only show files that are not ignored by git
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_extensions = ['line']
let g:ctrlp_use_caching = 0


"Emmet conf
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


" Use ag instead of ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

