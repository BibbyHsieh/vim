# vimrc

## 建立HOME底下的local資料夾
    mkdir ~/.local

## 以下需要請IT協助安裝 或 自己有root權限
###### 移除exuberant-ctags
    sudo apt-get --purge remove exuberant-ctags
###### 移除舊版vim及其相關套件
    sudo apt-get --purge remove vim*
###### 自動清除無用軟體
    sudo apt-get --purge autoremove
    sudo apt-get autoclean
###### 更新軟體來源
    sudo apt-get update
###### 安裝checkinstall
    sudo apt-get install checkinstall
###### 安裝pyton
    sudo apt-get -f install python3-dev
###### 安裝libncurses5-dev
    sudo apt-get install libncurses5-dev
###### 安裝編譯工具集
    sudo apt-get install cmake build-essential
###### 安裝自動配置工具
    sudo apt-get install autoconf
###### 安裝cscope和global
    sudo apt-get install cscope
    sudo apt-get install global
###### 安裝powerline字体
    sudo apt-get install fonts-powerline

## 安裝Python3.8
    Python 官網下載一包 python3.8 source code
    解壓縮放進HOME
    ./configure --prefix=$HOME/.local
    make -j8 && make install

## 增加HOME底下.local/bin進PATH 確保使用到local bin
    export PATH=~/.local/bin:$PATH

## 安裝vim8
    git clone https://github.com/vim/vim.git
    cd vim/
    git pull
    cd src/
    make distclean #if you build Vim before
    ./configure --prefix=$HOME/.local \
                --with-features=huge \
                --enable-python3interp=yes \
                --with-python3-command=python3.8 \
                --enable-rubyinterp=yes \
                --enable-luainterp=yes \
                --enable-perlinterp=yes \
                --enable-tclinterp=yes \
                --enable-multibyte \
                --enable-cscope \
                --enable-gtk3-check
    make -j8 && make install

## 安裝universal-ctags
    git clone https://github.com/universal-ctags/ctags.git
    cd ctags
    ./autogen.sh
    ./configure --prefix=$HOME/.local
    make -j8
    make install

## 安裝gnu-global
    wget http://tamacom.com/global/global-6.6.2.tar.gz
    tar xvf global-6.6.2.tar.gz
    cd global-6.6.2
    ./configure --prefix=$HOME/.local
    make -j8
    make install

## 安裝vim-plug
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## 快捷鍵
**F2**： 啟動左側Taglist視窗
**F3**： 打開右側NerdTree視窗
**F4**： 打開mru視窗顯示最近打開過的檔案，選擇檔案enter打開
**F5**： 視窗上方打開LookupFileb搜尋視窗，輸入檔案名稱或者目錄名稱搜尋，Ctrl-N、Ctrl-P選擇，enter打開
**F6**： 打開vimgrep，輸入任意字元進行搜尋（相當於shell的grep命令）
**F7**： 在目前的目錄下產生filename.tags檔，LookupFile使用該檔進行搜尋，產生過程中vim不允許操作
**F8**： 在目前的目錄下產生GTAGS資料庫相關檔，gtags-cscope使用該資料庫進行代碼搜尋和跳轉
**F9**： 在目前的目錄下產生tags檔，供ctags使用
**F10**： 在目前的目錄下產生cscope資料庫相關檔案，cscope基於cscope.out進行代碼搜尋和跳轉
**;**： 進入命令模式
**Ctrl-h**： 從當前視窗切換到左側視窗
**Ctrl-l**： 從當前視窗切換到右側視窗
**Ctrl-k**： 從當前視窗切換到上側視窗
**Ctrl-j**： 從當前視窗切換到下側口
**Ctrl-z**： 主動補全
**Ctrl-/**： 關閉補全列表
**Shift-=**： “+” 增加當前視窗高度
**Shift--**： “_” 減小當前窗口高度
**Shift-,**： “<” 減小當前窗口寬度
**Shift-.**： “>” 增加當前視窗寬度
**空格lt**： 打開LookupFile按tags搜索文件
**空格lb**： 打開LookupFile按vim緩衝區搜索文件
**空格lw**： 打開LookupFile按目錄搜索檔
**空格mm**： man查找當前游標所在函數
**空格m2**： man 2查找當前游標所在函數（系統調用）
**空格m3**： man 3查找當前游標所在函數（庫函數）
**空格fs**： 查找並跳轉到當前游標所在識別字出現的地方
**空格fg**： 查找並跳轉到當前游標所在識別字的定義處
**空格fd**： 查找並跳轉到被當前游標所在函式呼叫的函數
**空格fc**： 查找並跳轉到調用當前游標所在函數的地方
**空格ft**： 查找並跳轉到當前游標所在的字串
**空格fe**： egrep模式查找並跳轉到當前游標所在的字串
**空格ff**： 查找並跳轉到當前游標所在的檔案名
**空格fi**： 查找並跳轉到當前檔所包含的檔
**空格fa**： 查找並跳轉到當前游標所在的識別字被賦值的地方
**p**： 在gutentags_plus外掛程式啟動gtags-cscope跳轉快速鍵換出qucikfix視窗是顯示游標所在行的預覽視窗
**P**： 在gutentags_plus外掛程式啟動gtags-cscope跳轉快速鍵換出qucikfix視窗是關閉游標所在行的預覽窗口
**空格u**： quickfix視窗預覽視窗向上滾動
**空格d**： quickfix視窗預覽視窗向下滾動
**空格x**： 打開/關閉語法檢查
**空格y**： 顯示語法錯誤或警告詳細資訊
**空格m**： 顏色標記特定文字
**空格n**： 解除顏色標記特定文字
**空格.**： 切換到下一個緩衝區（標籤欄下一個）
**空格,**： 切換到下一個緩衝區（標籤欄上一個）

