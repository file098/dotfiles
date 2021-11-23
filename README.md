# My dotfiles

![Screenshot](screen.jpg)

```
echo 'alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"' >> $HOME/.zshrc
source ~/.zshrc
echo ".dotfiles" >> .gitignore
git clone --bare https://www.github.com/file098/dotfiles.git $HOME/.dotfiles
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

### Zsh plugins

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

### StartPage

```
git clone git://github.com/file098/startpage.git ~/.config/
```

### Packages
```
sudo pacman -Syu zsh nitrogen alacritty arandr spotify mailspring neovim firefox nvidia --needed

yay -S optimus-manager openrazer-meta polychromatic
```

### Steam
Launch options to run games with hybrid cards (Nvidia/Intel), with optimus-manager and bumblebee
```
LD_PRELOAD="/usr/lib32/libGL.so" optirun %command%
```
