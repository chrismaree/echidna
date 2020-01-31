#! /bin/bash

set -ex

if [ -f $HOME/.local/bin/ghr ]; then
  echo "found ghr, exiting..."
  exit 0
fi

VERSION="v0.13.0"
GITHUB="https://github.com/tcnksm/ghr/releases/download"

echo "Installing ghr"
mkdir -p "$HOME/.local/bin"
if [ "$HOST_OS" = "Linux" ]; then
  curl -L "${GITHUB}/${VERSION}/ghr_${VERSION}_linux_amd64.tar.gz" > ghr.tar.gz
  tar -C "$HOME/.local/bin" -xf ghr.tar.gz
elif [ "$HOST_OS" = "macOS" ]; then
  curl -L "${GITHUB}/${VERSION}/ghr_${VERSION}_darwin_amd64.tar.gz" > ghr.zip
  unzip ghr.zip -d "$HOME/.local/bin"
else
  echo "unknown host"
  exit 1
fi
