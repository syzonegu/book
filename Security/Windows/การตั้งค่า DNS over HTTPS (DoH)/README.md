<h1>การตั้งค่า DNS over HTTPS (DoH)</h1>

<pre>
<code class="language-bash">@echo off
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
</code></pre>

<p><strong>โปรแกรมตัวนี้เป็นโปรแกรม batch script ที่ใช้สำหรับตั้งค่า DNS over HTTPS (DoH) โดยจะทำการกำหนด DNS Server ที่ใช้ให้กับอินเตอร์เน็ตเฟซ Ethernet โดยใช้คำสั่ง netsh ซึ่งเป็นคำสั่งในการกำหนดการตั้งค่าของระบบเครือข่ายของ Windows โดยเฉพาะ</strong></p>

<p><strong>รายละเอียดการทำงานของโปรแกรม batch script นี้ ได้แก่</strong></p>

<ol>
	<li>แสดงข้อความ &quot;Setting DNS over HTTPS (DoH)...&quot; บอกว่าเริ่มต้นการตั้งค่า DoH</li>
	<li>กำหนด DNS Server ตามลำดับดังนี้ 2.1 กำหนด primary DNS Server เป็น 1.1.1.1 2.2 เพิ่ม secondary DNS Server เป็น 1.0.0.1 ลำดับที่ 2 2.3 เพิ่ม tertiary DNS Server เป็น 8.8.8.8 ลำดับที่ 3 2.4 เพิ่ม fourth DNS Server เป็น 8.8.4.4 ลำดับที่ 4 2.5 กำหนด DoH template ให้เป็น &quot;<a href="https://dns.google/dns-query" target="_new">https://dns.google/dns-query</a>&quot; และเปิดใช้ validate ทำให้การส่งข้อมูลผ่าน DoH ถูกต้องตามมาตรฐาน 2.6 เพิ่ม DNS Server เป็น 1.1.1.1 ลำดับที่ 5 2.7 เพิ่ม DNS Server เป็น 2606:4700:4700::1111 ลำดับที่ 6 2.8 เพิ่ม DNS Server เป็น 2606:4700:4700::1001 ลำดับที่ 7</li>
	<li>แสดงข้อความ &quot;DNS over HTTPS (DoH) has been set successfully.&quot; และหยุดรอให้ผู้ใช้กดปุ่มใดๆ เพื่อปิดหน้าต่างของ Command Prompt โดยใช้คำสั่ง pause</li>
</ol>
