#!/bin/bash

INSTALLDIR=$(pwd)

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
rm ~/.pocket/config/genesis.json
wget -P ~/.pocket/config/ https://raw.githubusercontent.com/pokt-network/pocket-network-genesis/master/testnet/genesis.json
cp $INSTALLDIR/config.json ~/.pocket/config/ 
cp $INSTALLDIR/chains.json ~/.pocket/config/ 

#Add ulimit increase

ls ~/.pocket/config

echo "POCKET INSTALLED - Continue Here: https://docs.pokt.network/docs/create-validator-node"

#TO DO NGINX CONFIG
#TO DO SSL CERT
