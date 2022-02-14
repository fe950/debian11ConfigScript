#  Configuration script for Debian 11 that creates a minimalistic machine ready configured with Xfce desktop.
Suited for VM or Desktop use.

Can be run unattended if the answer is Yes to the first question.
If not, you will be asked before every option.


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
sudo apt install wget -y && wget https://raw.githubusercontent.com/fe950/debian11ConfigScript/main/debian11ConfigScript.sh && chmod +x debian11ConfigScript.sh
```
5. Review and make changes that fit your needs.
```
cat debian11ConfigScript.sh
```
6. Run script
```
./debian11ConfigScript.sh

```
### Options 
- answer_Yes_to_Everything_and_run_Unattended
- update_system
- change startup delay in Grub from 5 to 1 sec.
- configures locales with norwegian time and date format
- install firewall (ufw  gufw) (not automaticly activated)
- install minimal Xfce desktop
- install basic packages (curl dnsutils net-tools tcpdump mc lynx nmap nethogs viewnior git falkon python3 python3-pip mousepad gigolo garcon python)
- install packages for desktop (gimp, vlc gparted, geogebra, librecad)
- install Mullvad Vpn client (direct download from Mullvad)
- remove packages (the small package "tree" is removed as a test)
- configure terminal (aliases and nano as preselected editor)
- setDNS_toCloudflare






### TODO
- Fix sudo 
- Option to install a unattended VM light, a VM ultra light and a deskotop version
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
