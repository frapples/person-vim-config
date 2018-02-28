
" ----------------------------- 移动 -----------------------------
Plug 'accelerated-jk'
Plug 'accelerated-smooth-scroll'

" ----------------------------- 编辑 -----------------------------
Plug 'https://github.com/Raimondi/delimitMate.git' "YCM的FAQ中推荐
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/scrooloose/nerdcommenter.git' " 快速注释

" 文本对象扩展
Plug 'https://github.com/wellle/targets.vim.git' " 定义了好多文本对象，包括argtextobj(如dia)
Plug 'https://github.com/bkad/CamelCaseMotion.git' 
Plug 'https://github.com/michaeljsmith/vim-indent-object.git' " 定义缩进块文本对象

Plug 'https://github.com/sheerun/vim-polyglot.git' "提供大多数语言的高亮和缩进等配置


function! Userconfig__edit()


"代码折叠
augroup vimrc_fold 
autocmd! filetype python,vim,php setlocal foldmethod=indent "基于缩进进行代码折叠
augroup END
set foldmethod=syntax  "基于语法进行代码折叠
set foldnestmax=10
set foldlevel=10
set nofoldenable       "启动 vim 时关闭折叠代码

call LoadModule('feature/run')        " 一键编译运行


" ------------------- 快速完成 ---------------
" delimitMate
let g:delimitMate_expand_cr = 1 " 按下回车键时，中间会多出一行
let g:delimitMate_matchpairs = "(:),[:],{:}"

" nerdCommenter 
let g:NERDSpaceDelims = 1 "注释时加上空格
let g:NERDRemoveExtraSpaces = 1 "取消注释时移除额外空格
map <silent> gcc <Plug>NERDCommenterToggle
" ;cb 对齐注释 ;cu反注释 ;c<space>切换注释


" vim-surround
"

" ---------------------- 代码上色/格式化显示 ----------------
" vim-polyglot
" php 的高亮太坑爹
let g:polyglot_disabled = ['php', 'markdown', 'json']


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

" ---------- 文本编辑  --------

" targets.vim
" 文本对象扩展，定义参数文本对象a

" vim-indent-object
" 定义缩进文本对象i

"CamelCaseMotion
" call camelcasemotion#CreateMotionMappings('<leader>')
" 定义骆峰单词文本对象，可自定义按键按驼峰移动


endfunction
