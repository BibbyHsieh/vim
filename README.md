# vimrc

## 移除exuberant-ctags
    sudo apt-get --purge remove exuberant-ctags
## 移除舊版vim及其相關套件
    sudo apt-get --purge remove vim*
## 自動清除無用軟體
    sudo apt-get --purge autoremove
    sudo apt-get autoclean
## 更新軟體來源
    sudo apt-get update
## 安裝checkinstall
    sudo apt-get install checkinstall
## 安裝pyton
    sudo apt-get -f install python-dev
    sudo apt-get -f install python3-dev
## 安裝libncurses5-dev
    sudo apt-get install libncurses5-dev
## 安裝編譯工具集
    sudo apt-get install cmake build-essential
## 安裝自動配置工具
    sudo apt-get install autoconf
## 安裝cscope和global
    sudo apt-get install cscope
    sudo apt-get install global
## 安裝powerline字体
    sudo apt-get install fonts-powerline
## 安裝vim8
    git clone https://github.com/vim/vim.git
    cd vim/
    git pull
    cd src/
    make distclean # if you build Vim before
    ./configure --with-features=huge \
                --enable-pythoninterp=yes \
                --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ \
                --enable-python3interp=yes \
                --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu/ \
                --enable-rubyinterp=yes \
                --enable-luainterp=yes \
                --enable-perlinterp=yes \
                --enable-tclinterp=yes \
                --enable-multibyte \
                --enable-cscope \
                --enable-gui=gtk2 \
                --enable-gdb
    make -j8
    sudo make install
## 將vim8設為默認編輯器
    export PATH=<$PWD/vim>:$PATH
    (Test vim function)
    vim ~/.bashrc
    (Add one line) export PATH=<$PWD/vim>:$PATH
## 安裝universal-ctags
    git clone https://github.com/universal-ctags/ctags.git
    cd ctags
    ./autogen.sh
    ./configure
    make -j8
    sudo make install
## 安裝gnu-global
    wget http://tamacom.com/global/global-6.6.2.tar.gz
    tar xvf global-6.6.2.tar.gz
    cd global-6.6.2
    ./configure
    make -j8
    sudo make install
## 安裝vim-plug
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## 快捷鍵
**F2**： 启动左侧Taglist窗口  
**F3**： 打开右侧NerdTree窗口  
**F4**： 打开mru窗口显示最近打开过的文件，选择文件回车打开  
**F5**： 窗口上方打开LookupFile搜索窗口，输入文件名或者目录名查找文件，Ctrl-N、Ctrl-P选择，回车打开  
**F6**： 打开vimgrep，输入任意字符进行搜索（相当于shell的grep命令）  
**F7**： 在当前目录下生成filename.tags文件，LookupFile使用该文件进行查找，生成过程中vim不允许操作  
**F8**： 在当前目录下生成GTAGS数据库相关文件，gtags-cscope使用该数据库进行代码查找和跳转  
**F9**： 在当前目录下生成tags文件，供ctags使用  
**F10**： 在当前目录下生成cscope数据库相关文件，cscope基于cscope.out进行代码搜索和跳转  
**;**： 进入底行命令模式  
**Ctrl-h**： 从当前窗口切换到左侧窗口  
**Ctrl-l**： 从当前窗口切换到右侧窗口  
**Ctrl-k**： 从当前窗口切换到上侧窗口  
**Ctrl-j**： 从当前窗口切换到下侧窗口  
**Ctrl-x**： 主动补全  
**Ctrl-y**： 关闭补全列表  
**Ctrl-n**： 补全列表向下选择  
**Ctrl-p**： 补全列表向上选择  
**Shift-=**： “+” 增加当前窗口高度  
**Shift--**： “_” 减小当前窗口高度  
**Shift-,**： “<” 减小当前窗口宽度  
**Shift-.**： “>” 增加当前窗口宽度  
**空格lt**： 打开LookupFile按tags搜索文件  
**空格lb**： 打开LookupFile按vim缓冲区搜索文件  
**空格lw**： 打开LookupFile按目录搜索文件  
**空格mm**： man查找当前光标所在函数  
**空格m2**： man 2查找当前光标所在函数（系统调用）  
**空格m3**： man 3查找当前光标所在函数（库函数）  
**空格fs**： 查找并跳转到当前光标所在标识符出现的地方  
**空格fg**： 查找并跳转到当前光标所在标识符的定义处  
**空格fd**： 查找并跳转到被当前光标所在函数调用的函数  
**空格fc**： 查找并跳转到调用当前光标所在函数的地方  
**空格ft**： 查找并跳转到当前光标所在的字符串  
**空格fe**： egrep模式查找并跳转到当前光标所在的字符串  
**空格ff**： 查找并跳转到当前光标所在的文件名  
**空格fi**： 查找并跳转到当前文件所包含的文件  
**空格fa**： 查找并跳转到当前光标所在的标识符被赋值的地方  
**空格ss**： 查找并水平分割窗口跳转到当前光标所在标识符出现的地方  
**空格sg**： 查找并水平分割窗口跳转到当前光标所在标识符的定义处  
**空格sd**： 查找并水平分割窗口跳转到被当前光标所在函数调用的函数  
**空格sc**： 查找并水平分割窗口跳转到调用当前光标所在函数的地方  
**空格st**： 查找并水平分割窗口跳转到当前光标所在的字符串  
**空格se**： egrep模式查找并水平分割窗口跳转到当前光标所在的字符串  
**空格sf**： 查找并水平分割窗口跳转到当前光标所在的文件名  
**空格si**： 查找并水平分割窗口跳转到当前文件所包含的文件  
**空格sa**： 查找并水平分割窗口跳转到当前光标所在的标识符被赋值的地方  
**空格vs**： 查找并垂直分割窗口跳转到当前光标所在标识符出现的地方  
**空格vg**： 查找并垂直分割窗口跳转到当前光标所在标识符的定义处  
**空格vd**： 查找并垂直分割窗口跳转到被当前光标所在函数调用的函数  
**空格vc**： 查找并垂直分割窗口跳转到调用当前光标所在函数的地方  
**空格vt**： 查找并垂直分割窗口跳转到当前光标所在的字符串  
**空格ve**： egrep模式查找并垂直分割窗口跳转到当前光标所在的字符串  
**空格vf**： 查找并垂直分割窗口跳转到当前光标所在的文件名  
**空格vi**： 查找并垂直分割窗口跳转到当前文件所包含的文件  
**空格va**： 查找并垂直分割窗口跳转到当前光标所在的标识符被赋值的地方  
**p**： 在gutentags_plus插件启动gtags-cscope跳转快捷键换出qucikfix窗口是显示光标所在行的预览窗口  
**P**： 在gutentags_plus插件启动gtags-cscope跳转快捷键换出qucikfix窗口是关闭光标所在行的预览窗口  
**空格u**： quickfix窗口预览窗口向上滚动  
**空格d**： quickfix窗口预览窗口向下滚动  
**空格x**： 打开/关闭语法检查  
**空格y**： 显示语法错误或警告详细信息  
**空格p**： 跳转到上一处错误或警告  
**空格n**： 跳转到下一处错误或警告  
**空格.**： 切换到下一个缓冲区（标签栏下一个）  
**空格,**： 切换到下一个缓冲区（标签栏上一个）  