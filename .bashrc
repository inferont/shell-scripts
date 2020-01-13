## If in tty download latest rc files and load
if [ -t 1 ]; then
    wget --quiet -T 2 https://raw.githubusercontent.com/inferont/shell-scripts/master/.bashrc -O ~/.bashrc_new
    wget --quiet -T 2 https://raw.githubusercontent.com/inferont/shell-scripts/master/.commonrc -O ~/.commonrc_new
    if [ $(stat --printf="%s" ~/.bashrc_new) -gt 200 ]; then
        rm ~/.bashrc
        mv ~/.bashrc_new ~/.bashrc
    fi
    if [ $(stat --printf="%s" ~/.commonrc_new) -gt 200 ]; then
        rm ~/.commonrc
        mv ~/.commonrc_new ~/.commonrc
    fi
    source ~/.commonrc
fi
if [ ! -f ~/bin/sshrc ]; then
    wget --quiet https://raw.githubusercontent.com/inferont/sshrc/master/sshrc -O ~/bin/sshrc
    chmod +x ~/bin/sshrc
    ln -s ~/.commonrc ~/.sshrc
fi
alias ssh="sshrc"
alias sssh="/usr/bin/ssh"
mkdir -p ~/lib
export LD_LIBRARY_PATH=~/lib

KEEP=100
BASH_HIST=~/.bash_history
BACKUP=~/logs/bash_history/$(date +%y%m)
mkdir -p ~/logs/bash_history

HISTTIMEFORMAT="%F %s "
if [ -s "$BASH_HIST" -a "$BASH_HIST" -nt "$BACKUP" ]; then
  # history file is newer then backup
  if ! [[ -f $BACKUP ]]; then
    # create new backup, leave last few commands and reinitialize
    mv -f $BASH_HIST $BACKUP
    tail -n$KEEP $BACKUP > $BASH_HIST
    history -r
  fi
fi
