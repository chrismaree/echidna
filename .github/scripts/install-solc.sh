#! /bin/bash

# Adapted from https://github.com/commercialhaskell/stack

set -eux

mkdir -p ~/.local/bin;

travis_retry() {
  cmd=$*
  $cmd || (sleep 2 && $cmd) || (sleep 10 && $cmd)
}

fetch_solc_linux() {
  rm -Rf solc-static-linux;
  wget https://github.com/ethereum/solidity/releases/download/v0.4.25/solc-static-linux;
  chmod +x solc-static-linux;
  mv solc-static-linux ~/.local/bin/solc-0.4.25;
  wget https://github.com/ethereum/solidity/releases/download/v0.5.7/solc-static-linux;
  chmod +x solc-static-linux;
  mv solc-static-linux ~/.local/bin/solc-0.5.7;
}

if [ "$HOST_OS" = "Linux" ]; then
  travis_retry fetch_solc_linux
fi
