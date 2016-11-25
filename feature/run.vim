"单个文件编译
"makeprg 是vim内置的编译命令，可以通过更改来实现编译对应类型文件。具体可参考vim官方说明文件。
"最后的copen是打开quickfix，在错误描述上回车，可以直接跳转到错误行。
"
"help function-list
"
"
let s:compile_rule = {
            \ 'c': 'gcc -g -Wall -std=c99 {fullpath} -o {dir}/{shortname}',
            \ 'cpp': 'g++ -g -Wall -std=c++11 {fullpath} -o {dir}/{shortname}'
            \}

let s:run_rule = {
            \ 'c': '{dir}/{shortname}',
            \ 'cpp': '{dir}/{shortname}',
            \ 'python': 'python2 {fullpath}',
            \ 'py2': 'python2 {fullpath}',
            \ 'py3': 'python3 {fullpath}',
            \ 'php': 'php {fullpath}'
            \}


function! Compile()
    exec "wa"
    if !has_key(s:compile_rule, &filetype)
        echohl WarningMsg | echo "不知道如何编译的文件类型:" . &filetype |  echohl None
        return
    endif
    call ExecuteByQuickfix(ExpandFilePathInfo(s:compile_rule[&filetype]))

    " let option = inputlist(["选择编译类型:", "1.普通", "2.GTK"])
    "`pkg-config --cflags --libs gtk+-3.0`"
endfunction



function! RunFile()
    if !has_key(s:run_rule, &filetype)
        echohl WarningMsg | echo "不支持的文件类型。。。" | echohl None
        return
    endif

        call OpenShellCommandWin(ExpandFilePathInfo(s:run_rule[&filetype]))
endfunction

function! ExecuteByQuickfix(cmd)
    let original_makeprg = &makeprg
    let &makeprg = a:cmd
    silent make
    let &makeprg = original_makeprg
    if getqflist() == []
        call EchoWarning("编译成功！")
    else
        clist
    endif
endfunction


function! ExpandFilePathInfo(str)
    let str = substitute(a:str, "{fullpath}", expand("%:p"), 'g')
    let str = substitute(str, "{dir}", expand("%:p:h"), 'g')
    let str = substitute(str, "{name}", expand("%:t"), 'g')
    let str = substitute(str, "{ext}", expand("%:e"), 'g')
    let str = substitute(str, "{shortname}", expand("%:t:r"), 'g')
    return str
endfunction

""""""""""""""""""""" 按键，命令 """"""""""""""""""""
map <F7> :call Compile()<CR>
map <F5> :call RunFile()<CR>
