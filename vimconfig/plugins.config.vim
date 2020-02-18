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
autocmd! BufWritePre *.js,*.jsx,*.ts,*.tsx :ALEFix
imap <C-a>f <Esc>:ALEFix<CR>i
map <C-a>f :ALEFix<CR>


" Magit
nnoremap <silent> <leader>gs :execute magit#show_magit('h', 1, 1)<CR>


" AutoComplete
let g:deoplete#enable_at_startup = 1
"call deoplete#custom#option('auto_refresh_delay', 300)

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
nmap <silent> <leader>gd <Plug>(coc-definition)
"nmap <silent> <leader>gd :call CocAction('jumpDefinition', 'tab drop') <CR>
nnoremap <silent> <leader>b <C-o>

nmap <silent> <leader>rr <Plug>(coc-rename)
nmap <silent> <leader>fr <Plug>(coc-references)
nmap <silent> <leader>h :call <SID>show_documentation()<CR>


" C++ highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" JSX config
let g:jsx_ext_required=0

let g:fzf_action = {
  \ 'ctrl-x': 'split',
  \ 'ctrl-t': 'tab split' }

let g:fzf_colors =
  \ { 'fg':    ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_layout = { 'down': '15%' }

nmap <leader>h :History<cr>
nmap <leader>/ :BLines<cr>
nmap <C-P> :Files<cr>
map <leader>H :Helptags<cr>


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

" ranger integration
map <leader>l :RangerEdit<cr>
map <leader>ls :RangerSplit<cr>
map <leader>lv :RangerVSplit<cr>
map <leader>lt :RangerTab<cr>

" smooth scrolling
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" Use ag instead of ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

