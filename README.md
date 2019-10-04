# .files
This is a configuration repository to get a new MacOS up and running

# Installation
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/rolme/.files/feat/install-script/install)"

Generate [SSH keys](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/) for new installations.

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
* [Atom](https://atom.io) Setup sync [here](https://atom.io/packages/sync-settings)
* SizeUp (Check Email)
* Postman

## thanks

I referenced [Ryan Bates](http://github.com/ryanb/dotfiles)' and [Zach
Holman](https://github.com/holman/dotfiles) dotfiles projects.
