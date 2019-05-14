" =============================================================================
" vim-plug插件管理
" =============================================================================
call plug#begin('~/.vim/plug')

Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-mark'
Plug 'vim-scripts/a.vim'
Plug 'bronson/vim-trailing-whitespace'

" vim中文帮助手册
Plug 'yianwillis/vimcdoc'
" C++语法高亮增强
Plug 'octol/vim-cpp-enhanced-highlight'
" 最近打开的文件维护插件
Plug 'vim-scripts/mru.vim'
" 状态栏插件
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Taglist插件
Plug 'vim-scripts/taglist.vim', { 'on': 'TlistToggle' }
" 树形目录插件
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" 通用函数插件
Plug 'vim-scripts/genutils'
" 查找文件插件(依赖于genutils)
Plug 'vim-scripts/lookupfile'

" 自动更新tags插件
Plug 'ludovicchabant/vim-gutentags'
" 自动加载切换gtags数据库
Plug 'skywind3000/gutentags_plus', { 'on': 'GscopeKill' }
" 预览 quickfix 窗口 ctrl-w z 关闭
Plug 'skywind3000/vim-preview', { 'on': 'GscopeKill' }

" 代码补齐插件
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
" 代码补齐模板
Plug 'honza/vim-snippets'

" 自动补全插件YCM
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer',
            \ 'for': ['s', 'S', 'c', 'h', 'C', 'cpp', 'cc', 'cxx', 'py', 'go', 'java', 'js', 'php', 'sh'] }

" 异步静态代码检查
Plug 'w0rp/ale', { 'for': ['s', 'S', 'c', 'h', 'C', 'cpp', 'cc', 'cxx', 'py', 'go', 'java', 'js', 'php', 'sh'] }

" 主题配色
Plug 'tomasr/molokai'

call plug#end() 
