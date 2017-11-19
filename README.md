# installACMModule
MIT License

Copyright (c) 2017 Jetsonhacks

Install the CDC ACM Module for the Jetson TX1 or Jetson TX2 Development Kit

On the NVIDIA Jetson TX2 and Jetson TX1 Development Kits running L4T 28.1, this script adds a module for USB Host functions to support Communication Device Class (CDC) Abstract Control Module (ACM) USB Devices.

Typically these USB devices report as ttyACM* (where * is an integer). ACM devices have a lineage that goes back to modems and other network types of devices. However, many USB devices (such as an Arduino) are implemented using this simple USB protocol. The stock L4T 28.1 kernel does not have a CDC ACM module built in to the kernel, or as a separate module. This script adds cdc-acm.ko as a module so that such devices can be accessed through ttyACM*.

To install:

$ sudo ./installCDCACM.sh

The script checks the version magic of the module and compares it to the kernel version running on the machine. If the two do not match, the user is asked if they still want to continue the installation. If the two match, the module is installed.

Note that on a version mismatch, the user can still install the module. However, some extra steps may be needed after the installation to get the module installed fully. The steps are not covered here, but should be readily available elsewhere.

 
