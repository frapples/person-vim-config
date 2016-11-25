
function! s:rainbow_conf()
    let g:rainbow_conf = {
        \	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
        \	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
        \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
       \}

    if g:isGUI
        let guifg = synIDattr(synIDtrans(hlID("Delimiter")), "fg", "guifg")
        if guifg == -1 || guifg == ''
            let guifg = synIDattr(synIDtrans(hlID("Delimiter")), "Normal", "guifg")
        endif
        let g:rainbow_conf['guifgs'] = []
        call add(g:rainbow_conf['guifgs'], guifg)
    else
        let ctermfg = synIDattr(synIDtrans(hlID("Delimiter")), "fg", "cterm")
        if ctermfg == -1 || ctermfg == ''
            let ctermfg = synIDattr(synIDtrans(hlID("Delimiter")), "Normal", "cterm")
        endif
        let g:rainbow_conf['ctermfgs'] = []
        call add(g:rainbow_conf['ctermfgs'], ctermfg)
    endif

    let b:rainbow_conf = g:rainbow_conf

    if exists('*rainbow#show')
        call rainbow#show()
    endif
endfunction

if g:rainbow_active
    augroup vim_rc_plugin_rainbow_conf
    autocmd! ColorScheme * call s:rainbow_conf()
    augroup END
    if exists("g:colors_name")
        exec "colorscheme " . g:colors_name
    else
        colorscheme default
    endif
endif
