#!/bin/bash

sudo apt-get update -y && apt-get install -y libleveldb-dev build-essential
sudo apt-get install golang-go -y
sudo apt-get install nginx -y
sudo apt-get install git -y


git clone https://github.com/pokt-network/pocket-core.git
cd pocket-core
git checkout tags/RC-0.4.3

which go
GOPATH=/usr/bin/go

go build -tags cleveldb -o /usr/bin/pocket ./app/cmd/pocket_core/main.go

mkdir -p .pocket/config && cd .pocket/config; curl -O https://raw.githubusercontent.com/pokt-network/pocket-network-genesis/master/testnet/genesis.json

curl -O https://raw.githubusercontent.com/pokt-network/pocket-network-genesis/master/testnet/genesis.json > ~/.pocket/config/genesis.json

#wget https://raw.githubusercontent.com/pokt-network/pocket-network-genesis/master/testnet/genesis.json -P ~/.pocket/config

cp ./config.json ~/.pocket/config/
cp ./chains.json ~/.pocket/config/

ls ~/.pocket/config
