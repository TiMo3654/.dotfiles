# Created by newuser for 5.9

export PATH=$HOME/.local/bin:$PATH
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

PS1="%F{green}%~ $ "
alias nvconf="nvim $HOME/.dotfiles/nvim/init.lua"
alias nv="nvim"

source $HOME/zsh_plugs/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/zsh_plugs/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/zsh_plugs/zsh-completions/zsh-completions.plugin.zsh

# History
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY_TIME
setopt EXTENDED_HISTORY

autoload -Uz tetriscurses

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/moldenhauert/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/home/moldenhauert/miniconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/moldenhauert/miniconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/home/moldenhauert/miniconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

