#!/bin/bash

sudo apt-get update -y
sudo apt-get install build-essential -y
sudo apt install linuxbrew-wrapper -y
sudo apt-get install nginx -y

test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile


brew tap pokt-network/pocket-core
brew install pokt-network/pocket-core/pocket
pocket version
sudo cp /home/linuxbrew/.linuxbrew/bin/pocket /usr/local/bin

mkdir -p ~/.pocket/config 

curl -O https://raw.githubusercontent.com/pokt-network/pocket-network-genesis/master/testnet/genesis.json > ~/.pocket/config/genesis.json

#wget https://raw.githubusercontent.com/pokt-network/pocket-network-genesis/master/testnet/genesis.json -P ~/.pocket/config

cp ./config.json ~/.pocket/config/
cp ./chains.json ~/.pocket/config/

ls ~/.pocket/config
