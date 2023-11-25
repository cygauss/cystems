##wayland
##GUIlib
pacman -S gtk4 qt6-wayland qt5ct
echo -e "QT_QPA_PLATFORM=wayland\nQT_QPA_PLATFORMTHEME=qt5ct" >> /etc/environment
##Hyprland kitty
pacman -S hyprland-nvidia kitty
##字体和输入法
pacman -S noto-fonts-cjk fcitx5-im fcitx5-rime 
##修改环境变量和随hyprland启动,ibus项是因为kitty
echo -e "GTK_IM_MODULE=fcitx\nQT_IM_MODULE=fcitx\nXMODIFIERS=@im=fcitx\nSDL_IM_MODULE=fcitx\nGLFW_IM_MODULE=ibus" >> /etc/environment
fcitx5-configtool
##fcitx5 -d为其运行deamon

##声音
pacman -S pipewire wireplumber helvum

##v2raya
pacman -S v2raya
systemctl enable v2raya.service
