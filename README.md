# Dotfiles and Setup scripts 

95% content from
[Paul](https://github.com/paulirish/dotfiles),
[Mathias](https://github.com/mathiasbynens/dotfiles/)
and [Nicolas](https://github.com/bevacqua/dotfiles)

[mathias's readme](https://github.com/mathiasbynens/dotfiles/) is awesome. go read it.


## install the necessary apps

My basic setup is captured in `setup/ubuntu.sh`

## Syntax highlighting

…is really important. even for these files.

Install [Dotfiles Syntax Highlighting](https://github.com/mattbanks/dotfiles-syntax-highlighting-st2) via [Sublime Text 2 Package Control](http://wbond.net/sublime_packages/package_control)


### Sensible OS X defaults

When setting up a new Mac, you may want to set some sensible OS X defaults:

```bash
./.osx
```

## overview of files

####  Automatic config
* `.ackrc` - for ack (better than grep)

#### shell environment
* `.aliases`
* `.bash_profile`
* `.bash_prompt`
* `.bashrc`
* `.exports`
* `.functions`

#### manual run (about to change)
* `install-deps.sh` - random apps i need installed
* `.osx` - run on a fresh osx machine
* `.brew` - homebrew initialization

#### git, brah
* `.git`
* `.gitattributes`
* `.gitconfig`
* `.gitignore`

* `.inputrc` - config for bash readline


## Installation

Install the config files
```bash
git clone https://github.com/jcsrb/dotfiles.git && cd dotfiles && ./sync.sh
```

Setup ubuntu 
```bash
bash -c "`curl -sL https://raw.github.com/jcsrb/dotfiles/master/setup/ubuntu.sh`"
```

