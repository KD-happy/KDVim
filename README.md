# KDVim

自用的Vim配置包含Windows和Linux版本

# Windows

## 安装教程

1. 下载程序
    首先[点我](https://github.com/vim/vim-win32-installer/releases)到下载页面后，找到 `Assets` 如果下面没有东西，就点击一下，就会出现好多下载链接（个人推荐使用 `x64.zip` 版本）
2. 添加到文件夹中
    个人推荐直接在 `C:\Users\xxxx` 的用户路径下解压
3. 配置环境变量
    将 `C:\Users\xxxx\vim\vim82\` 添加到环境变量中，不会自己百度去
4. 验证配置
    打开cmd后输入 `vim` 只要没提醒 `'vim' 不是内部或外部命令，也不是可运行的程序` 就行了

# Linux

## 安装教程

几行命令解决战斗

```shell
yum install ncurses-devel
wget https://github.com/vim/vim/archive/master.zip
unzip master.zip && cd vim-master/src/
./configure --prefix=/usr/local/vim
make && make install
cd .. && cd .. && rm -rf vim-master
```

# 有些关键字的解释

打开后输入 `:ver` 或 `:version`，能看见一些配置信息

```text
     系统 vimrc 文件: "$VIM\vimrc"
     用户 vimrc 文件: "$HOME\_vimrc"
 第二用户 vimrc 文件: "$HOME\vimfiles\vimrc"
 第三用户 vimrc 文件: "$VIM\_vimrc"
      用户 exrc 文件: "$HOME\_exrc"
  第二用户 exrc 文件: "$VIM\_exrc"
       defaults file: "$VIMRUNTIME\defaults.vim"
```

$VIM、$HOME、$VIMRUNTIME

上方代表的意思就是一些路径，如何知道到底是什么路径呢，执行下面的命令就能看见了

```shell
:echo $VIM
:echo $HOME
:echo $VIMRUNTIME
```

# 插件的安装

插件资源网 [vimawesome](https://vimawesome.com/)

## vim-plug的安装与使用

[vim-plug](https://github.com/junegunn/vim-plug)

他有教程自己去看去

## 注意

中文帮助文档（汉化插件）

请到[vimcdoc](https://github.com/yianwillis/vimcdoc)下载源码压缩包，然安装的时候慢死你

然后解压到相应位置（plugged文件夹下），最后添加插件

好多插件Windows版本不可用