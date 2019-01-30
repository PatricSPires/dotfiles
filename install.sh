#!/bin/bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo apt-get install zsh
cp .zshrc ~/.zshrc


# install nvm
sh -c "$(curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash)"

export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/creationix/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm --version

# install git
sudo apt-get install git

# set git aliases
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '

# install vscode extensions
code --install-extension naumovs.color-highlight
code --install-extension dbaeumer.vscode-eslint
code --install-extension dbaeumer.jshint
code --install-extension guillaumedoutriaux.name-that-color
code --install-extension michelemelluso.code-beautifier
code --install-extension zignd.html-css-class-completion
code --install-extension ritwickdey.liveserver
code --install-extension shinnn.stylelint
code --install-extension calvinhong.stylelint-fix
code --install-extension eamodio.gitlens

