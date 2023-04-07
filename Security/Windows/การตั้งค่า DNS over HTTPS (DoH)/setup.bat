@echo off
echo Setting DNS over HTTPS (DoH)...
netsh interface ipv4 set dns "Ethernet" static 1.1.1.1 primary
netsh interface ipv4 add dns "Ethernet" 1.0.0.1 index=2
netsh interface ipv4 add dns "Ethernet" 8.8.8.8 index=3
netsh interface ipv4 add dns "Ethernet" 8.8.4.4 index=4
netsh interface ipv4 set dns "Ethernet" dohtemplate="https://dns.google/dns-query" validate=yes
netsh interface ipv4 add dnsserver "Ethernet" address="1.1.1.1" index=5
netsh interface ipv4 add dnsserver "Ethernet" address="2606:4700:4700::1111" index=6
netsh interface ipv4 add dnsserver "Ethernet" address="2606:4700:4700::1001" index=7
echo DNS over HTTPS (DoH) has been set successfully.
pause
