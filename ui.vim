
" ----------------------------- UI -----------------------------
Plug 'https://github.com/itchyny/lightline.vim.git'
Plug 'https://github.com/altercation/vim-colors-solarized.git'
Plug 'https://github.com/tomasr/molokai.git'

function Userconfig__ui()
" 自己写的功能，ctrl-鼠标滚轮即可切换字体大小
call LoadModule('feature/font')


" ------------------ 窗口 --------------------
if g:isGUI
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guioptions-=m
    set guioptions-=T
    set guioptions-=e
    set guicursor=a:block-blinkon0
    set guitablabel=%M%N\ %t
    set lines=999 columns=999  " GUI启动时全屏。注:在终端下设置此选项会导致启动过慢
endif
set mousemodel=popup "选择一段文本之后,鼠标右键弹出菜单

if g:isGUI
    set cursorline    "高亮当前行
    " set cursorcolumn "高亮当前列
endif


" http://stackoverflow.com/questions/901313/editing-xml-files-with-long-lines-is-really-slow-in-vim-what-can-i-do-to-fix-th
set synmaxcol=220 " 高亮的最大列数，设这么小是因为默认的设置打开长行非常慢


" ------------------ 颜色 --------------------
if !g:isGUI
    set t_Co=256
endif


" ------------------ 状态栏 --------------------
" help relativenumber 打开时可显示每行相对于光标所在行的行号，可以帮助给出一些命令的count
set number      "显示行号
set ruler		"显示标尺
set showcmd		"在右下角显示未完成的命令
" set ambiwidth=double "把unicode中所有不明宽度的字符设置为2个宽度
" set linespace=  "可以设置行间像素

call LoadModule('feature/tabline')
set tabline=%!MyTabLine()

" lightLine
call LoadModule('feature/plugin.lightline')

" -------------------- 皮肤 -----------------------------
" solarized 
let g:solarized_termcolors = 256
" let g:solarized_termtrans = 1 " 设置为1solarized主题会使用透明终端的背景

" molokai 
let g:rehash256 = 1


if g:isGUI
    if 5 < strftime("%H") && strftime("%H") < 17 " 上午五点到下午五点为白天
        colorscheme solarized
    else
        colorscheme molokai
    endif
else
    colorscheme solarized
endif

endfunction
