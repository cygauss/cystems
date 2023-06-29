echo "sys-kernel/git-sources ~amd64" > /etc/portage/package.accept_keywords/00-manual
emerge linux-firmware git-sources
eselect kernel set 1
passwd
cd /usr/src/linux
wget raw.githubusercontent.com/cygauss/awesome-linuxy/main/kernelconfig/ori.config
make menuconfig
make -j24 && make modules_install
make install
cd -
#echo -e "/dev/nvme2n1p1 /boot/efi vfat defaults,noatime 0 2\n/dev/nvme2n1p2 / ext4 noatime 0 1\ntmpfs /tmp tmpfs size=128G,mode=775 0 0" >> /etc/fstab
echo cygen > /etc/hostname
emerge app-admin/sysklogd sys-process/cronie net-misc/chrony net-misc/dhcpcd sys-boot/grub
rc-update add dhcpcd default
rc-update add sysklogd default
rc-update add cronie default
rc-update add chronyd default
grub-install /boot/efi --removable
grub-mkconfig -o /boot/grub/grub.cfg
