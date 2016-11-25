
set laststatus=2
let g:lightline = {}
let g:lightline.enable = {
    \ 'statusline': 1,
    \ 'tabline': 0
    \ }
let g:lightline.colorscheme = 'default'
let g:lightline.subseparator = { 'left': '︙', 'right': '︙' } " '┊'  " `┊` `¦`, `┆`, `︙` or `│`
" let g:lightline.tabline_separator = {'left': '┊', 'right': '┊' }
" let g:lightline.tabline_subseparator = {'left': '┊', 'right': '┊'}
"

" 激活窗口的各部件的安排方式
let g:lightline.active = {
    \   'left': [['mode', 'specialwinname', 'paste'],  ['fugitive', 'filename'], ['functionname']],
	\   'right': [['time'], ['percent', 'lineinfo'], ['fileformat', 'fileencoding', 'filetype']]
    \ }

" 未激活窗口的各部件的安排方式
let g:lightline.inactive = {
    \ 'left': [['specialwinname'], ['filename']],
	\ 'right': [['percent', 'lineinfo'], ['fileformat', 'fileencoding', 'filetype']]
    \ }
" 也可以在component中直接设置statusline的表达式。
" 写成函数的好处是，不必要设置component_visible_condition选项了。函数返回空字符串时表示不显示
" 定义各部件显示的东西。也可以再这添加自定义的部件
let g:lightline.component_function = {
    \   'fugitive': 'LightLineFugitive', 
    \   'mode': 'LightLineMode',
    \   'specialwinname': 'LightLineSpecialWinName',
    \   'filename': 'LightLineFilename',
    \   'functionname' : 'LightLineFunctionInfo',
    \   'fileformat': 'LightLineFileformat',
    \   'filetype': 'LightLineFiletype',
    \   'fileencoding': 'LightLineFileencoding',
    \   'percent': 'LightLinePercent',
    \   'lineinfo': 'LightLineLineInfo',
    \   'time': 'LightLineTime'
    \ }


let g:lightline.mode_map = {
    \ 'n' : '一般',
    \ 'i' : '插入',
    \ 'R' : '替换',
    \ 'v' : '可视',
    \ 'V' : '可视-行',
    \ 'c' : '命令',
    \ "\<C-v>": '可视-块',
    \ 's' : '选择',
    \ 'S' : '选择-行',
    \ "\<C-s>": '选择-块',
    \ '?': '      '
    \ }


let s:special_win_show_name = {
    \'tagbar': 'Tagbar',
    \'nerdtree':'NerdTree',
    \'unite':'Unite', 
    \ 'vimfiler': 'VimFiler',
    \'vimshell': 'VimShell',
    \'vim-plug': 'vim-plug',
    \'voomtree':'Voom',
    \'startify': 'vim-startify初始界面'
    \}


function! LightLineFilename()
    if s:isSpecialWin()
        if &ft == 'vimfiler'
            return vimfiler#get_status_string()
        endif

        if &ft == 'unite'
            return unite#get_status_string()
        endif
        
        if &ft == 'vimshell'
            return vimshell#get_status_string()
        endif
        return ''
    else
        return (&readonly ?  'RO ': '') .
                \ (expand('%:t') != '' ? expand('%:t') : '[未命名]') .
                \ ' ' . (&modified ? '+' : &modifiable ? '' : '-')
    endif

endfunction

function! LightLineFugitive()
    if &ft !~? 'vimfiler' && exists('*fugitive#head')
        return fugitive#head()
    endif
    return ''
endfunction

function! LightLineSpecialWinName()
  return has_key(s:special_win_show_name, &ft) ? s:special_win_show_name[&ft] : ''
endfunction

function! s:isSpecialWin()
    return has_key(s:special_win_show_name, &ft)
endfunction

function! LightLineMode()
        if !s:isSpecialWin() && winwidth(0) > 50
            return lightline#mode()
        else
            return ''
        endif
endfunction

function! LightLineFileformat()
    if s:isSpecialWin()
        return ''
    endif

    return winwidth(0) > 65 ? &fileformat : ''
endfunction

function! LightLineFiletype()
    if s:isSpecialWin()
        return ''
    endif

    return winwidth(0) > 65 ? &filetype : ''
endfunction

function! LightLineFileencoding()
    if s:isSpecialWin()
        return ''
    endif

    return winwidth(0) > 50 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineLineInfo()
    "return (winwidth(0) > 70 ? "%3l,%-2v" : "")
    return (winwidth(0) > 65 ? printf("%3d,%-2d", line('.'), virtcol('.')) : "")
endfunction

function! LightLinePercent()
    return (winwidth(0) > 65 ? printf("%3d%%", line('.') * 100 / line('$')) : "")
endfunction

function! LightLineTime()
    return (winwidth(0) > 70 ? "☺ " .  strftime("%H:%M:%S") : "")
endfunction

function! LightLineFunctionInfo()
        if !exists("*tagbar#currenttag")
            return ''
        endif
        if winwidth(0) < 75
            return ''
        endif
        return (winwidth(0) > 110 ? tagbar#currenttag('%s','', 'p') : tagbar#currenttag('%s', '', 's'))
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'
function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction
