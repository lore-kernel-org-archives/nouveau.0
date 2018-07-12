From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107210] Segment Fault while opening thunderbitf
 windows
Date: Thu, 12 Jul 2018 20:59:48 +0000
Message-ID: <bug-107210-8800-jd1JOMjIo7@http.bugs.freedesktop.org/>
References: <bug-107210-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0766003542=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-107210-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0766003542==
Content-Type: multipart/alternative; boundary="15314291880.A26bE8bF.17174"
Content-Transfer-Encoding: 7bit


--15314291880.A26bE8bF.17174
Date: Thu, 12 Jul 2018 20:59:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107210

--- Comment #2 from Frank <fpedersoli-W5PRBNShjJq35wUkaLeaMEEOCMrvLtNR@public.gmane.org> ---
This is the inxi with a full detail of the PC. Tomorrow I'll try to reprodu=
ce
the bug, now is really late here.
I can add also that to use nouveau with KDE has been very hard, for me. I
cannot use the compositor and no way to use the GPU like before (nvidia 304
driver, no longer supported).

I'm using  4.17.5-1-zen #1 ZEN SMP PREEMPT, but the error is present with a=
ll
the versions. I tried also to downgrade the glibc: no way.

To reproduce with symbols have I to compile and install a custom version of=
 the
driver?


System:    Host: faststar01 Kernel: 4.17.5-1-zen x86_64 bits: 64 gcc: 8.1.1
           Desktop: KDE Plasma 5.12.5 (Qt 5.11.1) dm: sddm,sddm Distro: Art=
ix
Linux
Machine:   Device: portable System: Dell product: MP061 serial: N/A  Chassi=
s:
type: 8 serial: N/A
           Mobo: Dell model: 0YD479 serial: N/A BIOS: Dell v: A10 date:
08/26/2009
Battery    BAT0: charge: 49.1 Wh 100.0% condition: 49.1/73.3 Wh (67%) volts:
12.2/11.1
           model: SMP DELLRD8 Li-ion serial: 1984 status: Full cycles: 0
CPU:       Dual core Intel Core2 T7600 (-MCP-) arch: Conroe rev.6 cache: 40=
96
KB
           flags: (lm nx sse sse2 sse3 ssse3 vmx) bmips: 9313
           clock speeds: min/max: 1000/2333 MHz 1: 1542 MHz 2: 1568 MHz
Memory:    Using dmidecode: dmidecode is not installed.
Graphics:  Card: NVIDIA G71M [GeForce Go 7950 GTX] bus-ID: 01:00.0 chip-ID:
10de:0297
           Display Server: N/A drivers: nouveau (unloaded:
modesetting,fbdev,vesa) tty size: 168x47
Audio:     Card Intel NM10/ICH7 Family High Definition Audio Controller
           driver: snd_hda_intel bus-ID: 00:1b.0 chip-ID: 8086:27d8
           Sound: Advanced Linux Sound Architecture v: k4.17.5-1-zen
Network:   Card: Broadcom Limited BCM4401-B0 100Base-TX driver: b44 v: 2.0
bus-ID: 03:00.0 chip-ID: 14e4:170c
           IF: eth0 state: down mac: 00:14:22:f3:fe:95
           WAN IP: 87.26.11.195
           IF: eth0 ip-v4: N/A ip-v6-link: N/A
           IF: wlan0 ip-v4: 192.168.0.185 ip-v6-link: fe80::45e:628:d10a:42=
d8
Drives:    HDD Total Size: 1240.3GB (34.4% used)
           ID-1: /dev/sda model: KINGSTON_SA400S3 size: 240.1GB serial:
50026B7682179419
           ID-2: /dev/sdb model: HGST_HTS721010A9 size: 1000.2GB serial:
JR1004D31KZ6MM
           Optical: No optical drives detected.
Partition: ID-1: / size: 224G used: 108G (49%) fs: btrfs dev: /dev/dm-0
           label: N/A uuid: 0accd8a7-bd71-49d1-acd5-6a33bce1b984
           ID-2: /boot size: 488M used: 96M (22%) fs: ext4 dev: /dev/sda1
           label: BootHD uuid: 828052c6-7851-42d8-8a3f-79f7761263e2
           ID-3: /home size: 224G used: 108G (49%) fs: btrfs dev: /dev/dm-0
           label: N/A uuid: 0accd8a7-bd71-49d1-acd5-6a33bce1b984
           ID-4: /run/media/francesco/WorkDisk size: 932G used: 291G (32%) =
fs:
btrfs dev: /dev/dm-1
           label: WorkDisk uuid: 6a79cb6d-992c-4676-8a56-bc7dd0952f8f
           ID-5: /home/francesco/.thunderbird size: 224G used: 108G (49%) f=
s:
fuse.encfs dev: /dev/encfs
           label: N/A uuid: N/A
RAID:      No RAID data: /proc/mdstat missing-is md_mod kernel module loade=
d?
Unmounted: ID-1: /dev/sda2 size: 239.52G label: N/A uuid:
fcedf7b3-e1f6-4c8b-a578-c4a44802b21c
           ID-2: /dev/sdb1 size: 1000.20G label: N/A uuid:
4dc4ee68-5a50-4203-8e9b-824f8fd8d62e
Sensors:   System Temperatures: cpu: 52.0C mobo: N/A gpu: 52.0
           Fan Speeds (in rpm): cpu: N/A
Info:      Processes: 203 Uptime: 14:20 Memory: 844.9/3253.4MB
           Init: N/A v: N/A rc: OpenRC v: 0.38.1 runlevel: default Gcc sys:
