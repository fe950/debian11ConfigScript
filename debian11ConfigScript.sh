#!/bin/bash

#if root stop
if ! [ "$EUID" -ne 0 ] ; then
    echo "Dont run as root, use sudo."
    exit
fi

#install sudo if not already installed, NOT WORKING
if ! hash sudo 2>/dev/null; then
    echo "installing sudo"
    su -c "apt install sudo ; echo '$USER ALL=(ALL:ALL) ALL' | sudo EDITOR='tee -a' visudo"
fi


answer_yes_to_everything_and_run_unattended() {
    update_system
    remove_grub_delay
    change_locales
    install_firewall
    install_xfce
    install_basic_packages
    install_packages_for_desktop
    configure_terminal
    install_mullvad
    remove_apps
    set_dns_to_cloudflare
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
install_firewall() {
    #Firewall needs to be enabled manually after reboot
    sudo apt -qq install ufw gufw -y
}
install_xfce() {
    sudo apt -qq install xfdesktop4 xfce4-settings xfce4-panel xfwm4 xfce4-session xfce4-terminal thunar -y
}
install_basic_packages() {
    sudo apt -qq install curl dnsutils net-tools tcpdump mc lynx man nmap nethogs viewnior git falkon python3 python3-pip mousepad gigolo xfce4-datetime-plugin tree -y   
}
install_packages_for_desktop() {
    sudo apt -qq install gimp vlc gparted geogebra librecad -y
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
configure_terminal() {
    #root terminal
    echo "alias tid='date "+%T"'" | sudo tee -a /root/.bashrc > /dev/null
    echo "alias klocka='date "+%T"'" | sudo tee -a /root/.bashrc > /dev/null
    echo "alias klockan='date "+%T"'" | sudo tee -a /root/.bashrc > /dev/null
    echo "alias ll='ls -alF'" | sudo tee -a /root/.bashrc > /dev/null
    echo "alias la='ls -A'" | sudo tee -a /root/.bashrc > /dev/null
    echo "alias l='ls -CF'" | sudo tee -a /root/.bashrc > /dev/null
    echo 'SELECTED_EDITOR="/bin/nano"' | sudo tee /root/.selected_editor > /dev/null
    #user terminal
    echo "alias tid='date "+%T"'" >> ~/.bashrc
    echo "alias klocka='date "+%T"'" >> ~/.bashrc
    echo "alias klockan='date "+%T"'" >> ~/.bashrc
    echo "alias ll='ls -alF'" >> ~/.bashrc
    echo "alias la='ls -A'" >> ~/.bashrc
    echo "alias l='ls -CF'" >> ~/.bashrc
    echo 'SELECTED_EDITOR="/bin/nano"' >> ~/.selected_editor
}
set_dns_to_cloudflare() {
    #Set dns server to cloudflare
    echo "nameserver 1.1.1.1" | sudo tee /etc/resolv.conf > /dev/null
}
reboot() { 
    echo""
    echo "Everything is done"
    echo""
    echo " Please reboot now"
    exit
}


functions_array=(
    answer_yes_to_everything_and_run_unattended
    update_system
    remove_grub_delay
    change_locales
    install_firewall
    install_xfce
    install_basic_packages
    install_packages_for_desktop
    install_mullvad
    remove_apps
    configure_terminal
    set_dns_to_cloudflare
    reboot
    )
if [[ " $# " -ne 0 ]]; then
    for i in $@
    do
        if [[ " ${functions_array[@]} " =~ " ${i} " ]]; then
            echo "Option ${i} valid"
            ${i} #exec function
        else
            echo "Unknown option ${i}"
        fi
    done
else
    for i in "${functions_array[@]}"; do
        formatted1=${i//_/ }
        formatted2=${formatted1^}
        echo -n "${formatted2^} (y/n)? "
        read answer
        if [ "$answer" != "${answer#[Yy]}" ] ;then
            ${i}
        fi
    done
fi
