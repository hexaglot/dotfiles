if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

syntax enable set background=dark
set hidden
set history=100
filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set hlsearch
" for vim wiki
filetype plugin on
set nocompatible
" make searches case-sensitive only if they contain upper-case characters
set ignorecase
set smartcase
" if file changes outside of vim, reload
set autoread
set clipboard=unnamedplus "set vim to use system clipboard
" fix slow O inserts
set timeout timeoutlen=1000 ttimeoutlen=100
" live feedback of substitutions
set inccommand=nosplit
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'flazz/vim-colorschemes'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
"Plug 'autozimu/LanguageClient-neovim', {
    "\ 'branch': 'next',
    "\ 'do': 'bash install.sh',
    "\ }

Plug 'w0rp/ale'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'posva/vim-vue'
Plug 'vimwiki/vimwiki'

" plugins are visible to vim after this call
call plug#end()

" configure vim wiki to use notes dir and markdown format
let g:vimwiki_list = [{'path': '~/notes/'}]
let g:vimwiki_list = [{'path': '~/notes/', 'syntax': 'markdown', 'ext': '.md'}]

nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

let mapleader = ' '
"make . do again over visual selection
vnoremap . :normal .<CR>
"noremap <leader>w :wq<ESC>
inoremap jj  <esc>

noremap <c-a> :Ag 
nnoremap <left>   <c-w>>
nnoremap <right>  <c-w><
nnoremap <up>     <c-w>-
nnoremap <down>   <c-w>+
noremap <leader>j  <ESC><C-W>w
"noremap <leader>w  <ESC>:w<CR>
"noremap <leader>q  <ESC>:x<CR>
noremap <C-T> :FZF <CR>
" make indent grab the visual selection after indenting
vnoremap > >gv
vnoremap < <gv
noremap <leader>hb i&nbsp;<ESC>
" select just-pasted text
nnoremap gp `[v`]
nnoremap <leader>pp "*p
nnoremap <leader>pj o<ESC>"*p

nnoremap <leader>pp "*p

" In visual mode, pipe selection through markdown and replace in text
vnoremap <leader>d c<C-R>=system('markdown', getreg('"'))[:-2]<CR><ESC>

" new command :R to run command and put results in a scratch buffer
:command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>


" assoc nunjucks with html for syntax
augroup filetypedetect
    au BufRead,BufNewFile *.nunjucks setfiletype html
augroup END
