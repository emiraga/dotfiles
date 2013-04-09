" Emir Habul <emiraga@gmail.com>

let g:emir_use_style='badwolf'
let g:emir_use_cursorline = 0
let g:emir_folding = 0

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
" Bundle 'msanders/snipmate.vim'
" }}}

" visual S, normal cs"', yss<curly> {{{
Bundle 'tpope/vim-surround'
" }}}

" help abolish {{{
Bundle 'tpope/vim-abolish'
" }}}

" delimit mate {{{
Bundle 'Raimondi/delimitMate'
let delimitMate_expand_cr = 1
" }}}

" [DISABLED] multi cursor {{{
" Bundle 'paradigm/vim-multicursor'
" }}}

" Solarized style {{{ 
if g:emir_use_style ==# 'solarized'
  Bundle 'altercation/vim-colors-solarized'
  set background=dark
  let g:solarized_termcolors=256
  let g:solarized_termtrans=1
  colorscheme solarized
  highlight clear SignColumn
  highlight CursorLine ctermbg=234
endif
" }}}

" Settings for tomasr/molokai {{{
if g:emir_use_style ==# 'molokai'
  Bundle 'tomasr/molokai'
  colorscheme molokai
  " don't paint the background, grrrr!
  hi Normal ctermbg=NONE
  syntax enable
endif
" }}}

" Badwolf color scheme {{{
if g:emir_use_style ==# 'badwolf'
  Bundle 'sjl/badwolf'
  syntax on
  set background=dark
  let g:badwolf_tabline = 2
  let g:badwolf_html_link_underline = 0
  colorscheme badwolf
  " Cursorline just a bit darker
  highlight CursorLine ctermbg=234
  highlight phpStorageClass ctermfg=6
  highlight phpVarSelector ctermfg=9

  " Reload the colorscheme whenever we write the file.
  augroup color_badwolf_dev
    au!
    au BufWritePost badwolf.vim color badwolf
  augroup END
endif
" }}}

" Sunburst color scheme
if g:emir_use_style ==# 'sunburst'
  Bundle 'sickill/vim-sunburst'
  colorscheme Sunburst
endif

" Netrw {{{
filetype plugin indent on " required!

"# Settings for fucking awesome netrw
let g:netrw_liststyle=3
let g:netrw_keepdir=0
let g:netrw_winsize=90
" }}}

" Nyancat {{{
Bundle 'koron/nyancat-vim'
" }}}

" [DISABLED] Cute PHP {{{
" Bundle 'laurentb/vim-cute-php'
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
set ttimeoutlen=5

" Emacs
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-e> <End>

" Uppercase a word
inoremap <C-u> <esc>mzgUiw`za
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

" Code folding...
if g:emir_folding == 1
  set foldenable
else
  set nofoldenable
endif
set foldlevelstart=0
" }}}

" Searching  {{{
set incsearch
set hlsearch
set ignorecase
set smartcase
nnoremap <Space>q :nohlsearch<cr>:call clearmatches()<cr>
nnoremap \q :nohlsearch<cr>:call clearmatches()<cr>
set noerrorbells
set visualbell
set t_vb=
set gdefault

" Partial match stuff
nnoremap * g*<c-o>
nnoremap # g#<c-o>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

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

if g:emir_use_cursorline == 1
  augroup cline
      au!
      au WinLeave,InsertEnter * set nocursorline
      au WinEnter,InsertLeave * set cursorline
  augroup END
  set cursorline
else
  set nocursorline
endif
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

" Synstack {{{

" Show the stack of syntax hilighting classes affecting whatever is under the
" cursor.
function! SynStack()
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), " > ")
endfunc

nnoremap <F7> :call SynStack()<CR>

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

" nnoremap <silent> <s-h> :call <SID>MoveInDirection('h')<cr>
" nnoremap <silent> <s-l> :call <SID>MoveInDirection('l')<cr>
" }}}

" Pulse function  {{{
function! s:PulseLine()
  setlocal nocursorline
  setlocal cursorcolumn
  redraw
  sleep 50 m
  setlocal cursorline
  setlocal nocursorcolumn
endfunction
nnoremap <silent> <leader>f :call <SID>PulseLine()<cr>
" }}}

" Leaders and functional keys  {{{
let mapleader = ' '
let maplocalleader = "\\"

nnoremap <F1> :help <c-r><c-w><cr><c-w>p
nnoremap <leader>h :help <c-r><c-w><cr><c-w>K<c-w>p

nnoremap <F6> :set paste!<cr>
noremap <leader>p :silent! set paste!<CR>

" open a new vertical split and switch over to it.
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>n :tabnew<cr>:Nyancat2<cr>
" }}}

" Source a line {{{
vnoremap <leader>S y:execute @@<cr>:echo 'Sourced selection.'<cr>
nnoremap <leader>S ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>
" }}}

" Highlight Word --- leader,1-6 {{{
"
" This mini-plugin provides a few mappings for highlighting words temporarily.
"
" Sometimes you're looking at a hairy piece of code and would like a certain
" word or two to stand out temporarily.  You can search for it, but that only
" gives you one color of highlighting.  Now you can use <leader>N where N is
" a number from 1-6 to highlight the current word in a specific color.

function! HiInterestingWord(n) " {{{
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
endfunction " }}}

" Mappings {{{

nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>

" }}}
" Default Highlights {{{

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

" }}}

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

  " Auto open the closing brace (close curly brace)
  " autocmd FileType php inoremap <buffer> { {<CR>}<C-o><S-o>

  " Enter run a php script
  autocmd FileType php nnoremap <buffer>  :echo system('php '.expand('%').' 2>&1')<cr>
  autocmd FileType php nnoremap <buffer> <leader>r :echo system('php ~/www/scripts/emir.php 2>&1')<cr>

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

