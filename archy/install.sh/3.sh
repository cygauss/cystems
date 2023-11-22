##显示配置
##nvidia
##为了避免更新 NVIDIA 驱动之后忘了更新 initramfs，你可以使用 Pacman Hooks：
##安装后把kms 从 /etc/mkinitcpio.conf 里的HOOKS 数组中移除，并 重新生成 initramfs。
##To enable DRM (Direct Rendering Manager) kernel mode setting, set modeset=1 and fbdev=1 kernel module parameters for the nvidia_drm module.
##如果任何受影响的模块是从 initramfs 加载的，那么您需要将适当的 .conf 文件添加到 mkinitcpio.conf 中的 FILES
echo "options nvidia_drm modeset=1 fbdev=1" > /etc/modprobe.d/nvidia_drm.conf
nano /etc/mkinitcpio.conf
mkdir /etc/pacman.d/hooks/
cd /etc/pacman.d/hooks/
curl -O https://raw.githubusercontent.com/cygauss/cystems/main/archy/nvidia.hook
cd -
##prime-run前缀脚本以用独显运行
pacman -S nvidia nvidia-prime
