" 一些函数方法
source $HOME/.vim/vimrcs/function.vim

" 插件安装
call plug#begin('$HOME/.vim/plugged')
  Plug 'scrooloose/nerdtree'            " 目录浏览
  Plug 'tweekmonster/braceless.vim'     " Python插件
  Plug 'iamcco/markdown-preview.nvim'
  Plug 'dense-analysis/ale'             " 语法检查插件
  Plug 'mbbill/undotree'
  Plug 'yianwillis/vimcdoc'             " 中文帮助文档
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'
call plug#end()

" 只有一行时删除
set backspace=indent,eol,start
" 保存历史记录行数
set history=200        " keep 200 lines of command line history
" 显示当前位置 右下角
set ruler               " show the cursor position all the time
" 显示指令
set showcmd             " display incomplete commands
" 指令补全
set wildmenu            " display completion matches in a status line
" 估计是按键的延迟
set ttimeout            " time out for key codes
set ttimeoutlen=100     " wait up to 100ms after Esc for special key
" 帮助文档为中文
set helplang=cn

" https://files.cnblogs.com/ma6174/vimrc.zip
" 代码高亮
syntax on
set mousehide
" 显示行数
set number
set relativenumber
" Tab键显示的空格数
set softtabstop=4
" 将Tab设置为空格
set expandtab
" 编码格式
set encoding=utf-8
" 匹配高亮 对框号
set showmode
" 关括号匹配高亮
let loaded_matchparen = 1
" 光标当前行高亮
set cursorline
" 将多余的空格和Tab显示出来
set list
set listchars=tab:>>,trail:.
" 换行
" set wrap
" 设置必能看见5行
set scrolloff=5
" 不显示救助信息
set shortmess=atl
" 所有模式下允许使用鼠标
" set mouse=a


" 搜索高亮
set hlsearch
" 刷新去除高亮
exec "nohlsearch"
" 边搜边高亮
set incsearch
" 忽略大小写
set ignorecase
" 智能大小写
set smartcase
" 搜索时上下绑定自动中心行
nmap n nzz
nmap N Nzz


"退出插入模式
imap jj <Esc>
" 空格键在一般模式输出 :
nmap <Space> :
" 退出搜索高亮 Ctrl+n
map <C-N> :nohlsearch<CR>
" 绑定快速翻页
nmap J 5j
nmap K 5k
" 刷新配置文件
nmap <F5> :source $MYVIMRC<CR>


" 分屏配置
" 分别为右分屏、左分屏、上分屏和下分屏
nmap sl :set splitright<CR>:vsplit<CR>
nmap sh :set nosplitright<CR>:vsplit<CR>
nmap sk :set nosplitbelow<CR>:split<CR>
nmap sj :set splitbelow<CR>:split<CR>
" 切换分屏
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
" 切换屏幕的布局
nmap <A-H> <C-W>H
nmap <A-J> <C-W>J
nmap <A-K> <C-W>K
nmap <A-L> <C-W>L
" 分屏大小调整
nmap <Down> :res +5<CR>
nmap <Up> :res -5<CR>
nmap <Left> :vertical resize-5<CR>
nmap <Right> :vertical resize+5<CR>

" 标签页设置
" 标签之间的切换 创建、左右、前后
nmap te :tabe<CR>
nmap th :-tabnext<CR>
nmap tl :+tabnext<CR>
nmap tj :tabn<CR>
nmap tk :tabp<CR>


" 配色
colorscheme darkblue


" 插件配置区
" Python braceless
autocmd FileType python BracelessEnable +indent +fold +highlight

" NERDTree
nmap tt :NERDTreeToggle<CR>
imap tt <C-O>:NERDTreeToggle<CR>