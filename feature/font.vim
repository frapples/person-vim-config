""""""""""字体"""""""""""
" set guifont=Consolas\ 14
" set guifontwide=文泉驿等宽微米黑\ 14 

if g:isWindows
    let g:gui_font = "Consolas:h{size}"
    "let g:gui_font_wide = "微软雅黑:h{size}"
    let g:gui_font_wide = ""
    let g:gui_font_size = 12
else
    let g:gui_font = "YaHei Consolas Hybrid {size},文泉驿等宽微米黑 %size"
    " let g:gui_font = "Inconsolata {size}"
    let g:gui_font_wide = "文泉驿等宽微米黑 {size}"
    let g:gui_font_size = 12.0
endif


function! s:GuiFontSet(size)
    if(a:size > 0)
        let g:gui_font_size_now = str2float(string(a:size))
    endif
    let &guifont = substitute(g:gui_font, "{size}", string(g:gui_font_size_now), 'g')
    let &guifontwide = substitute(g:gui_font_wide, "{size}", string(g:gui_font_size_now), 'g')
endfunction

function! s:GuiFontAdd()
    call s:GuiFontSet(g:gui_font_size_now + 0.5)
endfunction

function! s:GuiFontSub()
    if(g:gui_font_size_now > 0.5)
        call s:GuiFontSet(g:gui_font_size_now - 0.5)
    endif
endfunction

function! s:GuiFontReset()
    call s:GuiFontSet(g:gui_font_size)
endfunction

let g:gui_font_size_now = g:gui_font_size
call s:GuiFontSet(g:gui_font_size)

""""""""""""""""""""" 按键，命令 """"""""""""""""""""
command! FontSizeAdd       call s:GuiFontAdd()
command! FontSizeSub       call s:GuiFontSub()
command! FontSizeReset     call s:GuiFontReset()
command! -nargs=1 FontSize call s:GuiFontSet(<args>)

map <silent> <C-scrollWheelUp> :FontSizeAdd<CR>
map <silent> <C-scrollWheelDown> :FontSizeSub<CR>
