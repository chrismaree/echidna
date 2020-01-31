#! /bin/bash

set -ex

if [ -f $HOME/.local/bin/ghr ]; then
  echo "found ghr, exiting..."
  exit 0
fi

if [ "$HOST_OS" = "Linux" ]; then
  ARCH="linux"
elif [ "$HOST_OS" = "macOS" ]; then
  ARCH="darwin"
else
  echo "unknown host"
  exit 1
fi

VERSION="v0.13.0"

echo "Installing ghr"
URL="https://github.com/tcnksm/ghr/releases/download/${VERSION}/ghr_${VERSION}_${ARCH}_amd64.zip"
curl -L ${URL} > ghr.zip
mkdir -p "$HOME/.local/bin"
unzip ghr.zip -d "$HOME/.local/bin"
