#! /bin/bash

set -ex

source .github/scripts/host.sh

mkdir .github-cache
mkdir -p $HOME/.local/lib

mv .github-cache/libsecp256k1.a $HOME/.local/lib
mv .github-cache/libff"$EXT" $HOME/.local/lib
