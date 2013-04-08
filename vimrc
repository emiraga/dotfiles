" Emir Habul <emiraga@gmail.com>

" Vundle: bundles for vim  {{{
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" }}}

" Plugins and plugin settings  {{{

" Dot command, more power {{{
Bundle 'tpope/vim-repeat'
" }}}

" Status bar -- powerline {{{
Bundle 'Lokaltog/vim-powerline'
" Recommended settings from :help Powerline
set laststatus=2
set encoding=utf-8
set t_Co=256
set hidden
" }}}

"\w move faster -- easymotion {{{
Bundle 'Lokaltog/vim-easymotion'
" Recommended settings for vim-easymotion
let g:EasyMotion_leader_key = '\'
" \w Will go to a next word of choice
" \j will go down easily
" }}}

" Ctrl+space Ctrl+P -- ctrlp {{{
Bundle 'kien/ctrlp.vim'
" Settings for CtrlP
nnoremap <C-Space> :CtrlPBuffer<CR>
nnoremap <C-@> :CtrlPBuffer<CR>
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_dotfiles = 0
" }}}

" space space -- tagbar {{{
Bundle 'majutsushi/tagbar'
"# Settings for TagBar
"let g:tagbar_ctags_bin='/mnt/vol/engshare/admin/scripts/ct'
let g:tagbar_width=30
let g:tagbar_autoclose=1
let g:tagbar_indent=1
nnoremap <silent> <space><space> :TagbarToggle<CR>/
" }}}

" [DISABLED] auto-linting -- syntastic {{{
" Bundle 'Syntastic'
" # Settings for Syntastic, "installed pyflakes"
" let g:syntastic_enable_highlighting=1
" }}}

" Ack {{{
Bundle 'mileszs/ack.vim'
" }}}

" gcc comment/uncomment stuff {{{
Bundle 'tpope/vim-commentary'
" }}}

" :Arc<tab> {{{
Bundle 'phleet/vim-arcanist'
" }}}

" :Tab<tab> {{{
Bundle 'godlygeek/tabular'
" }}}

" f<char> t<char> multi-line {{{
Bundle 'dahu/vim-fanfingtastic'
" }}}

" [DISABLED] Snipets -- snipmate {{{
Bundle 'msanders/snipmate.vim'
" }}}

" visual S, normal cs"', yss<curly> {{{
Bundle 'tpope/vim-surround'
" }}}

" help abolish {{{
Bundle 'tpope/vim-abolish'
" }}}

" [DISABLED] Solarized style {{{ 
" Bundle 'altercation/vim-colors-solarized'
" set background=dark
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1
" colorscheme solarized
" highlight clear SignColumn
" }}}

" [DISABLED] Settings for tomasr/molokai {{{
" colorscheme Sunburst
" don't paint the background, grrrr!
" hi Normal ctermbg=NONE
" syntax enable
" }}}

" badwolf {{{
Bundle 'sjl/badwolf'
syntax on
set background=dark
let g:badwolf_tabline = 2
let g:badwolf_html_link_underline = 0
colorscheme badwolf

" Reload the colorscheme whenever we write the file.
augroup color_badwolf_dev
  au!
  au BufWritePost badwolf.vim color badwolf
augroup END
" }}}

" Netrw {{{
filetype plugin indent on " required!

"# Settings for fucking awesome netrw
let g:netrw_liststyle=3
let g:netrw_keepdir=0
let g:netrw_winsize=90
" }}}

"  }}}

" Facebook master  {{{
source $HOME/.vimrc.facebook
"  }}}

" Keyboard hacks (movement)  {{{

" arrows keys can get fucked
inoremap OA <up>
inoremap OB <down>
inoremap OD <left>
inoremap OC <right>

" I accidentally press J-join when visually selecting
nnoremap VJ Vj

" Keep the cursor in place while joining lines
" nnoremap J mzJ`z

" Visual move
nnoremap j gj
nnoremap k gk

" command mode, avoid using arrows, and use C-n C-p
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Escape from input via jj 00
inoremap jj <ESC>
inoremap 00 <ESC>:wa<cr>0

" (Hopefully) removes the delay when hitting esc in insert mode
" set noesckeys " this has some weirdness with arrow keys
set ttimeout
set ttimeoutlen=1

" Emacs
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-e> <End>
" }}}

" Basic settings  {{{
set encoding=utf-8
set modelines=0
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
" When at 3 spaces and I hit >>, go to 4, not 5.
set shiftround

set mouse=a
set autowrite
set nonumber
set showmode
set showcmd
set ruler
set nolazyredraw
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮
set showbreak=↪
set title
set linebreak
set dictionary=/usr/share/dict/words
set spellfile=~/.vim/custom-dictionary.utf-8.add

" wrapping
set wrap
set textwidth=79
set formatoptions=qrn1

set ttyfast
set backspace=indent,eol,start

" Speed up syntax highlighting by skipping the long lines.
set synmaxcol=150

