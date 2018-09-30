" ~/.vimrc
" Lisa McCutcheon
" Wed Feb 07, 2007

" **************************************
" * PLUGIN MANAGEMENT
" **************************************


" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'benekastah/neomake'
Plug 'ervandew/supertab'
Plug 'leafgarland/typescript-vim'
Plug '/usr/local/opt/fzf'

call plug#end()

" Run neomake on every write
autocmd! BufWritePost * Neomake

" Use 'bundle exec' when running rubocop in neomake
let g:neomake_ruby_rubocop_maker_exe = 'bundle exec rubocop'


" **************************************
" * VARIABLES
" **************************************
set nocompatible		" get rid of strict vi compatibility!
set nu				" line numbering on
set autoindent			" autoindent on
set noerrorbells		" bye bye bells :)
set modeline			" show what I'm doing
set showmode			" show the mode on the dedicated line (see above)
set nowrap			" no wrapping!
set ignorecase			" search without regards to case
set backspace=indent,eol,start	" backspace over everything
set fileformats=unix,dos,mac	" open files from mac/dos
set exrc			" open local config files
set nojoinspaces		" don't add white space when I don't tell you to
set ruler			" which line am I on?
set showmatch			" ensure Dyck language
set incsearch			" incremental searching
set hlsearch			" meh
set bs=2			" fix backspacing in insert mode
set bg=dark

" Expand tabs in C, java, and ruby files to spaces
au BufRead,BufNewFile *.{c,h,java,rb,erb} set expandtab
au BufRead,BufNewFile *.{c,h,java,rb,erb} set shiftwidth=2
au BufRead,BufNewFile *.{c,h,java,rb,erb} set tabstop=2

" for default to expand tab "
set expandtab
set shiftwidth=2
set tabstop=2

" Do not expand tabs in assembly file.  Make them 8 chars wide.
au BufRead,BufNewFile *.s set noexpandtab
au BufRead,BufNewFile *.s set shiftwidth=8
au BufRead,BufNewFile *.s set tabstop=8

" Show syntax
syntax on

" This is my prefered colorscheme, open a file with gvim to view others
:colors darkblue

" For switching between many opened file by using ctrl+l or ctrl+h
map <C-J> :next <CR>
map <C-K> :prev <CR>

" Spelling toggle via F10 and F11
map <F10> <Esc>setlocal spell spelllang=en_us<CR>
map <F11> <Esc>setlocal nospell<CR>

" setlocal textwidth=80		" used for text wrapping
set cc=100
set wildmenu
set cindent
set backspace=2

" highlighting over a certain line
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%101v.\+/
" show tabs "
set listchars=tab:o-
set list
" hightlight trailing whitespace"
match Error /\s\+$/

" makes gutter same color as background "
highlight clear SignColumn

" folding settings "
set foldmethod=syntax " fold based on syntax [ indent, manual, expr, marker, diff ]
set nofoldenable      " start without folded
set foldnestmax=10    " let's not go too deep
" za to toggle folding
" zM to fold everything
" zR to unfold everything
