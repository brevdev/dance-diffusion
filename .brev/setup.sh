#!/bin/bash

# set -eo pipefail

####################################################################################
##### Specify software and dependencies that are required for this project     #####
#####                                                                          #####
##### Note:                                                                    #####
##### The working directory is /home/brev/<PROJECT_FOLDER_NAME>. Execution of  #####
##### this file happens at this level.                                         #####
####################################################################################

##### Yarn #####
# (echo ""; echo "##### Yarn #####"; echo "";)
# curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add
# echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
# sudo apt update
# sudo apt install -y yarn

##### Homebrew #####
# (echo ""; echo "##### Homebrew #####"; echo "";)
# curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash -
# echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/brev/.bash_profile
# echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/brev/.zshrc
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

##### Node v14.x + npm #####
# (echo ""; echo "##### Node v14.x + npm #####"; echo "";)
# sudo apt install ca-certificates
# curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
# sudo apt-get install -y nodejs
# # install npm packages globally without sudo
# if [ ! -d "${HOME}/.npm-packages" ]
# then
# mkdir "${HOME}/.npm-packages"
# printf "prefix=${HOME}/.npm-packages" >> $HOME/.npmrc
# cat <<EOF | tee -a ~/.bashrc | tee -a ~/.zshrc
# NPM_PACKAGES="\${HOME}/.npm-packages"
# NODE_PATH="\${NPM_PACKAGES}/lib/node_modules:\${NODE_PATH}"
# PATH="\${NPM_PACKAGES}/bin:\${PATH}"
# # Unset manpath so we can inherit from /etc/manpath via the `manpath`
# # command
# unset MANPATH # delete if you already modified MANPATH elsewhere in your config
# MANPATH="\${NPM_PACKAGES}/share/man:\$(manpath)"
# EOF
# fi

##### Python + Pip + Poetry #####
# (echo ""; echo "##### Python + Pip + Poetry #####"; echo "";)
# sudo apt-get install -y python3-distutils
# sudo apt-get install -y python3-apt
# curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3 -
# curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
# python3 get-pip.py
# rm get-pip.py
# source $HOME/.poetry/env

##### Golang v16x #####
# (echo ""; echo "##### Golang v16x #####"; echo "";)
# wget https://golang.org/dl/go1.16.7.linux-amd64.tar.gz
# sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.16.7.linux-amd64.tar.gz
# echo "" | sudo tee -a ~/.bashrc
# echo "export PATH=\$PATH:/usr/local/go/bin" | sudo tee -a ~/.bashrc
# source ~/.bashrc
# echo "" | sudo tee -a ~/.zshrc
# echo "export PATH=\$PATH:/usr/local/go/bin" | sudo tee -a ~/.zshrc
# source ~/.zshrc
# rm go1.16.7.linux-amd64.tar.gz

##### Custom commands #####
# (echo ""; echo "##### Custom commands #####"; echo "";)
# npm install


conda init zsh
conda init bash 
eval "$(conda shell.bash hook)"
pip install .
conda install -n base ipykernel --update-deps --force-reinstall -y
git clone https://github.com/harmonai-org/sample-generator
git clone --recursive https://github.com/crowsonkb/v-diffusion-pytorch
pip install ./sample-generator
pip install ./v-diffusion-pytorch
pip install ipywidgets==7.7.1 gradio
pip install k-diffusion