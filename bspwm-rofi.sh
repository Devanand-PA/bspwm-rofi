#!/bin/sh

# Installing software

sudo apt install -y xorg bspwm stterm rofi polybar network-manager acpi lxdm htop qalc
sudo apt install -y pcmanfm xarchiver sxiv
sudo apt install -y okular vim mpv yt-dlp  #libreoffice

# Making directories

mkdir ~/.config
mkdir ~/.config/bspwm
mkdir ~/.config/sxhkd
mkdir ~/.config/polybar
mkdir ~/Documents
mkdir ~/Pictures 
mkdir ~/Backgrounds
mkdir ~/Projects
mkdir ~/Downloads
mkdir ~/Music
mkdir ~/Videos
mkdir ~/.bin

# Setting up bspwm 

cp bspwmrc ~/.config/bspwm/bspwmrc
chmod +x ~/.config/bspwm/bspwmrc

cp polybar-config ~/.config/polybar/config
chmod +x ~/.config/polybar/config

cp sxhkdrc ~/.config/sxhkd/sxhkdrc
chmod +x ~/.config/sxhkd/sxhkdrc

touch ~/.bash_aliases
echo "alias reboot='systemctl reboot'" >> ~/.bash_aliases
echo "alias poweroff='systemctl poweroff'" >> ~/.bash_aliases
source ~/.basrhc
 

#Setting up rofi
mkdir ~/.config/rofi
mkdir ~/.config/rofi/themes
cp dt-center.rasi ~/.config/rofi/themes/dt-center.rasi
touch ~/.config/rofi/config.rasi
echo 'configuration {
 modi: "window,drun,ssh,combi";
 font: "hack 10";
 combi-modi: "window,drun,ssh";
 }
@theme "~/.config/rofi/themes/dt-center.rasi"
' > ~/.config/rofi/config.rasi


chmod +x post_script.sh
/bin/bash post_script.sh
