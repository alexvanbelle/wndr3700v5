#!/bin/bash
if [ ! -e lede-17.01.1-ramips-mt7621-wndr3700v5-squashfs-sysupgrade.bin ]; then
	wget https://downloads.lede-project.org/releases/17.01.1/targets/ramips/mt7621/lede-17.01.1-ramips-mt7621-wndr3700v5-squashfs-sysupgrade.bin
fi

if [ ! -e WNDR3700v5_V1.0.0.17_src.tar.gz.zip ]; then
	wget http://www.downloads.netgear.com/files/GPL/WNDR3700v5_V1.0.0.17_src.tar.gz.zip
fi

sha1sum -c *.sha1
