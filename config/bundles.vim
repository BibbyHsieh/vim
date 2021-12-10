" =============================================================================
" vim-plug插件管理
" =============================================================================
call plug#begin('~/.vim/plug')

Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-mark'
Plug 'vim-scripts/a.vim'
Plug 'bronson/vim-trailing-whitespace'

Plug 'yianwillis/vimcdoc'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-scripts/mru.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'vim-scripts/taglist.vim', { 'on': 'TlistToggle' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'vim-scripts/genutils'
Plug 'vim-scripts/lookupfile'

Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus', { 'on': 'GscopeKill' }
Plug 'skywind3000/vim-preview', { 'on': 'GscopeKill' }

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

" 主題配色
Plug 'tomasr/molokai'
Plug 'KabbAmine/yowish.vim'
Plug 'junegunn/seoul256.vim'

call plug#end()
