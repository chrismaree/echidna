#! /bin/bash

if [ -f $HOME/.local/bin/ghr ]; then
  exit 0
fi

if [ "$HOST_OS" = "Linux" ]; then
  ARCH="linux"
elif [ "$HOST_OS" = "macOS" ]; then
  ARCH="darwin"
fi

echo "Installing ghr"
URL="https://github.com/tcnksm/ghr/releases/download/v0.5.4/ghr_v0.5.4_${ARCH}_386.zip"
curl -L ${URL} > ghr.zip
mkdir -p "$HOME/.local/bin"
unzip ghr.zip -d "$HOME/.local/bin"
