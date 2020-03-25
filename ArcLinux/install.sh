- Habilitar o AUR;

- Configurar o git:
	echo "What name do you want to use in GIT user.name?"
	echo "For example, mine will be \"PatricSPires\""
	read git_config_user_name
	git config --global user.name "$git_config_user_name"
	clear 

	echo "What email do you want to use in GIT user.email?"
	echo "For example, mine will be \"patric.pires@outlook.com\""
	read git_config_user_email
	git config --global user.email $git_config_user_email
	clear

- Gerando uma SSH:
	- ssh-keygen -t rsa -b 4096 -C "email"
	- eval "$(ssh-agent -s)"
	- sudo pacman -S clip
	- xclip -sel clip < ~/.ssh/id_rsa.pub

- Instalar o fzf:
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install --all

- Instalar o zsh:
	- pacman -S zsh
	- sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	- chsh -s $(which ssh)

- Instalar o nvm:
	echo 'installing nvm' 
	sh -c "$(curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash)"

	export NVM_DIR="$HOME/.nvm" && (
	git clone https://github.com/creationix/nvm.git "$NVM_DIR"
	cd "$NVM_DIR"
	git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
	) && \. "$NVM_DIR/nvm.sh"

	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

	source ~/.zshrc
	nvm --version
	nvm install 12
	nvm alias default 12
	node --version	
	npm --version

- Instalar auto sugestoes
	echo 'installing autosuggestions' 
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
	echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
	source ~/.zshrc

- Instalar o docker:
	- sudo pacman -S docker
	- systemctl start docker.service
	- systemctl enable docker.service
	- docker info
	- groupadd docker
	- sudo usermod -aG docker $whoami
	- newgrp docker
	- docker run hello-world

- Instalar o docker compose:
	- sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose;
	- sudo chmod +x /usr/local/bin/docker-compose
	- Casofalhe (sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose)
	- docker-compose --version

- Instalar a fonte firacode

- Vscode extensions:
	code --install-extension ahmadawais.shades-of-purple
	code --install-extension CoenraadS.bracket-pair-colorizer
	code --install-extension dbaeumer.vscode-eslint
	code --install-extension eamodio.gitlens
	code --install-extension EditorConfig.EditorConfig
	code --install-extension esbenp.prettier-vscode
	code --install-extension formulahendry.auto-rename-tag
	code --install-extension jpoissonnier.vscode-styled-components
	code --install-extension mquandalle.graphql
	code --install-extension naumovs.color-highlight
	code --install-extension PKief.material-icon-theme
	code --install-extension wix.vscode-import-cost

Depois de instalar tudo, fala logout e login