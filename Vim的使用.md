# Vim的配置和使用

1. 首先看Vim的版本和配置文件的存放地点
    ```bat
    " 显示Vim的配置信息 相关文件存放位置
    :version

    " 不知道具体的文件位置 配置文件相对位置最好使用下面的东西
    echo $VIM
    echo $HOME
    echo $VIMRUNTIME
    echo $MYVIMRC       " 配置文件

    " Windows
    vimfiles            " 该文件夹是存放公共插件的  在 $VIM 路径下的
    vimfiles            " 该文件夹是存放私有插件的  在 $HOME 路径下的

    " Liunx
    vimfiles            " 该文件夹是存放公共插件的  在 $VIM 路径下的
    .vim                " 该文件夹是存放私有插件的  在 $HOME 路径下的
    " .vim 的文件夹里面可以添加插件什么配置

    " 具体的配置文件按照 `:version` 说明就可以了
    ```
2. 安装 `vim-plug`，这是管理插件的插件，用来安装和卸载插件的东西，直接执行这条指令就可以安装插件了
    ```shell
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```
3. Liunx用户在 `/root` 路径下，执行 `vim .vimrc`，也可以通过执行 `vim $HOME/.vimrc`
    <details>
    <summary>基本配置</summary>

    ```bat
    " 插件安装
    call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree'
    call plug#end()


    " 插件配置
    " NERDTree
    nmap tt :NERDTreeToggle<CR>


    " 我的设置
    " 显示当前位置
    set ruler               " show the cursor position all the time
    " 显示指令
    set showcmd             " display incomplete commands
    " 指令补全
    set wildmenu            " display completion matches in a status line

    " 代码高亮
    syntax on
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
    set wrap
    " 设置必能看见5行
    set scrolloff=5
    " 设置颜色配色
    colorscheme desert

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
    nmap <space> :
    " 退出搜索高亮 Ctrl+n
    map <c-n> :nohlsearch<CR>
    " 绑定快速翻页
    nmap J 5j
    nmap K 5k
    " 刷新当前文件
    " nmap <F5> :source $MYVIMRC<CR>

    " 分屏配置
    " 分别为右分屏、左分屏、上分屏和下分屏
    nmap sl :set splitright<CR>:vsplit<CR>
    nmap sh :set nosplitright<CR>:vsplit<CR>
    nmap sk :set nosplitbelow<CR>:split<CR>
    nmap sj :set splitbelow<CR>:split<CR>
    " 切换分屏
    nmap <c-h> <c-w>h
    nmap <c-j> <c-w>j
    nmap <c-k> <c-w>k
    nmap <c-l> <c-w>l
    " 分屏大小调整
    nmap <up> :res +5<CR>
    nmap <down> :res -5<CR>
    nmap <left> :vertical resize-5<CR>
    nmap <right> :vertical resize+5<CR>

    " 标签页设置
    nmap te :tabe<CR>
    nmap th :-tabnext<CR>
    nmap tl :+tabnext<CR>
    nmap tj :tabn<CR>
    nmap tk :tabp<CR>


    " 一键执行代码
    map <F12> :call CompoleRunGcc()<CR>
    fun! CompoleRunGcc()
        exec "w"
        if &filetype == 'c'
            exec '!g++ % -o %<'
            exec '!./%<'
        elseif &filetype == 'cpp'
            exec '!g++ % -o %<'
            exec '!./%<'
        elseif &filetype == 'python'
            exec '!python %'
        elseif &filetype == 'sh'
            :!time bash %
        endif
    endfunc

    " 自动补全框号
    :inoremap ( ()<ESC>i
    :inoremap ) <c-r>=ClosePair(')')<CR>
    :inoremap { {<CR>}<ESC>O
    :inoremap } <c-r>=ClosePair('}')<CR>
    :inoremap [ []<ESC>i
    :inoremap ] <c-r>=ClosePair(']')<CR>
    :inoremap " ""<ESC>i
    :inoremap ' ''<ESC>i
    function! ClosePair(char)
        if getline('.')[col('.') - 1] == a:char
            return "\<Right>"
        else
            return a:char
        endif
    endfunction

    " 红竖线
    nmap <F2> :call SetColorColumn()<CR>:echo <CR>
    function! SetColorColumn()
        let col = virtcol(".")
        let ccs = split(&cc,',')
        if count(ccs, string(col)) <= 0
            let op = "+"
        else
            let op = "-"
        endif
        exec "set cc".op."=".col
    endfunction
    ```
    </details>
