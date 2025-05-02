# vimrc

## 以下需要請IT協助安裝 或 自己有root權限
## 更新系統：
sudo apt update && sudo apt upgrade -y
## 安裝 Vim： 確保 Vim 支援 Python 3（YouCompleteMe 要求）。安裝完整版 Vim：
sudo apt install vim -y
## 確認版本 >= 7.4.1578 且包含 +python3。
## 若無 Python 3 支援，安裝 vim-nox 或 vim-gtk3：
sudo apt install vim-nox -y
## 安裝 tmux：
sudo apt install tmux -y
## 安裝 tmuxinator： tmuxinator 依賴 Ruby，因此先安裝 Ruby 和 gem：
sudo apt install ruby ruby-dev -y
sudo gem install tmuxinator
## 創建 tmuxinator 配置目錄：
mkdir -p ~/.tmuxinator
## 安裝 git：
sudo apt install git -y
## 配置 git（可選）：
git config --global user.name "Bibby Hsieh"
git config --global user.email "bibby.hsieh771@gmail.com"
## 安裝 C/C++ 開發工具： 為 driver 開發和 YouCompleteMe 安裝必要工具：
sudo apt install build-essential cmake python3-dev clang clangd linux-headers-$(uname -r) -y
## 安裝 vim-plug：
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## YouCompleteMe相關：
## 編譯YCM
cd ~/.vim/plug/YouCompleteMe
python3 install.py --clangd-completer

cp ~/.vim/plug/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py


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
**空格x**： 打開/關閉語法檢查  
**空格y**： 顯示語法錯誤或警告詳細資訊  
**空格m**： 顏色標記特定文字  
**空格n**： 解除顏色標記特定文字  
**空格.**： 切換到下一個緩衝區（標籤欄下一個）  
**空格,**： 切換到下一個緩衝區（標籤欄上一個）  

