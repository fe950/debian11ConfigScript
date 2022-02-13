#  Configuration script for Debian 11 to create a minimalistic machine ready configured with Xfce desktop.
Suited for Vm or Desktop use.



### Options 
- update_system
- configures norwegian time and date format
- remove_grub_delay from 5 to 1 sec.
- install_Xfce (xfdesktop4 xfce4-settings xfce4-panel xfwm4, xfce4-session)
- install optional Xfce tools (Mousepad Gigolo garcon xfce4-datetime-plugin)
- install_firewall (ufw  gufw)  (need manual activation incase ssh,start with "enable ufw")
- install_basic debian apps (curl man-db manpages dnsutils mc lynx nmap baobab nethogs ark okular gwenview git xeyes)
- install common desktop tools (gimp, vlc gparted, ffmpeg, wireshark, geogebra, librecad, obs studio)
- installs qbittorrent
- configuration of terminal (aliases and nano as preselected editor)
 -install minimalistic browser (qutebrowser and python3)
- install python (python3 and pip)
- install_firefox (firefox-esr with optional extension-ublock-origin and configuration)
-Snap
- Spotify (installed with snap
- installs Mullvad Vpn client (direct download from Mullvad)
- removes software (only xeyes)
- reboot


### HowTo
 1. Download Debian 11 netinstall https://www.debian.org/download 
 2. Install Debian without any packages or window managers.
 3. Login, and fix the issue that debian dont support sudo out of the box. (replace joe with username)
```
su -
usermod -aG sudo joe
```
4.install wget and download script and give it permission to run
 ```
su
apt install wget -y && wget https://raw.githubusercontent.com/fe950/debian11/main/easy_debian11.sh && chmod +x easy_debian11.sh
usermod -aG sudo YOUR_USERNAME
exit
```
5. Review and make changes to fit your needs.
```
cat script.sh
```
6. Run script
```
./easy_debian11.sh

```


### TODO
- Fix sudo 
- Change Dns server to 1.1.1.1
- Automatic innstallation av pub og private ssh keys
- Cryptomator or simular
- rsync or simular client to Onedrive, google Drive
- Configure Sambashare
- Nvidia driver installation
- Debian Hardening
- flatpack
- tor browser
