
#!/bin/bash

#Set version variable
#XMRSTAK=xmr-stak-rx-1.0.5

# Download latest xmr-stak-rx
#wget https://github.com/fbmoose48/xmr-stak/archive/xmr-stak-rx-1.0.5.tar.gz
git clone https://github.com/fbmoose48/xmr-stak.git -b xmr-stak-rx

# Unpack TAR
tar -xvzf ~/xmr-stak-rx.tar.gz

# Move to /opt
sudo mv ~/xmr-stak-rx /opt/xmr-stak-rx

#Create build dir
sudo mkdir /opt/xmr-stak-rx/build

#Enter build dir
cd /opt/xmr-stak-rx/build

#Create makefile
sudo cmake ..

#Install
sudo make install

# Download service files
git https://github.com/fbmoose48/xmr-stak-systemd-service.git

# Unpack TAR
tar -xvzf ~/xmr-stak-systemd-service.tar.gz

# Create "./start-service.sh" in /opt/xmr-stak-rx/build/bin or other appropriate directory

sudo cp ./xmr-stak-systemd-service/start-service.sh /opt/xmr-stak-rx/build/bin

# Create "/etc/systemd/system/xmr-stak.service"

sudo cp ./xmr-stak-systemd-service/xmr-stak.service /etc/systemd/system/

# Provide necessary permissions to "start-service.sh"

sudo chmod 755 /opt/xmr-stak-rx/build/bin/start-service.sh

# Make "start-service.sh" executable

sudo chmod +x /opt/xmr-stak-rx/build/bin/start-service.sh

# Enable service

sudo systemctl enable xmr-stak.service

# Start service

sudo systemctl start xmr-stak.service

# Copy relevant files from previous release
#sudo cp /opt/xmr-stak/build/bin/amd.txt /opt/xmr-stak-1.0.5/build/bin/
#sudo cp /opt/xmr-stak/build/bin/config.txt /opt/xmr-stak-1.0.5/build/bin/
#sudo cp /opt/xmr-stak/build/bin/cpu.txt /opt/xmr-stak-1.0.5/build/bin/
#sudo cp /opt/xmr-stak/build/bin/pools.txt /opt/xmr-stak-1.0.5/build/bin/
#sudo cp /opt/xmr-stak/build/bin/start.sh /opt/xmr-stak-1.0.5/build/bin/
#sudo cp /opt/xmr-stak/build/bin/start-service.sh /opt/xmr-stak-1.0.5/build/bin/

# Run
#cd /opt/xmr-stak-1.0.5/build/bin
#sudo ./start.sh
