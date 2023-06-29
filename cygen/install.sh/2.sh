mount /boot/efi
mount /tmp
emerge-webrsync
emerge --update --deep --newuse @world
echo "Asia/Chongqing" > /etc/timezone
emerge --config sys-libs/timezone-data
echo "en_SG.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
eselect locale set 4
