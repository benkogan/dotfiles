
"
" .vimrc
"
" Ben Kogan <http://benkogan.com>
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL SETUP

set nocompatible                " disable vi compatability mode
set ruler		        " always show cursor position at window bottom
set laststatus=2                " always show status line
set showcmd		        " display incomplete commands
set incsearch                   " do incremental searching
set ignorecase                  " turn off case-sensitive search
set smartcase                   " turn on case-sensitive search if uppercase
set noshowmode                  " hide insert status
set hlsearch                    " highlight last used search pattern
set colorcolumn=80              " highlight 80th column
set cursorline                  " highlight cursor line
set number                      " show line numbers
set hidden                      " buffers can be hidden without saving first
set confirm                     " confirm abandoning a buf with unsaved changes
set nofoldenable                " disable folding (re-enable with `zc`)
set showmatch                   " show matching brackets under cursor...
set mat=2                       " ...and blink every 2 tenths of a second
set mouse=a                     " enable mouse in all modes
set history=100		        " keep 100 lines of command line history
set encoding=utf-8              " use utf-8 as standard encoding
set backspace=indent,eol,start  " allow bkspace over everything in insert mode
set shell=/bin/bash             " shell as bash so fish doesn't break vim
set viminfo+=n~/.vim/.viminfo   " store .viminfo in ~/.vim
set display+=lastline           " display last line, even if cut off by bottom
set background=dark             " use dark theme background
set noeb vb t_vb=               " no beep, no flash for bell
set t_Co=256                    " use 256 colors

filetype plugin indent on  " detect filetype and language-dependent indent
syntax on                  " enable syntax highlighting
colorscheme solarized

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Limit how close to window edge cursor can scroll
if !&scrolloff
    set scrolloff=1
endif
if !&sidescrolloff
    set sidescrolloff=5
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUG

call plug#begin()
Plug 'scrooloose/syntastic'
Plug 'edkolev/tmuxline.vim'
Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'kien/ctrlp.vim'
Plug 'dag/vim-fish'
Plug 'junegunn/goyo.vim'
Plug 'airblade/vim-gitgutter'
Plug 'digitaltoad/vim-jade'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'honza/vim-snippets'
Plug 'wavded/vim-stylus'
Plug 'justinmk/vim-sneak'
Plug 'garbas/vim-snipmate'
  " Deps
  Plug 'tomtom/tlib_vim'
  Plug 'MarcWeber/vim-addon-mw-utils'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS

" tmuxline: section separators
let g:tmuxline_separators = {
    \ 'left'      : '',
    \ 'left_alt'  : '',
    \ 'right'     : '',
    \ 'right_alt' : '',
    \ 'space'     : ' '}

" tmuxline: section contents
let g:tmuxline_preset = {
    \ 'a'    : 'SESSION #S',
    \ 'b'    : '',
    \ 'c'    : '',
    \'win'   : '#I:#W',
    \'cwin'  : '#I:#W',
    \ 'x'    : '#(weather -c)',
    \ 'y'    : '%I:%M · %a · #(date +"%y-%m-%d") · #(~/scripts/battery.sh)%%',
    \ 'z'    : '#h'}

" vim-airline: section seperators
let g:airline_left_sep=''
let g:airline_right_sep=''

" vim-airline: show buffers/tabs at top
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#buffer_min_count = 2

" vim-sneak: clever-s
let g:sneak#s_next = 1

" Set gitgutter and syntastic gutter background to clear
highlight clear SignColumn

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPINGS

" Use jj to enter command mode
:imap jj <Esc>

" Use ; instead of : to enter commandline mode
nore ; :
nore , ;

" Move through wrapped lines like normal lines
nnoremap j gj
nnoremap k gk

" Transpose characters
nnoremap <silent> gc xph

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS

" Run :FixWhitespace to remove end of line white space
function! s:FixWhitespace(line1,line2)
    let l:save_cursor = getpos(".")
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//'
    call setpos('.', l:save_cursor)
endfunction
command! -range=% FixWhitespace call <SID>FixWhitespace(<line1>,<line2>)

" Type `dts` to expand to date
iab <expr> dts strftime("%Y-%m-%d")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TEXT, TABS, INDENTATION, SPELL CHECK

" Defaults
set shiftwidth=4
set expandtab
set autoindent

autocmd FileType make,markdown setlocal noexpandtab
autocmd FileType text setlocal autoindent expandtab softtabstop=2
autocmd FileType javascript,html,css,sh,fish setlocal ts=2 sts=2 sw=2 et ai
autocmd FileType markdown,text setlocal spell lbr cc=0 nocul

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BACKUP

" note: `~/.vim` and `~/.vim/backup` must already exist
" note: `^=` prepends to target
" note: `//` incorporates full path into swap file name

set backup
set backupdir^=~/.vim/backup
set dir^=~/.vim/backup//

