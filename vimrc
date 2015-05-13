" Include Vundle Configs
source ~/.vundlerc

" YouCompleteMe Options
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '⚠'

" map F7 and F8 keys to "prev tab" and "next tab"
:nnoremap <F7> :tabprevious<CR>
:nnoremap <F8> :tabnext<CR>
:inoremap <F7> <Esc>:tabprevious<CR>i
:inoremap <F8> <Esc>:tabnext<CR>i

" Tap Options
" size of a hard tabstop
set tabstop=4
" size of an 'indent'
set shiftwidth=4
" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4
" always uses spaces instead of tab characters
set expandtab

" Syntax Highlighting
syntax on

" line numbers
"set number

" highlight current line
set cursorline

" suggest 80 chars per line
" from http://stackoverflow.com/a/3765575
"if exists('+colorcolumn')
"    set colorcolumn=80
"else
"    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
"endif

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

" ----------------------------------------------------------------------------
" <F9> | Color scheme selector
" from https://github.com/junegunn/dotfiles
" ----------------------------------------------------------------------------
function! s:rotate_colors()
  if !exists('s:colors_list')
    let s:colors_list = ['hybrid', 'hybrid-light']
  endif
  if !exists('s:colors_index')
    let s:colors_index = index(s:colors_list, g:colors_name)
  endif
  let s:colors_index = (s:colors_index + 1) % len(s:colors_list)
  let name = s:colors_list[s:colors_index]
  execute 'colorscheme' name
  redraw
  echo name
endfunction
nnoremap <F9> :call <SID>rotate_colors()<cr>
