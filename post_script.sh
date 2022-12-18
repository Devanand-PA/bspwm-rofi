#!/bin/bash
# Setting up flatpak
echo "Do you want flatpaks?[y/n] no by default"
read flatpak_ans
if [ $flatpak_ans == y ]
then
    sudo apt install -y flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi

#Touchpad
sudo touch /etc/X11/xorg.conf.d/30-touchpad.conf  
sudo bash -c 'Section "InputClass"   
  Identifier "touchpad"  
  Driver "libinput"  
  MatchIsTouchpad "on"  
  Option "Tapping" "on"  
EndSection' > /etc/X11/xorg.conf.d/30-touchpad.conf

# Libreoffice theme
echo "Do you want libreoffice theme to match desktop theme?[y/n] no by default"
read office_theme
if [ $office_theme == y ]
then
    sudo apt install -y libreoffice-gtk3
fi

# Setting up notification daemon
echo "Do you want notifications?[y/n] no by default"
read notify_ans
if [ $notify_ans == y ]
then
    sudo apt install -y notification-daemon
    sudo touch /usr/share/dbus-1/services/org.freedesktop.Notifications.service
    sudo bash -c "echo '[D-BUS Service]' >> /usr/share/dbus-1/services/org.freedesktop.Notifications.service"
    sudo bash -c "echo 'Name=org.freedesktop.Notifications' >> /usr/share/dbus-1/services/org.freedesktop.Notifications.service"
    sudo bash -c "echo 'Exec=/usr/lib/notification-daemon/notification-daemon' >> /usr/share/dbus-1/services/org.freedesktop.Notifications.service"
fi
