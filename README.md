# Raspberry Pi S/PDIF DSP box
Requirements
-  [Raspberry Pi](https://www.amazon.com/Raspberry-Pi-RASP-PI-3-Model-Motherboard/dp/B01CD5VC92)
-  [S/PDIF Board](https://www.hifiberry.com/products/digiplus/)
-  [Additional PCB Mount RCA Jacks](https://www.hifiberry.com/shop/accessories/rca-jack-pcb-mount-1-pair/)
-  You'll need to solder one of the additional RCA Jacks to the S/PDIF Board
-  [Fresh Raspbian Install](https://www.raspberrypi.org/downloads/raspbian/)
-  Insert SD Card into reader
-  `df -h` To find the mount path to the SDCARD ie: `/dev/sdb`
-  `umount /dev/card1` && `umount /dev/card2` etc as many partitions as there are
-  `unzip /path/to/raspbian-jessie.zip`
-  `sudo dd bs=4M if=/path/to/raspbian-jessie.img of=/dev/card`