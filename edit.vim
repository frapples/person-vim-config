
" ----------------------------- 移动 -----------------------------
Plug 'https://github.com/Lokaltog/vim-easymotion.git' " github的readme中有作者推荐设置
Plug 'https://github.com/vim-scripts/a.vim.git'
Plug 'accelerated-jk'
Plug 'accelerated-smooth-scroll'

" ----------------------------- 编辑 -----------------------------
Plug 'https://github.com/Raimondi/delimitMate.git' "YCM的FAQ中推荐
Plug 'https://github.com/junegunn/vim-easy-align.git' " 代码对齐
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/scrooloose/nerdcommenter.git' " 快速注释
Plug 'https://github.com/terryma/vim-multiple-cursors.git'
Plug 'https://github.com/SirVer/ultisnips.git' |  Plug 'https://github.com/honza/vim-snippets.git' " vim-snippets提供ultisnips的模板
Plug 'https://github.com/Shougo/unite.vim.git'

" 文本对象扩展
Plug 'https://github.com/wellle/targets.vim.git' " 定义了好多文本对象，包括argtextobj(如dia)
Plug 'https://github.com/bkad/CamelCaseMotion.git' 
Plug 'https://github.com/michaeljsmith/vim-indent-object.git' " 定义缩进块文本对象

Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/jistr/vim-nerdtree-tabs.git'
Plug 'https://github.com/vim-voom/VOoM.git' " 大纲插件，可列出markdown的大纲


function! Userconfig__edit()

" unite
" let g:unite_force_overwrite_statusline = 0
call unite#custom#profile('default', 'context', {
      \ 'direction': 'botright',
      \ })
call unite#custom#source('file,file/new,buffer,file_rec,file_rec/async,file_mru',
      \ 'matchers', 'matcher_fuzzy') " 模糊匹配

call unite#custom#source('file_mru,file_rec,file_rec/async,grep,locate',
  \ 'ignore_pattern', join(['\.git/'], '\|'))

nmap <silent><leader>b :Unite buffer -buffer-name=缓冲区 -start-insert  -prompt-direction="bottom" -auto-resize<CR>
nmap <silent><c-p>  :Unite file -start-insert -buffer-name=文件 -prompt-direction="bottom" -auto-resize<CR>

augroup vimrc_unite
autocmd FileType unite call s:unite_my_settings()
augroup END
function! s:unite_my_settings()
    imap <buffer> <A-q>   <Plug>(unite_exit)
    nmap <buffer> <ESC>   <Plug>(unite_exit)
endfunction


" ------------- session --------------
set sessionoptions-=buffers "不保存隐藏和卸载的缓冲区，仅保存在窗口里的
set sessionoptions+=tabpages
set sessionoptions+=unix,slash "使用unix换行,路径使用正斜杠,这样可以使会话文件在win和unix下通用
set sessionoptions-=options " Don't persist options and mappings because it can corrupt sessions.



" ----------- tab 页签 ---------------
map <A-h> <C-W>h
map <A-j> <C-W>j
map <A-k> <C-W>k
map <A-l> <C-W>l
map <A-=> <C-W>+
map <A--> <C-W>-
map <A-,> <C-W><
map <A-.> <C-W>>
map <A-_> <C-W>_
map <A-+> <C-W>=
map <A-q> <C-w>q

map<silent> <A-0> :tabnew<CR>
map <A-1> 1gt
map <A-2> 2gt
map <A-3> 3gt
map <A-4> 4gt
map <A-5> 5gt
map <A-6> 6gt
map <A-7> 7gt
map <A-8> 8gt
map <A-9> 9gt



" ---------- 移动  --------
"accelerated_jk 
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

"easy-motion
let g:EasyMotion_do_mapping = 1 " 关闭默认的easymotion快捷键
let g:EasyMotion_smartcase = 1 " Turn on case insensitive feature
let g:EasyMotion_keys =  'asdghklqwertyuiopzxcvbnmfj;' . 'ASDGHKLQWERTYUIOPZXCVBNMFJ'
" map <Leader>s <Plug>(easymotion-s)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" map <space> <Plug>(easymotion-s)
" 关于按拼音首字母定位汉字功能的讨论：https://github.com/easymotion/vim-easymotion/issues/145
" g:EasyMotion_use_migemo选项支持日本字的

