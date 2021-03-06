" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" ================ General Config ====================

" Text Width (word wrapping)
set tw=80

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

set fileformats+=dos

set ruler                       "Show current line and column position in file
set modeline

set clipboard=unnamed

" Natural split opening
set splitbelow
set splitright

" Show file title in terminal tab
set title

" Highlight current line
set cursorline

" Don't keep results hightlighted after searching
set nohlsearch

" Show hidden files in NerdTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 40

" Vim Multiple Cursors
let g:multi_cursor_next_key='<C-g>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Markdown preview
" let vim_markdown_preview_hotkey='<C->'
" let vim_markdown_preview_browser='Google Chrome'

" CtrlP
"let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
let g:ctrlp_show_hidden = 1
"let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_custom_ignore = 'dist|node_modules\|DS_Store\|git'

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" NeoComplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#keyword_patterns = {}

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" YouCompleteMe
autocmd Filetype typescript nnoremap <silent> gd :YcmCompleter GoToDefinition<CR>
autocmd Filetype typescript nnoremap ,f :YcmCompleter GoToReferences<CR>
"autocmd FileType typescript nmap <buffer> ,t :YcmCompleter GetDoc<CR>
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all 
" the plugins.
let mapleader=","

" Unite
nnoremap <Leader>f :Unite -start-index file<CR>

" Change inside surrounding
nmap <Leader>cis :ChangeInsideSurrounding<CR>

" ===================== Syntastic ====================
let g:syntastic_check_on_open  = 1
let g:syntastic_enable_signs   = 1
let g:syntastic_error_symbol   = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '»'
let g:syntastic_style_warning_symbol = '»'
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_javascript_checkers = ['standard', 'eslint']
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
let g:syntastic_disabled_filetypes = ['ts', 'html']
let g:syntastic_html_tidy_ignore_errors = [
			\ 'trimming empty <i>',
			\ 'trimming empty <span>',
			\ '<input> proprietary attribute \"autocomplete\"',
			\ 'proprietary attribute \"role\"',
			\ 'proprietary attribute \"hidden\"',
			\ 'proprietary attribute \"ng-',
      \ '<svg> is not recognized!',
      \ '<g> is not recognized!',
      \ '<path> is not recognized!',
			\ 'discarding unexpected <svg>',
			\ 'discarding unexpected </svg>',
			\ '<rect> is not recognized!',
			\ 'discarding unexpected <rect>'
			\ ]
" autocmd bufwritepost *.js silent !standard % --format

" =============== Vundle Initialization ===============
" This loads all the plugins specified in ~/.vim/vundles.vim
" Use Vundle plugin to manage all other plugins
if filereadable(expand("~/.vim/vundles.vim"))
  source ~/.vim/vundles.vim
endif

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" nnoremap <leader>p p`[v`]=
" nnoremap <leader>P P`]v`[=

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set wrap  " Wrap lines
set linebreak
" set wrap linebreak nolist " get word wrapping that doesn't cut a word in half
if has('linebreak')
  try
    set breakindent             "bri:   visually indent wrapped lines
    let &showbreak='↳'
  catch /E518:/
    " Unknown option: breakindent
  endtry
endif

set gdefault

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=dist/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"
" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Sizes ===================
set winheight=30
" set winminheight=5

" ========== Black Hole Register =========
"nnoremap d "_d
"vnoremap d "_d
"nnoremap p "_dP
"vnoremap p "_dP

" ================ Custom Settings ========================
so ~/.yadr/vim/settings.vim
