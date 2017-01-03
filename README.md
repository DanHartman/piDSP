# Raspberry Pi S/PDIF DSP box
A playbook to provision a raspberry pi as a DSP box.  The original intent is to use it as an effects loop for a MOTU Ultralite.  Of course, it can be used with any device capable of S/PDIF connectivity.  You could use analog I/O for the PI but I already had a MOTU box and I speculate that it may have higher quality A/D and D/A than a readily availble Ras-Pi converter board would.

#### Requirements
-  [Raspberry Pi](https://www.amazon.com/Raspberry-Pi-RASP-PI-3-Model-Motherboard/dp/B01CD5VC92)
-  [S/PDIF Board](https://www.hifiberry.com/products/digiplus/)
-  [Additional PCB Mount RCA Jacks](https://www.hifiberry.com/shop/accessories/rca-jack-pcb-mount-1-pair/)
-  [0.1uF Ceramic Capacitor 0603 Package](http://www.digikey.com/product-detail/en/yageo/CC0603ZRY5V9BB104/311-1343-1-ND/2103127)
-  [75 ohm Chip Resistor 0603 Package](http://www.digikey.com/product-detail/en/yageo/RC0603JR-0775RL/311-75GRCT-ND/729774)
-  [Fresh Raspbian Install](https://www.raspberrypi.org/downloads/raspbian/)
-  ansible `sudo pip install ansible`
-  [Generate SSH keys if they don't already exist](https://help.github.com/articles/generating-an-ssh-key/)

#### Installation
-  You'll need to populate R15 with a `75 Ohm Resistor` && C9 with a `0.1uF Capacitor`
-  You'll need to solder one of the additional RCA Jacks to the S/PDIF Board
-  Insert SD Card into reader
-  `df -h` To find the mount path to the SDCARD ie: `/dev/sdb`
-  `umount /dev/card1` && `umount /dev/card2` etc as many partitions as there are
-  `unzip /path/to/raspbian-jessie.zip`
-  `sudo dd bs=4M if=/path/to/raspbian-jessie.img of=/dev/card`
-  [Enable SSH access](http://raspberrypi.stackexchange.com/a/58479) Remount the card && `touch /path/to/boot/ssh`
-  Insert card into PI and power up
-  connect pi to network && find ip of the ras pi
-  `ansible-playbook -i ras.pi.ip.addr, -u pi -k deploy/ansible/user.yml` default sudo password is `raspberry`
-  `ansible-playbook -i ras.pi.ip.addr, --ask-become-pass deploy/ansible/configure.yml` default sudo password is `123456`
-  `ssh ras.pi.ip.addr`
-  Set input as clock source: `amixer set 'Tx Source' 'S/PDIF RX'` && `sudo reboot` 
