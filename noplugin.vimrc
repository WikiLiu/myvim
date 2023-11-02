" Define the leader key as Space
let mapleader = "\<Space>"

" Use Vim settings, rather than Vi settings
set nocompatible

" Enable syntax highlighting
syntax enable

" Set the path to include subdirectories for file searching
set path+=**

" Define special character behavior in 'whichwrap'
set whichwrap=b,s,<,>,[.]
set wrap             " Wrap lines

" Miscellaneous settings
set sc               " Smart case in search
set ic               " Incremental search
set aw               " Automatically write the file when it's modified
set scs              " Smart case for search patterns
set tabstop=4        " Tab width
set softtabstop=4    " Soft tab width
set shiftwidth=4     " Shift width
set autoindent       " Auto-indent
set cindent          " C-style auto-indent
set history=1000     " Maximum number of command history entries
filetype indent on   " Enable filetype-specific indenting
set autoread          " Automatically reload files when they change
filetype on


inoremap jj <Esc>
set number
augroup relativenumbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,WinEnter,InsertLeave * if &number | set relativenumber | endif
	autocmd BufLeave,FocusLost,WinLeave,InsertEnter * if &number | set norelativenumber | endif
augroup END


" 粘贴时保持格式
set paste
" 点击光标不会换,用于复制
set mouse-=a           " 在所有的模式下面打开鼠标。
set selection=exclusive
set selectmode=mouse,key
