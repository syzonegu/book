<p>#### &gt;&gt; Ubuntu 16.04 &lt;&lt; ####</p>

<p># Install docker</p>

<p>curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -<br />
sudo add-apt-repository &quot;deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable&quot;<br />
sudo apt-get update<br />
sudo apt-get install -y docker-ce</p>

<p># Install docker-compose</p>

<p>sudo curl -L &quot;https://github.com/docker/compose/releases/download/1.26.1/docker-compose-$(uname -s)-$(uname -m)&quot; -o /usr/local/bin/docker-compose<br />
sudo chmod +x /usr/local/bin/docker-compose</p>

<p># Deploy pi-hole</p>

<p>## สร้าง User สำหรับ Deploy</p>

<p>useradd -m deploy<br />
cd /home/deploy<br />
mkdir pi-hole<br />
cd pi-hole</p>

<p>## สร้างไฟล์ docker-compose.yml ใส่ config ดังนี้</p>

<p>version: &quot;3&quot;<br />
services:<br />
&nbsp; pihole:<br />
&nbsp; &nbsp; container_name: pihole<br />
&nbsp; &nbsp; image: pihole/pihole:latest<br />
&nbsp; &nbsp; ports:<br />
&nbsp; &nbsp; &nbsp; - &quot;53:53/tcp&quot;<br />
&nbsp; &nbsp; &nbsp; - &quot;53:53/udp&quot;<br />
&nbsp; &nbsp; &nbsp; - &quot;67:67/udp&quot;<br />
&nbsp; &nbsp; &nbsp; - &quot;8888:80/tcp&quot;<br />
&nbsp; &nbsp; environment:<br />
&nbsp; &nbsp; &nbsp; TZ: &#39;Asia/Bangkok&#39;<br />
&nbsp; &nbsp; volumes:<br />
&nbsp; &nbsp; &nbsp; - &#39;./etc-pihole/:/etc/pihole/&#39;<br />
&nbsp; &nbsp; &nbsp; - &#39;./etc-dnsmasq.d/:/etc/dnsmasq.d/&#39;<br />
&nbsp; &nbsp; dns:<br />
&nbsp; &nbsp; &nbsp; - 127.0.0.1<br />
&nbsp; &nbsp; &nbsp; - 1.1.1.1<br />
&nbsp; &nbsp; cap_add:<br />
&nbsp; &nbsp; &nbsp; - NET_ADMIN<br />
&nbsp; &nbsp; restart: unless-stopped</p>

<p># Start pi-hole</p>

<p>docker-compose up -d</p>

<p># เข้าสู่เว็บ UI<br />
## ดู password แรกของ pi-hole</p>

<p>docker logs pihole | grep password</p>

<p>&gt;&gt; จะเห็นบรรทัดที่เขียนว่า Assigning random password: {Password}<br />
&gt;&gt; เว็บไซต์คือ http://{IP}:8888/admin</p>

<p># แก้ไขไฟล์ /etc/openvpn/server.conf (แก้ไขในส่วนของ IP DNS Server เราให้ถูกต้อง)</p>

<p>push &quot;dhcp-option DNS {Private_IP_DNS}&quot;<br />
push &quot;dhcp-option DNS {Public_IP_DNS}&quot;</p>

<p># Restart openvpn</p>

<p>systemctl restart openvpn</p>

<p># ทดสอบการใช้งาน</p>

<p>เชื่อมต่อ VPN ตามปกติ,, ทดสอบ block website ตามปกติจากหน้าเว็บ UI</p>
