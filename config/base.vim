" =============================================================================
" 编码相关
" =============================================================================
set termencoding=utf-8  " 设置终端显示编码
set encoding=utf-8      " 设置vim内部编码
" 菜单显示编码
set langmenu=zh_CN.UTF-8
" 设置可识别文件编码列表
set fileencodings=utf-8,gb2312,gbk,gb18030,cp936,utf-16,big5,latin1

" =============================================================================
" 基本配置
" =============================================================================
" 开启文件类型检查,根据不同的文件类型加载不同的插件采用不同的缩进
filetype plugin indent on
syntax on               " 打开语法高亮
set t_Co=256            " 启用256色
set nocompatible        " 不与vi兼容(采用vim自己的操作命令)
set background=dark     " 设置背景色
set cursorline          " 高亮光标所在行
" 高亮行颜色
highlight CursorLine cterm=Bold ctermbg=Black ctermfg=NONE guibg=Black guifg=NONE
"设置主题配色
colorscheme molokai
set number              " 显示行号
set laststatus=2        " 是否显示状态栏(0,1,2)
set ruler               " 在状态栏显示当前光标坐标
set showmode            " 底行显示当前处于哪种模式
set showcmd             " 命令模式下,在底行显示键入的指令
set mouse=a             " 鼠标模式(n,v,i,c,h,a,r,A)
set scrolloff=7         " 垂直滚动时光标距离顶部/底部的行数
set sidescrolloff=7     " 水平滚动时光标距离边缘的字符数
set showmatch           " 光标遇到括号时自动高亮对应的另一个括号
set nobackup            " 不创建备份文件
set noerrorbells        " 出错时不要发出声音
"set visualbell          " 出错时发出视觉提示(通常时屏幕闪烁)
set history=1024        " 记录历史操作的数量
set autoread            " 打开文件监视,如果在编辑中的文件被外部修改则提示
set autowrite           " 跳转时自动保存
" 文件换行符检测列表
set fileformats=unix,dos,mac
set foldenable          " 默认折叠
set foldmethod=marker   " 折叠方式
set guioptions-=T       " gvim不包含工具栏
set guioptions-=m       " gvim不使用菜单栏
set guioptions-=r       " gvim不显示右边滚动条
set guioptions-=l       " gvim不显示左边滚动条
set helpheight=10       " 帮助窗口的最小高度
set helplang=cn,en      " 帮助手册语言
set hidden              " 允许在有未保存的修改时切换缓冲区
set nowrap              " 不自动折行
set helplang=cn         " 中文帮助优先
"自动向上递归查找tags文件
set tags=./tags;

" =============================================================================
" 编辑相关
" =============================================================================
set ai
set tabstop=8           " 制表符宽度(Tab空格数)
set softtabstop=8       " 软制表符宽度(按Tab键和Backspace键时光标跳转的空格数)
set shiftwidth=8        " 缩进宽度(空格数)
set noexpandtab         " 制表符替换为空格
set autoindent          " 自动缩进
set cindent             " 特别针对C语言的自动缩进
set cinoptions=:0       " 自动缩进方案
set smartindent         " 插入新行时自动缩进
" 启用退格键删除功能
set backspace=indent,eol,start
set whichwrap=h,l       "使用指定的左右移动光标键可以移到前一行和后一行
" 自动补全模式
set complete=.,w,b,u,t,i,d
" 自动补全选项
set completeopt=longest,menuone
set pumheight=10        " 自动补全菜单显示的最多项目数
" 文件和目录名补全忽略的文件
set wildignore=*.bak,*.o,*.e,*~
set wildmenu            " 命令模式下,按Tab键补全命令
" 命令补全模式
set wildmode=longest:list,full
set hlsearch            " 查找时高亮显示匹配结果
set incsearch           " 查找输入时,每输入一个字符,自动跳转到第一个匹配结果
set ignorecase          " 查找时忽略大小写
set smartcase           " 针对只有首字母时大写的查找词不忽略大小写

" =============================================================================
" 自动命令
" =============================================================================
" 打开文件光标自动跳转到上次关闭时的位置
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal g'\"" |
    \ endif

" =============================================================================
" 快捷键
" =============================================================================
" Leader键设置
let mapleader=' '

" 使用分号进入命令模式
nnoremap ; :
vnoremap ; :

" 窗口切换快捷键
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
inoremap <C-h> <Esc><C-w>h
inoremap <C-j> <Esc><C-w>j
inoremap <C-k> <Esc><C-w>k
inoremap <C-l> <Esc><C-w>l

" 窗口大小调整
nnoremap + :resize +1<cr>
nnoremap _ :resize -1<cr>
nnoremap > :vertical resize +1<cr>
nnoremap < :vertical resize -1<cr>

" shell命令调用函数
function! RunShell(Msg, Shell)
	echo a:Msg . '...'
	call system(a:Shell)
	echon 'done'
endfunction

" vimgrep查找字符串
nmap <F6> :vimgrep /<C-R>=expand("<cword>")<cr>/ **/*.c **/*.h<cr><C-o>:cw<cr>
" 生成GTAGS数据库文件快捷键F8
nmap <F8> :call RunShell("Generate GTAGS.*", 'find . -name "*.[chsS]" -o -name "*.cpp" -o -name "*.cc" -o -name "*.C", -o -name "*.cxx"> gtags.files && gtags')<cr>
" 生成tags文件快捷键F9
nmap <F9> :call RunShell("Generate tags", "ctags -R --c-kinds=+lpxzL --c++-kinds=+lpxzLANU --fields=+niazS --extras=+q --output-format=e-ctags")<cr>
" 生成cscope数据库文件快捷键F10
nmap <F10> :call RunShell("Generate cscope.*", 'find `pwd` -name "*.[chsS]" -o -name "*.cpp" -o -name "*.cc" -o -name "*.C", -o -name "*.cxx"> cscope.files && cscope -bkq')<cr>
" <Ctrl + x> 剪下
vmap <C-x> "+d
" <Ctrl + c> 複製
vmap <C-c> "+y
" <Ctrl + v> 貼上
vmap <C-v> "+p
" vim 分頁功能快捷鍵
imap <C-p> :tabprevious<CR>
imap <C-n> :tabnext<CR>
imap <C-t> :tabnew<CR>
imap <C-w> :tabclose<CR>
imap <C-p> <Esc>:tabprevious<CR>i
imap <C-n> <Esc>:tabnext<CR>i
imap <C-t> <Esc>:tabnew<CR>
