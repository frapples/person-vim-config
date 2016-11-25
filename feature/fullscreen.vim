"将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数

function! ToggleFullScreen_unix()
    if ShellCommandExists("wmctrl")
        call system(printf("wmctrl -ir %d -b toggle,fullscreen", v:windowid))
    else
        call EchoWarning("没有找到wmctrl命令,请确认安装此软件后再使用全屏功能!")
    endif
endfunction

function! ToggleFullScreen_win()
    let gvimfullscreenDll = globpath(&runtimepath, "gvimfullscreen.dll")
    if !filereadable(gvimfullscreenDll)
        call EchoWarning("所需的dll文件不存在,请检查!")
        return
    endif
    if !has('libcall')
        call EchoWarning("需要vim编译时支持libcall特性,当前使用vim不支持!")
        return
    endif
    call libcallnr(gvimfullscreenDll, "ToggleFullScreen", 0)
endfunction

function! ToggleFullScreen()
    if g:isWindows
        call ToggleFullScreen_win()
    else
        call ToggleFullScreen_unix()
    endif
endfunction


""""""""""""""""""""" 按键，命令 """"""""""""""""""""

map <silent> <F11> :call ToggleFullScreen()<CR>
augroup vimrc_fullscreen
"autocmd VimEnter * call ToggleFullscreen() " 启动 vim 时自动全屏
augroup END
