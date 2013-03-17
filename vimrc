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
" Dot command, more power
Bundle 'tpope/vim-repeat'
" status bar
Bundle 'Lokaltog/vim-powerline'
"\w move faster
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
" auto-linting
Bundle 'Syntastic'
Bundle 'mileszs/ack.vim'
" gcc comment/uncomment stuff
Bundle 'tpope/vim-commentary'
Bundle 'phleet/vim-arcanist'
Bundle 'godlygeek/tabular'
" f<char> t<char> multi-line
Bundle 'dahu/vim-fanfingtastic'
" Snipets
Bundle 'msanders/snipmate.vim'
" visual S, normal cs"', yss{
Bundle 'tpope/vim-surround'
" help abolish
Bundle 'tpope/vim-abolish'

" # style
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

" Recurse tags
set tags=./tags;

syntax enable
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized
highlight clear SignColumn


"# Settings for Syntastic, "installed pyflakes"
let g:syntastic_enable_highlighting=1

au FocusLost * :wa

"# Settings for fucking awesome netrw
let g:netrw_liststyle=3
let g:netrw_keepdir=0
let g:netrw_winsize=90

" Settings for commenter
" gcc commenter tpope/vim-commentary

" Settings for autohighlight
" z/ to enable it

" git gutter
let g:gitgutter_enabled = 0
let g:gitgutter_highlight_lines = 0

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
inoremap <esc> <nop>

" navigate windows more easily
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

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
set synmaxcol=100

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
au FileType python,php match OverLength /\%81v.\+/

" Auto open the closing brace {
inoremap { {<CR>}<C-o><S-o>
" Escape from input via jj
inoremap jj <ESC>

" Save -- Ctrl+S
inoremap <C-s> <C-o>:bufdo update<CR>
nnoremap <C-s> :bufdo update<CR>

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

source $HOME/.vimrc.facebook

