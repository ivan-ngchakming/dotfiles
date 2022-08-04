BASEDIR=$(realpath ./)


# Installs
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


# Terminal
ln -sF $BASEDIR/.zshrc ~/.zshrc

# GIT
ln -sF $BASEDIR/git/.gitignore ~/.gitignore
ln -sF $BASEDIR/git/.gitconfig ~/.gitconfig

# Vscode
ln -sF $BASEDIR/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

