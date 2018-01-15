From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104621] Nouveau prevents booting on Pascal Gpu
Date: Mon, 15 Jan 2018 16:33:58 +0000
Message-ID: <bug-104621-8800-5bLXytI7OH@http.bugs.freedesktop.org/>
References: <bug-104621-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1273936651=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-104621-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1273936651==
Content-Type: multipart/alternative; boundary="15160340380.786a9.7148"
Content-Transfer-Encoding: 7bit


--15160340380.786a9.7148
Date: Mon, 15 Jan 2018 16:33:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104621

--- Comment #2 from Leopard <ramazanerol91-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi again, i can boot with nouveau.runpm=3D0 although Linux Mint 18.2 didn't
require an adjustment like that.

Sys info;

inxi -SMGxx
System:    Host: mint Kernel: 4.10.0-38-generic x86_64 (64 bit gcc: 5.4.0)
           Desktop: Cinnamon 3.6.6 (Gtk 3.18.9-1ubuntu3.3) dm: lightdm
           Distro: Linux Mint 18.3 Sylvia
Machine:   System: ASUSTeK (portable) product: GL553VD v: 1.0
           Mobo: ASUSTeK model: GL553VD v: 1.0
           Bios: American Megatrends v: GL553VD.304 date: 09/07/2017
Graphics:  Card-1: Intel Device 591b bus-ID: 00:02.0 chip-ID: 8086:591b
           Card-2: NVIDIA Device 1c8d bus-ID: 01:00.0 chip-ID: 10de:1c8d
           Display Server: X.Org 1.18.4 drivers: intel (unloaded: fbdev,ves=
a)
FAILED: nouveau
           Resolution: 1920x1080-ReKH/F3/UIQ@public.gmane.org
           GLX Renderer: Mesa DRI Intel Kabylake GT2
           GLX Version: 3.0 Mesa 17.0.7 Direct Rendering: Yes

inxi -Fxz
System:    Host: mint Kernel: 4.10.0-38-generic x86_64 (64 bit gcc: 5.4.0)
           Desktop: Cinnamon 3.6.6 (Gtk 3.18.9-1ubuntu3.3) Distro: Linux Mi=
nt
18.3 Sylvia
Machine:   System: ASUSTeK (portable) product: GL553VD v: 1.0
           Mobo: ASUSTeK model: GL553VD v: 1.0 Bios: American Megatrends v:
GL553VD.304 date: 09/07/2017
CPU:       Quad core Intel Core i7-7700HQ (-HT-MCP-) cache: 6144 KB
           flags: (lm nx sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx) bmips: 22464
           clock speeds: max: 3800 MHz 1: 899 MHz 2: 899 MHz 3: 1911 MHz 4:=
 899
MHz 5: 899 MHz 6: 1450 MHz
           7: 899 MHz 8: 1250 MHz
Graphics:  Card-1: Intel Device 591b bus-ID: 00:02.0
           Card-2: NVIDIA Device 1c8d bus-ID: 01:00.0
           Display Server: X.Org 1.18.4 drivers: intel (unloaded: fbdev,ves=
a)
FAILED: nouveau
           Resolution: 1920x1080-ReKH/F3/UIQ@public.gmane.org
           GLX Renderer: Mesa DRI Intel Kabylake GT2 GLX Version: 3.0 Mesa
17.0.7 Direct Rendering: Yes
Audio:     Card Intel Device a171 driver: snd_hda_intel bus-ID: 00:1f.3 Sou=
nd:
ALSA v: k4.10.0-38-generic
Network:   Card-1: Intel Wireless 7265 driver: iwlwifi bus-ID: 02:00.0
           IF: wlp2s0 state: down mac: <filter>
           Card-2: Realtek RTL8111/8168/8411 PCI Express Gigabit Ethernet
Controller
           driver: r8169 v: 2.3LK-NAPI port: d000 bus-ID: 03:00.0
           IF: enp3s0 state: up speed: 1000 Mbps duplex: full mac: <filter>
Drives:    HDD Total Size: NA (-) ID-1: /dev/sda model: SanDisk_SD8SN8U1 si=
ze:
128.0GB temp: 40C
           ID-2: /dev/sdb model: HGST_HTS541010A9 size: 1000.2GB temp: 30C
           ID-3: USB /dev/sdc model: silicon size: 4.0GB temp: 0C
RAID:      No RAID devices: /proc/mdstat, md_mod kernel module present
Sensors:   System Temperatures: cpu: 51.0C mobo: N/A
           Fan Speeds (in rpm): cpu: 0
Info:      Processes: 249 Uptime: 17 min Memory: 876.9/7866.2MB Init: syste=
md
runlevel: 5 Gcc sys: 5.4.0
           Client: Shell (bash 4.3.481) inxi: 2.2.35=20

So my guess is something has changed during this time period ; either firmw=
ares
or Mesa version and caused this.

X was the same with no problem booting 18.2 and with 18.3.

So problem might not be X related at all.=20

