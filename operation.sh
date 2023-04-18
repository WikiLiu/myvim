!/bin/bash
sudo apt install git
sudo apt install zsh
sudo apt install vim
git clone https://github.com/WikiLiu/myvim.git
cd myvim/
mv .vim ~
mv .vimrc ~
sudo apt install ctags
sudo apt install universal-ctags
sudo apt install python
https://nodejs.org/dist/v18.16.0/node-v18.16.0-linux-x64.tar.xz
tar xzJF node-v18.16.0-linux-x64.tar.xz
xz -d node-v18.16.0-linux-x64.tar.xz
tar -xvf node-v18.16.0-linux-x64.tar
cd /etc/bin
sudo ln -s  ~/node-v18.16.0-linux-x64/bin/node node
