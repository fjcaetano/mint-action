#! /bin/bash

VERSION=$1

if [[ ! $(which mint) ]]; then
  echo "Installing mint ${VERSION}"
  git clone https://github.com/yonaskolb/Mint.git
  cd Mint

  if [[ -z $VERSION ]]; then
    echo
    echo "## Version not provided"
    VERSION="$(git tag --sort=creatordate | tail -1)"
    echo "## Latest tag is ${VERSION}"
    echo
  fi

  echo
  echo "# Checking out tag ${VERSION}"
  git checkout "$VERSION"

  echo
  echo "# Installing Mint"
  make

  echo
  echo "# Cleaning up"
  cd ..
  rm -rf Mint
else
  echo "Mint already installed"
fi