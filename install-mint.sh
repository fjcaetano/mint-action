#! /bin/bash

VERSION="$1"
PREFIX="/usr/local"
INSTALL_PATH="${PREFIX}/bin/${EXECUTABLE_NAME}"
BUILD_PATH=".build/release/mint"
BUILD_LOG=/tmp/swift-build.log

if [[ ! $(which mint) ]]; then
  echo "# Installing Mint ${VERSION}"
  git clone https://github.com/yonaskolb/Mint.git
  cd Mint

  if [[ -z $VERSION ]]; then
    echo "## Version not provided"
    VERSION="$(git tag --sort=creatordate | tail -1)"
    echo "## Latest tag is ${VERSION}"
  fi

  echo "# Checking out tag ${VERSION}"
  git checkout "$VERSION" &> /dev/null

  echo "# Installing Mint"
  swift build --disable-sandbox -c release &> "${BUILD_LOG}"
  if [ $? -eq 0 ]; then
    mkdir -p "${PREFIX}/bin"
    cp -f "${BUILD_PATH}" "${INSTALL_PATH}"
  else
    echo "## Mint installation failed"
    cat "${BUILD_LOG}"
  fi

  echo "# Cleaning up"
  cd ..
  rm -rf Mint

  echo "# Checking installation and exiting"
  which mint
  exit $?
else
  echo "Mint already installed"
  exit 0
fi