#!/bin/bash
if [ ! -e lede-17.01.1-ramips-mt7621-wndr3700v5-squashfs-sysupgrade.bin ]; then
	wget https://downloads.lede-project.org/releases/17.01.1/targets/ramips/mt7621/lede-17.01.1-ramips-mt7621-wndr3700v5-squashfs-sysupgrade.bin
fi

if [ ! -e WNDR3700v5_V1.0.0.17_src.tar.gz.zip ]; then
	wget http://www.downloads.netgear.com/files/GPL/WNDR3700v5_V1.0.0.17_src.tar.gz.zip
fi

sha1sum -c *.sha1

if [ ! -e WNDR3700v5-firmware ]; then
	git clone https://github.com/Vic063/WNDR3700v5-firmware.git
fi

cd WNDR3700v5-firmware
# newer version probably work but it's the one I've used (latest one when I built my firmware)
git checkout 3e309e2c3064e55f07d7384a555e262b0d503de4
cd ..
