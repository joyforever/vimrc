" Tiny VIM configuration for Linux and macOS.

" Base {{{
set nocompatible
set shortmess+=I " Do not show :intro message
set magic
" }}}


" Vundle {{{
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
call vundle#end()
filetype plugin indent on
" }}}


" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

set number
" 显示光标当前位置
set ruler
" Use a visual bell instead of beeping.
set novisualbell


" Scroll {{{
"set scroll=10 " 指定CTRL-U和CTRL-D滚动的行数，默认为屏幕一半行数
set scrolloff=3
set sidescrolloff=3
" }}}


" Match {{{
set showmatch
set matchtime=1
set matchpairs+=<:>
" }}}


" Search {{{
set hlsearch
set incsearch
set ignorecase
" }}}


" Coding and Language {{{
set helplang=cn
set langmenu=zh_CN.UTF-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
" }}}


" Indent {{{
filetype indent on  " 自适应不同语言的智能缩进
set expandtab       " 将制表符扩展为空格
set tabstop=4       " 设置编辑时制表符占用空格数
set shiftwidth=4    " 设置格式化时制表符占用空格数
set softtabstop=4   " 把连续数量的空格视为一个制表符
" }}}


" Trail {{{
set list
set listchars=tab:\|\ ,nbsp:%,trail:~
" }}}


" NERDTree {{{
" Open NERDTree with <F3>
noremap <F3> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.so', '\.a', '\.lib', '\.dll', '\.exe']
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open a NERDTree automatically when vim starts up if no files were specified.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Close vim if the only window left open is a NERDTree.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}}


" CtrlP {{{
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_map = '<C-P>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(a|lib|exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" }}}


inoremap jk <ESC>

