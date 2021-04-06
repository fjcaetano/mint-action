#! /bin/bash

VERSION="$1"
PREFIX="/usr/local"
INSTALL_PATH="${PREFIX}/bin/${EXECUTABLE_NAME}"
BUILD_PATH=".build/release/mint"

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
  swift build --disable-sandbox -c release
	mkdir -p "${PREFIX}/bin"
	cp -f "${BUILD_PATH}" "${INSTALL_PATH}"

  echo
  echo "# Cleaning up"
  cd ..
  rm -rf Mint

  echo
  echo "# Checking installation and exiting"
  which mint
  exit $?
else
  echo "Mint already installed"
  exit 0
fi