I will add this drm pointer error also.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15160340380.786a9.7148
Date: Mon, 15 Jan 2018 16:33:58 +0000
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
   title=3D"NEW - Nouveau prevents booting on Pascal Gpu"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104621#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau prevents booting on Pascal Gpu"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104621">bug 10462=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ramazanerol91&#64;gmail.com" title=3D"Leopard &lt;ramazanerol91&#64;gmail.c=
om&gt;"> <span class=3D"fn">Leopard</span></a>
</span></b>
        <pre>Hi again, i can boot with nouveau.runpm=3D0 although Linux Min=
t 18.2 didn't
require an adjustment like that.

Sys info;

inxi -SMGxx
System:    Host: mint Kernel: 4.10.0-38-generic x86_64 (64 bit gcc: 5.4.0)
           Desktop: Cinnamon 3.6.6 (Gtk 3.18.9-1ubuntu3.3) dm: lightdm
           Distro: Linux Mint 18.3 Sylvia
Machine:   System: ASUSTeK (portable) product: GL553VD v: 1.0
           Mobo: ASUSTeK model: GL553VD v: 1.0
           Bios: American Megatrends v: GL553VD.304 date: 09/07/2017
Graphics:  Card-1: Intel Device 591b bus-ID: 00:02.0 chip-ID: 8086:591b
           Card-2: NVIDIA Device 1c8d bus-ID: 01:00.0 chip-ID: 10de:1c8d
           Display Server: X.Org 1.18.4 drivers: intel (unloaded: fbdev,ves=
a)
FAILED: nouveau
           Resolution: <a href=3D"mailto:1920x1080&#64;60.01hz">1920x1080&#=
64;60.01hz</a>
           GLX Renderer: Mesa DRI Intel Kabylake GT2
           GLX Version: 3.0 Mesa 17.0.7 Direct Rendering: Yes

inxi -Fxz
System:    Host: mint Kernel: 4.10.0-38-generic x86_64 (64 bit gcc: 5.4.0)
           Desktop: Cinnamon 3.6.6 (Gtk 3.18.9-1ubuntu3.3) Distro: Linux Mi=
nt
18.3 Sylvia
Machine:   System: ASUSTeK (portable) product: GL553VD v: 1.0
           Mobo: ASUSTeK model: GL553VD v: 1.0 Bios: American Megatrends v:
GL553VD.304 date: 09/07/2017
CPU:       Quad core Intel Core i7-7700HQ (-HT-MCP-) cache: 6144 KB
           flags: (lm nx sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx) bmips: 22464
           clock speeds: max: 3800 MHz 1: 899 MHz 2: 899 MHz 3: 1911 MHz 4:=
 899
MHz 5: 899 MHz 6: 1450 MHz
           7: 899 MHz 8: 1250 MHz
Graphics:  Card-1: Intel Device 591b bus-ID: 00:02.0
           Card-2: NVIDIA Device 1c8d bus-ID: 01:00.0
           Display Server: X.Org 1.18.4 drivers: intel (unloaded: fbdev,ves=
a)
FAILED: nouveau
           Resolution: <a href=3D"mailto:1920x1080&#64;60.01hz">1920x1080&#=
64;60.01hz</a>
           GLX Renderer: Mesa DRI Intel Kabylake GT2 GLX Version: 3.0 Mesa
17.0.7 Direct Rendering: Yes
Audio:     Card Intel Device a171 driver: snd_hda_intel bus-ID: 00:1f.3 Sou=
nd:
ALSA v: k4.10.0-38-generic
Network:   Card-1: Intel Wireless 7265 driver: iwlwifi bus-ID: 02:00.0
           IF: wlp2s0 state: down mac: &lt;filter&gt;
           Card-2: Realtek RTL8111/8168/8411 PCI Express Gigabit Ethernet
Controller
           driver: r8169 v: 2.3LK-NAPI port: d000 bus-ID: 03:00.0
           IF: enp3s0 state: up speed: 1000 Mbps duplex: full mac: &lt;filt=
er&gt;
Drives:    HDD Total Size: NA (-) ID-1: /dev/sda model: SanDisk_SD8SN8U1 si=
ze:
128.0GB temp: 40C
           ID-2: /dev/sdb model: HGST_HTS541010A9 size: 1000.2GB temp: 30C
           ID-3: USB /dev/sdc model: silicon size: 4.0GB temp: 0C
RAID:      No RAID devices: /proc/mdstat, md_mod kernel module present
Sensors:   System Temperatures: cpu: 51.0C mobo: N/A
           Fan Speeds (in rpm): cpu: 0
Info:      Processes: 249 Uptime: 17 min Memory: 876.9/7866.2MB Init: syste=
md
runlevel: 5 Gcc sys: 5.4.0
           Client: Shell (bash 4.3.481) inxi: 2.2.35=20

So my guess is something has changed during this time period ; either firmw=
ares
or Mesa version and caused this.

X was the same with no problem booting 18.2 and with 18.3.

So problem might not be X related at all.=20

I will add this drm pointer error also.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15160340380.786a9.7148--

--===============1273936651==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1273936651==--
