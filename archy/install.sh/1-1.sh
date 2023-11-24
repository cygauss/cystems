ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime 
hwclock --systohc
##虽然只使用LANG=sg，但是一些软件不自带语言环境，需要locale提供，故选用中文
echo -e "en_SG.UTF-8 UTF-8\nzh_CN.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_SG.UTF-8" >> /etc/locale.conf
echo "Archy" >> /etc/hostname
#systemctl enable NetworkManager
passwd
#efibootmgr -Bb 0000
#efibootmgr -Bb 0001
#efibootmgr -Bb 0002
#efibootmgr -Bb 0003
#efibootmgr -c -d /dev/nvme0n1p1 -l /vmlinuz-linux -L "Arch Linux" -u 'initrd=\intel-ucode.img initrd=\initramfs-linux.img root=/dev/nvme0n1p2 quiet rw nowatchdog'
