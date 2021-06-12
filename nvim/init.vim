""" VIM-PLUG as plugin manager
call plug#begin('~/.config/nvim/plugged')

Plug 'dracula/vim'						" theme
Plug 'itchyny/lightline.vim'						" status line
Plug 'jiangmiao/auto-pairs'						" auto-pair
" Plug 'junegunn/goyo.vim'						" distraction free writing
" Plug 'junegunn/limelight.vim'						" Dim neighbouring paragraphs
" Plug 'junegunn/seoul256.vim'						" theme
Plug 'mattn/emmet-vim'						" emmet support
" Plug 'morhetz/gruvbox'						" theme
" Plug 'neoclide/coc.nvim'						" auto completion engine
" Plug 'NLKNguyen/papercolor-theme'						" theme
" Plug 'preservim/nerdtree'						" file explorer
" Plug 'prettier/vim-prettier'						" preetier code format
Plug 'sheerun/vim-polyglot'						" language packs
Plug 'tpope/vim-commentary'						" commenting
" Plug 'tpope/vim-fugitive'						" git integration

call plug#end()


set number						" show line number
syntax on						" colored syntax
set cursorline						" line with cursor is highlited
set mouse=a						" Enable mouse use


colorscheme dracula
""" Lightline
set noshowmode
let g:lightline={ 'colorscheme': 'dracula', }


" Enable folding
set foldmethod=indent
set foldlevel=99

" Folding with spacebar
nnoremap <space> za

" python PEP8 guide
au BufNewFile,BufRead *.py
	\ set tabstop=4
	\ softtabstop=4
	\ shiftwidth=4
	\ textwidth=79
	\ expandtab
	\ autoindent
	\ fileformat=unix

" HTML, CSS, JS indentation guide
au BufNewFile,BufRead *.js,*.html,*.css
	\ set tabstop=2
	\ softtabstop=2
	\ shiftwidth=2

" Highlight improper use of whitespace
highlight BadWhitespace ctermfg=16 ctermbg=253 guifg=#000000 guibg=#F8F8F0
au BufNewFile,BufRead *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Higlight requirements.txt files as python
autocmd BufNewFile,BufRead requirements*.txt set ft=python

" Visualising tabs
" set list lcs=tab:\|\

" current colorscheme follows terminal background
" hi Normal ctermbg=NONE guibg=NONE
