# Created by newuser for 5.9

export PATH=$HOME/.local/bin:$PATH

PS1="%F{green}%M%f $ "
alias plasma="ssh -Y 134.103.55.10"
alias cadsrv="ssh -Y 134.103.69.45"

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
