wget --quiet https://raw.githubusercontent.com/inferont/shell-scripts/master/.bashrc -O ~/.bashrc; wget --quiet https://raw.githubusercontent.com/inferont/shell-scripts/master/.bash_git -O ~/.bash_git
source ~/.bash_git
function generate() {
    echo "export PHP_IDE_CONFIG='serverName="$HOSTNAME"'" >  ~/.bashrc_this_server
    echo "function prompt_left() {" >> ~/.bashrc_this_server
    echo "   echo -e \"\\u@\\[\\033[1;"$(( ( RANDOM % 15 )  + 31 ))"m\\]\\h\\[\\033[0m\\]:\\w\$(__git_ps1)\"" >> ~/.bashrc_this_server
    echo "}" >> ~/.bashrc_this_server
}
function regenerate() {
    generate
    source ~/.bashrc
}
if [ ! -f ~/.bashrc_this_server ]; then
    generate
fi
source ~/.bashrc_this_server

KEEP=100
BASH_HIST=~/.bash_history
BACKUP=~/logs/bash_history/$(date +%y%m)
mkdir -p ~/logs/bash_history

if [ -s "$BASH_HIST" -a "$BASH_HIST" -nt "$BACKUP" ]; then
  # history file is newer then backup
  if ! [[ -f $BACKUP ]]; then
    # create new backup, leave last few commands and reinitialize
    mv -f $BASH_HIST $BACKUP
    tail -n$KEEP $BACKUP > $BASH_HIST
    history -r
  fi
fi


mkdir -p ~/bin
mkdir -p ~/lib
export PATH=~/bin:$PATH
unset HISTFILESIZE
HISTSIZE=9999999
HISTFILESIZE=99999999
export LD_LIBRARY_PATH=~/lib
shopt -s histappend
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\eOA": history-search-backward'
bind '"\eOB": history-search-forward'
APPLICATION_ENV="testing"
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
alias ls="ls --color=auto"
alias calculator="bc --quiet"
alias calc="bc --quiet"
alias bc="bc --quiet"
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}\007"'
PROMPT_COMMAND="${PROMPT_COMMAND:-:} ; history -a"
function prompt_right() {
  echo -e "\033[0;0m\\\D{%s}\033[0m"
}

function print_pre_prompt() {
    compensate=5
    PS1=$(printf "\n%*s\r%s\n\! \$ " "$(($(tput cols)+${compensate}))" "$(prompt_right)" "$(prompt_left)")
}
PROMPT_COMMAND="${PROMPT_COMMAND:-:} ; print_pre_prompt"
export XDEBUG_CONFIG="idekey=PHPSTORM_CLI remote_enable=1 remote_host=172.16.24.83 remote_port=9000 remote_handler=dbgp remote_mode=req"