" Tab complete like bash does, plus a C-n C-p <left> and <right>
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.DS_Store                       " OSX bullshit

" Command mode history
set history=2000

" Say no to code folding...
set foldenable
set foldlevelstart=0

" }}}

" Searching  {{{
set incsearch
set hlsearch
set ignorecase
set smartcase
nnoremap <Space>q :nohlsearch<CR>
nnoremap \q :nohlsearch<CR>
set noerrorbells
set visualbell
set t_vb=
set gdefault

" Partial match stuff
nnoremap * g*<c-o>
nnoremap # g#<c-o>
" }}}

" Display of characters  {{{

" Custom splitting lines
set fillchars=diff:⣿,vert:▚

" Display trailing spaces
set listchars+=trail:⌴
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
    au InsertLeave * :set listchars+=trail:⌴
augroup END
" }}}

" Ctags {{{
set tags=./tags;
" }}}

" Window management  {{{
augroup mybig_auto_cmd_group " {{{
  autocmd!
  " Save when losing focus
  autocmd FocusLost * :wa

  " Resize splits when the window is resized
  au VimResized * :wincmd =

  " Source vimrc when written
  autocmd BufWritePost vimrc,my_vimrc,.vimrc source $MYVIMRC
augroup END " }}}

set equalalways
set splitright
set splitbelow

" }}}

" Auto completion  {{{
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview
" set omnifunc=syntaxcomplete#Complete " This is overriden by syntax plugins.
augroup au_python_auto_complete
  autocmd!
  autocmd FileType python set omnifunc=pythoncomplete#Complete
augroup END
inoremap <c-l> <c-x><c-l>
inoremap <c-f> <c-x><c-f>
inoremap <c-]> <c-x><c-]>
" }}}

" Windows navigation  {{{
" If more than one tab, ctrl+h and ctrl+l are switching tabs, otherwise switching windows
function! s:MoveInDirection(dir)
  if tabpagenr("$") > 1
    echom a:dir
    if a:dir ==# 'l'
      :tabnext
      return
    elseif a:dir ==# 'h'
      :tabprev
      return
    endif
  endif

  execute 'wincmd ' . a:dir
endfunction

nnoremap <silent> <C-j> :call <SID>MoveInDirection('j')<cr>
nnoremap <silent> <C-k> :call <SID>MoveInDirection('k')<cr>
nnoremap <silent> <C-h> :call <SID>MoveInDirection('h')<cr>
nnoremap <silent> <C-l> :call <SID>MoveInDirection('l')<cr>

nnoremap <silent> <s-h> :call <SID>MoveInDirection('h')<cr>
nnoremap <silent> <s-l> :call <SID>MoveInDirection('l')<cr>
" }}}

" Pulse function  {{{
function! s:PulseLine()
  setlocal cursorline
  setlocal cursorcolumn
  redraw
  sleep 50 m
  setlocal nocursorline
  setlocal nocursorcolumn
endfunction
nnoremap <silent> <leader>p :call <SID>PulseLine()<cr>
" }}}

" Leaders and functional keys  {{{
let mapleader = ' '
let maplocalleader = "\\"

nnoremap <F1> :help <c-r><c-w><cr><c-w>p
nnoremap <leader>h :help <c-r><c-w><cr><c-w>K<c-w>p

nnoremap <F6> :set paste!<cr>
noremap <leader>p :silent! set paste!<CR>
" }}}

" Source a line {{{
vnoremap <leader>S y:execute @@<cr>:echo 'Sourced selection.'<cr>
nnoremap <leader>S ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>
" }}}

" Some abbreviations, misspellings {{{
abbreviate teh the
abbreviate itn int
abbreviate adn and
" }}}

" Command line commands {{{
" :Q :Wq :WQ
command! Q q
command! Wq wq
command! WQ wq
" }}}

" Filetype specific commands  {{{

highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
augroup filetype_specific_autogroups
  autocmd!
  " Warn me when exceeding 80 char limit
  autocmd FileType python,php match OverLength /\%81v.\+/

  " Auto open the closing brace
  autocmd FileType php inoremap <buffer> { {<CR>}<C-o><S-o>

  " Enter run a php script
  autocmd FileType php nnoremap <buffer>  :echo system('php '.expand('%').' 2>&1')<CR>

  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Quit and Save -- Ctrl+Q Ctrl+S {{{
" Ctrl+S
inoremap <silent> <C-s> <C-o>:execute("wall \| nohlsearch")<cr>
nnoremap <silent> <C-s> :execute("wall \| nohlsearch")<CR>

" Quit and save -- Ctrl+Q
inoremap <C-q> <C-o>:wqall!<CR>
nnoremap <C-q> :wqall!<CR>
" }}}

" Disable pain points  {{{
" Ex mode no mode
nnoremap Q <Nop>
" K wtf?
nnoremap K <Nop>
" }}}

" Shell  {{{
let g:is_posix = 1
" }}}

" Backups  {{{
set backup                        " enable backups
set noswapfile                    " It's 2012, Vim.

set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif
" }}}

