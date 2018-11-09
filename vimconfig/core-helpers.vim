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


