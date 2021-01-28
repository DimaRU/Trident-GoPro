# Use GoPro official Android app with Trident Drone.


1. First, connect to Trident Drone, use Trident Cockpit android app:
[![GoPro](Screenshots/Screenshot_20200831-165401_Sofar_Trident.jpg)](#)
2. Connect your GoPro to the Tridrent Drone onboard WiFi:
[![GoPro](Screenshots/Screenshot_20210127-172354_Sofar_Trident.jpg)](#)
3. Open WiFi connections menu, tap to Trident connection:
[![GoPro](Screenshots/Screenshot_20210127-174501_One_UI_Home.jpg)](#)
4. Tap to `Advanced` setting:
[![GoPro](Screenshots/Screenshot_20210127-172910_Settings.jpg)](#)
5. Change connection type from `DHCP` to `Static`:
[![GoPro](Screenshots/Screenshot_20210127-172941_Settings.jpg)](#)
6. Change `Gateway` from `10.1.1.1` to `1.1.1.243`:
[![GoPro](Screenshots/Screenshot_20210127-173039_Settings.jpg)](#)
7. Download [gopro.sh](gopro.sh) script to the Trident drone using sftp.
8. Enter Trident shell by ssh, use `OpenROV` password:
&nbsp;
```bash
ssh rov@10.1.1.243
```
9. Make it executable and execute it:
&nbsp;
```bash
chmod +x gopro.sh
sudo gopro.sh
```
10. Then you may use offical GoPro app to control your camera:
[![GoPro](Screenshots/Screenshot_20210127-173215_GoPro.jpg)](#)
