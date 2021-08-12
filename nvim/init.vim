""" Break compatibility with vi
" set nocompatible

set encoding=utf-8

""" Syntax and plugin
syntax enable
filetype plugin on

""" Finding files
set path+=**
set wildignore+=**/.venv/**
set wildignore+=**/node_modules/**
" set wildmenu

set number						" show line number
set cursorline						" line with cursor is highlited
set mouse=a						" Enable mouse use
set clipboard+=unnamedplus				" Same clipboard for vim and system

""" Enable folding
set foldmethod=indent
set foldlevel=99
""" Folding with spacebar
nnoremap <space> za

""" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

""" Netrw with settings and Ctrl n for toggling
let g:netrw_banner=0					" Hide banner
let g:netrw_liststyle=3					" Tree style view/folding
let g:netrw_winsize=20					" 20% width
let g:netrw_list_hide=netrw_gitignore#Hide()		" Hiding files in .gitignore
nnoremap <silent> <C-n> :Lexplore<CR>

""" Moving lines up and down with alt j k in normal and visual
nnoremap <silent> <A-k> :m .-2<CR>==
nnoremap <silent> <A-j> :m .+1<CR>==
vnoremap <silent> <A-j> :m '>+1<CR>gv=gv
vnoremap <silent> <A-k> :m '<-2<CR>gv=gv

""" python PEP8 guide
au BufNewFile,BufRead *.py
	\ set tabstop=4
	\ softtabstop=4
	\ shiftwidth=4
	\ textwidth=79
	\ expandtab
	\ shiftround
	\ autoindent
	\ fileformat=unix

""" higlighting requirements.txt files as python
autocmd BufNewFile,BufRead requirements*.txt set ft=python

""" HTML,CSS,JS indentation guide
au BufNewFile,BufRead *.js,*.html,*.css
	\ set tabstop=2
	\ softtabstop=2
	\ shiftwidth=2

""" Highlight improper use of whitespace
highlight BadWhitespace ctermfg=16 ctermbg=253 guifg=#000000 guibg=#F8F8F0
au BufNewFile,BufRead *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

""" Splittling behaviour alter
set splitright
set splitbelow

""" Integrated terminal opens in insert mode and mapped to Ctrl t
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
function! OpenTerminal()
	split term://bash
	set nonumber
	set nocursorline
	resize 15
endfunction
nnoremap <silent> <C-t> :call OpenTerminal()<CR>

""" Prevent creation of swap files
" set nobackup       					" no backup files
" set nowritebackup  					" only in case you don't want a backup file while editing
" set noswapfile     					" no swap files

""" Visualising tabs
" set list lcs=tab:\|\



""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""IMPURITIES START HERE"""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""

""" VIM-PLUG as plugin manager
call plug#begin('~/.config/nvim/plugged')

Plug 'dracula/vim'  					" theme
Plug 'itchyny/lightline.vim'				" status line
Plug 'jiangmiao/auto-pairs'				" auto-pair
Plug 'joshdick/onedark.vim'				" theme
" Plug 'junegunn/goyo.vim'				" distraction free writing
" Plug 'junegunn/seoul256.vim'				" theme
Plug 'mattn/emmet-vim'					" emmet support
" Plug 'morhetz/gruvbox'  				" theme
" Plug 'neoclide/coc.nvim', {'branch': 'release'}  	" auto completion engine
" Plug 'NLKNguyen/papercolor-theme'  			" theme
" Plug 'preservim/nerdtree'  				" file explorer
Plug 'prettier/vim-prettier' 				" preetier code format
Plug 'sheerun/vim-polyglot'				" language packs
Plug 'tpope/vim-commentary'				" commenting
" Plug 'tpope/vim-fugitive'  				" git integration

call plug#end()

" let g:coc_global_extenstions = ['coc-html', 'coc-css', 'coc-emmet', 'coc-tsserver', 'coc-json', 'coc-prettier']

colorscheme onedark
""" Lightline
set noshowmode
let g:lightline={ 'colorscheme': 'onedark', }

nnoremap <silent> <C-f> :FZF<CR>
nnoremap <C-p> :Prettier<CR>

""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""IMPURITIES END HERE""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""



""" current colorscheme follows terminal background
" hi Normal ctermbg=NONE guibg=NONE
