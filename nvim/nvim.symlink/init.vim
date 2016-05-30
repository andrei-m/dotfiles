" ---------------------------------------------------------------------------
"  vim-plug
" ---------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')
Plug 'fatih/vim-go'
Plug 'junegunn/fzf'
Plug 'scrooloose/syntastic'
call plug#end()

" ----------------------------------------------------------------------------
"  File Handling
" ----------------------------------------------------------------------------
set backupdir=~/.vim-tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,/var/tmp,/tmp
set noswapfile

" ----------------------------------------------------------------------------
"  Text Formatting
" ----------------------------------------------------------------------------
set autoindent             " automatic indent new lines
set smartindent            " be smart about it
inoremap # X<BS>#
set softtabstop=2          " yep, two
set shiftwidth=2           " ..
set tabstop=4
set expandtab              " expand tabs to spaces
set nosmarttab             " fuck tabs
set virtualedit=block      " allow virtual edit in visual block ..

" ----------------------------------------------------------------------------
"  Remapping
" ----------------------------------------------------------------------------

let mapleader = ","

" exit to normal mode with 'jj'
inoremap jj <ESC>

" reflow paragraph with Q in normal and visual mode
nnoremap Q gqap
vnoremap Q gq

" sane movement with wrap turned on
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" <C-P> for fzf plugin
noremap <C-P> :FZF<CR>

" quickfix navigation
noremap <Leader>e :cfir<CR>
noremap <Leader>n :cn<CR>
noremap <Leader>p :cp<CR>

" ----------------------------------------------------------------------------
"  UI
" ----------------------------------------------------------------------------

set ruler                  " show the cursor position all the time
set noshowcmd              " don't display incomplete commands
set nolazyredraw           " turn off lazy redraw
set number                 " line numbers
set wildmenu               " turn on wild menu
set wildmode=list:longest,full
set ch=1                   " command line height
set backspace=2            " allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l,[,] " backspace and cursor keys wrap to
set shortmess=filtIoOA     " shorten messages
set report=0               " tell us about changes
set nostartofline          " don't jump to the start of line when scrolling
set statusline=%f\ %m\ %{go#jobcontrol#Statusline()}%=%c,%l/%L

" ----------------------------------------------------------------------------
"  Syntax
" ----------------------------------------------------------------------------
syntax enable
filetype plugin indent on
syntax on
" Enable syntax highlighting for go templates
au BufNewFile,BufRead *.tmpl set filetype=gotexttmpl

" ----------------------------------------------------------------------------
" Go
" ----------------------------------------------------------------------------

au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <Leader>d <Plug>(go-def)
au FileType go nmap <Leader>dx <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>i <Plug>(go-info)

" Tab settings for Go
au BufNewFile,BufRead *.go set softtabstop=4 shiftwidth=4 tabstop=4 noexpandtab
" test on save
au BufWritePost *.go :GoTest<CR>

let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

" ----------------------------------------------------------------------------
" Visual Cues
" ----------------------------------------------------------------------------

set showmatch              " brackets/braces that is
set mat=5                  " duration to show matching brace (1/10 sec)
set incsearch              " do incremental searching
set laststatus=2           " always show the status line
set ignorecase             " ignore case when searching
set nohlsearch             " don't highlight searches
set visualbell             " shut the fuck up

" ----------------------------------------------------------------------------
" System
" ----------------------------------------------------------------------------
set shell=/bin/zsh
