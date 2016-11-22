# .files
This is a configuration repository to get a new development environment up and running with familiar settings.

## Prerequisites
* 1Password (App Store)
* [iTerm2](https://www.iterm2.com)
* [Oh My Zsh](http://ohmyz.sh)
* [Homebrew](http://brew.sh)

# Need to brew manually
* brew install z ruby-build rbenv node zsh-syntax-highlighting

# Installation
Clone this repo into your home directory
```
$ git clone git@github.com:rolme/.files.git
```
This will create a ~/.files directory. Then you can run the installer.
```
$ ~/.files/install.sh
```
### This will:
* install Oh-My-Zsh! if it is not installed.
* Add custom plugins and themes.
* Create the code and projects directory.

# TODO
* Skip the clone and install straight from github.
* Install homebrew auto-magically first.
* Check .files repo for changes.

# Native OSX Apps
* Atom
* SizeUp (Check Email)
* Postman

## thanks

I referenced [Ryan Bates](http://github.com/ryanb/dotfiles)' and [Zach
Holman](https://github.com/holman/dotfiles) dotfiles projects.
