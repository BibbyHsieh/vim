" =============================================================================
" 插件配置
" =============================================================================
" lookupfile.vim
" -----------------------------------------------------------------------------
" 生存filename.tags快捷键F7
nmap <F7> :call RunShell("Generate filename.tags", "genftag")<cr>
" 映射LookupFile快捷键
nmap <Leader>lt :LUTags<cr>
" 映射LUBufs快捷键
nmap <Leader>lb :LUBufs<cr>
" 映射LUWalk快捷键
nmap <Leader>lw :LUWalk<cr>  
" 最少输入2个字符才开始查找
let g:LookupFile_MinPatLength=2
" 不保存上次查找的字符串
let g:LookupFile_PreserveLastPattern=0
" 保存查找历史
let g:LookupFile_PreservePatternHistory=1
" 回车打开第一个匹配项目
let g:LookupFile_AlwaysAcceptFirst=1
" 不允许创建不存在的文件
let g:LookupFile_AllowNewFiles=0
" 关闭对搜索结果的字母排序
let g:LookupFile_SortMethod=""
" 向上递归查找tags文件
let g:filename_tags=findfile("filename.tags", ".;")
" 设置tags文件
if filereadable(g:filename_tags)
    let g:LookupFile_TagExpr='"'.g:filename_tags.'"'
endif
" 查找忽略大小写
function! LookupFile_IgnoreCaseFunc(pattern)
    let _tags = &tags
    try
        let &tags = eval(g:LookupFile_TagExpr)
        let newpattern = '\c' . a:pattern
        let tags = taglist(newpattern)
    catch
        echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
        return ""
    finally
        let &tags = _tags
    endtry

    " Show the matches for what is typed so far.
    let files = map(tags, 'v:val["filename"]')
    return files
endfunction
let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc'

" mru.vim
" -----------------------------------------------------------------------------
" 打开mru快捷键F4
nmap  <F4> :MRU<cr>

" man.vim
" -----------------------------------------------------------------------------
" 启动man插件
source $VIMRUNTIME/ftplugin/man.vim
" man 光标定位的函数
nmap <Leader>mm :Man <C-R>=expand("<cword>")<cr><cr>
" man 2 光标定位的函数
nmap <Leader>m2 :Man 2 <C-R>=expand("<cword>")<cr><cr>
" man 3 光标定位的函数
nmap <Leader>m3 :Man 3 <C-R>=expand("<cword>")<cr><cr>

" taglist.vim
" -----------------------------------------------------------------------------
" 设置打开关闭快捷键F2
nmap  <F2> :TlistToggle<cr>
" 自动更新tags列表
let g:Tlist_Auto_Update=1
" 始终解析文件中的tag,不管taglist窗口有没有打开
let g:Tlist_Process_File_Always=1
" 当taglist窗口是最后一个窗口时退出vim
let g:Tlist_Exit_OnlyWindow=1
" 只显示一个文件的tags
let g:Tlist_Show_One_File=1
" 窗口宽度
let g:Tlist_WinWidth=30
" 只显示当前文件的tags
let g:Tlist_Enable_Fold_Column=0
" 高亮显示当前tag
let g:Tlist_Auto_Highlight_Tag=1
" 设置窗口显示在右侧
"let g:Tlist_Use_Right_Window=1
" 打开时光标定位于taglist窗口
let g:Tlist_GainFocus_On_ToggleOpen=1

" NERDTree.vim
" -----------------------------------------------------------------------------
" 设置打开关闭快捷键F3 
nmap  <F3> :NERDTreeToggle<cr>
" 窗口美化
let NERDChristmasTree=1
" 自动调整光标到窗口中心
let NERDTreeAutoCenter=1
" 指定鼠标模式(1.双击打开;2.单目录双文件;3.单击打开)
let NERDTreeMouseMode=2
" 默认显示文件
let NERDTreeShowFiles=1
" 默认显示隐藏文件
let NERDTreeShowHidden=1
" 窗口位置（'left' or 'right'）
let g:NERDTreeWinPos="right"
" 窗口宽度
let g:NERDTreeWinSize=30
" 显示行号
let g:NERDTreeShowLineNumbers=1
" 打开文件后关闭NERDTree窗口
let g:NERDTreeQuitOnOpen=1
" 高亮显示当前行目录或文件
let NERDTreeHightCursorline=1

" cscope配置
" -----------------------------------------------------------------------------
" 更新cscope数据库函数
function! UpdateCsdb(path)
	execute "cd " . a:path
    call job_start("cscope -bkq")
	execute "cd -"
	execute "silent cs reset"
endfunction

" 更新GTAGS数据库函数
function! UpdateGtags(f)
    let g:dir = fnamemodify(a:f, ':p:h')
    execute "cd " . g:dir
    call job_start("global -u")
	execute "cd -"
endfunction

