emerge linux-firmware intel-microcode gentoo-sources genkernel
eselect kernel set 1
genkernel --mountboot --install all
echo -e "/dev/nvme0n1p1 /boot vfat defaults,noatime 0 2\n/dev/nvme0n1p2 / ext4 noatime 0 1" >> /etc/fstab
echo cygen > /etc/hostname
emerge app-admin/sysklogd sys-process/cronie net-misc/chrony net-misc/dhcpcd
rc-update add dhcpcd default
rc-update add sysklogd default
rc-update add cronie default
rc-update add chronyd default
echo -e "sys-kernel/git-sources ~amd64\nsys-boot/systemd-boot ~amd64" > /etc/portage/package.accept_keywords/00-manual
echo "sys-apps/systemd-utils boot" > /etc/portage/package.use/00-manual
emerge systemd-boot
bootctl --esp-path=/boot install
cd /boot
echo -e "title Gentoo\nlinux /$(ls vmlinuz*)\ninitrd /$(ls ini*)\noptions root=PARTUUID= quiet $(lsblk -o name,partuuid)" > /boot/loader/entries/gentoo.conf
nano /boot/loader/entries/gentoo.conf
passwd
cd -
