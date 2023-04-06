"之后会在readme中添加所有快捷按键说明

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"



set whichwrap=b,s,<,>,[,]
" 设置<leader>为空格键
let mapleader = "\<Space>"


" 在状态行显示命令
" showcmd
set sc

" 搜索不区分大小写
" ignorecase
set ic

" 自动写入(不包含"edit","quit"等命令,如需包含参见autowriteall)
" 当在执行一些跳转,离开本缓冲区的命令时自动写入文件,如:
" :next,:last,:stop,:suspend,CTRL-],CTRL-O,'{A-Z0-9}等
" autowrite
set aw

" 搜索智能区分大小写
" 本选项的作用是配合上面不区分大小写的设置
" 这样,只要包含一个大写字母则搜索时区分大小写
" smartcase
set scs

set termguicolors   " 启用true color

" 是否把超出编辑区显示范围的行,按多行显示
" wrap
set wrap
set nu!
"1.设置（软）制表符宽度为4
set tabstop=4
set softtabstop=4

"2.设置缩进的空格数为4
set shiftwidth=4

"3.设置自动缩进：即每行的缩进值与上一行相等；使用 noautoindent 取消设置：
set autoindent

"4.使用 C/C++ 语言的自动缩进方式
set cindent



nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a
nnoremap <C-q> :q<CR>
inoremap <C-q> <Esc>:q<CR>
set mouse=a


call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasr/molokai'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'scrooloose/nerdtree'
Plug 'vim-autoformat/vim-autoformat'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'preservim/nerdcommenter'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

"代码块
Plug 'SirVer/ultisnips'    
Plug 'honza/vim-snippets'


Plug 'vim-scripts/taglist.vim' "Tlist标签列表插件
Plug 'ludovicchabant/vim-gutentags' "gutentags异步tags插件
Plug 'skywind3000/gutentags_plus'
Plug 'skywind3000/vim-preview'


"终端------------------------------------------------------------
" 设置打开终端时占比较小
let g:terminal_size = 20

" 将光标移动到左侧目录树
nnoremap <leader>tt :wincmd h<CR> :belowright terminal<CR>
 
nnoremap <C-Up> <C-w>k
nnoremap <C-Down> <C-w>j
nnoremap <C-Left> <C-w>h
nnoremap <C-Right> <C-w>l


"####################
" previm
" 执行PrevimOpen命令在浏览器中实时预览所编写的markdown文件
Plug 'kannokanno/previm', { 'for': 'markdown' }
    let g:previm_open_cmd = 'xdg-open'
map <leader>md :PrevimOpen<CR>

call plug#end()


"补全代码塊--------------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"



"主题--------------------------------------------------------------------------------------
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
set background=dark
syntax on


nnoremap <leader>f :Autoformat<CR>


"注释----------------------------------------------------------------------
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

"高亮---------------------------------------------------------------------------------------------------------
let g:lsp_cxx_hl_use_text_props = 1



"NERDTree--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

nnoremap <silent> <F2> :NERDTreeToggle<CR>

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Start NERDTree when Vim starts with a directory argument.

autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif




"airline-------------------------------------------------------------------------

nmap <S-Tab> :bprev<Return>
nmap <Tab> :bnext<Return>
" airline设置
" 显示颜色
set t_Co=256
set laststatus=2
" 使用powerline打过补丁的字体
let g:airline_powerline_fonts = 1
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
" tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '
" tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = ' '
" tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1
" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
" 映射<leader>num到num buffer
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>= <Plug>AirlineSelectNextTab
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_theme='violet'

" 删除当前buffer
" 如果有多个buffer则自动编辑之前的buffer或前一个buffer
" 如果只有当前一个buffer则删除后打开NERDTree(未启用, 如果需要取消下面 "NERDTreeFocus 的注释即可)

" 隐藏已经被:bdelete的buffer
" airline的tabline就不会再显示已经被delete的buffer
set hidden

nnoremap <leader>q :call CloseCurrentBuffer()<CR>

function! CloseCurrentBuffer()
    " 在处理buffer前先关闭预览，quickfix，位置列表这几个窗口，不然会有些问题
    pclose
    cclose
    lclose

    let l:bufsInfo = getbufinfo()
    let l:bufsNrListed = []
    for l:bufInfo in l:bufsInfo
        if get(l:bufInfo, "listed") == 1
            call add(l:bufsNrListed, get(l:bufInfo, "bufnr"))
        endif
    endfor
    let l:bufsNrListedCount = len(l:bufsNrListed)
    if l:bufsNrListedCount <= 1
        execute "bw"
        "NERDTreeFocus
    else
        if bufloaded(bufnr("#"))
            execute "b#"
        else
            execute "bp"
        endif
        execute "bw #"
    endif
endfunction

" 删除所有buffer
nnoremap <leader>bc :call CloseListedBuffers()<cr>
" 删除所有buffer,除了当前的
nnoremap <leader>bo :call CloseOtherBuffers()<cr>
" 切换到之前的buffer
nnoremap <leader>0 :b#<cr>

