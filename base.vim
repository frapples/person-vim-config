" help quickref 总览常用的命令

let mapleader=" "
let maplocalleader=" "

" breakadd file 9 ~/.vim/config/edit.vim
set autoread " 若文件被vim之外的程序修改过，重新读取
" ---------- 搜索相关 ----------
set incsearch              "搜索时实时匹配
set hlsearch               "如果有上一个搜索模式，高亮它的所有匹配
set ignorecase             "搜索时忽略大小写
set smartcase              "若搜索内容中包含大写字母仍然对大小写敏感
":noh[lsearch] 搜索后总是内容高亮,使用此命令可以使其消失

" 搜索完后，按<Esc>即可取消高亮
" 终端下会有两个问题，第一个问题原因及解决方法：
" http://stackoverflow.com/questions/11940801/mapping-esc-in-vimrc-causes-bizzare-arrow-behaviour/16027716#16027716
" neovim下就没这么多事了，据说是低版本的bug
" 第二个问题是映射esc后alt系列就用不了。
if has('gui_running')
    nnoremap <silent><esc> :noh<CR>
else
    augroup no_highlight
    " autocmd TermResponse * nnoremap <esc> :noh<CR><esc>
    augroup END
endif
noremap <c-l> :noh<CR><c-l>



set wildmenu               "增强命令行补全
set noerrorbells           "关闭错误消息响铃
set mouse=a              " 开启鼠标操作
"set backspace=indent,eol,start " 备注:此设置下在插入模式删除时遇到无法删到上一行的问题
set backspace=2 
set nobackup               "关闭备份
set history=20	           "保存的命令条数

autocmd FileType text setlocal textwidth=78 "对于text类型文件在一行长于78个字符时自动换行

command! ReloadVimrc :exec "source ".$MYVIMRC


" -------------------- 复制粘帖 -------------------- 

" 让剪贴板使用系统剪贴板
if has('unnamedplus')
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif

" Y的本意是和yy一样的没卵用，现在让Y向D看齐了
nmap Y y$

" 使用gp来粘帖最近一次yank的文字
nmap gp "0p
nmap gP "0P


"----------编码与语言---------
set encoding=utf-8 "vim内部使用的编码
set fileencodings=utf-8,gbk,big5
let $LANG="zh_CN.UTF-8"
set helplang=cn


" ----------------- Base program ------------------------
syntax on                  "打开语法高亮
filetype plugin indent on  "打开文件类型检测,特定文件插件载入,缩进文件载入


"自动缩进
set tabstop=4 "tab宽度
set shiftwidth=4
set expandtab "输入Tab时用空格代替
set autoindent "开启自动缩进 当增加新行时使得缩进量与上一行一致

call LoadModule('base-keybind')



" ============== 自定义快捷键 ===================
"
" ------------- 命令模式 ---------------------
" 至行首
cnoremap <C-A>		<Home>
" 至行尾
cnoremap <C-E>		<End>
" 前进一个字符
cnoremap <C-F>		<Right>
" 后退一个字符
cnoremap <C-B>		<Left>
" 取回以前 (较旧的) 命令行
cnoremap <C-P>		<Up>
" 取回较新的命令行
cnoremap <C-N>		<Down>
" 删除光标所在的字符
" cnoremap <C-D>		<Del>
" 后退一个单词
cnoremap <A-b>	<S-Left>
" 前进一个单词
cnoremap <A-f>	<S-Right>

" ------------ map -------------------
map <leader>wh <c-w>h
map <leader>wj <c-w>j
map <leader>wk <c-w>k
map <leader>wl <c-w>l
map <leader>wo <c-w>o
map <leader>ws <c-w>s
map <leader>wv <c-w>v
map <leader>wc <c-w>c
" ------------- 命令模式 ---------------------
" 至行首
cnoremap <C-A>		<Home>
" 至行尾
cnoremap <C-E>		<End>
" 前进一个字符
cnoremap <C-F>		<Right>
" 后退一个字符
cnoremap <C-B>		<Left>
" 取回以前 (较旧的) 命令行
cnoremap <C-P>		<Up>
" 取回较新的命令行
cnoremap <C-N>		<Down>
" 删除光标所在的字符
" cnoremap <C-D>		<Del>
" 后退一个单词
cnoremap <A-b>	<S-Left>
" 前进一个单词
cnoremap <A-f>	<S-Right>

" ------------ map -------------------
map <leader>wh <c-w>h
map <leader>wj <c-w>j
map <leader>wk <c-w>k
map <leader>wl <c-w>l
map <leader>wo <c-w>o
map <leader>ws <c-w>s
map <leader>wv <c-w>v
map <leader>wc <c-w>c



" ------------- 命令模式 ---------------------
" 至行首
cnoremap <C-A>		<Home>
" 至行尾
cnoremap <C-E>		<End>
" 前进一个字符
cnoremap <C-F>		<Right>
" 后退一个字符
cnoremap <C-B>		<Left>
" 取回以前 (较旧的) 命令行
cnoremap <C-P>		<Up>
" 取回较新的命令行
cnoremap <C-N>		<Down>
" 删除光标所在的字符
" cnoremap <C-D>		<Del>
" 后退一个单词
cnoremap <A-b>	<S-Left>
" 前进一个单词
cnoremap <A-f>	<S-Right>

" ------------ map -------------------
map <leader>wh <c-w>h
map <leader>wj <c-w>j
map <leader>wk <c-w>k
map <leader>wl <c-w>l
map <leader>wo <c-w>o
map <leader>ws <c-w>s
map <leader>wv <c-w>v
map <leader>wc <c-w>c
