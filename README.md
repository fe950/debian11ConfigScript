#  Debian 11 Config Script
This will help you build a lightweight desktop or headless server with unattended configuration of software based on a minimal debian 11 netinstall.

Easy to change to your needs.
<br/><br/>
### Choose between 3 templates without user interaction. ###
- **Headless server**
    - change startup delay in Grub from 5 to 1 sec.
    - configures locales with `norwegian` time and date format
    - configure terminal aliases and nano as the preselected editor
    - set DNS to 1.1.1.1
    - option to remove packages
    - basic packages `python, curl, wget, man, dnsutils, net-tools, tcpdump, mc, lynx, nmap, nethogs, and git.`
 
- **Minimal Xfce Desktop environment**
    - **Headless Server +**
    - vpn client `mullvad`
    - small browser `Falcon`
    - editor `mousepad`
    - mount helper `gigolo`
    - image viewer `viewnior`
    - firewall `ufw  gufw`

- **Desktop use**
    - **Headless Server and Minimal Xfce +**
    - `brave-browser`
    - more packages `gimp, vlc, gparted, geogebra and librecad`

<br/><br/>



# Installation and use
 1. Install [debian 11 netinstall ](https://www.debian.org/CD/netinst/) without any additional software. Install ssh server if you need it.
 2. Fix Su and reboot
```
su -
apt install sudo
usermod -aG sudo yourusername
reboot
```

3. Download, review and edit so it fits you.
 ```
sudo apt install wget -y && wget https://raw.githubusercontent.com/fe950/debian11ConfigScript/main/deb11_cs.sh
```
4. Give it permission to run and start with this line:

```
chmod +x ./deb11_cs.sh && ./deb11_cs.sh
```
<br/>
<br/>
<br/>
<br/>
<br/>

## Note:
If script runs more then once, multiple rows is created in this files.

To avoid that, script renames it self to `deb11_cs-HAS_ALREADY_RUN-RENAME_TO_RUN_AGAIN.sh`

-  .bashrc
-  /root/.bashrc
-  /etc/lokales.gen


<br/>
<br/>
<br/>
<br/>
<br/>
<br/>

# TODO 
- **Flaws**
    - Can only be run once (use if statement)
    - Sudo can timeout if downloads are very slow (run as sudo and use sudo inside script to change to user when needed.
- **Functionality**
    - Add ssh keys (option to paste key)
    - Add options for Debian Hardening
    - Mount network drives
    - Customize Xfce Menu
    - Minimal XFCE install www.devuan.org/os/documentation/dev1fanboy/en/minimal-xfce-install.html
- **Software to be added**
    - tor browser
    - Cryptomator
    - Gui for rsync or simular client to Onedrive, google Drive, etc.
    - Smbshare
    - Nvidia and Amd gpu driver
    - flatpack ?
- **Problemeatic Software**
    - wireshark (is interupted by a dialog)
    - Add launcher to nethogs in menu as non root user
    - Configure qbittorrent so it only bind to vpn interface
    - Spotify



