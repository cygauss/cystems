rm /mnt/gentoo/2.sh
rm /mnt/gentoo/3.sh
umount -l /mnt/gentoo/dev{/shm,/pts,} 
umount -R /mnt/gentoo 
reboot
