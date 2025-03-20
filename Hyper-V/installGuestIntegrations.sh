#!/bin/bash

echo "Did you activate the guest integrations tools first in the VM-settings?"
read -p "Press enter to continue."

# Add hv_modules to initramfs-tools modules.
sudo sh -c 'echo "hv_vmbus" >> /etc/initramfs-tools/modules'
sudo sh -c 'echo "hv_storvsc" >> /etc/initramfs-tools/modules'
sudo sh -c 'echo "hv_blkvsc" >> /etc/initramfs-tools/modules'
sudo sh -c 'echo "hv_netvsc" >> /etc/initramfs-tools/modules'

# Update the apt packages
sudo apt update

# Upgrade the apt packages
sudo apt -y upgrade

# Install the Hyper-V integration packages for Ubuntu
sudo apt -y install linux-virtual linux-cloud-tools-virtual linux-tools-virtual

# Update initramfs
sudo update-initramfs -u

# Reboot
read -p "Press enter to reboot."
sudo reboot

# Run the following command to ensure the LIS integration features are installed
# lsmod | grep hv
