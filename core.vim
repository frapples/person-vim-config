
" ========================= base var ========================
let g:isGUI          = has("gui_running")
let g:isWindows      = has("win32") || has("win95") || has("win64") || has("win16")
let g:vim_config_dir = g:isWindows ? ($HOME.'/vimfiles') : ($HOME.'/.vim')


" 我发现在函数内部expand("<sfile>")的值会变成函数名字。。。
let s:config_dir = expand("<sfile>:p:h")

" 将路径path加入到$PATH中。未修改系统PATH，只是在vim中调用的程序能使用到修改过的
function! AddToPath(path)
    let $PATH = a:path . ";" . $PATH
endfunction

" ========================= tool functions ====================
" 输出一条警告信息
function! EchoWarning(str)
        echohl WarningMsg | echo a:str | echohl None
endfunction


" 某shell命令是否存在
function! ShellCommandExists(command)
    "备注:shell里面可以用;分割多条命令,$?储存最近一次错误代码
    call system("command -v ".a:command) " 也可以用which和type命令
    return !v:shell_error
endfunction

function! OpenShellCommandWin(command_str)
    if g:isWindows
        exec '!' . a:command_str
        call feedkeys("\<CR>")
    else
        let command = 'gnome-terminal -x bash -c ' . shellescape(a:command_str . " ; echo -------------- ; read name")
        call system(command)
    endif
endfunction


" ===================== modules load functions ===============
" 加载配置文件某模块。返回是否成功加载。未找到模块时输出警告信息
"
let s:modules = []
function! LoadModuleStart()
    call plug#begin(g:vim_config_dir . '/bundle')
endfunction

function! s:moduleNameToPath(name)
    return s:config_dir . "/" . a:name . '.vim'
endfunction

function! LoadModuleEnd()
    call plug#end()

    for name in s:modules
        let func_name = 'Userconfig__' . name
        if exists('*' . func_name)
            call {func_name}()
	endif
    endfor

    unlet s:modules
endfunction

function! LoadModule(name)
    if !filereadable(s:moduleNameToPath(a:name))
        call EchoWarning("没有找到该模块:" . a:name)
        return 0 
    endif

    call add(s:modules, a:name)
    exec 'source ' . s:moduleNameToPath(a:name)
    return 1 
endfunction


" ===================== key binding function ====================
" 以前尝试的一种想法，未完成
"
let s:key_to_description = {}
function AddBindingDescription(keys, description)
    let s:key_to_description[a:keys] =  a:description
endfunction

function AddPrefix(prefix, description)
    call AddBindingDescription(a:prefix, '+' . a:description)
    exec printf("map<silent> %s :call DisplayDescription('%s')<CR>", a:prefix, escape(a:prefix, "<>"))
endfunction

function DisplayDescription(prefix)
    :let prefix = substitute(a:prefix, "\\", "", "g")
    let maybe_subkey = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l',
                \ 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
    let i = 1
    let buf = ''
    for subkey in maybe_subkey
        let key = prefix . subkey
        if has_key(s:key_to_description, key)
            let buf .= printf("%s(%s)\t\t", key, s:key_to_description[key])
            if i % 4 == 0
                let buf .= "\n"
            endif
        endif
        let i += 1
    endfor
    echo buf
endfunction