8.1.1
           Client: Shell (bash 4.4.231 running in konsole) inxi: 2.3.56

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15314291880.A26bE8bF.17174
Date: Thu, 12 Jul 2018 20:59:48 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Segment Fault while opening thunderbitf windows"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107210#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Segment Fault while opening thunderbitf windows"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107210">bug 10721=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
fpedersoli&#64;kisantechnology.com" title=3D"Frank &lt;fpedersoli&#64;kisan=
technology.com&gt;"> <span class=3D"fn">Frank</span></a>
</span></b>
        <pre>This is the inxi with a full detail of the PC. Tomorrow I'll t=
ry to reproduce
the bug, now is really late here.
I can add also that to use nouveau with KDE has been very hard, for me. I
cannot use the compositor and no way to use the GPU like before (nvidia 304
driver, no longer supported).

I'm using  4.17.5-1-zen #1 ZEN SMP PREEMPT, but the error is present with a=
ll
the versions. I tried also to downgrade the glibc: no way.

To reproduce with symbols have I to compile and install a custom version of=
 the
driver?


System:    Host: faststar01 Kernel: 4.17.5-1-zen x86_64 bits: 64 gcc: 8.1.1
           Desktop: KDE Plasma 5.12.5 (Qt 5.11.1) dm: sddm,sddm Distro: Art=
ix
Linux
Machine:   Device: portable System: Dell product: MP061 serial: N/A  Chassi=
s:
type: 8 serial: N/A
           Mobo: Dell model: 0YD479 serial: N/A BIOS: Dell v: A10 date:
08/26/2009
Battery    BAT0: charge: 49.1 Wh 100.0% condition: 49.1/73.3 Wh (67%) volts:
12.2/11.1
           model: SMP DELLRD8 Li-ion serial: 1984 status: Full cycles: 0
CPU:       Dual core Intel Core2 T7600 (-MCP-) arch: Conroe rev.6 cache: 40=
96
KB
           flags: (lm nx sse sse2 sse3 ssse3 vmx) bmips: 9313
           clock speeds: min/max: 1000/2333 MHz 1: 1542 MHz 2: 1568 MHz
Memory:    Using dmidecode: dmidecode is not installed.
Graphics:  Card: NVIDIA G71M [GeForce Go 7950 GTX] bus-ID: 01:00.0 chip-ID:
10de:0297
           Display Server: N/A drivers: nouveau (unloaded:
modesetting,fbdev,vesa) tty size: 168x47
Audio:     Card Intel NM10/ICH7 Family High Definition Audio Controller
           driver: snd_hda_intel bus-ID: 00:1b.0 chip-ID: 8086:27d8
           Sound: Advanced Linux Sound Architecture v: k4.17.5-1-zen
Network:   Card: Broadcom Limited BCM4401-B0 100Base-TX driver: b44 v: 2.0
bus-ID: 03:00.0 chip-ID: 14e4:170c
           IF: eth0 state: down mac: 00:14:22:f3:fe:95
           WAN IP: 87.26.11.195
           IF: eth0 ip-v4: N/A ip-v6-link: N/A
           IF: wlan0 ip-v4: 192.168.0.185 ip-v6-link: fe80::45e:628:d10a:42=
d8
Drives:    HDD Total Size: 1240.3GB (34.4% used)
           ID-1: /dev/sda model: KINGSTON_SA400S3 size: 240.1GB serial:
50026B7682179419
           ID-2: /dev/sdb model: HGST_HTS721010A9 size: 1000.2GB serial:
JR1004D31KZ6MM
           Optical: No optical drives detected.
Partition: ID-1: / size: 224G used: 108G (49%) fs: btrfs dev: /dev/dm-0
           label: N/A uuid: 0accd8a7-bd71-49d1-acd5-6a33bce1b984
           ID-2: /boot size: 488M used: 96M (22%) fs: ext4 dev: /dev/sda1
           label: BootHD uuid: 828052c6-7851-42d8-8a3f-79f7761263e2
           ID-3: /home size: 224G used: 108G (49%) fs: btrfs dev: /dev/dm-0
           label: N/A uuid: 0accd8a7-bd71-49d1-acd5-6a33bce1b984
           ID-4: /run/media/francesco/WorkDisk size: 932G used: 291G (32%) =
fs:
btrfs dev: /dev/dm-1
           label: WorkDisk uuid: 6a79cb6d-992c-4676-8a56-bc7dd0952f8f
           ID-5: /home/francesco/.thunderbird size: 224G used: 108G (49%) f=
s:
fuse.encfs dev: /dev/encfs
           label: N/A uuid: N/A
RAID:      No RAID data: /proc/mdstat missing-is md_mod kernel module loade=
d?
Unmounted: ID-1: /dev/sda2 size: 239.52G label: N/A uuid:
fcedf7b3-e1f6-4c8b-a578-c4a44802b21c
           ID-2: /dev/sdb1 size: 1000.20G label: N/A uuid:
4dc4ee68-5a50-4203-8e9b-824f8fd8d62e
Sensors:   System Temperatures: cpu: 52.0C mobo: N/A gpu: 52.0
           Fan Speeds (in rpm): cpu: N/A
Info:      Processes: 203 Uptime: 14:20 Memory: 844.9/3253.4MB
           Init: N/A v: N/A rc: OpenRC v: 0.38.1 runlevel: default Gcc sys:
8.1.1
           Client: Shell (bash 4.4.231 running in konsole) inxi: 2.3.56</pr=
e>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15314291880.A26bE8bF.17174--

--===============0766003542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0766003542==--
