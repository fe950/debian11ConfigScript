#  Debian 11 Congig Script
This will help you build a lightweight desktop or headless server with unattended  onfiguration of software based on minimal debian 11 netinstall. Easy to change to your needs.

Use of Denian 11 Config Script:<br/>
- Choose between 3 templates without user interaction.<br/>
- Headless server<br/>
- Minimal Xfce Desktop environment<br/>
- Desktop use with more apps<br/>
<br/>

### Headless
- change startup delay in Grub from 5 to 1 sec.
- configures locales with `norwegian` time and date format
- configure terminal aliases and nano as the preselected editor
- set DNS to 1.1.1.1
- option to remove packages
- basic packages `python, curl, wget, man, dnsutils, net-tools, tcpdump, mc, lynx, nmap, nethogs, and git.`

### Minimal Xfce for VM
- vpn client `mullvad`
- small browser `Falcon`
- editor `mousepad`
- mount helper `gigolo`
- image viewer `viewnior`
- firewall `ufw  gufw` (not automaticly activated)

###Desktop use
- `brave-browser`
- more packages `gimp, vlc, gparted, geogebra and librecad`
.



# Installation and use
 1. Install debian 11 netinstall with sshserver
 2. Fix Su and reboot
```
su -
usermod -aG sudo yourusername
reboot
```

3. Download and chmod
 ```
sudo apt install wget -y && wget https://raw.githubusercontent.com/fe950/debian11ConfigScript/main/deb11_cs.sh && chmod +x deb11_cs.sh
```
4. Review and change script so it suits you and run it.

```
./deb11_cs.sh
```
,
,

#### Note:
 f script is runnig more then once, multiple rows is created in the files 
.bashrc
/root/.bashrc
/etc/lokales.gen
To prevent that, and to show that the machine is already configured
the script renames it self after 
first run to `deb11_cs-HAS_ALREADY_RUN-RENAME_TO_RUN_AGAIN.sh`
.
.






# TODO 
- Fix so script can be run with sudo (risk for timeout if slow download speed)
- Add wireshark to packages, (install is interupted by a dialog)
- Add launcher to nethogs in menu as non root user
- Installs qbittorrent and configure that only bind to Mullvad adapter
- Automatic installation ssh keys
- rsync or simular client to Onedrive, google Drive
- Smbshare
- Snapd and Spotify
- Nvidia driver installation
- Debian Hardening
- flatpack
- tor browser
- Cryptomator or simular
- {How to add new menu items to XFCE menu](https://www.internalpointers.com/post/add-new-menu-items-xfce-menu)
- [Minimal XFCE install](https://www.devuan.org/os/documentation/dev1fanboy/en/minimal-xfce-install.html)
- [Sed example edit inside config files](https://stackoverflow.com/questions/11245144/replace-whole-line-containing-a-string-using-sed)
- [sublie text rsync](https://packagecontrol.io/packages/Rsync%20SS)
- Fix so script can be run more than once. 