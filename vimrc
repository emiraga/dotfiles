"from source /mnt/vol/engshare/admin/scripts/master.vimrc
set errorformat+=%.%#PHP:\ %m\ \(in\ %f\ on\ line\ %l\)%.%#,
   \%E%[0-9]%#.%m:%f?rev=%.%##L%l\ %.%#,%C%.%#
set ruler

"# cat-us-trophy: Vimrc
set autoindent
set ts=2 sw=2 st=2
syntax enable
set autowrite
set expandtab
set number

" searching
set incsearch
set hlsearch
set ignorecase
set smartcase
nmap <Space>q :nohlsearch<CR>
set noerrorbells
set novisualbell

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"# Vundle: bundles for vim

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'
" Leader <move>
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'Syntastic'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-commentary'
Bundle 'sontek/rope-vim'
Bundle 'phleet/vim-arcanist'
Bundle 'godlygeek/tabular'
Bundle 'sjl/gundo.vim'

" # style
Bundle 'sickill/vim-sunburst'
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on " required!

"# Recommended settings from :help Powerline
set laststatus=2
set encoding=utf-8
set t_Co=256
set hidden


"# Recommended settings for vim-easymotion
let g:EasyMotion_leader_key = '\'
" \w Will go to a next word of choice
" \j will go down easily


"# Settings for CtrlP
nmap <C-Space> :CtrlPBuffer<CR>
nmap <C-@> <C-Space>
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_dotfiles = 0


"# Settings for TagBar
"let g:tagbar_ctags_bin='/mnt/vol/engshare/admin/scripts/ct'
let g:tagbar_width=30
" autocmd BufEnter * nested :call tagbar#autoopen(0)
let g:tagbar_autoclose=1
let g:tagbar_indent=1
nmap <silent> <space><space> :TagbarToggle<CR>/


"# Settings for tomasr/molokai
" colorscheme Sunburst
" don't paint the background, grrrr!
" hi Normal ctermbg=NONE

syntax enable
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized


"# Settings for Syntastic, "installed pyflakes"
let g:syntastic_enable_highlighting=1
"# let g:syntastic_check_on_open=1
let g:syntastic_auto_loc_list=1

"# Autosave file, helpful to syntastic
" au CursorHold *.{py} call UpdateFile()
" function! UpdateFile()
"   update
"   SyntasticCheck
" endfunction

au FocusLost * :wa

"# Settings for fucking awesome netrw
let g:netrw_liststyle=3
let g:netrw_keepdir=0
let g:netrw_winsize=90

" Settings for commenter
" gcc commenter tpope/vim-commentary

" Settings for autohighlight
" z/ to enable it

"""""""""""""""""""""""
" Post-plugins-config "
"""""""""""""""""""""""

" Auto completion
set completeopt=longest,menuone,preview
set omnifunc=syntaxcomplete#Complete " This is overriden by syntax plugins.
au FileType python set omnifunc=pythoncomplete#Complete

" disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
"imap <up> <nop>
"imap <down> <nop>
"imap <left> <nop>
"imap <right> <nop>

" navigate windows more easily
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

nnoremap j gj
nnoremap k gk

nnoremap <leader>l :ls<cr>:b<space>

" wrapping
set wrap
set textwidth=79
set formatoptions=qrn1

set ttyfast
set backspace=indent,eol,start

" Speed up syntax highlighting by skipping the long lines.
set synmaxcol=100

" Some abbreviations, misspellings
abbreviate teh the
abbreviate itn int
abbreviate adn and

" Warn me when exceeding 80 char limit
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
au FileType python,php match OverLength /\%81v.\+/

au BufNewFile *.php delete; r ~/.vim/template.php

source $HOME/.vimrc.facebook
