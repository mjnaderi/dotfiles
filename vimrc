" Include Vundle Configs
source ~/.vundlerc

" Press jk to go to Normal mode
" source: https://github.com/Valloric/YouCompleteMe#i-get-weird-errors-when-i-press-ctrl-c-in-vim
inoremap jk <Esc>

"" Fn Keys
" F5  -> toggle paste mode
" F6  ->
" F7  ->
" F8  -> prev tab
" F9  -> next tab
" F10 -> switch color scheme

" toggles vim's paste mode; when we want to paste something into vim from a
" different application, turning on paste mode prevents the insertion of extra
" whitespace
set pastetoggle=<F5>

" map <F8> and <F9> keys to 'prev tab' and 'next tab'
:nnoremap <F8> :tabprevious<CR>
:nnoremap <F9> :tabnext<CR>
:inoremap <F8> <Esc>:tabprevious<CR>i
:inoremap <F9> <Esc>:tabnext<CR>i

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
    syntax on
endif

" Search Settings
set hlsearch       " highlight searches
set ignorecase     " ignore case of searches
set smartcase      " but become case sensitive if you type uppercase characters
set incsearch      " highlight dynamically as pattern is typed

" Editor Settings
set tabstop=4      " size of a hard tabstop (number of spaces a tab counts for)
set shiftwidth=4   " size of an 'indent' (spaces for autoindents)
set softtabstop=4  " a combination of spaces and tabs are used to simulate tab stops at a width other than the (hard)tabstop
set expandtab      " always uses spaces instead of tab characters
set number        " show line numbers
set cursorline     " highlight current line
set scrolloff=3    " Start scrolling three lines before the horizontal window border
set noshowmode     " don't show the mode ("-- INSERT --") at the bottom
" suggest 80 chars per line
" from http://stackoverflow.com/a/3765575
if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif


""""""""""""""""""""""""""""""""
"        Misc. Settings        "
""""""""""""""""""""""""""""""""

set t_Co=256          " Enable 256 colors, for Color Scheme and Vim-Airline
set history=1000      " remember more commands and search history
set undolevels=1000   " use many levels of undo


""""""""""""""""""""""""""
" Color Scheme Settings  "
""""""""""""""""""""""""""
set background=dark
colorscheme hybrid_material
" <F10> | Color scheme selector, from https://github.com/junegunn/dotfiles
function! s:rotate_colors()
  if !exists('s:colors_list')
    let s:colors_list = ['hybrid_material', 'primary', 'hybrid_material']
    let s:bgs = ['dark', 'light', 'light']
  endif
  if !exists('s:colors_index')
    let s:colors_index = index(s:colors_list, g:colors_name)
  endif
  let s:colors_index = (s:colors_index + 1) % len(s:colors_list)
  let name = s:colors_list[s:colors_index]
  let bg = s:bgs[s:colors_index]
  execute 'colorscheme' name
  execute 'set background='.bg
  redraw
  echo name.' '.bg
endfunction
nnoremap <F10> :call <SID>rotate_colors()<cr>
inoremap <F10> <Esc>:call <SID>rotate_colors()<cr>i

"""""""""""""""""""""""""""""""""""
"       Vim-Airline Settings      "
"""""""""""""""""""""""""""""""""""

set laststatus=2                   " appear airline all the time
let g:airline_powerline_fonts = 1  " set powerline fonts for airline
let g:airline_theme = 'tomorrow'   " https://github.com/bling/vim-airline/wiki/Screenshots, consider using: tomorrow, luna, light, powerlineish


"""""""""""""""""""""""""""""""""""
"      YouCompleteMe Settings    "
"""""""""""""""""""""""""""""""""""

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '⚠'

nnoremap <leader>y :YcmForceCompileAndDiagnostics<cr>
nnoremap <leader>pg :YcmCompleter GoTo<CR>
nnoremap <leader>pd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>pc :YcmCompleter GoToDeclaration<CR>
