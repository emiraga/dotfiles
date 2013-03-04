# .bashrc

if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

source ~/facebook_bashrc

alias g="git"
alias gc="git commit -a"
alias gd="git diff"
alias gca="git commit -a --amend"
alias gl="git log --decorate --color --graph --pretty=format:'%Cgreen%h%Creset%Cred%d %Creset%s %Cblue(%an, %ar, %cn, %cr)'"
alias gl2="git log --decorate --color --graph --stat --pretty=format:'%Cgreen%h%Creset%Cred%d %Creset%s %Cblue(%an, %ar, %cn, %cr)'"
alias gup="git fetch; git rebase origin/master;"
alias gpr="git pull --rebase"
alias cfh="cmf --fix --head"
alias hl="hphpd -h localhost"
alias dstat="dstat -ta"
alias ad="arc diff --amend-all --verbatim --skip-binaries"
alias ab="arc build"
alias adp="arc diff --only --skip-binaries"
alias tracet="sudo strace -e write -s 200 -p"

alias a="arc"
alias ark="arc"

alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
export PATH=~/bin:$PATH:/sbin:/usr/sbin:/usr/local/sbin
export PATH=/usr/hs/bin:$PATH
export EDITOR=vim
export PHABRICATOR_ENV=facebook/emir

_stopped_jobs() {
  num=$(jobs -s | wc -l | sed -e "s/ //g")
	if [ $num -ne 0 ]; then
		echo " {J:$num} "
	fi
}

export PS1='\[\033[0;32m\][\u:\w$(_dotfiles_scm_info)]$(_stopped_jobs)\$ \[\033[0;37m\]'

source ~/bin/.git.bash
unalias sc

alias vimproj='vim `proj`'

set completion-query-items 10000
set completion-ignore-case On

export HISTSIZE=1000000
export HISTFILESIZE=1000000
shopt -s histappend

source .bashautocomplete
