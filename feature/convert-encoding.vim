
" 备注：vim有iconv函数可实现此功能
function! s:convertEncodingTo(encoding)
    if !ShellCommandExists('iconv')
        call EchoWarning("非常抱歉，你的系统中没有iconv命令")
        return
    endif

        let filepath = expand("%:p")
        let from_encoding = strlen(&fenc) ? &fenc : &enc
        let res = system(printf("iconv -c -f %s -t %s %s -o %s", from_encoding, a:encoding, shellescape(filepath), shellescape(filepath)))
        if v:shell_error == 0
            edit " 重新加载文件
        else
            call EchoWarning("貌似失败了。。。。。iconv输出如下：")
            echo res
        endif
        

endfunction


command! -nargs=1 ConvertEncodingTo call <SID>convertEncodingTo(<f-args>)

function! Set_file_encoding(encoding)
    let encoding = input("输入欲转换的编码：")
    exec "set fileencoding=" + encoding
endfunction
