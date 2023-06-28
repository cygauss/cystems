mkfs.fat -F32 /dev/nvme0n1p1
mkfs.ext4 /dev/nvme0n1p2
mount /dev/nvme0n1p2 /mnt
mkdir /mnt/boot
mount /dev/nvme0n1p1 /mnt/boot
herd start cow-store /mnt
mkdir /mnt/etc
cd /mnt/etc
wget raw.githubusercontent.com/cygauss/awesome-linuxy/main/guixy/config.scm
cd -
guix system init /mnt/etc/config.scm /mnt --substitute-urls='https://mirror.sjtu.edu.cn/guix/'
