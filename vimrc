set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My Plugins
Plugin 'bling/vim-airline'
Plugin 'chriskempson/base16-vim'
Plugin 'w0ng/vim-hybrid'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" map "next" and "prev" tab keys to f7 and f8
:nnoremap <F7> :tabprevious<CR>
:nnoremap <F8> :tabnext<CR>
:inoremap <F7> <Esc>:tabprevious<CR>i
:inoremap <F8> <Esc>:tabnext<CR>i

" Tap Options
" size of a hard tabstop
set tabstop=4
" size of an "indent"
set shiftwidth=4
" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4
" always uses spaces instead of tab characters
set expandtab

" Syntax Highlighting
syntax on

" line numbers
set number

" highlight current line
set cursorline

" Highlight searches
set hlsearch

" ignore case of searches
set ignorecase

" Highlight dynamically as pattern is typed
set incsearch

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" vim-airline settings
" Enable 256 colors in vim (for airline)
set t_Co=256
" appear airline all the time
set laststatus=2
" set powerline fonts for airline
let g:airline_powerline_fonts = 1
" vim-airline theme, select theme from https://github.com/bling/vim-airline/wiki/Screenshots
let g:airline_theme = 'light'

" Color Scheme
colorscheme hybrid
