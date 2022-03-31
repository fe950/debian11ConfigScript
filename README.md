#  Configuration script for Debian 11 that creates a minimalistic machine ready configured with Xfce desktop.
For unattended configuration of configuration and software for  VM or Desktop use.

Option to choose between 3 template that install without user interaction.

1. headless server with only base tools and python installed
2- Like 1 + minimal Xfce desktop 
3. Full desktop version with more programs installed.

Can also be run in manual mode ther you are prompted for each option 



### HowTo
 1. Download Debian 11 netinstall https://www.debian.org/download 
 2. Install Debian without any packages or window managers. (ssh_server is ok)
 3. Login, and fix that you are not allow to sudo out of the box. (replace joe with your username), Reboot
```
su -
usermod -aG sudo joe
reboot
```

4. Clone and do the usual thing or just copy below to Install wget, download script and give it permission to run
 ```
sudo apt install wget -y && wget https://raw.githubusercontent.com/fe950/debian11ConfigScript/main/deb11_cs.sh && chmod +x deb11_cs.sh
```
5. Review and make changes that fit your needs.
```

6. Run script
```
./deb11_cs.sh

```
Note: If script is runnig more then once, multiple rows is created in the files 
.bashrc
/root/.bashrc
/etc/lokales.gen
 To prevent that, the script renames it self after first run.
Rename it back and clean the files in the end.


If Tor Browser is installed, only flatpack is installed.
Install Tor Browser manually with 
```
sudo flatpak run com.github.micahflee.torbrowser-launcher
```




`

### Headless server
- change startup delay in Grub from 5 to 1 sec.
- configures locales with norwegian time and date format
- basic packages (curl wget man dnsutils net-tools tcpdump mc lynx nmap nethogs and gir
- ption to remove packages
- configure terminal (aliases and nano as preselected editor)
- setDNS_toCloudflare

### With minimal Xfce Desktop environment
Like Headless server +
- minimal Xfce installation
- a small browser, Falcon, editor: mousepad helper for mounting: gigolo, image viewer: viewnior

### For Desktop use
Like Headless server+ minimal Xfce +
- Firewall (ufw  gufw) (not automaticly activated
- ullvad Vpn client (direct download from Mullvad)
- more packages: gimp, vlc gparted, geogebra, librecad






### TODO 

How to add new menu items to XFCE menu
https://www.internalpointers.com/post/add-new-menu-items-xfce-menu

Minimal XFCE install
https://www.devuan.org/os/documentation/dev1fanboy/en/minimal-xfce-install.html


Sed example edit inside config files
https://stackoverflow.com/questions/11245144/replace-whole-line-containing-a-string-using-sed

sublie text rsync
https://packagecontrol.io/packages/Rsync%20SSH

- Fix so script can be run more than once. 
- Fix so script can be run with sudo (risk for timeout if slow download speed)
- Add wireshark to packages, (install is interupted by a dialog)
- Add launcher to nethogs in menu as non root user
- Installs qbittorrent that only bind to Mullvad adapter
- Automatic installation ssh keys
- rsync or simular client to Onedrive, google Drive
- Smbshare
- Snapd and Spotify
- Nvidia driver installation
- Debian Hardening
- flatpack
- tor browser
- Cryptomator or simular
