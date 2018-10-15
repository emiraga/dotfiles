# .bashrc

if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

export INPUTRC=~/.inputrc

alias g="git"
alias gc="git commit -a"
alias gd="git diff"
alias gl="git log --decorate --color --graph --pretty=format:'%Cgreen%h%Creset%Cred%d %Creset%s %Cblue(%an, %ar, %cn, %cr)'"
alias gl2="git log --decorate --color --graph --stat --pretty=format:'%Cgreen%h%Creset%Cred%d %Creset%s %Cblue(%an, %ar, %cn, %cr)'"
alias gup="git fetch; git rebase origin/master;"
alias gpr="git pull --rebase"
alias cfh="cmf --fix --head"
alias hl="hphpd -h localhost"
alias dstat="dstat -ta"
alias ad="arc diff --amend-all --verbatim --skip-binaries"
alias ab="arc build"
alias ap="arc pull"
alias adp="arc diff --only --skip-binaries"
alias tracet="sudo strace -e write -s 200 -p"

alias ark="arc"

alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
export PATH=~/optbin:~/bin:~/facebook_bin:$PATH:/sbin:/usr/sbin:/usr/local/sbin:/opt/local/bin
export PATH=/usr/hs/bin:$PATH
export EDITOR=vim

alias h?="history | grep"

source ~/bin/.git.bash

which htop >/dev/null

alias vimproj='vim `proj`'

vis() {
  vim `s_no_color $@` -c "/$@"
}

_stopped_jobs() {
  num=$(jobs -s | wc -l | sed -e "s/ //g")
  if [ $num -ne 0 ]; then
    echo " {J:$num} "
  fi
}

function hgup() {
  hg pull
  hg rebase -d master
  hg update
}

function hgupall() {
  hg pull
  for bookmark in $(hg bookmarks | awk '{ print $(NF-1) }'); do
    hg update $bookmark && hg rebase -d master
  done
}


set completion-query-items 10000
set completion-ignore-case On

export HISTSIZE=1000000
export HISTFILESIZE=1000000
shopt -s histappend
shopt -s histverify
export PHABRICATOR_ENV=custom/emir

# OPAM configuration
. /Users/emir/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

export NVM_DIR="/Users/emir/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

PATH="/Users/emir/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/emir/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/emir/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/emir/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/emir/perl5"; export PERL_MM_OPT;
