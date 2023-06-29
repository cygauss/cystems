stage3镜像 请去http://mirrors.ustc.edu.cn/gentoo/releases/amd64/autobuilds/latest-stage3-amd64-openrc.txt

wget raw.githubusercontent.com/cygauss/awesome-linuxy/main/cygen/install.sh/1.sh && bash 1.sh

chroot /mnt/gentoo

source /etc/profile

bash 2.sh

env-update

source /etc/profile

bash 3.sh

exit

bash 4.sh



