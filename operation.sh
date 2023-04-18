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



//install vim
sudo apt-get update
sudo apt-get install -y build-essential libncurses-dev libatk1.0-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python3-dev
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=no \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.9/config-3.9-x86_64-linux-gnu \
            --enable-perlinterp=no \
            --enable-luainterp=no \
            --enable-gui=no \
            --enable-cscope \
            --prefix=/usr/local

make
sudo make install
