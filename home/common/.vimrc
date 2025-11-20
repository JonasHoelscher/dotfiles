" Set map leader
let mapleader=" "

" Basic settings
set nocompatible
filetype off
set fileformats=unix
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
set cc=79
set ttyfast
set complete-=i
set termguicolors
set wrap
set textwidth=79
set formatoptions+=t
set ruler
set showmatch
set number
set relativenumber
set breakindent
syntax on

" spelling
set spelllang=en
set spell

" indentation
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
filetype plugin indent on

" increase undo limit
set history=1000

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent> <F8> :TlistToggle<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Set colors for spellcheck groups
highlight SpellBad cterm=underline ctermfg=red guifg=#fb4934 guibg=NONE
highlight SpellCap cterm=underline ctermfg=yellow guifg=#fabd2f guibg=NONE
highlight SpellRare cterm=underline ctermfg=blue guifg=#83a598 guibg=NONE
highlight SpellLocal cterm=underline ctermfg=green guifg=#b8bb26 guibg=NONE

set laststatus=2

" Mark extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Plugins
" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Plugin configurations
" NERDTree config
let g:NERDTreeFileLines = 1
nnoremap <Leader>e :NERDTreeToggle<CR>

" CtrlP configuration
" Use a leader instead of the actual named binding
nnoremap <Leader>p :CtrlP<CR>
" Easy bindings for its various modes
nnoremap <Leader>bb :CtrlPBuffer<CR>
nnoremap <Leader>bm :CtrlPMixed<CR>
nnoremap <Leader>bs :CtrlPMRU<CR>
" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Set colorscheme
set background=dark
colorscheme moonfly
if has('termguicolors')
  set termguicolors
endif
