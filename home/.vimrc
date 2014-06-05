" Maintained by Ben Kogan
" http://benkogan.com


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL SETUP

set nocompatible                " disable vi compatability mode
set ruler		        " always show cursor position at window's bottom
set laststatus=2                " always show status line
set showcmd		        " display incomplete commands
set incsearch                   " do incremental searching
set autoindent                  " automatic indentation
set noshowmode                  " hide insert status (-- INSERT --)
set hlsearch                    " highlight last used search pattern
set colorcolumn=80              " highlight 80th column
set cursorline                  " highlight cursor line
set number                      " show line numbers
set hidden                      " buffers can be hidden without saving first
set confirm                     " confirm if abandoning buf with unsaved changes
set showmatch                   " show matching brackets under cursor...
set mat=2                       " ...and blink every 2 tenths of a second
set history=100		        " keep 100 lines of command line history
set encoding=utf-8              " use utf-8 as standard encoding
set backspace=indent,eol,start  " allow backspace over everything in insert mode
set viminfo+=n~/.vim/.viminfo   " store .viminfo in ~/.vim
set display+=lastline           " display last line, even if cut off by bottom
set background=dark             " use dark theme background
set noeb vb t_vb=               " no beep, no flash for bell
set t_Co=256                    " use 256 colors

" Enable pathogen.vim
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

filetype plugin indent on  " filetype detection and language-dependent indenting
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

let g:vim_markdown_folding_disabled=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPINGS

" Use jj to enter command mode
:imap jj <Esc>


" Use ; instead of : to enter commandline mode
nore ; :
nore , ;

" Move through wrapped lines like normal lines
nnoremap j gj
nnoremap k gk

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" vim-bufferline: don't highlight current buffer if it's the only buffer
let g:bufferline_solo_highlight = 1
let g:bufferline_active_highlight = 'StatusLine'
let g:bufferline_fname_mod = ':p:~:.'

" Set gitgutter and syntastic gutter background to clear
highlight clear SignColumn


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TEXT, TABS, AND INDENTATION

" Auto-indent by 4 spaces, a la K&R; change tab into spaces
set shiftwidth=4
set expandtab

" Use tab character in makefiles and markdown
autocmd FileType make,markdown setlocal noexpandtab

" In text files, follow prev line indent, replace tab with spaces, softtab = 2
autocmd FileType text setlocal autoindent expandtab softtabstop=2

autocmd FileType javascript,html,css,sh setlocal ts=2 sts=2 sw=2 expandtab autoindent


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BACKUP

" Keep a backup file
set backup

" Prepend ~/.vim/backup to backupdir
" Vim will look for this dir before littering the current dir with backups
" Do `mkdir ~/.vim/backup` for this to work
set backupdir^=~/.vim/backup

" Also use ~/.backup for swap files
" Trailing // tells Vim to incorporate full path into swap file names.
set dir^=~/.vim/backup//