if executable('cscope')
    " 获取GTAGS目录
    let s:gtfile = system('global -pq')
	" 向上递归寻找cscope.files
    let s:csfile = findfile("cscope.out", ".;")

	" 如果存在cscope.out则获取目录
    if filereadable(s:csfile)
        " 设置cscope模式标志
        let g:csflag = 0
        " 获取cscope.out目录
        let s:pathlen = strridx(s:csfile, "cscope.out")
		let g:cspath = strpart(s:csfile, 0, s:pathlen)
	" 如果存在cscope.out则获取目录
    elseif s:gtfile != ""
        " 设置cscope模式标志
        let g:csflag = 1
        " 获取GTAGS目录
		let g:gtpath = strpart(s:gtfile, 0, strlen(s:gtfile) - 1)
    " 使用gutentags_plus
    else
        " 设置cscope模式标志
        let g:csflag = 2
	endif

    " cscope程序位置
	if !exists("g:cspath") && executable('gtags-cscope')
        " 设置cscope映射的程序
        set csprg=/usr/local/bin/gtags-cscope
        if g:csflag == 1
            " 加载GTAGS
            execute 'silent cs add ' . g:gtpath . '/GTAGS'
            " 保存文件后自动更新GTAGS
            autocmd BufWritePost * call UpdateGtags(expand('<afile>'))
        else
            execute 'silent GscopeKill'
        endif
    else
        " 设置cscope映射的程序
        set csprg=/usr/bin/cscope
        " 自动命令查找结果不使用quickfix窗口
        " autocmd BufReadPost * set cscopequickfix=""
        " 保存文件后自动更新GTAGS
        autocmd BufWritePost * call UpdateCsdb(g:cspath)
        " 加载cscope.out
    	set nocsverb
		execute 'cs add ' . s:csfile
    endif

    " 显示添加数据库结果
    set csverb
    " 使用cstag命令代替tag命令 
    set cst
    " 优先搜索tags,失败再搜索cscope.out
    set csto=0
    " 显示文件路径全名 
    set cspc=0
endif

" cscope当前窗口直接跳转快捷键
nnoremap <Leader>fs :cs find s <C-R>=expand("<cword>")<cr><cr>
nnoremap <Leader>fg :cs find g <C-R>=expand("<cword>")<cr><cr>
nnoremap <Leader>fd :cs find d <C-R>=expand("<cword>")<cr><cr>
nnoremap <Leader>fc :cs find c <C-R>=expand("<cword>")<cr><cr>
nnoremap <Leader>ft :cs find t <C-R>=expand("<cword>")<cr><cr>
nnoremap <Leader>fe :cs find e <C-R>=expand("<cword>")<cr><cr>
nnoremap <Leader>ff :cs find f <C-R>=expand("<cfile>")<cr><cr>
nnoremap <Leader>fi :cs find i <C-R>=expand("<cfile>")<cr><cr>
nnoremap <Leader>fa :cs find a <C-R>=expand("<cword>")<cr><cr>

" cscope跳转同时新建水平分割窗口快捷键
nnoremap <Leader>ss :scs find s <C-R>=expand("<cword>")<cr><cr>
nnoremap <Leader>sg :scs find g <C-R>=expand("<cword>")<cr><cr>
nnoremap <Leader>sd :scs find d <C-R>=expand("<cword>")<cr><cr>
nnoremap <Leader>sc :scs find c <C-R>=expand("<cword>")<cr><cr>
nnoremap <Leader>st :scs find t <C-R>=expand("<cword>")<cr><cr>
nnoremap <Leader>se :scs find e <C-R>=expand("<cword>")<cr><cr>
nnoremap <Leader>sf :scs find f <C-R>=expand("<cfile>")<cr><cr>
nnoremap <Leader>si :scs find i <C-R>=expand("<cfile>")<cr><cr>
nnoremap <Leader>sa :scs find a <C-R>=expand("<cword>")<cr><cr>

" cscope跳转同时新建垂直分割窗口快捷键
nnoremap <Leader>vs :vert scs find s <C-R>=expand("<cword>")<cr><cr>
nnoremap <Leader>vg :vert scs find g <C-R>=expand("<cword>")<cr><cr>
nnoremap <Leader>vd :vert scs find d <C-R>=expand("<cword>")<cr><cr>
nnoremap <Leader>vc :vert scs find c <C-R>=expand("<cword>")<cr><cr>
nnoremap <Leader>vt :vert scs find t <C-R>=expand("<cword>")<cr><cr>
nnoremap <Leader>ve :vert scs find e <C-R>=expand("<cword>")<cr><cr>
nnoremap <Leader>vf :vert scs find f <C-R>=expand("<cfile>")<cr><cr>
nnoremap <Leader>vi :vert scs find i <C-R>=expand("<cfile>")<cr><cr>
nnoremap <Leader>va :vert scs find a <C-R>=expand("<cword>")<cr><cr>

