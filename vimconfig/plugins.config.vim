" Magit
nnoremap <silent> <leader>gs :execute magit#show_magit('h', 1, 1)<CR>


" AutoComplete
let g:coc_config_home = "$HOME/vimdot/vimconfig/"

nmap <silent> <leader>gd <Plug>(coc-definition)
"nmap <silent> <leader>gd :call CocAction('jumpDefinition', 'tab drop') <CR>
nnoremap <silent> <leader>b <C-o>

nmap <silent> <leader>rr <Plug>(coc-rename)
nmap <silent> <leader>fr <Plug>(coc-references)
nmap <silent> <leader>h :call <SID>show_documentation()<CR>

vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
vmap <leader>fa  <Plug>(coc-format)
nmap <leader>fa  <Plug>(coc-format)


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

" GitGutter settings
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)
" Find file in NERDtree
map <C-z> :NERDTreeFind<CR>
" the same with shorter command
cmap nf NERDTreeFind
" Toggle NERDtree
map <C-Z> :NERDTreeToggle<CR>
" For conceal markers.



