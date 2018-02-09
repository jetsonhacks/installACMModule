# installACMModule
MIT License

Copyright (c) 2017-2018 Jetsonhacks

There are scripts in this repository which install USB kernel modules which are not in the L4T 28.1 build. The modules:

<ul><li>cdc-acm</li>
<li>cp210x</li>
<li>ch341</li>
</ul>

<h2>cdc-acm kernel module</h2>
Install the CDC ACM Module for the Jetson TX1 or Jetson TX2 Development Kit

This script adds a module for USB Host functions to support Communication Device Class (CDC) Abstract Control Module (ACM) USB Devices.

Typically these USB devices report as ttyACM* (where * is an integer). ACM devices have a lineage that goes back to modems and other network types of devices. However, many USB devices (such as an Arduino) are implemented using this simple USB protocol. The stock L4T 28.1 kernel does not have a CDC ACM module built in to the kernel, or as a separate module. This script adds cdc-acm.ko as a module so that such devices can be accessed through ttyACM*.

To install:

$ sudo ./installCDCACM.sh

<h2>cp210x USB to serial converter</h2>
This script install the CP210x USB to serial converter module. There are several different types of USB to serial converters (FTDI is built into the L4T 28.1 kernel), the CP210x is used by devices such as the RP-LIDAR products

<h2>ch341</h2>
This script install the CH-341 USB to serial converter module. There are several different types of USB to serial converters (FTDI is built into the L4T 28.1 kernel), this is the CH-341 which is used by many Arduino clones.


<h2>Notes</h2>
These scripts expect a stock kernel, kernel version 4.4.38-tegra

More than likely, you will need to replug the USB device for it to be detected properly after installing the kernel module.

These scripts check the version magic of the module and compares it to the kernel version running on the machine. If the two do not match, the user is asked if they still want to continue the installation. If the two match, the module is installed.

Note that on a version mismatch, the user can still install the module. However, some extra steps may be needed after the installation to get the module installed fully. The steps are not covered here, but should be readily available elsewhere.

These scripts are for L4T 28.1. L4T version 28.2 includes cp210x and cdc-acm modules.

<h2>Release Notes</h2>
<h3>February, 2018</h3>
Add cp210x and ch341 modules and install scripts

<h3>November, 2017</h3>
Initial Release


 
