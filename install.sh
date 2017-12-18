#!/bin/bash
clear;

DIR=pwd/

echo " "
echo "|============================================================================================|"
echo "|Welcome $(whoami), to the enviroment setup of a trully Horadrim, a Defender of Sanctuary! <3|"
echo "|============================================================================================|"
echo " \n"

echo " \n"
echo "|=====================================================|"
echo "|Press any key to start the setup for vIM and ZSH :D !|"
echo "|=====================================================|"
echo "\n"
read -t 1 -n 1

# Install VIM for great of the nation!
echo "Installing vIM..."

apt-get -qq upgrade & ;
for pc in $(seq 1 100); do
  echo -ne "$pc%\033[0K\r"
  sleep 0.7
done

apt-get -qq install -y vim

echo "Setting vIM to a suggested theme and style!"
mv $DIR/vim/.vimrc $HOME/

echo "Moving the packages to your Home => $HOME"
mv $DIR/vim/.vim $HOME/

# Instaling ZSH
echo "Installing ZSH... I may need you permission $(whoami)"
apt-get install -y zsh
apt-get install -y git-core

echo "Putting things in place..."
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

echo "Changing your default bash to ZSH"
chsh -s `which zsh`

# Installing Spaceship theme
echo "Installing Spaceship ZSH theme..."
curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.zsh | zsh

# Installing zsh autosuggestions
echo "Installing ZSH-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

echo "Moving the packages to your Home => $HOME"
mv $DIR/zsh/.zshrc $HOME/
