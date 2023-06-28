echo "sys-kernel/git-sources ~amd64" > /etc/portage/package.accept_keywords/00-manual
emerge linux-firmware git-sources
eselect kernel set 1
cd /usr/src/linux*
make -j24 && make modules_install
make install
cd -
echo -e "/dev/nvme0n1p1 /boot vfat defaults,noatime 0 2\n/dev/nvme0n1p2 / ext4 noatime 0 1" >> /etc/fstab
echo cygen > /etc/hostname
emerge app-admin/sysklogd sys-process/cronie net-misc/chrony net-misc/dhcpcd 
rc-update add dhcpcd default
rc-update add sysklogd default
rc-update add cronie default
rc-update add chronyd default
passwd
