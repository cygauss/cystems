wget raw.githubusercontent.com/cygauss/awesome-linuxy/main/cygen/install.sh/4.sh
#mkfs.fat -F 32 /dev/nvme2n1p1
#mkfs.ext4 /dev/nvme2n1p2
mkdir /mnt/gentoo
#mount /dev/nvme2n1p2 /mnt/gentoo
cd /mnt/gentoo
wget raw.githubusercontent.com/cygauss/awesome-linuxy/main/cygen/install.sh/2.sh
wget raw.githubusercontent.com/cygauss/awesome-linuxy/main/cygen/install.sh/3.sh
chronyd -q
#wget http://mirrors.ustc.edu.cn/gentoo/releases/amd64/autobuilds/20230625T165009Z/stage3-amd64-openrc-20230625T165009Z.tar.xz
tar xpvf stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner
cd -
#echo -e "/dev/nvme2n1p1 /boot/efi vfat defaults,noatime 0 2\n/dev/nvme2n1p2 / ext4 noatime 0 1\ntmpfs /tmp tmpfs size=128G,mode=775 0 0" >> /mnt/etc/fstab
rm /mnt/gentoo/etc/portage/make.conf
cd /mnt/gentoo/etc/portage/
wget https://raw.githubusercontent.com/cygauss/awesome-linuxy/main/cygen/make.conf
cd -
mkdir --parents /mnt/gentoo/etc/portage/repos.conf
cp /mnt/gentoo/usr/share/portage/config/repos.conf /mnt/gentoo/etc/portage/repos.conf/gentoo.conf
cp --dereference /etc/resolv.conf /mnt/gentoo/etc/
mkdir /mnt/gentoo/boot/efi
mount --types proc /proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev
mount --bind /run /mnt/gentoo/run
mount --make-slave /mnt/gentoo/run