function! CloseListedBuffers()
    " 在处理buffer前先关闭预览，quickfix，位置列表这几个窗口，不然会有些问题
    pclose
    cclose
    lclose
 
    let l:bufsInfo = getbufinfo()
    for l:bufInfo in l:bufsInfo
        if get(l:bufInfo, "listed") == 1
            let l:bufNr = get(l:bufInfo, "bufnr")
            if bufloaded(l:bufNr)
                execute "bw" l:bufNr
            endif
        endif
    endfor
    NERDTreeFocus
endfunction

function! CloseOtherBuffers()
    " 在处理buffer前先关闭预览，quickfix，位置列表这几个窗口，不然会有些问题
    pclose
    cclose
    lclose

    let l:bufsInfo = getbufinfo()
    for l:bufInfo in l:bufsInfo
        if get(l:bufInfo, "listed") == 1
            let l:bufNr = get(l:bufInfo, "bufnr")
            if l:bufNr != bufnr("%")
                if bufloaded(l:bufNr)
                    execute "bw" l:bufNr
                endif
            endif
        endif
    endfor
endfunction

"Leaderf-------------------------------------------------------------------------------------------------------------------------------------------
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1

let g:Lf_PreviewResult = {
			\ 'File': 0,
			\ 'Buffer': 0,
			\ 'Mru': 0,
			\ 'Tag': 1,
			\ 'BufTag': 1,
			\ 'Function': 1,
			\ 'Line': 0,
			\ 'Colorscheme': 0,
			\ 'Rg': 1,
			\ 'Gtags': 1
			\}
let g:Lf_PreviewCode = 1                          " 预览代码
let g:Lf_RootMarkers = ['.root', 'compile_command.json', '.git'] "你的根目录标志
let g:Lf_WorkingDirectoryMode = 'A'              " 设置 LeaderF 工作目录为项目根目录，如果不在项目中，则为当前目录。
let g:Lf_ShortcutF = "<Leader>ff"
let g:Lf_ShortcutB = "<Leader>fb"
nnoremap <silent><Leader>fc :LeaderfFunctionAll<CR> " 搜索函数
nnoremap <silent><Leader>fbt :LeaderfBufTagAll<CR>   " 搜索缓冲区中的 tag
nnoremap <silent><Leader>ft :LeaderfTag<CR>         " 搜索项目中的 tag
nnoremap <silent><leader>fh :LeaderfHelp<CR>        " 搜索 vim help
nnoremap <Leader>fg :Leaderf rg<Space>             " 调用 ripgrep 查找字符串
let g:Lf_UseDevIcons = 0




"ale-----------------------------------------------------------------------------------------------------------------------------------
"let g:ale_completion_enabled = 1
"let g:ale_linters = {
"\   'c++': ['clang++'],
"\   'c': ['clang'],
"\}



"coc.vim-----------------------------------------------------------------------------------------------------------------
" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion

inoremap <silent><expr> <c-@> coc#refresh()


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> S :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif


" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space><space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space><space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space><space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space><space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space><space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space><space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space><space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space><space>p  :<C-u>CocListResume<CR>


" tag ---------------------------------------------------------------------------
map <silent> <F3> :TlistToggle<cr>
let Tlist_Close_On_Select = 1 "close taglist window once we selected something
let Tlist_Exit_OnlyWindow = 1 "if taglist window is the only window left, exit vim
let Tlist_Show_Menu = 1 "show Tags menu in gvim
let Tlist_Show_One_File = 1 "show tags of only one file
let Tlist_GainFocus_On_ToggleOpen = 1 "automatically switch to taglist window
let Tlist_Highlight_Tag_On_BufEnter = 1 "highlight current tag in taglist window
let Tlist_Process_File_Always = 1 "even without taglist window, create tags file, required for displaying tag in statusline
let Tlist_Use_Right_Window = 1 "display taglist window on the right
let Tlist_Display_Prototype = 1 "display full prototype instead of just function name



set tags=./.tags;,.tags
set tags+=/home/wiki/.cache/tags


" gtags-----------------------------------------------------------------------------------------------------------------------------------------------
" 安装新的ctags 和 编译新的gtags

nmap <silent> <F4> :!ctags -R --c++-kinds=+p --fields=+iaS --extras=+q .<CR>
" " 配置 ctags 的参数 "
map <c-]> g<c-]>  "ctags跳转不自动选择

" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project','compile_commands.json']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
        let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
        let g:gutentags_modules += ['gtags_cscope']
endif
" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags目录中，避免污染工程目录                      
" 对于gtags  这里很重要 可以先 ln -s /usr/include  然后 gtags   
" 对于ctags nmap <silent> <F4> :!ctags -R --c++-kinds=+p --fields=+iaS --extras=+q .<CR>
let g:gutentags_cache_dir = expand('~/.cache/tags')


" 配置 ctags 的参数，老的 Exuberant-ctags 不能有--extra=+q，注意
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" 如果使用 universal ctags 需要增加下面一行，老的Exuberant-ctags 不能加下一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']


" 禁用 gutentags 自动加载 gtags 数据库的行为
"let g:gutentags_auto_add_gtags_cscope = 0

let g:gutentags_plus_nomap = 1
noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>
noremap <silent> <leader>gz :GscopeFind z <C-R><C-W><cr>