4. 安装中文的帮助文档
    下载[文件](http://nchc.dl.sourceforge.net/sourceforge/vimcdoc/vimcdoc-1.8.0.tar.gz)
    然后解压到doc文件夹中，然后在配置文件中添加 `set helplang=cn`
    方法二
    `Plug 'yianwillis/vimcdoc'`

# Vim有四种模式

1. 普通模式 --NORMAL--
2. 插入模式 --INSERT--
3. 可视模式 --VISUAL--
4. 命令模式 :

# 模式切换

## 普通模式to插入模式

| 按键 | 功能 |
| --- | --- |
| i | 在光标前插入 |
| I | 在行首掺入 |
| a | 在光标后插入 |
| A | 在行尾插入 |
| o | 在下一行插入（另起一行） |
| O | 在上一行插入（另起一行） |
| zz | 改行显示在中心位置 |

## 插入模式to普通模式

ESC: 退出插入模式

Ctrl+[: 退出插入模式

jj/CapsLock: 这是VsCode中的绑定后退出插入模式

## 普通模式与可视模式相互转换

普通to可视: v

可视to普通: v/Esc

## 普通模式与命令模式相互转换

普通to命令: :

命令to普通: Esc

# 光标移动

**普通模式**

| 按键 | 功能 | 备注 |
| --- | --- | --- |
| x | 删除光标当下的字母 |  |
| h | 左移 |  |
| j | 右移 |  |
| k | 上移 |  |
| l | 右移 |  |
| w | 跳到一个单词开头 | 连续的中文算一个单词 |
| b | 跳到本单词或上一个单词开头 |  |
| e | 跳到本单词或下一个单词结尾 |  |
| ge | 跳到上一个单词结尾 |  |
| 0 | 跳到行首 |  |
| ^ | 跳到从行首开始第一个非空字符 |  |
| $ | 跳到行尾 |  |
| gg | 跳到第一行 |  |
| G | 跳到最后一行 |  |
| f{char} | 光标跳到下个{char}所在位置 | 只对本行有用 |
| F{char} | 方向移动到上一个{char}所在位置 | 只对本行有用 |
| t{char} | 光标跳到下一个{char}的前一个字符的位置 | 只对本行有用 |
| T{char} | 光标反向移动到上一个{char}的后一个字符的位置 | 只对本行有用 |
| ; | 重复上次的字符查找操作 | 只对本行有用 |
| , | 反向查找上次的查找命令 | 只对本行有用 |

# 动作 motion

**普通模式**

i(inner) 和 a(around) 的区别

| 按键 | i | a | 按键 |
| --- | --- | --- | --- |
| i" | "`foo`" | `"foo"` | a" |
| iw | `foo` | ` foo` | aw |
| i( | (`foo`) | `(foo)` | a( |

```
iw / aw：单词
i< / a<
i[ / a[
i( / a( 或 ib / ab
i{ / a{ 或 iB / aB
i" / a"
i' / a'
i` / a`
it / at：targe 标签，这个在Html中使用有奇效
is / as：句子
ip / ap：段落
```

# 操作符 operator

**普通模式**

| 按键 | 功能 | 备注 |
| --- | --- | --- |
| d(delete) | 删除 |  |
| c(change) | 修改（删除并进入插入模式） | 会删除这一行 |
| y(yank) | 复制 |  |
| x | 裁剪 | * |
| r | 替换一个字母 | * |
| R | 替换多个字符串 | * |
| v(visual) | 选中并进入 VISUAL 模式 |  |
| V | 选中当前行，上下可以继续选中 |  |
| e(exit) | 编辑文件 | 只需要给路径就可编辑 |
| Ctrl+V | 可视块模式 |  |
| p | 粘贴 |  |
| u | 撤销 |  |
| H | 跳转至可视范围的开头 |  |
| L | 跳转至可视范围的结尾 |  |

```
ciw: 删除单词并进入写入模式
diw: 删除光标中的单词
yiw: 复制这个单词

{n}dd: {n}表示数字，删除{n}行，注意从光标这一行开始
{n}yy: 复制{n}行
{n}cc: 修改{n}行
{n}j: 向下滑动{n}行
{n}k: 向上滑动{n}行

df{char}: 当前光标一直删到{char}，包含{char}
yf{char}: 复制到{char}
cf{char}: 一直修改到{char}，也会删到{char}

d^: 删除到开头，从光标前面开始删除
d$: 删除到结尾
d%: 感觉就是对称删除

dh: 删除当前光标左侧的一个字母

die: 删除整个文章
yie: 复制整个文章
cie: 重写(修改)整个文章

dgg: 删除到开头，光标这个行也会删除
dG: 删除到结尾，光标这个行也会删除

viw: 先选中一个单词（一段连续的中文），当在选中的一行时p可以替换选中的
```

# 切换大小写

| 按键 | 功能 |
| --- | --- |
| ~ | 将光标下的字母改变大小写 |
| 3~ | 将光标位置开始的3个字母改变其大小写 |
| g~~ | 改变当行字母的大小写 |
| gUU | 将当行的字母改为大写 |
| guu | 将当行的字母改为小写 |
| gUaw(gUiw) | 将光标下的单词改为大写 |
| guaw(guiw) | 将光标下的单词改为小写 |

**其他组合**

```
gUf{char}
gU4h
gUgg
gUG
viw 选中一个单词 ~ 切换大小写
```

# 分屏操作

```
" 分别为右分屏、左分屏、上分屏和下分屏 s[h|j|k|l]
nmap sl :set splitright<CR>:vsplit<CR>
nmap sh :set nosplitright<CR>:vsplit<CR>
nmap sk :set nosplitbelow<CR>:split<CR>
nmap sj :set splitbelow<CR>:split<CR>
```

## 切换分屏

```
Ctrl+w+[w|h|j|k|l]

w: 顺序切换
h: 左边的分屏
j: 下面的分屏
k: 上面的分屏
l: 右边的分屏

" 配置的切换分屏快捷键 Ctrl+[h|j|k|l]
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
```

## 更改分屏大小

```
Ctrl+w+<数字>+[<|>]

数字: 增加减小的数值
<: 缩小
>: 放大

" 上下左右控制窗体的大小 记忆方法: 上上边增加 下下边增加 右右边增加 左左边增加
nmap <A-k> :res +5<CR>
nmap <A-j> :res -5<CR>
nmap <A-h> :vertical resize-5<CR>
nmap <A-l> :vertical resize+5<CR
```

## 修改分屏的相对位置

```
" 分屏相对位置
Ctrl+w+H    " 当前分屏去左边
Ctrl+w+J    " 当前分屏去下面
Ctrl+w+K    " 当前分屏去上面
Ctrl+w+L    " 当前分屏去右边

nmap <A-H> <C-W>H
nmap <A-J> <C-W>J
nmap <A-K> <C-W>K
nmap <A-L> <C-W>L
```

# 标签页

```
tabe        打开新标签

+tabnext    右边
-tabnext    左边
tabp        前一个
tabn        后一个

" 配置
nmap te :tabe<CR>
nmap th :-tabnext<CR>
nmap tl :+tabnext<CR>
nmap tj :tabn<CR>
nmap tk :tabp<CR>
```

## 切换标签页

gt: goto table

gT: 往前切换标签

{n}gt: 跳转到第{n}个标签 

**说明**

标签页可以包含多个分屏

# 搜索操作

使用 `/` 来进行搜索

/set 就会搜索set

回车之后，可以使用 `n` 和 `N` 来进行 下一个 和 上一个

```
" 搜索时上下绑定自动中心行
nmap n nzz
nmap N Nzz

" 退出搜索高亮 Ctrl+n
map <C-N> :nohlsearch<CR>
```

# 小技巧

## 查看函数

gd: goto definition

gh 查看函数的签名

## 可视块的进阶使用

Ctrl+v ;进入可视块模式，这就可以选中上下行的好东西

i ; 进入插入模式，然后在里面修改的东西在下面的光标也会做相应的修改，但是不显示出来，这时候只需要Esc就可以显示出来了

##  光标的前进后退

Ctrl+i: 前进

Ctrl+o: 后退

gf: 打开文件

光标的移动是可以跳转文件的

## 检查单词和提示单词

:set spell   : 提示单词错误，中文也会被认为是单词

z=           : 提供单词列表

## 查看当前文件的路径

```bat
:f
:e
Ctrl+g
```

# 命令模式

| 按键 | 功能 |
| --- | --- |
| :w | 保存 |
| :wq | 保存并退出 |
| :q | 退出 |
| :q! | 不保存强制退出 |
| :e xxx | 打开新的文件 |
| : !xxx | 执行终端指令 |
| :r !type xxx.txt | 将xxx.txt文件里的内容写入当前鼠标下 |

# 其他操作

| 按键 | 功能 |
| --- | --- |
| Ctrl+u | 向上翻页 |
| Ctrl+d | 向下翻页 |
| dj | 删除当前行和下一行 | 
| Ctrl+a | 光标下的数字+1 |
| Ctrl+x | 光标下的数字-1 |
| <<  >> | 缩进或前进 |

文件ToHmtl  :%TOhtml

# Vim自带的快捷键

## 折叠与展开

```bat
zc        " 折叠
zC        " 对所在范围内所有嵌套的折叠点进行折叠
zo        " 展开折叠
zO        " 对所在范围内所有嵌套的折叠点展开
[z        " 到当前打开的折叠的开始处。
]z        " 到当前打开的折叠的末尾处。
zj        " 向下移动到达下一个折叠的开始处。关闭的折叠也被计入。
zk        " 向上移动到前一折叠的结束处。关闭的折叠也被计入。
zR        " 打开全部折叠
zM        " 关闭所有折叠
zd        " 删除光标所在的折叠
zE        " 删除所有折叠
```

# 常用插件的使用介绍

##  nerdtree

[地址](https://github.com/preservim/nerdtree)

设置快捷打开菜单和关闭菜单

```bat
nmap tt :NERDTreeToggle<CR>
```

```bat
h/j/k/l " 左/下/上/右
o       " 打开文件、打开/关闭文件夹
go      " 预览文件，在刚刚有光标的分屏中打开
i       " 拆分的打开文件
gi      " 拆分预览文件，创建一个分屏来预览
t       " 新建一个标签，然后打开该文件
T       " 新建一个标签，然后打开该文件，光标不移动
x       " 关闭到父节点
e       " 预览目录
p       " 切换到父节点
P       " 切换到根节点
u/U     " 将根节点切换到上面的根节点
C       " 将改目录的父节点切换成根节点
CD      " 将改目录的父节点切换成根节点
cd      " 查看当前路径
I       " 切换隐藏文件是否可见
F       " 切换只见文件夹/都可见
q       " 退出nerdtree
A       " 最大化/最小化切换
```