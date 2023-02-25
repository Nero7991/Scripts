#!/bin/bash

{
# set the GitHub repository URL
REPO_URL="https://api.github.com/repos/ettusresearch/uhd/tags"

# fetch the tags and store them in a temporary file
curl -s $REPO_URL | grep '"name"' | cut -d '"' -f 4 > /tmp/tags.txt

# prompt the user to select a tag
echo "Please select a tag from the following list:"
select TAG in $(cat /tmp/tags.txt); do
  # set the UHD_COMMIT variable to the selected tag
  echo "Selected tag: $TAG"
  export UHD_COMMIT=$(curl -s https://api.github.com/repos/ettusresearch/uhd/git/refs/tags/$TAG | grep '"sha"' | cut -d '"' -f 4)
  echo "Commit hash: $UHD_COMMIT"
  break
done

# clean up the temporary file
rm /tmp/tags.txt

# Set UHD commit to determine the version to build and install and overwrite above tag selection

#v4.1.06
#export UHD_COMMIT=1a5b4fd

#4.0.0.0
#export UHD_COMMIT=90ce606

#3.15.0.0
#export UHD_COMMIT=aea0e2d

# Install security updates and required packages
sudo apt-get update
sudo apt-get -y install -q \
    build-essential \
    ccache \
    git \
    python3-dev \
    python3-pip \
    curl \
    gnome-terminal

# Install UHD dependencies
sudo apt-get -y install -q \
    libboost-all-dev \
    libusb-1.0-0-dev \
    libudev-dev \
    python3-mako \
    doxygen \
    python3-docutils \
    cmake \
    python3-requests \
    python3-numpy \
    dpdk \
    libdpdk-dev

sudo rm -rf /var/lib/apt/lists/*

sudo mkdir -p /usr/local/src
sudo git clone https://github.com/EttusResearch/uhd.git /usr/local/src/uhd
cd /usr/local/src/uhd/ && git checkout $UHD_COMMIT
sudo mkdir -p /usr/local/src/uhd/host/build
cd /usr/local/src/uhd/host/build
sudo cmake .. -DENABLE_PYTHON3=ON -DUHD_RELEASE_MODE=release -DCMAKE_INSTALL_PREFIX=/usr
sudo make -j $(nproc)
sudo make install
uhd_images_downloader

sudo apt update
} |& tee -a >(while read line; do echo "$(date "+%Y-%m-%d %H:%M:%S") $line"; done > uhd_install_output.txt)
