校园网ipv6由无状态地址自动配置（slaac），是否也有dhcpv6不确定。
 
 之前没注意到nat6文件中PRIVACY=1使得Accepting router advertisements on $WAN6_INTERFACE even if forwarding is enabled (required for temporary addresses)，这是随机ip被删除后又回来的罪魁祸首。虽然sysctl.conf里的net.ipv6.conf.default.accept_ra=2 net.ipv6.conf.all.accept_ra=2和它是一个东西，但是前者关闭后貌似只用重置一次ip -6 flush就不会再变。
