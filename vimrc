"安装插件"
call plug#begin()

"自动对齐操作"
Plug 'godlygeek/tabular'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Valloric/YouCompleteMe'
Plug 'martinda/Jenkinsfile-vim-syntax'
" rust 
Plug 'rust-lang/rust'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" :help 中文插件
Plug 'yianwillis/vimcdoc'
call plug#end()

let nmapleader = "\<space>"
"snips 配置
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"YCM 自动关闭预览窗口
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
"显示行号"
set number
"语法高亮"
syntax on
"显示光标所在行"
set cursorline
"显示相对距离"
set relativenumber
"搜索结果高亮显示"
set hlsearch
set ts=4
set shiftwidth=4
set smartindent
set wrap
set showcmd
set wildmenu
set hlsearch
set nocompatible
"开启实时搜索
set incsearch
set conceallevel=0
set expandtab
filetype plugin indent on

"insert 模式的映射"
"自动匹配打括号
inoremap {<CR> {<ESC>o}<ESC>ko
inoremap (<CR> (<ESC>o)<ESC>ko
inoremap [<CR> [<ESC>o]<ESC>ko
inoremap "<CR> "<ESC>o"<ESC>ko
"normal 模式的映射"
nnoremap <leader>r :source $MYVIMRC<CR>
"rust
let g:rustfmt_autosave = 1
