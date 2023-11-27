校园网ipv6由无状态地址自动配置（slaac），是否也有dhcpv6不确定。

 # disable IPv6 address auto-configuration

 net.ipv6.conf.eth0.autoconf=0
	
 # disable IPv6 acceptance of default router in RA
 
 net.ipv6.conf.eth0.accept_ra_defrtr=0

-> /etc/sysctl.conf
 
关闭内核上的autoconf,accept_ra后，使用static无问题，但是若使用dhcp客户端，还是会接收ip，甚至指示为ra的slaac的，而非dhcp的。

最终选择在ledecy不修正+内核上屏蔽 + 不使用任何网络管理器

windows下怎么处理，已经加入到/windows文件中
