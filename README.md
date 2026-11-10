# dotfiles
my dotfiles

For Neovim:

- Install the vim plug plug-in manager via: 

```
$ sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

- Create ~/.config/nvim folder and create a symbolic link to the init.lua from this repository
- :PlugInstall
- Install missing dependencies in case of errors
- DNF might not have the most recent neovim version, istall from website then

For zsh:

- Create a symbolic link to the .zshrc from this repository in home directory
- Download zsh from your package manager (e.g. dnf)
- Create ~/zsh_plugs folder
- Clone desired plugins into that folder
- Set the default shell: 

```
$ chsh -s /bin/zsh
```
