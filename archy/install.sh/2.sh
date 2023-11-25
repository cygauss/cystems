##修改mirror和repo
echo -e "Server = http://mirrors.tuna.tsinghua.edu.cn/archlinux/\$repo/os/\$arch\nServer = http://mirrors.pku.edu.cn/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
echo -e "Server = http://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/\$arch\nServer = http://mirrors.pku.edu.cn/archlinuxcn/\$arch" > /etc/pacman.d/archlinuxcn-mirrorlist
echo -e "[archlinuxcn]\nInclude = /etc/pacman.d/archlinuxcn-mirrorlist" >> /etc/pacman.conf
##yay可以统筹aur和repos
pacman -Sy archlinuxcn-keyring
pacman -S yay base-devel
##用户配置
pacman -S sudo
useradd -m -G wheel cygauss
passwd cygauss
EDITOR="nano" visudo
