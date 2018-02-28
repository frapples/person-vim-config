Plug 'https://github.com/vim-scripts/fcitx.vim.git'

" 一些功能需要其它程序的支持，将这些程序加入到环境变量
if g:isWindows
    let g:vimRootDir = $HOME."\\..\\..\\.."
    call AddToPath(g:vimRootDir."\\TDM-GCC-32\\bin\\")
    call AddToPath(g:vimRootDir."\\ctags\\")

endif

if g:isGUI
    " 修正gvim中菜单无文字问题，原因是环境变量中zh_CN.UTF-8写法不标准,用locale查看
    set langmenu=zh_CN.UTF-8
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
endif

" ===========================    终端按键兼容设置 ========================== 
" help set-termcap
" 这里 ^[ 是真正的 <Esc>，插入模式下用 CTRL-V <Esc> 来输入
" set <A-0>=0
function! s:FixConsoleKey()
    for c in range(char2nr('a'), char2nr('z')) + range(char2nr('A'), char2nr('Z')) + range(char2nr("0"), char2nr("9"))
        let c = nr2char(c)
        exec printf("set <A-%s>=%s%s", c, "\<Esc>", c)
    endfor

    set <F1>=OP
    set <F2>=OQ
    set <F3>=OR
    set <F4>=OS
    set <Home>=OH
    " set <S-Tab>=[Z " 注：貌似在补全弹出菜单中作为反向遍历键的时候没有作用

endfunction


if !has("gui_running") && !has('nvim')
    call s:FixConsoleKey()
    set ttimeoutlen=80
    " 设置下面的选项可避免tmux中使用vim的一个背景色的问题
    "http://sunaku.github.io/vim-256color-bce.html
    set t_ut=
endif
