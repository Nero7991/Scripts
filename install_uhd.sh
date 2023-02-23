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


# Any working directory can be chosen as per choice like '/' or '/home' etc

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
sudo cd /usr/local/src/uhd/ && git checkout v4.1.0.6
sudo mkdir -p /usr/local/src/uhd/host/build
cd /usr/local/src/uhd/host/build
sudo cmake .. -DENABLE_PYTHON3=ON -DUHD_RELEASE_MODE=release -DCMAKE_INSTALL_PREFIX=/usr
sudo make -j $(nproc)
sudo make install
uhd_images_downloader

sudo apt update