#!/bin/bash
echo "Delete previously generated final files"
rm final/*.bin
rm final/*.zip
rm final/*.img
echo "...done"

echo "Build the firmware tool"
echo "#################################################"
echo "Please enter '1.0.0.18' for the firmware version"
echo "#################################################"
echo "The current number of your device firmware doesn't have an importance since Netgear factory firmware enables to downgrade and upgrade"
cd WNDR3700v5-firmware/
rm WNDR3700v5-Firmware-tool
rm lede-17.01.1-ramips-mt7621-wndr3700v5-squashfs-sysupgrade.bin
g++ WNDR3700v5-Firmware/*.cpp -o WNDR3700v5-Firmware-tool
cp ../lede-17.01.1-ramips-mt7621-wndr3700v5-squashfs-sysupgrade.bin .
./WNDR3700v5-Firmware-tool lede-17.01.1-ramips-mt7621-wndr3700v5-squashfs-sysupgrade.bin 
cp lede-17.01.1-ramips-mt7621-wndr3700v5-squashfs-sysupgrade.bin ../final
cd ..
echo "...done"

echo "Unzip and untar WNDDR3700v5"
if [ ! -e WNDR3700v5_V1.0.0.17_src.tar.gz ]; then
	unzip WNDR3700v5_V1.0.0.17_src.tar.gz.zip
fi
if [ ! -e WNDR3700v5_V1.0.0.17_src ]; then
	tar zxvf  WNDR3700v5_V1.0.0.17_src.tar.gz
fi
echo "...done"

echo "Generating final image"
if [ ! -e final/zipImage-tool ]; then
	cd final
	ln -s ../WNDR3700v5_V1.0.0.17_src/image/tools/src/zipImage/zipImage zipImage-tool
	cd ..
fi
cd final
./zipImage-tool lede-17.01.1-ramips-mt7621-wndr3700v5-squashfs-sysupgrade.bin

echo "...done"

echo "Checking generated image"
sha1sum -c *.sha1

# remove previous symlink
rm -f final/zipImage-tool
