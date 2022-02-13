#  Configuration script for Debian 11 that creates a minimalistic machine ready configured with Xfce desktop.
Suited for VM or Desktop use.

Can be run unattended if the answer is Yes to first question.
If not, you will be asked about all options.


### Options 
- answer_Yes_to_Everything_and_run_Unattended
- update_system
- configures norwegian time and date format
- remove_grub_delay from 5 to 1 sec.
- install_Xfce bare minimum
- install optional Xfce tools (Mousepad Gigolo garcon xfce4-datetime-plugin)
- install_firewall (ufw  gufw)  (need manual activation in case ssh,start with "enable ufw")
- install_basic debian apps (curl, man-db, manpages, dnsutils, net-tools, tcpdump, mc, lynx, nmap, nethogs, viewnior, git)
- install common desktop tools (gimp, vlc gparted, ffmpeg, wireshark, geogebra, librecad, obs studio)
- configer terminal (aliases and nano as preselected editor)
- option to set setuid on nethogs ( this is considered insecure by debian, use at your own risk)
 -install minimalistic browser (qutebrowser)
- install python
- install_firefox
 -installs Snap
- installs Spotify (snap)
- installs Mullvad Vpn client (direct download from Mullvad)
- remove software (the small package "tree" is removed as a test)

### HowTo
 1. Download Debian 11 netinstall https://www.debian.org/download 
 2. Install Debian without any packages or window managers. (ssh_server is ok)
 3. Login, and fix the issue that debian dont support sudo out of the box. (replace joe with your username), Reboot
```
su -
usermod -aG sudo joe
/sbin/reboot
```

4.Install wget, download script and give it permission to run
 ```
sudo apt install wget -y && wget https://github.com/fe950/debian11ConfigScript/blob/main/debian11ConfigScript.sh && chmod +x debian11ConfigScript.sh
```
5. Review and make changes that fit your needs.
```
cat debian11ConfigScript.sh
```
6. Run script
```
./debian11ConfigScript.sh

```


### TODO
- Fix sudo 
- Option to install a unattended VM light, a VM ultra light and a deskotop version
- Change Dns server to 1.1.1.1
- Add launcher to nethogs in menu
- installs qbittorrent that only works on Mullvad
- Automatic innstallation av pub og private ssh keys
- rsync or simular client to Onedrive, google Drive
- Configure Sambashare
- Nvidia driver installation
- Debian Hardening
- flatpack
- tor browser
- Cryptomator or simular
