" Set map leader
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

set nocompatible              " required
filetype off                  " required
set fileformats=unix

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'junegunn/vim-easy-align'
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'morhetz/gruvbox'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'wsdjeg/FlyGrep.vim'
" Plugin 'dense-analysis/ale'


" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set splitbelow
set splitright
set nu
set clipboard=unnamed
set encoding=utf-8
set completeopt=noinsert,menuone,noselect
set cursorline
set autoindent
set mouse=a
set title
set wildmenu
set guifont=hack_nerd_font:h11
set cc=79
set ttyfast
set complete-=i
set termguicolors
set expandtab
set wrap
set textwidth=79
set formatoptions+=t
set tabstop=4
set shiftwidth=4
set ruler
set showmatch
set number
set relativenumber
set breakindent

syntax on

set spelllang=de,en
set spell

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <silent> <F8> :TlistToggle<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99

let python_highlight_all=1

" Colorscheme
if has('termguicolors')
  set termguicolors
endif

set background=dark
colorscheme gruvbox

" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
nnoremap <Leader>p :CtrlP<CR>

" Easy bindings for its various modes
nnoremap <Leader>bb :CtrlPBuffer<CR>
nnoremap <Leader>bm :CtrlPMixed<CR>
nnoremap <Leader>bs :CtrlPMRU<CR>

" Farben für Spellcheck-Gruppen anpassen
highlight SpellBad cterm=underline ctermfg=red guifg=#fb4934 guibg=NONE
highlight SpellCap cterm=underline ctermfg=yellow guifg=#fabd2f guibg=NONE
highlight SpellRare cterm=underline ctermfg=blue guifg=#83a598 guibg=NONE
highlight SpellLocal cterm=underline ctermfg=green guifg=#b8bb26 guibg=NONE

set laststatus=2
set timeoutlen=1000
set timeoutlen=0

" Mark extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" NERDTree config
let g:NERDTreeFileLines = 1
nnoremap <Leader>e :NERDTreeToggle<CR>
