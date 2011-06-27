"非兼容模式
set nocompatible
"配色
color fu
"打开语法高亮
syntax on
"字体
set guifont=monaco\ 12
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
"通过使用: commands命令，告诉我们文件的哪一行被改变过 
set report=0
"关闭错误信息响铃
"自动切换当前目录为当前文件所在的目录
set autochdir           
set noerrorbells
"显示模式
set showmode
"显示括号配对情况
set magic      
"允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存         
set hidden             
"注释
set comments=sl:/*,mb:*,ex:*/
"设定命令行的行数为1
set cmdheight=1             
"自动补全提示
set wildmode=list:longest,full
"使用中文帮助
set helplang=cn
"不要备份文件
set nobackup
"设置编码  
set enc=utf-8  
"设置文件编码  
set fenc=utf-8  
"设置文件编码检测类型及支持格式  
set fencs=utf-8,gb18030,gbk,gb2312  
"显示Tab符
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
set list
"显示状态行 
set laststatus=2
set statusline=\ File:\ [%F%m%r]%h\ \ \ CWD:%r[%{getcwd()}]%h\ \ \ [%{(&fenc==\"\")?&enc:&fenc}][%{&ff}][ASCII=\%03.3b/Hex=\%02.2B]\ %w\ \ \ Line:[%l/%L:%c]\ [%p%%]



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

" let AutoCloseTag works for xml and xhtml files as well
au FileType xhtml,xml ru ftplugin/html_autoclosetag.vim

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

" NERD_commenter.vim
<leader>ca 在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//
<leader>cc 注释当前行
<leader>cs 以”性感”的方式注释
<leader>cA 在当前行尾添加注释符，并进入Insert模式
<leader>cu 取消注释
<leader>cm 添加块注释

" jsbeautify.vim 优化js代码，并不是简单的缩进，而是优化整个文件
nmap <silent> <leader>js :call g:Jsbeautify()<cr>


" vimwiki
let g:vimwiki_use_mouse = 1
let g:vimwiki_list = [{
\'path': '~/Dropbox/document/vimwiki/',
\'path_html': '~/Dropbox/document/vimwiki/html/',
\'html_header': '~/Dropbox/document/vimwiki/template/header.tpl',
\}]


" TagList
"Exuberant ctags程序的位置
let Tlist_Ctags_Cmd="/usr/bin/ctags"
let Tlist_Inc_Winwidth=0
"在右侧窗口打开
let Tlist_Use_Right_Window=1
"只显示当前文件的tag
let Tlist_File_Fold_Auto_Close=1
"如果Taglist是最后一个窗口则退出vim
let Tlist_Exit_OnlyWindow = 1



" BufExplore
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.


" winManager
"let g:winManagerWindowLayout = \""BufExplorer,FileExplorer|TagList"
let g:winManagerWindowLayout = "FileExplorer"
let g:winManagerWidth = 30
let g:defaultExplorer = 0
nmap <C-W><C-F> :FirstExplorerWindow<CR>
nmap <C-W><C-B> :BottomExplorerWindow<CR>
nmap <silent> <leader>wm :WMToggle<CR> 


