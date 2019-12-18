"安装插件"
call plug#begin()

"自动对齐操作"
Plug 'godlygeek/tabular'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Valloric/YouCompleteMe'
Plug 'martinda/Jenkinsfile-vim-syntax'
"defx 配置 -
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'SirVer/ultisnips'

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
noremap ter :terminal<CR>
"在下方向打开 terminal
noremap <C-j>  :below terminal<CR>
noremap <C-n> :Defx <cr>
nnoremap <leader>r :source $MYVIMRC<CR>


"config defx
call defx#custom#option('_', {
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })

autocmd FileType defx call s:defx_mappings()

function! s:defx_mappings() abort
  nnoremap <silent><buffer><expr> l     <SID>defx_toggle_tree()                    " 打开或者关闭文件夹，文件
  nnoremap <silent><buffer><expr> .     defx#do_action('toggle_ignored_files')     " 显示隐藏文件
  nnoremap <silent><buffer><expr> <C-r>  defx#do_action('redraw')
endfunction

function! s:defx_toggle_tree() abort
    " Open current file, or toggle directory expand/collapse
    if defx#is_directory()
        return defx#do_action('open_or_close_tree')
    endif
    return defx#do_action('multi', ['drop'])
endfunction
