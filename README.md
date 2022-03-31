#  For unattended installation and configuring software in debian 11.


Easy to adapt to your needs

Choose between 3 templates without user interaction.








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
- Tor-browser Launcher

### For Desktop use
Like Headless server+ minimal Xfce +
- Firewall (ufw  gufw) (not automaticly activated
- Mullvad Vpn client (direct download from Mullvad)
- more packages: gimp, vlc gparted, geogebra, librecad
- Brave-browser instead of Falkon





## prerequisite and install
 1. Debian 11 netinstall with sshserver
 2. Fix Su and reboot
```
su -
usermod -aG sudo joe
reboot
```

3. Download and chmod
 ```
sudo apt install wget -y && wget https://raw.githubusercontent.com/fe950/debian11ConfigScript/main/deb11_cs.sh && chmod +x deb11_cs.sh
```
4. Review and run script

```
./deb11_cs.sh

```
Note: If script is runnig more then once, multiple rows is created in the files 
.bashrc
/root/.bashrc
/etc/lokales.gen
To prevent that, and to show that the machine is already configured
the script renames it self after 
first run to `deb11_cs-HAS_ALREADY_RUN-RENAME_TO_RUN_AGAIN.sh`



If Tor Browser is installed, only flatpack is installed.

Install `torbrowser-launcher` like this: 
```
flatpak install flathub com.github.micahflee.torbrowser-launcher -y
```
Run `torbrowser-launcher` either by using the GUI desktop launcher, or by running:
```
sudo flatpak run com.github.micahflee.torbrowser-launcher
```











### TODO 
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
- How to add new menu items to XFCE menu https://www.internalpointers.com/post/add-new-menu-items-xfce-menu
- Minimal XFCE install https://www.devuan.org/os/documentation/dev1fanboy/en/minimal-xfce-install.html
- Sed example edit inside config files https://stackoverflow.com/questions/11245144/replace-whole-line-containing-a-string-using-sed
- sublie text rsync https://packagecontrol.io/packages/Rsync%20SS
- Fix so script can be run more than once. 