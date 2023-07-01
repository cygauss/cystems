校园网ipv6由无状态地址自动配置（slaac），是否也有dhcpv6不确定。
 
 之前没注意到nat6文件中PRIVACY=1使得Accepting router advertisements on $WAN6_INTERFACE even if forwarding is enabled (required for temporary addresses)，这是随机ip被删除后又回来的罪魁祸首。虽然sysctl.conf里的net.ipv6.conf.default.accept_ra=2 net.ipv6.conf.all.accept_ra=2和它是一个东西，但是前者关闭后后者无论是否关闭，貌似只用重置一次ip -6 flush就不会再变,从定义上考虑，故全关。（不知关后留前会怎样，主要是不知其真正作用）

 但是ip -6 flush每次开机跑一遍也有点怪，采用屏蔽slaac的方法from谷歌.

 关闭内核上的autoconf,accept_ra后，使用static无问题，但是若使用dhcp客户端，还是会接收ip，甚至指示为ra的slaac的，而非dhcp的。

 最终选择在ledecy修正+内核上屏蔽 + 不使用任何网络管理器

 内核修正项众说纷纭，使用 
 # disable IPv6 address auto-configuration

 net.ipv6.conf.eth0.autoconf=0
	
 # disable IPv6 acceptance of default router in RA
 
 net.ipv6.conf.eth0.accept_ra_defrtr=0
 到sysctl.conf
