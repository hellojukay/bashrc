"安装插件"
call plug#begin()

"自动对齐操作"
Plug 'godlygeek/tabular'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Valloric/YouCompleteMe'
Plug 'martinda/Jenkinsfile-vim-syntax'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" :help 中文插件
Plug 'yianwillis/vimcdoc'
" rust
Plug 'rust-lang/rust.vim'

" defx
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

let nmapleader = "\<space>"
let mapleader = "\<space>"
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
" 按下 tab 自动输入 4 个空格
set expandtab
set wrap
set showcmd
set wildmenu
set hlsearch
set nocompatible
"开启实时搜索
set incsearch
set conceallevel=0
" tab 自动展开为空格
set expandtab 
set encoding=utf-8
set tags+=~/.vim/systags
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

"netrw
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20

call defx#custom#option('_', {
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })
nmap <silent> <Leader>l :Defx <cr>
autocmd FileType defx call s:defx_mappings()

function! s:defx_mappings() abort
  nnoremap <silent><buffer><expr> l       <SID>defx_toggle_tree()                    " 打开或者关闭文件夹，文件
  nnoremap <silent><buffer><expr> .       defx#do_action('toggle_ignored_files')     " 显示隐藏文件
  nnoremap <silent><buffer><expr> <C-r>   defx#do_action('redraw')                   " 重新渲染 windows
  nnoremap <silent><buffer><expr> n       defx#do_action('new_file')                 " 创建新的文件
  nnoremap <silent><buffer><expr> N       defx#do_action('new_directory')            " 创建新的文件夹
  nnoremap <silent><buffer><expr> d       defx#do_action('remove')
  nnoremap <silent><buffer><expr> r       defx#do_action('rename')
endfunction

function! s:defx_toggle_tree() abort
    " Open current file, or toggle directory expand/collapse
    if defx#is_directory()
        return defx#do_action('open_or_close_tree')
    endif
    return defx#do_action('multi', ['drop'])
endfunctio
