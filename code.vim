
" ----------------------------- 编程 -----------------------------
Plug 'FSwitch' | Plug 'ProtoDef' " ProtoDef 从C++的声明中快速帮你写好实现文件的框架，依赖于FSwitch
Plug 'https://github.com/Valloric/YouCompleteMe.git', {'frozen':1}
" windows版本：https://bitbucket.org/Alexander-Shukaev/vim-youcompleteme-for-windows.git
Plug 'https://github.com/jalvesaq/vimcmdline.git'
Plug 'https://github.com/tpope/vim-fugitive.git'

Plug 'https://github.com/majutsushi/tagbar.git'
Plug 'TaskList.vim'

function! Userconfig__code()


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
" ultisnips
let g:UltiSnipsExpandTrigger = "<c-j>"     " ultisnips
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

" YCM
let g:ycm_global_ycm_extra_conf = g:vim_config_dir . '/config/.ycm_extra_conf.py'
set completeopt-=preview " 补全内容不以分割子窗口形式出现，只显示补全列表
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>gD :YcmCompleter GoToDefinition<CR>
" 主动调用补全。一般情况下输入字符会自动提示id补全，但是只有在输入. -> " ::等语法元素时才会语义补全。
" 该快捷键可以主动调用语义补全。
" let g:ycm_key_invoke_completion = '<C-a>' 

" delimitMate
let g:delimitMate_expand_cr = 1 " 按下回车键时，中间会多出一行
let g:delimitMate_matchpairs = "(:),[:],{:}"

" protodef 
" 设置 pullproto.pl 脚本路径
let g:protodefprotogetter = g:vim_config_dir . '/bundle/ProtoDef/pullproto.pl'
" 成员函数的实现顺序与声明顺序一致 // 没卵用
let g:disable_protodef_sorting = 0

" nerdCommenter 
let g:NERDSpaceDelims = 1 "注释时加上空格
let g:NERDRemoveExtraSpaces = 1 "取消注释时移除额外空格
map <silent> gcc <Plug>NERDCommenterToggle
" ;cb 对齐注释 ;cu反注释 ;c<space>切换注释


" vim-surround
"

" ---------------------- 跳转 ---------------------
"a.vim
"修改了a.vim源码，取消了下列映射：
" <Leader>ih
" <Leader>is
" <Leader>ihn
"



" ---------------------- 代码上色/格式化显示 ----------------
" vim-polyglot
" php 的高亮太坑爹
let g:polyglot_disabled = ['php', 'markdown', 'json']

" indentLine 
let g:indentLine_enabled              = 1
let g:indentLine_leadingSpaceEnabled  = 1
let g:indentLine_char                 = '┊'  " `┊` `¦`, `┆`, `︙` or `│`
let g:indentLine_first_char           = '┊'
let g:indentLine_leadingSpaceChar     = '·'
let g:indentLine_indentLevel          = 5 " 缩进的最高等级
"let g:indentLine_fileType            = ['c', 'cpp', 'python', 'php']
let g:indentLine_fileTypeExclude      = ['text']

" --------------------- 信息显示窗口 -------------------
" tagbar
let g:tagbar_left       = 1 " 在左边显示
let g:tagbar_ctags_bin  = 'ctags'
let g:tagbar_width      = 25
let g:tagbar_compact    = 1   "不显示顶上的一条简短的提示（press <F1> or ? for help
let g:tagbar_indent     = 1   "设置缩进量
let g:tagbar_iconchars  = ['▸', '▾']
nmap <silent> <F4> @=(&ft == 'markdown' ? ':VoomToggle': ':TagbarToggle')<CR><CR>


" ------------- Voom ---------------
" 使用 :Voom markdown 可以查看markdown提纲
let g:voom_tree_width = 25
let g:voom_default_mode = 'markdown' " 默认打开按markdown打开提纲
let g:voom_ft_modes = {'markdown': 'markdown', 'tex': 'latex'}

" tastList

" ------------------- 其它 -----------------------
"  git-fugitive
" 使用说明：www.zhihu.com/question/20866683





endfunction
