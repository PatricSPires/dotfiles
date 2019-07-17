#!/bin/bash

clear
curl http://0w.nz/fsociety.ascii
echo "Initializing...\n"
echo "Hello, $(whoami)! Long time we don't talk\n"

echo 'installing curl' 
sudo apt install curl -y
echo '\n\n'

echo 'installing tool to handle clipboard via CLI'
sudo apt-get install xclip
echo '\n\n'

echo 'installing git' 
sudo apt install git -y
echo '\n\n'

echo 'installing vim'
sudo apt install vim -y
echo '\n\n'

echo "\nWhat name do you want to use in GIT user.name?\n\nFor example, mine will be \"patricspires\"\n"
read git_config_user_name
git config --global user.name "$git_config_user_name"
clear 

echo "\nWhat email do you want to use in GIT user.email?\n\nFor example, mine will be \"patric.pires@outlook.com\"\n"
read git_config_user_email
git config --global user.email $git_config_user_email
clear

echo "Can I set VIM as your default GIT editor for you? (y/n)\n\n"
read git_core_editor_to_vim
if echo "$git_core_editor_to_vim" | grep -iq "^y" ;then
  git config --global core.editor vim
else
  echo "\nOkay, no problem. :) Let's move on!"
fi
clear

echo "Generating a SSH Key"
ssh-keygen -t rsa -b 4096 -C $git_config_user_email
ssh-add ~/.ssh/id_rs
xclip -sel clip < ~/.ssh/id_rsa.pub
clear
echo "SSH Key generate, awaiting you past it in your github\n\nPress ENTER to continue to the installation"
read press_anything
clear

echo 'installing code'
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https -y
sudo apt-get update
sudo apt-get install code -y
clear

echo 'installing vscode extensions'
code --install-extension 2gua.rainbow-brackets
code --install-extension christian-kohler.path-intellisense
code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension dbaeumer.vscode-eslint
code --install-extension deerawan.vscode-dash
code --install-extension dracula-theme.theme-dracula
code --install-extension eamodio.gitlens
code --install-extension Equinusocio.vsc-material-theme
code --install-extension esbenp.prettier-vscode
code --install-extension foxundermoon.shell-format
code --install-extension guillaumedoutriaux.name-that-color
code --install-extension hwencc.html-tag-wrapper
code --install-extension ionutvmi.path-autocomplete
code --install-extension michelemelluso.code-beautifier
code --install-extension naumovs.color-highlight
code --install-extension oderwat.indent-rainbow
code --install-extension PKief.material-icon-theme
code --install-extension pmneo.tsimporter
code --install-extension pnp.polacode
code --install-extension ritwickdey.LiveServer
code --install-extension shinnn.stylelint
code --install-extension waderyan.gitblame
code --install-extension yzhang.markdown-all-in-one
code --install-extension Zignd.html-css-class-completion
clear

echo 'installing spotify' 
snap install spotify
clear

echo 'installing chrome' 
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
clear

echo 'installing slack' 
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-3.3.8-amd64.deb
sudo apt install ./slack-desktop-*.deb -y
clear

