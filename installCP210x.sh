#!/bin/bash
# Install the CP210x module
# First, does the module version magic match the current kernel version?

MAGICVERSION=$(modinfo cp210x.ko | grep vermagic)
MODULEVERSION=$(echo $MAGICVERSION | cut -d " " -f 2)
KERNELVERSION=$(uname -r)
if [ "$MODULEVERSION" == "$KERNELVERSION" ]
then
  echo "Kernel and Module Versions Match; Installing ..."
else 
  echo "The Kernel version does not match the Module Version"
  echo "Kernel Version: " $KERNELVERSION
  echo "Module Version: " $MODULEVERSION
  while true; do
  read -p "Would you still like to install the module? [Y/n] " response
  case $response in
    [Yy]* ) break ;;
    [Nn]* ) exit;;
    * ) echo "Please answer Yes or no. " ;;
  esac
  done
  # The module version did not match the kernel version, but user selected to install anyway
  echo "You may have to force the module to be inserted, i.e.  "
  echo "$ sudo modprobe -f cp210x"
fi
# Install the cp210x module
# Make sure that the drivers/usb/serial directory exists
INSTALLDIRECTORY=/lib/modules/$(uname -r)/kernel/drivers/usb/serial
sudo mkdir -p "$INSTALLDIRECTORY" 
# Then copy over the module file
sudo cp -v cp210x.ko $INSTALLDIRECTORY
sudo depmod -a
echo "Installed cp210x Module"