" gutentags.vim && gutentags_plus.vim
" -----------------------------------------------------------------------------
" 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project', 'workspace', 'cscope.out', 'GTAGS', 'tags', 'filename.tags']
" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'
" tags模式设置
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if g:csflag == 2 && executable('gtags-cscope')
	let g:gutentags_modules += ['gtags_cscope']
    " 光标定位于quickfix窗口
    let g:gutentags_plus_switch = 1
endif
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
" 配置ctags的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extras=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+lpxzLANU']
let g:gutentags_ctags_extra_args += ['--c-kinds=+lpxzL']
" 如果使用universal ctags需要增加下面一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
" 禁用 gutentags 自动加载 gtags 数据库的行为
" 避免多个项目数据库相互干扰
" 使用plus插件解决问题
let g:gutentags_auto_add_gtags_cscope = 0

" vim-preview.vim
if g:csflag == 2 && executable('gtags-cscope')
    " p预览 大P关闭
    autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
    autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
    noremap <Leader>u :PreviewScroll -1<cr> " 往上滚动预览窗口
    noremap <Leader>d :PreviewScroll +1<cr> "  往下滚动预览窗口
endif

" YouCompleteMe.vim
" -----------------------------------------------------------------------------
" 补全配置脚本 
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'

" 弹出列表时选择第1项的快捷键(默认为<TAB>和<Down>)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" 弹出列表时选择前1项的快捷键(默认为<S-TAB>和<UP>)
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" 主动补全, 默认为<C-Space>
let g:ycm_key_invoke_completion = '<C-x>'
" 停止显示补全列表(防止列表影响视野),可以按<C-Space>重新弹出
let g:ycm_key_list_stop_completion = ['<C-y>']

" 停止提示是否载入本地ycm_extra_conf文件
let g:ycm_confirm_extra_conf = 0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
" 开启YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files = 1
" 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion = 2
" 开启输入注释时补全
let g:ycm_complete_in_comments = 1
" 开启输入字符串时补全
let g:ycm_complete_in_strings = 1
" 开启注释和字符串中收集补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" 关闭函数预览
let g:ycm_add_preview_to_completeopt = 0
" 关闭代码诊断
let g:ycm_show_diagnostics_ui = 0
" 设置标识符补全最小字符数
let g:ycm_min_num_identifier_candidate_chars = 2
" 设置以下语言自动弹出语义补全(默认需要输入'.->::'或者按主动补全组合键)
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
" 白名单(以外的文件类型不分析补全)
let g:ycm_filetype_whitelist = { 
			\ "s":1,
			\ "S":1,
			\ "c":1,
			\ "C":1,
			\ "cc":1,
			\ "cxx":1,
			\ "cpp":1,
			\ "py":1,
			\ "go":1,
			\ "java":1, 
			\ "objc":1,
			\ "sh":1,
			\ "zsh":1,
			\ "zimbu":1,
			\ }

" ALE.vim
" -----------------------------------------------------------------------------
"普通模式下警告跳转快捷键
nmap <silent> <Leader>p <Plug>(ale_previous_wrap)
nmap <silent> <Leader>n <Plug>(ale_next_wrap)
"<Leader>x触发/关闭语法检查
nmap <Leader>x :ALEToggle<CR>
"<Leader>y查看错误或警告的详细信息
nmap <Leader>y :ALEDetail<CR>
"始终开启标志列
"let g:ale_sign_column_always = 1
" 错误警告消息格式
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" 文件打开时不进行检查
"let g:ale_lint_on_enter = 0
" 文件修改时不进行检查
let g:ale_lint_on_text_changed = 'never'
" 文件保存时进行检查(默认)
"let g:ale_lint_on_save = 1
" 指定对应语言的检查工具
"let g:ale_linters = {
"            \   'c++': ['clang'],
"            \   'c': ['clang'],
"            \   'python': ['pylint'],
"            \   'go': ['gofmt', 'golint'],
"            \}
" 关闭补全功能
let g:ale_completion_enabled = 0
" 使能airline状态栏扩展
let g:airline#extensions#ale#enabled = 1
" 禁用高亮显示
"let g:ale_set_highlights = 0
" 自定义error和warning标志
"let g:ale_sign_error = '✗'
"let g:ale_sign_warning = '⚡'

" airline.vim
" -----------------------------------------------------------------------------
" 设置主题
let g:airline_theme='bubblegum'
" 这个是安装字体后必须设置此项"
let g:airline_powerline_fonts = 1
" 开启标签栏
let g:airline#extensions#tabline#enabled = 1
" 显示缓冲区编号
let g:airline#extensions#tabline#buffer_nr_show = 1
" tabline中当前buffer两端的分隔字符
"let g:airline#extensions#tabline#left_sep = ' '
" tabline中未激活buffer两端的分隔字符
"let g:airline#extensions#tabline#left_alt_sep = '|'
" 缓冲区切换快捷键
nnoremap <Leader>. :bn<cr>
nnoremap <Leader>, :bp<cr>
" 关闭状态显示空白符号计数"
let g:airline#extensions#whitespace#enabled = 0
" 状态栏显示设置
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''