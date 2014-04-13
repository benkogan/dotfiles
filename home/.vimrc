" Maintained by Ben Kogan
" http://benkogan.com


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL SETUP

set nocompatible                " disable vi compatability mode
set history=100		        " keep 100 lines of command line history
set ruler		        " always show cursor position at window's bottom
set laststatus=2                " always show status line
set showcmd		        " display incomplete commands
set incsearch                   " do incremental searching
set autoindent                  " set autoindenting on
set backspace=indent,eol,start  " allow backspace over everything in insert mode
set encoding=utf-8              " set utf-8 as standard encoding
set number                      " show line numbers
set viminfo+=n~/.vim/.viminfo   " store .viminfo in ~/.vim
set noeb vb t_vb=               " no beep, no flash for bell
set noshowmode                  " hide insert status ("-- INSERT --")
set display+=lastline           " display last line, even if cut off by bottom
set t_co=256                    " use 256


" Enable pathogen.vim
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Enable filetype detection and language-dependent indenting
filetype plugin indent on

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


if !&scrolloff
    set scrolloff=1
endif
if !&sidescrolloff
    set sidescrolloff=5
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" MAPPINGS

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
"" COLORS & FONTS

" Switch syntax highlighting on
set background=dark   " use dark theme background
colorscheme solarized " set colorscheme
syntax on             " syntax highlighting

set hlsearch	  " highlight last used search pattern

" Show matching brackets when text indicator is over them
" Blink every 2 tenths of a second
set showmatch
set mat=2

" Wrap on 80 chars and add a visual indicator to where this falls
" set wrap " turned wrap off....
" set textwidth=80
set colorcolumn=80
set cursorline " also highlight cursor line

" Set gitgutter and syntastic gutter background to clear
highlight clear SignColumn


""TMUXLINE.VIM""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Change section separators
let g:tmuxline_separators = {
    \ 'left'      : '>',
    \ 'left_alt'  : '>',
    \ 'right'     : '<',
    \ 'right_alt' : '<',
    \ 'space'     : ' '}
 
" Change section contents
let g:tmuxline_preset = {
    \ 'a'    : 'SESSION #S',
    \ 'b'    : '',
    \ 'c'    : '#W',
    \ 'x'    : '#(~/scripts/weather.sh)',
    \ 'y'    : '%I:%M · %a · #(date +"%y-%m-%d") · #(~/scripts/battery.sh)%%',
    \ 'z'    : '#h'}


""UNWANTED WHITESPACE"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Highlight EOL whitespace, http://vim.wikia.com/wiki/Highlight_unwanted_spaces
"highlight ExtraWhitespace ctermbg=159 guibg=#382424
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=159 guibg=#073642
"autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

" The above flashes annoyingly while typing, be calmer in insert mode
"autocmd InsertLeave * match ExtraWhitespace /\s\+$/
"autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/

" Or this:
"set list                   " Show invisible characters...
"set listchars=tab:\ \ ,trail:·      " ... but only trailing spaces

" Run :FixWhitespace to remove end of line white space
function! s:FixWhitespace(line1,line2)
    let l:save_cursor = getpos(".")
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//'
    call setpos('.', l:save_cursor)
endfunction
command! -range=% FixWhitespace call <SID>FixWhitespace(<line1>,<line2>)


""TEXT, TABS, AND INDENTATION"""""""""""""""""""""""""""""""""""""""""""""""""""

" When coding, auto-indent by 4 spaces, just like in K&R
" note: does not change tab into 4 spaces
set shiftwidth=4

" Always replace tab with spaces, except for makefiles
set expandtab
autocmd FileType make setlocal noexpandtab

" Jae's settings when editing text files
"   - automatically indent lines according to previous lines
"   - replace tab with 8 spaces
"   - when I hit tab key, move 2 spaces instead of 8
"   - wrap text if I go longer than 76 columns
autocmd FileType text setlocal autoindent expandtab softtabstop=2 textwidth=76

" For Serena, wrap soft-wrap plaintext on word
" autocmd FileType text set linebreak


""BACKUP""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Keep a backup file
set backup

" Prepend ~/.vim/backup to backupdir
" Vim will look for this dir before littering the current dir with backups
" Do "mkdir ~/.vim/backup" for this to work
set backupdir^=~/.vim/backup

" Also use ~/.backup for swap files
" Trailing // tells Vim to incorporate full path into swap file names.
set dir^=~/.vim/backup//


