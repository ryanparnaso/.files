# .files

This is a configuration repository to get a new MacOSX up and running

## Installation

```zsh
/usr/bin/ruby -e "\$(curl -fsSL https://raw.githubusercontent.com/rolme/.files/feat/install-script/install)"
```

### Generating new SSH keys

Generate [SSH keys](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/) for new installations.

Clone this repo into your home directory

```zsh
git clone git@github.com:rolme/.files.git
```

This will create a ~/.files directory. Then you can run the installer.

```zsh
~/.files/install.sh
```

## Manual Installation

### Install homebrew

```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Install oh-my-zsh

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### Install cask applications

```sh
casks=(
  1password
  chrome
  docker
  iterm2
  moom
  slack
  visual-studio-code
  zoomus
)

for cask in ${casks[@]}; do
  brew cask install $cask
done
```

### Install command line tools

```sh
tools=(
  awscli
  python
)

for tool in ${tools[@]}; do
  brew install $tool
done
```

### VSCode Extensions

- Apollo GraphQL
- Auto Rename Tag (optional)
- Beautify
- Bracket Pair Colorizer 2
- Debugger for Chrome
- Docker
- ESLint
- indent-rainbow
- Kubernetes
- markdownlint
- Material Icon Theme
- Material Theme
- Prettier - Code formatter
- REST Client
- YAML
