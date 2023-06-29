mkdir /boot/efi
#echo -e "/dev/nvme2n1p1 /boot/efi vfat defaults,noatime 0 2\n/dev/nvme2n1p2 / ext4 noatime 0 1\ntmpfs /tmp tmpfs size=128G,mode=775 0 0" >> /etc/fstab
mount /boot/efi
mount /tmp
emerge-webrsync
emerge --update --deep --newuse @world
echo "Asia/Chongqing" > /etc/timezone
emerge --config sys-libs/timezone-data
echo "en_SG.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
eselect locale set 4
