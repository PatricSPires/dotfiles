# GIT 

# install git
sudo apt-get install git
echo "Git instaled \n"

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
echo "Aliases defined \n"

echo "\nWhat is your name to be displayed at your GIT user.name?\n\nFor Example, mine is: \"Devinho\"\n"
 read git_config_user_name
 git config --global user.name "$git_config_user_name"

echo "\nWhat is your common used GIT email?\n"
 read git_config_user_email
 git config --global user.email $git_config_user_email

 echo "Generating SSH Key"
ssh-keygen -t rsa -b 4096 -C $git_config_user_email
ssh-add ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub
read -p "Key has been generated.\nPaste it on SSH Keys on BitBucket, GitLab or Github.\n\nThen push any button to continue..."

# install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo apt-get install zsh
chsh -s /bin/zsh
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
nvm install node
