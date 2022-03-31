#  Debian 11 Congig Script
This will help you build a lightweight desktop or headless server with unattended  onfiguration of software based on a minimal debian 11 netinstall. Easy to change to your needs.
<br/>
Choose between 3 templates without user interaction.<br/>
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
- Headless Server +
- vpn client `mullvad`
- small browser `Falcon`
- editor `mousepad`
- mount helper `gigolo`
- image viewer `viewnior`
- firewall `ufw  gufw`

### Desktop use
- Headless Server and Minimal Xfce +
- `brave-browser`
- more packages `gimp, vlc, gparted, geogebra and librecad`
<br/>

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
<br/><br/>

# Note:
 If script runs more then once, multiple rows is created in the files<br/> 
.bashrc<br/>
/root/.bashrc<br/>
/etc/lokales.gen<br/>
To avoid that, script is renames to `deb11_cs-HAS_ALREADY_RUN-RENAME_TO_RUN_AGAIN.sh`
<br/><br/>

# TODO 
Flaws
- Can only be run once (check last lines before edit locales and bashrc)
- Sudo can timeout if downloads are slow.<br/> 
  Instead run script as sudo and use sudo to user inside script when needed.
<br/>
Functionality<br/>
- Add ssh keys (option to paste key)<br/>
- Add options for Debian Hardening<br/>
- Mount network drives
- [Customize Xfce Menu](https://www.internalpointers.com/post/add-new-menu-items-xfce-menu)
- [Schrink XFCE install](https://www.devuan.org/os/documentation/dev1fanboy/en/minimal-xfce-install.html)
<br/>
Software to be added
- tor browser
- Cryptomator
- Gui for rsync or simular client to Onedrive, google Drive, etc.
- Smbshare
- Nvidia and Amd gpu driver
- flatpack ?


<br/>
Problemeatic Software
- wireshark (is interupted by a dialog)
- Add launcher to nethogs in menu as non root user
- Configure qbittorrent so it only bind to vpn interface
- Spotify
<br/>


