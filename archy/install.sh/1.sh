#net iwctl station wlan0 connect ssid
timedatectl
#cfdisk /dev/nvme0n1
#mkfs.fat -F 32 /dev/nvme0n1p1
#mkfs.ext4 /dev/nvme0n1p2
#mount /dev/nvme0n1p2 /mnt
mkdir /mnt/boot
#mount /dev/nvme0n1p1 /mnt/boot
echo -e "Server = http://mirrors.tuna.tsinghua.edu.cn/archlinux/\$repo/os/\$arch\nServer = http://mirrors.pku.edu.cn/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
pacstrap -K /mnt base linux linux-firmware networkmanager efibootmgr intel-ucode nano
genfstab -U /mnt >> /mnt/etc/fstab
cd /mnt
curl -O https://raw.githubusercontent.com/cygauss/cystems/main/archy/install.sh/1-1.sh
curl -O https://raw.githubusercontent.com/cygauss/cystems/main/archy/install.sh/sher
nano 1-1.sh
cd -
