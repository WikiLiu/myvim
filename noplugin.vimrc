" Define the leader key as Space
let mapleader = "\<Space>"

" Use Vim settings, rather than Vi settings
set nocompatible

" Enable syntax highlighting
syntax enable

" Enable filetype detection and plugins
filetype plugin on

" Set the path to include subdirectories for file searching
set path+=**

" Create a custom command to generate tags with ctags
command! MakeTags !ctags -R .

" Map a command to insert a predefined HTML skeleton
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

" Set the 'makeprg' for running RSpec tests with the QuickfixFormatter
set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter

" Customize the cursor shape in the terminal
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Define special character behavior in 'whichwrap'
set whichwrap=b,s,<,>,[.]

" Miscellaneous settings
set sc               " Smart case in search
set ic               " Incremental search
set aw               " Automatically write the file when it's modified
set scs              " Smart case for search patterns
set termguicolors    " Use true colors in terminal
set wrap             " Wrap lines
set tabstop=4        " Tab width
set softtabstop=4    " Soft tab width
set shiftwidth=4     " Shift width
set autoindent       " Auto-indent
set cindent          " C-style auto-indent
set history=1000     " Maximum number of command history entries
filetype indent on   " Enable filetype-specific indenting
set autoread          " Automatically reload files when they change


inoremap jj <Esc>
set number
augroup relativenumbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,WinEnter,InsertLeave * if &number | set relativenumber | endif
	autocmd BufLeave,FocusLost,WinLeave,InsertEnter * if &number | set norelativenumber | endif
augroup END
