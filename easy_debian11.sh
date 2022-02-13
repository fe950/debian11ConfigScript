#!/bin/bash
bold=`echo -en "\e[1m"`
purple=`echo -en "\e[35m"`
orange=`echo -en "\e[33m"`
red=`echo -en "\e[31m"`
green=`echo -en "\e[32m"`
lightblue=`echo -en "\e[94m"`
underline=`echo -en "\e[4m"`
normal=`echo -en "\e[0m"`
#if root stop
if ! [ "$EUID" -ne 0 ] ; then
    echo "${orange}Dont run as root.$normal"
    exit
fi
#install sudo if not already installed, NOT WORKING
if ! hash sudo 2>/dev/null; then
    echo "${purple}installing sudo$normal"
    su -c "apt install sudo ; echo '$USER ALL=(ALL:ALL) ALL' | sudo EDITOR='tee -a' visudo"
fi


Answer_Yes_to_Everything_and_run_Unattended() {
    update_system
    remove_grub_delaychange_locales
    install_xfce_core
    install_xfce_tools
    install_debian_basics_apps
    install_common_desktop_apps
    configure_terminal
    run_nethogs_as_root
    install_python3
    install_minimal_browser
    install_firefox
    install_spotify
    install_snap
    install_mullvad
    remove_apps
    reboot    
}

update_system() {
    sudo apt -qq update && sudo apt -qq upgrade -y && sudo apt -qq full-upgrade -y && sudo apt -qq autoremove -y
}
remove_grub_delay() {
    sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=1/' /etc/default/grub
    sudo update-grub
}
change_locales() {
    echo "nb_NO.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen > /dev/null
    sudo locale-gen
    sudo update-locale LC_TIME=nb_NO.UTF-8
}
# Xfce minimal install guide https://www.devuan.org/os/documentation/dev1fanboy/en/minimal-xfce-install.html
install_xfce_core() {
    sudo apt -qq install xfdesktop4 xfce4-settings xfce4-panel xfwm4 xfce4-session xfce4-terminal thunar -y
}
install_xfce_tools() {
    sudo apt -qq install Mousepad Gigolo garcon xfce4-datetime-plugin -y   
}
install_firewall() {
    #Firewall is not enabled, so you can run this from ssh. Remember to start with "enable ufw"
    sudo apt -qq install ufw gufw -y
}
install_debian_basics_apps() {
    sudo apt -qq install curl man-db manpages dnsutils net-tools tcpdump mc lynx nmap nethogs viewnior git tree -y
}
install_common_desktop_apps() {
    sudo apt -qq install gimp vlc gparted ffmpeg wireshark geogebra librecad obs-studio -y
}
configure_terminal() {
    #configure root terminal
    echo "alias tid='date "+%T"'" | sudo tee -a /root/.bashrc > /dev/null
    echo "alias klocka='date "+%T"'" | sudo tee -a /root/.bashrc > /dev/null
    echo "alias klockan='date "+%T"'" | sudo tee -a /root/.bashrc > /dev/null
    echo "alias ll='ls -alF'" | sudo tee -a /root/.bashrc > /dev/null
    echo "alias la='ls -A'" | sudo tee -a /root/.bashrc > /dev/null
    echo "alias l='ls -CF'" | sudo tee -a /root/.bashrc > /dev/null
    echo 'SELECTED_EDITOR="/bin/nano"' | sudo tee /root/.selected_editor > /dev/null
    #configure user terminal
    echo "alias tid='date "+%T"'" >> ~/.bashrc
    echo "alias klocka='date "+%T"'" >> ~/.bashrc
    echo "alias klockan='date "+%T"'" >> ~/.bashrc
    echo "alias ll='ls -alF'" >> ~/.bashrc
    echo "alias la='ls -A'" >> ~/.bashrc
    echo "alias l='ls -CF'" >> ~/.bashrc
    echo 'SELECTED_EDITOR="/bin/nano"' >> ~/.selected_editor
}  
run_nethogs_as_root() {
    #Allow to run nethogs as not root, Debian consider this unsecure, use at your own risk.
    echo sudo chmod u+s /sbin/nethogs
    echo "alias nethogs='/sbin/nethogs'" >> ~/.bashrc
}
install_python3() {
    sudo apt -qq install python3 pythin3-pip -y
}
install_minimal_browser() {
    echo ${red} "This will also install Python3"
    sudo apt -qq install qutebrowser -y
}
install_firefox() {
    sudo apt -qq install firefox-esr -y
    firefox-esr&
    sleep 5
    pkill -f firefox
    sleep 2
    install_firefox_plugins
    configure_firefox
 }   
install_firefox_plugins() {
    sudo apt -qq  webext-ublock-origin-firefox  -y
}    
configure_firefox() { 
    prefix="/home/$USER/.mozilla/firefox"
    suffix=".default-esr/"
    path=""
    for f in "${prefix}"/*"${suffix}"; do
        path="$f""user.js"
    done
    echo $path
    echo "user_pref(\"browser.contentblocking.category\",custom);
    user_pref(\"browser.privatebrowsing.autostart\", true);
    user_pref(\"browser.shell.checkDefaultBrowser\", true);
    user_pref(\"network.cookie.cookieBehavior\",1);
    user_pref(\"network.cookie.lifetimePolicy\",2);
    user_pref(\"privacy.donottrackheader.enabled\", true);
    user_pref(\"privacy.trackingprotection.enabled\", true);
    user_pref(\"privacy.trackingprotection.socialtracking.enabled\", true);
    user_pref(\"signon.rememberSignons\", false);
    " | sudo tee $path
}
install_spotify() {
    sudo apt -qq install snapd -y
    sudo snap install core
    sudo snap install spotify
}
install_snap() {
    sudo apt -qq install snapd -y
    sudo snap install core
}
install_mullvad() {
    wget --content-disposition https://mullvad.net/download/app/deb/latest
    sudo apt install -y ./MullvadVPN*.deb
    sleep 1
    rm ./MullvadVPN*.deb
}
remove_apps() {
    sudo apt -qq remove tree -y && sudo apt autoremove -y
}
reboot() { 
    sudo shutdown -r now
}

functions_array=(
    Answer_Yes_to_Everything_and_run_Unattended
    update_system
    remove_grub_delaychange_locales
    install_xfce_core
    install_xfce_tools
    install_debian_basics_apps
    install_common_desktop_apps
    configure_terminal
    run_nethogs_as_root
    install_python3
    install_minimal_browser
    install_firefox
    install_spotify
    install_snap
    install_mullvad
    remove_apps
    reboot
    )
if [[ " $# " -ne 0 ]]; then
    for i in $@
    do
        if [[ " ${functions_array[@]} " =~ " ${i} " ]]; then
            echo "${green}Option ${i} valid$normal"
            ${i} #exec function
        else
            echo "${red}Unknown option ${i}$normal"
        fi
    done
else
    for i in "${functions_array[@]}"; do
        formatted1=${i//_/ }
        formatted2=${formatted1^}
        echo -n "${purple}${formatted2^} (y/n)? $normal"
        read answer
        if [ "$answer" != "${answer#[Yy]}" ] ;then
            ${i}
        fi
    done
fi
