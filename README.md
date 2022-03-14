# My dotfiles

![Screenshot](screen.jpg)

```
echo 'alias dot="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"' >> $HOME/.zshrc
source ~/.zshrc
echo ".dotfiles" >> .gitignore
git clone --bare https://www.github.com/file098/dotfiles.git $HOME/.dotfiles
dot checkout
dot config --local status.showUntrackedFiles no
dot config credential.helper store
```

### Zsh plugins

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

### Steam
Launch options to run games with hybrid cards (Nvidia/Intel), with optimus-manager and bumblebee
```
LD_PRELOAD="/usr/lib32/libGL.so" optirun %command%
```