" ---------- 文本编辑  --------

" targets.vim
" 文本对象扩展，定义参数文本对象a

" vim-indent-object
" 定义缩进文本对象i

"CamelCaseMotion
" call camelcasemotion#CreateMotionMappings('<leader>')
" 定义骆峰单词文本对象，可自定义按键按驼峰移动

" vim-esay-align
 nmap <leader>a <Plug>(EasyAlign)
 vmap <leader>a <Plug>(EasyAlign)

"

" vim-multiple-cursors





" ------- 信息显示窗口 ----------
"NERDTree/NERDTree-tabs
"let NERDTreeShowBookmarks   = 1       " 是否默认显示书签列表
"let NERDTreeShowFiles       = 1       " 是否默认显示文件
"let NERDTreeShowHidden      = 1       " 是否默认显示隐藏文件
"let NERDTreeShowLineNumbers = 1       " 是否默认显示行号
let NERDTreeWinPos          = 'left'   " 窗口位置（'left' or 'right'）
let NERDTreeMinimalUI        = 1       " 子窗口不显示冗余帮助信息
let NERDTreeDirArrows        = 1       " 使用箭头而不是+~来表明目录打开与否的情况
let NERDTreeWinSize          = 18      " 窗口宽度
let g:nerdtree_tabs_open_on_gui_startup     = 0  " 打开GUIvim时是否默认打开目录树
let g:nerdtree_tabs_open_on_console_startup = 0  " 打开终端vim时是否默认打开目录树
let g:nerdtree_tabs_startup_cd = 1
nmap <F3> <plug>NERDTreeTabsToggle<CR>


" ---------------- 其它功能 -----------------------
" vim-startify 
if ShellCommandExists("cowsay") && ShellCommandExists("fortune")
    let g:startify_custom_header = map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']
endif
    let g:startify_custom_footer = ['', '', '-------- 舒适简洁的vim --------']

let g:startify_list_order = [
        \ ['最近文件：'],
        \ 'files',
        \ ['最近在此目录打开的文件：'],
        \ 'dir',
        \ ['会话(sessions):'],
        \ 'sessions',
        \ ['书签(bookmarks):'],
        \ 'bookmarks',
        \ ]



" vim-signature
let g:SignatureMap = {
    \ 'Leader'             :  "m",
    \ 'PlaceNextMark'      :  "m,",
    \ 'ToggleMarkAtLine'   :  "m.",
    \ 'PurgeMarksAtLine'   :  "m-",
    \ 'DeleteMark'         :  "dm",
    \ 'PurgeMarks'         :  "m<Space>",
    \ 'PurgeMarkers'       :  "m<BS>",
    \ 'GotoNextLineAlpha'  :  "']",
    \ 'GotoPrevLineAlpha'  :  "'[",
    \ 'GotoNextSpotAlpha'  :  "`]",
    \ 'GotoPrevSpotAlpha'  :  "`[",
    \ 'GotoNextLineByPos'  :  "]'",
    \ 'GotoPrevLineByPos'  :  "['",
    \ 'GotoNextSpotByPos'  :  "mn",
    \ 'GotoPrevSpotByPos'  :  "mp",
    \ 'GotoNextMarker'     :  "[+",
    \ 'GotoPrevMarker'     :  "[-",
    \ 'GotoNextMarkerAny'  :  "]=",
    \ 'GotoPrevMarkerAny'  :  "[=",
    \ 'ListLocalMarks'     :  "m/",
    \ 'ListLocalMarkers'   :  "m?"
    \ }

" --------------------- 其它功能 ----------------------

" calendar
let g:calendar_views =  ['year', 'month', 'week', 'day', 'clock']
let g:calendar_cache_directory =  $HOME . "/archive/calendar.vim/"
" 按?键可以获得快捷键帮助
"
"
call LoadModule("feature/dictionary")
nmap<silent> K :call ShowWordInDictionary()<CR>


endfunction
