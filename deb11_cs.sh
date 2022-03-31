#!/bin/bash 

#Renames the scriptfile after first run.
# This is to prevent the script from running multiple times.
# Nothing dangerous will happend, but for now you will end up with duplicate
# lines in eof in /etc/locale.gen, /root/.bashrc, and .bashrc.
# Just clean those files and you can runs script multiple times without problem.

mv "$0" deb11_cs-HAS_ALREADY_RUN-RENAME_TO_RUN_AGAIN.sh 


# Fancy Colours in script
#Colours 
RED=`tput setaf 1 && tput setab 7`
GREEN=`tput setaf 2`
NC=`tput sgr0`




# ------------------Yes or No function--------------------
# 
function askYesNo {
        QUESTION=$1
        DEFAULT=$2
        if [ "$DEFAULT" = true ]; then
                OPTIONS="[Y/n]"
                DEFAULT="y"
            else
                OPTIONS="[y/N]"
                DEFAULT="n"
        fi
        read -p "$QUESTION $OPTIONS " -n 1 -s -r INPUT
        INPUT=${INPUT:-${DEFAULT}}
        echo ${INPUT}
        if [[ "$INPUT" =~ ^[yY]$ ]]; then
            ANSWER=true
        else
            ANSWER=false
        fi
}
# --------------END Yes or No function---------------------




# ------------------Start Initial script-------------------
clear
echo ""
echo " #######################################################################################"
echo "  #                                                                                     #"
echo "   #                       Welcome to debian 11 config script                            #"
echo "    #                                                                                     #"
echo "   #                  https://github.com/fe950/debian11ConfigScript                      #"
echo "  #                                                                                     #"
echo " #                                                                                     #"
echo " #                        Licensed to.............well nothing...                     #"
echo "  #                       ....just be nice.                                            #"
echo "   #                                                                                     #"
echo "    #######################################################################################"
echo ""
sleep 1
askYesNo $GREEN"Do you want to start?"$NC true
DOIT=$ANSWER
if [ "$DOIT" = false ]; then
echo "Ok, exiting...."
sleep 1
exit
fi




# -------------START FUNCTIONS-----------------------------
only_basic_packages() {
    sudo apt -qq update && sudo apt -qq upgrade -y && sudo apt -qq full-upgrade -y
    sudo apt -qq install curl wget dnsutils net-tools tcpdump mc lynx man nmap nethogs tree python3 python3-pip -y
    # preconfigure git for use
    sudo apt -qq install git -y
    echo -e "[user]\n\temail = bill.gates@hotmail.com" > ~/.gitconfig
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
    sudo apt -qq install xfdesktop4 xfce4-settings xfce4-panel xfwm4 xfce4-session xfce4-terminal xfce4-datetime-plugin thunar mousepad viewnior falkon gigolo  -y
}
install_packages_for_desktop_use() {
    sudo apt -qq install gimp vlc gparted geogebra librecad -y
    #sudo apt -qq install firefox-esr -y
}
install_mullvad() {
    wget --content-disposition https://mullvad.net/download/app/deb/latest
    sudo apt install -y ./MullvadVPN*.deb
    sleep 1
    rm ./MullvadVPN*.deb
}
install_brave-nightly() {
    sudo apt install -qq apt-transport-https curl -y
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-nightly-archive-keyring.gpg https://brave-browser-apt-nightly.s3.brave.com/brave-browser-nightly-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-nightly-archive-keyring.gpg arch=amd64] https://brave-browser-apt-nightly.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-nightly.list
    sudo apt -qq update && sudo apt -qq install brave-browser-nightly -y
}
remove_apps() {
    sudo apt -qq remove example-app -y
}
configure_terminal() {
    #root terminal
    echo "alias cls='clear "+%T"'" | sudo tee -a /root/.bashrc > /dev/null
    echo "alias tid='date "+%T"'" | sudo tee -a /root/.bashrc > /dev/null
    echo "alias klocka='date "+%T"'" | sudo tee -a /root/.bashrc > /dev/null
    echo "alias klockan='date "+%T"'" | sudo tee -a /root/.bashrc > /dev/null
    echo "alias ll='ls -alF'" | sudo tee -a /root/.bashrc > /dev/null
    echo "alias la='ls -A'" | sudo tee -a /root/.bashrc > /dev/null
    echo "alias l='ls -CF'" | sudo tee -a /root/.bashrc > /dev/null
    echo 'SELECTED_EDITOR="/bin/nano"' | sudo tee /root/.selected_editor > /dev/null
    #user terminal
    echo "alias cls='clear "+%T"'" >> ~/.bashrc
    echo "alias tid='date "+%T"'" >> ~/.bashrc
    echo "alias klocka='date "+%T"'" >> ~/.bashrc
    echo "alias klockan='date "+%T"'" >> ~/.bashrc
    echo "alias ll='ls -alF'" >> ~/.bashrc
    echo "alias la='ls -A'" >> ~/.bashrc
    echo "alias l='ls -CF'" >> ~/.bashrc
    echo 'SELECTED_EDITOR="/bin/nano"' >> ~/.selected_editor
	rm -r Videos Templates Public Music Pictures
}
set_dns_to_cloudflare() {
    #Set dns server to cloudflare
    echo "nameserver 1.1.1.1" | sudo tee /etc/resolv.conf > /dev/null
}
stop_unattended_run() {
	rm .wget-hsts
    sudo apt -qq update && sudo apt -qq upgrade -y && sudo apt -qq full-upgrade -y && sudo apt -qq autoremove -y
      echo ""
      echo $GREEN"Everything is ready."$RED
      sudo /sbin/shutdown -r +1
      echo $NC""
      exit
}
# ----------------END -FUNCTIONS--------------------------




