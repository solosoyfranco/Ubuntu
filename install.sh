install minimal and add 3rd party
sudo apt update && sudo apt upgrade
sudo apt install gnome-shell-extensions
sudo apt autoremove
sudo apt install -y gnome-tweaks
sudo apt install snapd
sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.github.debauchee.barrier
sudo apt install ubuntu-restricted-extras
sudo apt install ubuntu-restricted-extras libdvd-pkg ubuntu-restricted-addons
sudo apt install rar unrar p7zip-full p7zip-rar
#cat /proc/sys/vm/swappiness
#sudo nano /etc/sysctl.conf
# vm.swappiness=10 ### add at the end
sudo apt install gnome-sushi
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
sudo apt-get install synaptic
sudo add-apt-repository ppa:gerardpuig/ppa
sudo apt-get update
sudo apt-get install ubuntu-cleaner
sudo apt install git
git clone https://github.com/vinceliuice/Orchis-theme.git
####https://github.com/daniruiz/Flat-Remix-GTK
sudo add-apt-repository ppa:daniruiz/flat-remix
sudo apt update
sudo apt install flat-remix-gtk
sudo add-apt-repository ppa:daniruiz/flat-remix
sudo apt update
sudo apt install flat-remix
https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Bold/complete/Hack%20Bold%20Nerd%20Font%20Complete%20Mono.ttf
sudo snap install curl
bash -c "$(curl -sLo- https://git.io/JvvDs)"
https://drasite.com/blog/Pimp%20my%20terminal
sudo apt  install tree
sudo snap install htop
sudo snap install btop
sudo apt install curl wget git
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
$ git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
nano ~/.zshrc
###ZSH_THEME="agnoster"
###ZSH_THEME="powerlevel10k/powerlevel10k"
###plugins=(git docker python zsh-autosuggestions zsh-syntax-highlighting)
source ~/.zshrc
#### https://www.tecmint.com/install-oh-my-zsh-in-ubuntu/
chsh -s /usr/bin/zsh
sudo apt-get install fonts-powerline
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
p10k configure
sudo apt-get install dconf-cli
git clone https://github.com/dracula/gnome-terminal
cd gnome-terminal
./install.sh
#https://medium.com/@satriajanaka09/setup-zsh-oh-my-zsh-powerlevel10k-on-ubuntu-20-04-c4a4052508fd




#spotify 
           sudo flatpak install -y flathub com.spotify.Client
            #Gimp
            sudo flatpak install -y flathub org.gimp.GIMP
            #network displays
            sudo flatpak install -y flathub org.gnome.NetworkDisplays
            #######evolution email
            #####sudo flatpak install -y flathub org.gnome.Evolution
            #agenda to do
            sudo flatpak install -y flathub com.github.dahenson.agenda
            
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
            #Teamviewer
            
            # Firmware
            sudo flatpak install -y flathub org.gnome.Firmware
            # Decoder 
            sudo flatpak install -y flathub com.belmoussaoui.Decoder
            #ultimaker cura 
            sudo flatpak install -y flathub com.ultimaker.cura
            
            sudo apt install -y gnome-extensions-app gnome-tweaks gnome-shell-extension-appindicator vlc mscore-fonts-all google-noto-sans-fonts neofetch cmatrix p7zip unzip gparted google-chrome-stable clang cmake microsoft-edge-stable code htop brave-browser notion-app-enhanced gnome-pomodoro prusa-slicer 
            
            dnfdragora
            teams
            blueman
            
            
            sudo apt install -y gnome-tweaks gnome-shell-extension-appindicator vlc neofetch cmatrix p7zip unzip gparted clang cmake prusa-slicer






########################



E: Unable to locate package gnome-extensions-app
sudo apt install ttf-mscorefonts-installer
sudo fc-cache -vr
sudo apt-get install fonts-noto
sudo apt-get install libxss1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
sudo apt -f install

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-stable.list'
sudo rm microsoft.gpg
sudo apt update && sudo apt install microsoft-edge-stable

sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install code

sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

echo "deb [trusted=yes] https://apt.fury.io/notion-repackaged/ /" | sudo tee /etc/apt/sources.list.d/notion-repackaged.list
sudo apt update
sudo apt install notion-app-enhanced


sudo apt-get install gnome-shell-pomodoro
