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
https://alexw00.github.io/StartTreeV2/html/v.html?t=~(s~(n~%27ddg~u~%27https*3a*2f*2fduckduckgo.com*2f*3fq*3d)~v~%270.0~bmc~(~(~(cn~%27Social~b~(~(n~%27reddit~u~%27www.reddit.com)~(n~%27whatsapp~u~%27web.whatsapp.com)))~(cn~%27TV~b~(~(n~%27netflix~u~%27www.netflix.com*2fbrowse)~(n~%27youtube~u~%27www.youtube.com)~(n~%27twitch~u~%27https*3a*2f*2fwww.twitch.tv*2f)~(n~%27lookmovie~u~%27https*3a*2f*2flookmovie.io*2f))))~(~(cn~%27Coding~b~(~(n~%27github~u~%27https*3a*2f*2fgithub.com*2ffile098*3ftab*3drepositories)~(n~%27codepen~u~%27https*3a*2f*2fcodepen.io*2fpen*2f)~(n~%27protondb~u~%27https*3a*2f*2fwww.protondb.com*2f)~(n~%27oryx~u~%27https*3a*2f*2fconfigure.zsa.io*2fplanck-ez*2flayouts*2fbdrVV*2flatest*2f0))))~(~(cn~%27Shopping~b~(~(n~%27amazon~u~%27https*3a*2f*2fwww.amazon.it*2fref*3dnav_logo)~(n~%27ebay~u~%27)))))~t~(nr~15))
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
