# dotfiles 
The dotfiles that I use in my development environment

## Installing apps

Only run this once when setting up apps

```
xcode-select --install
# Follow instructions...

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# Follow instructions...

# Then run
brew bundle -v 
```

## Other config

```
# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install
```


## Linking Files 
Run:
```
./bootstrap.sh
```

This will create symlinks of the dotfiles in this repo to your home directory. Run this command again if editing/adding files.

