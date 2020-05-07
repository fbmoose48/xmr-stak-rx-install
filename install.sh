
#!/bin/bash

#Set version variable
#XMRSTAK=xmr-stak-rx-1.0.5

# Download latest xmr-stak-rx
wget https://github.com/fbmoose48/xmr-stak/archive/xmr-stak-rx-1.0.5.tar.gz

# Unpack TAR
tar -xvzf ~/xmr-stak-rx-1.0.5.tar.gz

# Move to /opt
sudo mv ~/xmr-stak-xmr-stak-rx-1.0.5 /opt/xmr-stak-1.0.5

#Create build dir
sudo mkdir /opt/xmr-stak-1.0.5/build

#Enter build dir
cd /opt/xmr-stak-1.0.5/build

#Create makefile
sudo cmake ..

#Install
sudo make install

# Copy relevant files from previous release
#sudo cp /opt/xmr-stak/build/bin/amd.txt /opt/xmr-stak-1.0.5/build/bin/
sudo cp /opt/xmr-stak/build/bin/config.txt /opt/xmr-stak-1.0.5/build/bin/
sudo cp /opt/xmr-stak/build/bin/cpu.txt /opt/xmr-stak-1.0.5/build/bin/
sudo cp /opt/xmr-stak/build/bin/pools.txt /opt/xmr-stak-1.0.5/build/bin/
sudo cp /opt/xmr-stak/build/bin/start.sh /opt/xmr-stak-1.0.5/build/bin/

# Run
cd /opt/xmr-stak-1.0.5/build/bin
sudo ./start.sh
