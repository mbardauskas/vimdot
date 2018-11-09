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



