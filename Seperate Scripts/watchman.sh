#!/bin/bash


# **********************************************************
#                           Wacthman                           #
# **********************************************************

apt-get install libtool
apt-get install m4
apt-get install automake
apt-get install libssl-dev
apt-get install checkinstall
apt-get install autotools-dev

git clone https://github.com/facebook/watchman.git
cd watchman
git checkout v4.9.0  # the latest stable release
./autogen.sh
./configure
 make
sudo make install

# Increasing limit for watchman
echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_user_watches && echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_queued_events && echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_user_instances && watchman shutdown-server && sudo sysctl -p



