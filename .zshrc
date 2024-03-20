# Created by newuser for 5.9

PS1="%F{green}%M%f $ "
alias plasma="ssh -Y 134.103.55.10"
alias cadsrv="ssh -Y 134.103.69.45"
source ~/zsh_plugs/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Plugins
function load_plugin()
{
    plug=$1
    [ -d "~/zsh_plugs/${plug%/*}" ] && source "~/zsh_plugs/$plug"
}

ZSH_PLUGINS=( "zsh-completions/zsh-completions.plugin.zsh"
              "zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
              "fast-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
            )
              # "zsh-vi-mode/zsh-vi-mode.plugin.zsh"
              # "zsh-titles/titles.plugin.zsh"
              # "zsh-thefuck/zsh-thefuck.plugin.zsh"
              # "zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"

for plugin in $ZSH_PLUGINS; do load_plugin $plugin; done
