#net iwctl station wlan0 connect ssid
timedatectl
#cfdisk /dev/nvme0n1
#mkfs.fat -F 32 /dev/nvme0n1p1 && mkfs.ext4 /dev/nvme0n1p2
#mount /dev/nvme0n1p2 /mnt 
mkdir /mnt/boot
#mount /dev/nvme0n1p1 /mnt
echo -e "Server = http://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch\nServer = http://mirrors.pku.edu.cn/archlinux/$repo/os/$arch" > /etc/pacman.d/mirrorlist
pacstrap -K /mnt base linux linux-firmware networkmanager efibootmgr intel-ucode
genfstab -U /mnt >> /mnt/etc/fstab
cd /mnt
wget raw.githubusercontent.com/cygauss/cystems/main/archy/install.sh/2.sh
cd -
