"非兼容模式
set nocompatible
"配色
color fu
"打开语法高亮
syntax on
"字体
set guifont=monaco\ 12   "monaco:h14:b:cANSI
"整词换行
set linebreak
"左右光标移动到头时可以自动下移
set whichwrap=b,s,<,>,[,]
"底部标尺
set ruler
"搜索时高亮显示结果
set hlsearch
"输入搜索命令时，显示目前输入的模式的匹配位置
set incsearch
"保留50个命令
set history=50
"显示行号
set number
"使用:e命令的时候 可选项预览
set wildmenu
"文件默认编码utf-8
set enc=utf-8
"文件默认格式unix
set ff=unix
"缩进为4个空格宽度
set tabstop=4
"自动缩进使用的空格数
set shiftwidth=4
"编辑插入tab时，把tab算作的空格数
set softtabstop=4
"缩进使用空格
set expandtab
"自动缩进
set autoindent
"鼠标全模式下可用
set mouse=a
"设置backspace键
set backspace=indent,eol,start
"大小写不敏感查找
set ignorecase
set smartcase
"显示标签栏 0: 从不 1: 大于1个时显示 2: 总是
set showtabline=2
"关闭buffer后隐藏
set hidden
"通过使用: commands命令，告诉我们文件的哪一行被改变过 
set report=0
"不让vim发出讨厌的滴滴声
set noerrorbells
"显示模式
set showmode
"注释
set comments=sl:/*,mb:*,ex:*/
"自动补全提示
set wildmode=list:longest,full
"使用中文帮助
set helplang=cn

"设置编码  
set enc=utf-8  
"设置文件编码  
set fenc=utf-8  
"设置文件编码检测类型及支持格式  
set fencs=utf-8,gb18030,gbk,gb2312  


"显示状态行 
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction

"自动补全括号
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap < <><ESC>i
:inoremap > <c-r>=ClosePair('>')<CR>

function ClosePair(char)
if getline('.')[col('.') - 1] == a:char
return "\<Right>"
else
return a:char
endif
endf




"设置字典
autocmd FileType javascript set dictionary=~/.vim/dict/javascript.dict

"重新载入配置
map <leader>s :source ~/.vimrc<CR>


"映射ctrl+a
nmap <C-a> ggVG

"映射ctrl+z
imap <C-z> <Esc>ui

"映射ctrl+x
vnoremap <C-X> "+x

"映射ctrl+s
imap <C-s> <Esc>:w<cr>
 
"映射ctrl+c
vnoremap <C-C> "+y

"映射ctrl+v
map <C-V>   	"+gP
cmap <C-V>  	<C-R>+
"复制当前行
imap <A-c> <Esc>Ya

"粘贴到当前行   
imap <A-v> <Esc>pi



"visual模式修改缩进时不退出该模式
vnoremap < <gv
vnoremap > >gv 

"映射F12键为行号的开关
map <F12> :set number!<CR>

nmap <C-N> :tabnext<CR>
nmap <C-P> :tabprevious<CR>

"nnoremap <C-c> :update<CR>
"cnoremap <C-c> <Esc>:update<CR>
"inoremap <C-c> <Esc>:update<CR>

" insert mode shortcut
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-d> <DELETE>

" command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>

" 打开php折叠
let php_folding = 1 
" 打开javascript折叠
let b:javascript_fold=1
" 打开javascript对dom、html和css的支持
let javascript_enable_domhtmlcss=1

"自动补全
filetype on
filetype plugin indent on
au BufReadCmd *.jar,*.xpi,*.egg call zip#Browse(expand("<amatch>"))
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

autocmd FileType css set foldmethod=marker
autocmd FileType python setlocal et sta sw=4 sts=4



" javascriptlint
"autocmd FileType javascript set makeprg=/home/xp/bin/js/jsl\ -nologo\ -nofilelisting\ -nosummary\ -nocontext\ -conf\ '/home/xp/bin/js/jsl.conf'\ -process\ %
autocmd FileType javascript set makeprg=jsl\ -nologo\ -nofilelisting\ -nosummary\ -nocontext\ -process\ %
autocmd FileType javascript set errorformat=%f(%l):\ %m
autocmd FileType javascript inoremap <silent> <F9> <C-O>:make<CR>
autocmd FileType javascript map <silent> <F9> :make<CR>

" NERD tree
map <F10> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1

" vimwiki
let g:vimwiki_use_mouse = 1
let g:vimwiki_list = [{
\'path': '~/Dropbox/document/vimwiki/',
\'path_html': '~/Dropbox/document/vimwiki/html/',
\'html_header': '~/Dropbox/document/vimwiki/template/header.tpl',
\}]


" TagList setting
"Exuberant ctags程序的位置
let Tlist_Ctags_Cmd="/usr/bin/ctags"
let Tlist_Inc_Winwidth=0
"在右侧窗口打开
let Tlist_Use_Right_Window=1
"只显示当前文件的tag
let Tlist_File_Fold_Auto_Close=1
"如果Taglist是最后一个窗口则退出vim
let Tlist_Exit_OnlyWindow = 1



" BufExplore setting
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.


" winManager setting
"let g:winManagerWindowLayout = \""BufExplorer,FileExplorer|TagList"
let g:winManagerWindowLayout = "FileExplorer"
let g:winManagerWidth = 30
let g:defaultExplorer = 0
nmap <C-W><C-F> :FirstExplorerWindow<CR>
nmap <C-W><C-B> :BottomExplorerWindow<CR>
nmap <silent> <leader>wm :WMToggle<CR> 


