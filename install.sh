#!/bin/bash

# Update and download packages
sudo apt-get update -y && apt-get install -y libleveldb-dev build-essential
sudo apt-get install golang-go -y
sudo apt-get install nginx -y
sudo apt-get install git -y

# Download source
git ~/clone https://github.com/pokt-network/pocket-core.git
cd ~/pocket-core
git checkout tags/RC-0.4.3

# Compile Source (Var not necessary)
GOPATH=$(which go)
go build -tags cleveldb -o /usr/bin/pocket ./app/cmd/pocket_core/main.go

# Create .pocket dir and download genesis.json and copy config.json and chains.json
mkdir -p ~/.pocket/config 
wget -P ~/.pocket/config/ https://raw.githubusercontent.com/pokt-network/pocket-network-genesis/master/testnet/genesis.json
cp ./config.json ~/.pocket/config/ 
cp ./chains.json ~/.pocket/config/ 


#Add ulimit increase




ls ~/.pocket/config
