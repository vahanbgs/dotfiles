# Initial Setup Instructions

```sh
curl -fsSL https://install.determinate.systems/nix | sh -s -- install
git clone git@github.com:vahanbgs/dotfiles.git ~/.local/share/dot
cp -r ~/.local/share/dot/home/.config/home-manager/ ~/.config/
echo $USER > ~/.config/home-manager/username.txt
nix run nixpkgs#home-manager -- switch
dot deploy
```