# -----START PRECONFIGURED MACHINES-----------------------

# Headless Server
install_headless_server_Unattended() {
    only_basic_packages
    remove_grub_delay
    change_locales
    configure_terminal
    #remove_apps
    set_dns_to_cloudflare
    stop_unattended_run 
}

#Basic with Xfce
install_minimal_desktop_Unattended() {
    only_basic_packages
    remove_grub_delay
    change_locales
    install_firewall
    install_xfce
    #install_packages_for_desktop_use
    configure_terminal
    #install_mullvad
	#install_brave-nightly
    remove_apps
    set_dns_to_cloudflare
    stop_unattended_run 
}

# Install for desktop with everything Included
install_everything_for_Desktop__Unattended() {
    only_basic_packages
    remove_grub_delay
    change_locales
    install_firewall
    install_xfce
    install_packages_for_desktop_use
    configure_terminal
    install_mullvad
    install_brave-nightly
    remove_apps
    set_dns_to_cloudflare
    stop_unattended_run 
}

#------------END PRECONFIGURED MACHINES-------------------




# -------START Array part, this control the order for manually use if not using templates ---------
functions_array=(
    install_headless_server_Unattended
    install_minimal_desktop_Unattended
    install_everything_for_Desktop__Unattended
    only_basic_packages
    remove_grub_delay
    change_locales
    install_firewall
    install_xfce
    install_packages_for_desktop_use
    configure_terminal
    install_mullvad
    install_brave-nightly
    remove_apps
    set_dns_to_cloudflare   
    )





# -------------------MAIN LOOP----------------------------
for i in "${functions_array[@]}"
        do
            sleep 1
            askYesNo $GREEN"Do you want to $i ?"$NC false
            DOIT=$ANSWER
            if [ "$DOIT" = true ]; then
            $i
            fi

        done



#Finish and reboot for manual runs
sudo apt -qq update && sudo apt -qq upgrade -y && sudo apt -qq full-upgrade -y && sudo apt -qq autoremove -y
echo ""

echo $GREEN"Ready, Finito, Redo, Klar..."
echo $RED"Please reboot now."$NC
askYesNo $RED"Do you want to reboot now?"$NC false
            DOIT=$ANSWER
            if [ "$DOIT" = true ]; then
            sudo /sbin/shutdown +0
            fi


exit