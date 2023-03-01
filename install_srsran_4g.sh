#!/bin/bash

{
sudo apt update

sudo DEBIAN_FRONTEND=noninteractive apt install -y \
     build-essential \
     cmake libfftw3-dev \
     libmbedtls-dev \
     libboost-program-options-dev \
     libconfig++-dev \
     libsctp-dev \
     curl \
     iputils-ping \
     iproute2 \
     iptables \
     unzip \
     git \
     gcc-10 g++-10  \
     tmux
     
sudo update-alternatives --install /usr/bin/gcc gcc  /usr/bin/gcc-10 100 --slave /usr/bin/g++ g++ /usr/bin/g++-10 --slave /usr/bin/gcov gcov /usr/bin/gcov-10

sudo update-alternatives --config gcc

sudo rm -rf /var/lib/apt/lists/*

DIRPATH=~/github/
# Check if directory exists
if [ -d "$DIRPATH" ]; then
  echo "Directory already exists."
else
  # Create directory
  mkdir -p "$DIRPATH"
  echo "Directory created."
fi
# Pinned git commit used for this example
#22.04.1
#ARG COMMIT=ce8a3cae171f08c9bce83ae3611e56f2d168d073 

#21.10
COMMIT=254cc71  

cd "$DIRPATH"

if [ -f "srsRAN_4G" ]; then
    rm "srsRAN_4G"
    echo "Deleted srsRAN_4G"
else
    echo "srsRAN_4G not found"
fi

# Download and build
git clone https://github.com/srsran/srsRAN_4G
git fetch origin ${COMMIT}
git checkout ${COMMIT}

cd srsRAN_4G

# Get the current Git repository tag
TAG=$(sudo git describe --tags --abbrev=0)

# Get the current Git repository commit
COMMIT=$(sudo git rev-parse --short HEAD)

# Print the tag and commit
echo "Tag: $TAG"
echo "Commit: $COMMIT"
echo "Waiting 5 seconds... Exit (Ctrl-C) if not the correct srsRAN_4G version to be installed"

# Wait for 5 seconds
sleep 5

mkdir build
cd build

#!/bin/bash

# Prompt user for USRP type (or assume default as X310)
read -p "Enter USRP type (N310 or X310, press Enter for default): " usrp_type

# Check USRP type (or use default) and run cmake
if [ -z "$usrp_type" ]; then
  usrp_type="X310"
fi

if [ "$usrp_type" == "N310" ]; then
  cmake ../ -D USE_LTE_RATES=ON
elif [ "$usrp_type" == "X310" ]; then
  cmake ../
else
  echo "Invalid USRP type. Please enter N310 or X310."
fi

make -j$(nproc)
sudo make -j$(nproc) install
sudo srsran_install_configs.sh user

# Update dynamic linker
sudo apt-get update
sudo apt-get install net-tools -y
sudo apt-get install vim -y
sudo ldconfig

# delete the log file if exists
if [ -f "srsran_4g_install_output.txt" ]; then
    rm "srsran_4g_install_output.txt"
    echo "Deleted srsran_4g_install_output.txt"
else
    echo "srsran_4g_install_output.txt not found"
fi
} |& tee -a >(while read line; do echo "$(date "+%Y-%m-%d %H:%M:%S") $line"; done > srsran_4g_install_output.txt)
