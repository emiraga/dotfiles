" arrows keys can get fucked
inoremap OA <up>
inoremap OB <down>
inoremap OD <left>
inoremap OC <right>

"# cat-us-trophy: Vimrc
set autoindent
set ts=2 sw=2 st=2
set autowrite
set expandtab
set number
set ruler

" searching
set incsearch
set hlsearch
set ignorecase
set smartcase
nnoremap <Space>q :nohlsearch<CR>
nnoremap <leader>q :nohlsearch<CR>
set noerrorbells
set visualbell
set t_vb=

"# Vundle: bundles for vim

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Dot command, more power
Bundle 'tpope/vim-repeat'

" status bar
" Bundle 'Lokaltog/vim-powerline'
"# Recommended settings from :help Powerline
" set laststatus=2
set encoding=utf-8
set t_Co=256
set hidden

"\w move faster
Bundle 'Lokaltog/vim-easymotion'
"# Recommended settings for vim-easymotion
let g:EasyMotion_leader_key = '\'
" \w Will go to a next word of choice
" \j will go down easily

" ctrl+space
Bundle 'kien/ctrlp.vim'
"# Settings for CtrlP
nnoremap <C-Space> :CtrlPBuffer<CR>
nnoremap <C-@> <C-Space>
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_dotfiles = 0

" space space
Bundle 'majutsushi/tagbar'
"# Settings for TagBar
"let g:tagbar_ctags_bin='/mnt/vol/engshare/admin/scripts/ct'
let g:tagbar_width=30
let g:tagbar_autoclose=1
let g:tagbar_indent=1
nnoremap <silent> <space><space> :TagbarToggle<CR>/

" auto-linting
" Bundle 'Syntastic'
" # Settings for Syntastic, "installed pyflakes"
" let g:syntastic_enable_highlighting=1

" Ack
Bundle 'mileszs/ack.vim'

" gcc comment/uncomment stuff
Bundle 'tpope/vim-commentary'

" :Arc<tab>
Bundle 'phleet/vim-arcanist'

" :Tab<tab>
Bundle 'godlygeek/tabular'

" f<char> t<char> multi-line
Bundle 'dahu/vim-fanfingtastic'

" Snipets
Bundle 'msanders/snipmate.vim'

" visual S, normal cs"', yss{
Bundle 'tpope/vim-surround'

" help abolish
Bundle 'tpope/vim-abolish'

" {{{ style
Bundle 'altercation/vim-colors-solarized'
" (((
" Settings for tomasr/molokai
" colorscheme Sunburst
" don't paint the background, grrrr!
" hi Normal ctermbg=NONE
" syntax enable
" )))
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized
highlight clear SignColumn
" }}}

filetype plugin indent on " required!

"# Settings for fucking awesome netrw
let g:netrw_liststyle=3
let g:netrw_keepdir=0
let g:netrw_winsize=90

"""""""""""""""""""
" FACEBOOK MASTER "
"""""""""""""""""""

source $HOME/.vimrc.facebook

"""""""""""""""""""""""
" Post-plugins-config "
"""""""""""""""""""""""

" Recurse tags
set tags=./tags;

augroup auto_write_focus_lost
  autocmd!
  autocmd FocusLost * :wa
augroup END

" Auto completion
set completeopt=longest,menuone,preview
set omnifunc=syntaxcomplete#Complete " This is overriden by syntax plugins.
augroup au_python_auto_complete
  autocmd!
  autocmd FileType python set omnifunc=pythoncomplete#Complete
augroup END

" disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" navigate windows more easily
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap j gj
nnoremap k gk

nnoremap <leader>l :ls<cr>:b<space>

" command mode, avoid using arrows, and use C-n C-p
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" wrapping
set wrap
set textwidth=79
set formatoptions=qrn1

set ttyfast
set backspace=indent,eol,start

" Speed up syntax highlighting by skipping the long lines.
set synmaxcol=150

" Tab complete like bash does, plus a C-n C-p <left> and <right>
set wildmode=longest,list
set wildmenu

" Command mode history
set history=2000

" Some abbreviations, misspellings
abbreviate teh the
abbreviate itn int
abbreviate adn and

" Warn me when exceeding 80 char limit
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
augroup red_over_length
  autocmd!
  autocmd FileType python,php match OverLength /\%81v.\+/
augroup END

" Auto open the closing brace {
augroup php_brace_auto
  autocmd!
  autocmd FileType php <buffer> inoremap { {<CR>}<C-o><S-o>
augroup END

augroup filetype_php
  autocmd!
  autocmd FileType php <buffer> nnoremap  :echo system('php '.expand('%').' 2>&1')<CR>
augroup END

" Escape from input via jjS 00
inoremap jj <ESC>
inoremap 00 <ESC>0

" Save -- Ctrl+S
inoremap <C-s> <C-o>:update<CR>
nnoremap <C-s> :update<CR>

" Quit and save -- Ctrl+Q
inoremap <C-q> <C-o>:wqall!<CR>
nnoremap <C-q> :wqall!<CR>

" :Q
command Q q " Bind :Q to :q

" Ex mode no mode
nnoremap Q <Nop>

" When at 3 spaces and I hit >>, go to 4, not 5.
set shiftround

" Say no to code folding...
set nofoldenable

" (Hopefully) removes the delay when hitting esc in insert mode
" set noesckeys " this has some weirdness with arrow keys
set ttimeout
set ttimeoutlen=1

" Emacs
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-e> <End>

