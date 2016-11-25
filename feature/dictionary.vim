
function! ShowWordInDictionary()
    call system('goldendict ' . s:get_word())
endfunction

" 得到光标下的单词, 可正确处理驼峰等情况
function! s:get_word()
    " let cword = expand("<\cword>")
    let lineStr = getline('.')
    let colIndex = col('.') - 1
    if match(lineStr[colIndex], '[a-zA-Z]') == -1
        return lineStr[colIndex]
    endif

    while colIndex >= 0 && match(lineStr[colIndex], '\C[a-z]') != -1 
        let colIndex -= 1
    endwhile
    if colIndex >= 0 && match(lineStr[colIndex], '\C[a-zA-Z]') == -1
        let colIndex += 1
    endif

    return matchstr(lineStr, '\C^[a-zA-Z][a-z]*', colIndex)
endfunction
