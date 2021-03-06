" Turn off default key mappings
let g:multi_cursor_use_default_mapping=0

" Stay in MC mode when pressing Escape
let g:multi_cursor_exit_from_insert_mode=0

" Switch to multicursor mode with ,mc
let g:multi_cursor_start_key=',mc'
let g:multi_cursor_start_word_key='g,mc'

" Ctrl-n, Ctrl-p, Ctrl-x, and <Esc> are mapped in the special multicursor
" mode once you've added at least one virtual cursor to the buffer
let g:multi_cursor_next_key='<C-N>'
let g:multi_cursor_prev_key='<C-P>'
let g:multi_cursor_skip_key='<C-X>'
let g:multi_cursor_quit_key='<Esc>'

