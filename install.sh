#!/bin/bash
# fedora-scripts
# This is free software, and you are welcome to redistribute it
# under certain conditions
# Licensed under GPLv3 License


#PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin
HEIGHT=20
WIDTH=90
CHOICE_HEIGHT=4
BACKTITLE="Ubuntu 20.04 - 22.04 Post-Install - By Franco Lopez - https://github.com/solosoyfranco"
TITLE="Make a selection"
MENU="Please choose one of the following options:"


#Check to see if Dialog is installed, if not install it
if [ $(deb -q dialog 2>/dev/null | grep -c "is not installed") -eq 1 ]; then
sudo apt install -y dialog
fi

OPTIONS=(1  "System Update"
         2  "Enable Flatpak, Tweaks, Media Codecs, Extensions & Extras"
         3  "Swappiness - 10"
         4  "Appearance Tweaks - Flat GTK and Icon Theme"
         5  "Install Nvidia Drivers"
         6  "Install KVM virtualization software"
         7  "Enable Better Fonts - Better font rendering"
         8  "Install Common Software - Installs a bunch of my most used software"
         9  "Install DisplayLink Dock (d3100)"
         10 "Install Oh-My-ZSH w pl10k"
         11 "Reboot"
         12 "Quit")

while [ "$CHOICE -ne 4" ]; do
    CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --nocancel \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

    clear
    case $CHOICE in
        1)
            echo "System Update"
            sudo apt update && sudo apt upgrade
            sudo apt autoremove
            notify-send "Option 1 - system update" --expire-time=10
            ;;
        2)
            echo "Enable Flatpak, Tweaks, Media Codecs, Extensions & Extras"
            ##\
            sudo apt update
            sudo apt install -y gnome-shell-extensions gnome-tweaks snapd flatpak gnome-software-plugin-flatpak ubuntu-restricted-extras libdvd-pkg ubuntu-restricted-addons synaptic git curl wget gnome-shell-extension-appindicator blueman neofetch apt-transport-https p7zip p7zip-full unzip rar unrar p7zip-rar gparted clang cmake ubuntu-cleaner tree htop gnome-sushi gpg
            sudo snap install btop
            sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
            notify-send "Option 2 - tweaks" --expire-time=10
            ;;
        3)  echo "Swappiness - 10"
            #####
            #####cat /proc/sys/vm/swappiness 
            #sudo nano /etc/sysctl.conf
            # vm.swappiness=10 ### add at the end
            ####
            notify-send "Option 3 - Swappiness - 10"--expire-time=10
            ;;
        4)  echo "Appearance Tweaks - Flat GTK and Icon Theme"
            sudo add-apt-repository ppa:daniruiz/flat-remix
            sudo apt install -y gnome-shell-extension-user-theme flat-remix-gtk flat-remix paper-icon-theme flat-remix-icon-theme flat-remix-theme 
            gnome-extensions install user-theme@gnome-shell-extensions.gcampax.github.com
            gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
            gsettings set org.gnome.desktop.interface gtk-theme "Flat-Remix-GTK-Blue-Dark-Solid"
            gsettings set org.gnome.desktop.wm.preferences theme "Flat-Remix-Blue"
            gsettings set org.gnome.desktop.interface icon-theme 'Flat-Remix-Blue'
            gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
            gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
            notify-send "Option 4 - There you go, that's better" --expire-time=10
            ;;
        5)  echo "Nvidia drivers"
            modinfo -F version nvidia
            sudo add-apt-repository ppa:graphics-drivers/ppa
            sudo apt update -y # and reboot if you are not on the latest kernel
            sudo ubuntu-drivers autoinstall
            ubuntu-drivers devices
            sudo apt install -y nvidia-driver-510
            notify-send "Option 5 - Nvidia Drivers" --expire-time=10
            ;;
        6)  echo "KVM virtualization software"
            sudo apt install -y qemu qemu-kvm libvirt-daemon libvirt-clients bridge-utils virt-manager
            sudo systemctl enable --now libvirtd
            notify-send "Option 6 - fKVM installed" --expire-time=10            
            ;;
        7)  echo "Enabling Better Fonts"
            ## need to work on this
            # sudo -s apt -y copr enable dawid/better_fonts
            # sudo -s apt install -y fontconfig-font-replacements
            # sudo -s apt install -y fontconfig-enhanced-defaults
            notify-send "Option 7 - Fonts prettified - enjoy!" --expire-time=10
            ;;
        8)  echo "Installing Software"
            #necessary software
            sudo flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
            sudo apt install -y apt-transport-https git gpg curl wget fonts-noto libxss1 libindicator7 ttf-mscorefonts-installer
            #notion repo
            echo "deb [trusted=yes] https://apt.fury.io/notion-repackaged/ /" | sudo tee /etc/apt/sources.list.d/notion-repackaged.list
            #VSC repo
            wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
            sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
            sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
            rm -f packages.microsoft.gpg
            #microsoft edge repo
            curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
            sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
            sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-stable.list'
            sudo rm microsoft.gpg
            #brave repo
            sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
            echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
            #microsoft teams repo
            curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
            sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list'
            #remmina repo
            sudo apt-add-repository ppa:remmina-ppa-team/remmina-next
            
            #install discord
            sudo flatpak install -y flathub com.discordapp.Discord
            #spotify 
            sudo flatpak install -y flathub com.spotify.Client
            #Gimp
            sudo flatpak install -y flathub org.gimp.GIMP
            #network displays
            sudo flatpak install -y flathub org.gnome.NetworkDisplays
            #evolution email
            sudo flatpak install -y flathub org.gnome.Evolution
            #inkscape
            sudo flatpak install -y flathub org.inkscape.Inkscape
            #Whatsapp
            sudo flatpak install -y flathub com.rtosta.zapzap
            #Filezilla
            sudo flatpak install -y flathub org.filezillaproject.Filezilla
            #parsec
            sudo flatpak install -y flathub com.parsecgaming.parsec
            #qbittorrent
            sudo flatpak install -y flathub org.qbittorrent.qBittorrent
            #thunderbild mail
            sudo flatpak install -y flathub org.mozilla.Thunderbird
            # Disk analyzer
            sudo flatpak install -y flathub org.gnome.baobab
            # Atom
            sudo flatpak install -y flathub io.atom.Atom
            #Pycharm pro
            sudo flatpak install -y flathub com.jetbrains.PyCharm-Professional
            # SQL client 
            sudo flatpak install -y flathub com.github.alecaddd.sequeler
            # Firmware
            sudo flatpak install -y flathub org.gnome.Firmware
            # Decoder 
            sudo flatpak install -y flathub com.belmoussaoui.Decoder
            #ultimaker cura 
            sudo flatpak install -y flathub com.ultimaker.cura
            #barrier
            sudo flatpak install -y flathub com.github.debauchee.barrier

            #Teamviewer
            wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb && sudo apt install -y ./teamviewer_amd64.deb
            # chrome
            wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo apt -f -y install ./google-chrome-stable_current_amd64.deb

            # install software
            sudo fc-cache -vr
            sudo apt-get check
            sudo apt update
            sudo apt install -y microsoft-edge-stable code teams brave-browser notion-app-enhanced remmina remmina-plugin-rdp remmina-plugin-secret gnome-shell-pomodoro vlc cmatrix prusa-slicer
            sudo apt autoremove
            notify-send "Option 8 - Software has been installed" --expire-time=10
            ;;
        9) echo "Install DisplayLink Dock (d3100)"
            #https://www.synaptics.com/products/displaylink-graphics/downloads/ubuntu
            
            notify-send "Option 9 - Done" --expire-time=10
            ;;
        10) echo "Installing Oh-My-Zsh"
            sudo apt install -y zsh fonts-powerline dconf-cli
            sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
            git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
            git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
            git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
            chsh -s /usr/bin/zsh
            sudo nano ~/.zshrc
            #ZSH_THEME="powerlevel10k/powerlevel10k"
            #plugins=(git docker python zsh-autosuggestions zsh-syntax-highlighting)
            #p10k configure
            notify-send "Option 11 - Oh-My-Zsh is ready to rock n roll" --expire-time=10
            ;;
        
        11)
            sudo systemctl reboot
            ;;
        12)
          exit 0
          ;;
    esac
done
