" help tabpage
"
function! s:set_tab_line_color()
    hi TabLineSel     gui=underline guifg=#111111 guibg=#f4e1ae 
    hi TabLine        gui=underline guifg=#111111 guibg=#eee8d5
    hi TabLineFill    gui=underline guifg=#796b47 guibg=#eee8d5
endfunction

augroup vim_rc_tabline
autocmd! ColorScheme * call s:set_tab_line_color()
augroup END

" e2c77d
function! MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let bufnr = buflist[tabpagewinnr(a:n)- 1]
    let label = getbufvar(bufnr, '&modified') ? '+' : ''
    let label = getbufvar(bufnr, '&readonly') ? '-' : label
    " bufname(bufnr)
    let filename = expand(printf('#%d:t', bufnr))
    let filename = filename != "" ? filename : "[未命名]"
    return label . a:n ." " . filename
endfunction

function! MyTabLine()
    let s = ''
	for i in range(tabpagenr('$'))
        let s.= i + 1 == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#' " 选择高亮
        let s .= '%' . (i + 1) . 'T'                                  " 设置标签页号 (用于鼠标点击)
        let s .= '%{MyTabLabel(' . (i + 1) . ')}'
        let s .= '%#TabLineFill#┆'
	endfor

    let s .= '%#TabLineFill#%T'                 " 最后一个标签页之后用 TabLineFill 填充并复位标签页号

    if tabpagenr('$') > 1                       " 右对齐用于关闭当前标签页的标签
        let s .= '%=%#TabLine#%999X x '
    endif
    return s
endfunction

