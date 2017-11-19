#!/bin/bash
# Install the cdc-acm module
# First, does the module version magic match the current kernel version?

MAGICVERSION=$(modinfo cdc-acm.ko | grep vermagic)
MODULEVERSION=$(echo $MAGICVERSION | cut -d " " -f 2)
KERNELVERSION=$(uname -r)
if [ "$MODULEVERSION" == "$KERNELVERSION" ]
then
  echo "Kernel and Module Versions Match"
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
  echo "$ sudo modprobe -f cdc-acm"
fi
# Install the cdc-acm module
sudo cp -v cdc-acm.ko /lib/modules/$(uname -r)/kernel/drivers/usb/class
sudo depmod -a
echo "Installed cdc-acm Module"


