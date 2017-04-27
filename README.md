# wndr3700v5
This repository contains all information required to install openwrt/lede on Netgear N600/Wndr3700 v5. At the time of writing (04/27/2017), the factory image is not available for all users and only a sysupgrade file is available.

## Warning
The aim of this repository is to help people who wants to get LEDE on their WNDR3700v5 router. It comes with no guarentee (I have only tested it on my own router) and you're responsible of doing actions described here.

## Special thanks
I had a wndr3700v5 routers waiting for a long time in its box. By following the guidance of these guys (and their hard work), I've been able to use the full potential of this router.
* Markismus
* Francis

More details: https://forum.openwrt.org/viewtopic.php?id=56737&p=4

## Known issues
* I still have reliability issues with the WiFi 5Ghz (2.4G is working well)
* If you generate two times the factory image, you will get different sha1 for the file.
* For an unknown reason, after using this method to switch from original firmware to lede, router fs was coming back to default lede after each reboot. To solve this issue, I've just done a sysupgrade to the original firmware of lede and everything worked like a charm.

## Content of this repository
* build: all the scripts I've used to build the image available in the readytouse folder
* readytouse: image I've used to flash my own router


## How to use?
Two options are possible:
* Building your own factory image (I've only tested on a CentOs system)
  * Clone this repo
  * Execute 'make generate'
  * Files will be available in the folder 'build/final'
* Use the image available in this repository
  * Files are available in the folder 'readytouse'

Whatever the option you have chosen, you will get a lede-17.zip that you can use on the Netgear official firmware. You will probably warned that the 'new' firmware is older than the current one: just accept.
You might have issue with this version, please read the known issues section.

## How to contribute?
This repository will probably become useless in few months, once the factory image is officially available. Please feel free to contribute by adding issue.
