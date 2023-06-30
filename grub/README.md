the host system of grub:gentoo

emerge sys-boot/grub sys-boot/os-prober , with changed use and accept_keryword.
  
!os-prober 1.81 has detecting-twice for host system bug https://bugs.gentoo.org/830655 , at least use the rc1 version with ~amd64

grub-install /boot/efi --removable (for my msi motherboard)

grub-mkconfig -o /boot/grub/grub.cfg
