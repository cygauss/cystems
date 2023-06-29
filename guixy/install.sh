mkfs.fat -F32 /dev/nvme3n1p1
mkfs.ext4 /dev/nvme3n1p2
mount /dev/nvme3n1p2 /mnt
mkdir /mnt/boot
mkdir /mnt/boot/efi
mount /dev/nvme3n1p1 /mnt/boot/efi
herd start cow-store /mnt
mkdir /mnt/etc
cd /mnt/etc
wget raw.githubusercontent.com/cygauss/awesome-linuxy/main/guixy/config.scm
cd -
guix system init /mnt/etc/config.scm /mnt --substitute-urls='http://mirror.sjtu.edu.cn/guix/'
