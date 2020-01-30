#! /bin/bash

set -ex

source .github/scripts/host.sh

mkdir .github-cache

mv $HOME/.local/lib/libsecp256k1.a .github-cache/
mv $HOME/.local/lib/libff"$EXT" .github-cache/
