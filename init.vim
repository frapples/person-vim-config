" 由于作者本人以linux使用为主，因此，配置文件主要以适合linux为多，但是也会尽量做到Windows的兼容，包括安装版本的vim和便携版本的vim。

set nocompatible "关闭vi兼容模式，这个要必须第一个设置
source <sfile>:p:h/core.vim

"=============================================================================
"===========================      加载配置模块      ==========================
"=============================================================================
"  使用Plug命令要确保使用单引号
call LoadModuleStart()

call LoadModule('base')
call LoadModule("fix")        " 修复一些问题，做一些兼容性设置

call LoadModule('edit')       " 一般编辑设置
call LoadModule('code')       " 写代码相关设置
call LoadModule('ui')         " 界面相关设置
call LoadModule('other')      " 其它的东西

call LoadModuleEnd()






