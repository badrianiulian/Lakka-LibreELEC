# Lakka - The DIY retro emulation console

Lakka is a lightweight Linux distribution that transforms a small computer into a full blown emulation console.

* **Powerful** - Built on top of the famous RetroArch emulator, Lakka is able to emulate a large range of hardware and has some useful features such as Braid-like rewinding, joypad hotplug and video streaming.
* **User friendly** - Lakka is easy to setup and use. Once installed to your SD card, you just have to put your rom on the card, plug your joypad and enjoy your favorite old games.
* **Low cost** - The hardware required to run Lakka cost only $35. We also support PS3 and XBox360 controllers so you don't have to buy new ones. The power can be supplied by any micro USB adapter like the one of your smartphone.
* **Open source** - Our code is free as in freedom and hosted on Github. We accept external contributions, and we do our best to integrate our own patches into upstream projects.

## Notes on this version (v2.1-bananapro)
This version was originally built by libretro user mh287 for the Banana Pi M1 SBC.\
The original post can be found [here](https://forums.libretro.com/t/lakka-image-for-banana-pi-m1/32244).\
All I did was to modify the Bananapi project into Bananapro for the Banana Pi Pro SBC.\
I used the original [linux-sunxi](https://github.com/LeMaker/linux-sunxi) kernel provided by LeMaker to make the ap6210 driver/original script.fex work with mh287's modified version of Lakka.\
Also had to modify some files for the project to compile as instructed in this [issue thread](https://github.com/asdf288/Lakka-LibreELEC/issues/2).\
WiFi scans for available access points but does not connect from RetroArch.\
You will have to manually connect using ssh on the Ethernet port: start `connmanctl` and go through these commands:\
`agent on` (it's a must)\
`enable wifi` (not quite necessary since it results in `Error wifi: Already enabled`)\
`scan wifi` (get available access points)\
`services` (show available access points)\
`connect wifi_xxxxxxxxxxx_managed_psk` (connect to your desired access point and enter the password)\
I'm no expert but I do enjoy learning new things.\

## Installation instructions

Please refer to our website http://www.lakka.tv/get on how to setup Lakka.

## Support

* [FAQ](https://github.com/lakkatv/Lakka/wiki/FAQ)
* #lakkatv on irc.freenode.org
* [Forums](https://forums.libretro.com/c/libretro/lakka-tv-general)
* contact@lakka.tv
