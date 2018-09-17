From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107963] kernel rejected pushbuf: Invalid argument
Date: Mon, 17 Sep 2018 19:28:02 +0000
Message-ID: <bug-107963-8800-Er411YuXUJ@http.bugs.freedesktop.org/>
References: <bug-107963-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1950519060=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-107963-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1950519060==
Content-Type: multipart/alternative; boundary="15372124820.321eEa.7345"
Content-Transfer-Encoding: 7bit


--15372124820.321eEa.7345
Date: Mon, 17 Sep 2018 19:28:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107963

--- Comment #2 from mikhail.v.gavrilov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
$ inxi -bM
System:    Host: localhost.localdomain Kernel: 4.19.0-0.rc3.git3.1.fc30.x86=
_64
x86_64 bits: 64=20
           Desktop: Gnome 3.30.0 Distro: Fedora release 30 (Rawhide)=20
Machine:   Type: Desktop Mobo: ASUSTeK model: ROG STRIX X470-I GAMING v: Rev
1.xx serial: <root required>=20
           UEFI: American Megatrends v: 0901 date: 07/23/2018=20
CPU:       8-Core: AMD Ryzen 7 2700X type: MT MCP speed: 2145 MHz min/max:
2200/3700 MHz=20
Graphics:  Device-1: NVIDIA GT218 [GeForce 210] driver: nouveau v: kernel=20
           Display: wayland server: Fedora Project X.org 11.0 driver: nouve=
au
resolution: 1920x1080~60Hz=20
           OpenGL: renderer: NVA8 v: 3.3 Mesa 18.2.0=20
Network:   Device-1: Intel I211 Gigabit Network driver: igb=20
           Device-2: Realtek RTL8822BE 802.11a/b/g/n/ac WiFi adapter driver:
r8822be=20
Drives:    Local Storage: total: 11.35 TiB used: 17.08 GiB (0.1%)=20
Info:      Processes: 349 Uptime: 42m Memory: 31.36 GiB used: 3.23 GiB (10.=
3%)
Shell: bash inxi: 3.0.24

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15372124820.321eEa.7345
Date: Mon, 17 Sep 2018 19:28:02 +0000
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
   title=3D"NEW - kernel rejected pushbuf: Invalid argument"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107963#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - kernel rejected pushbuf: Invalid argument"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107963">bug 10796=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mikhail.v.gavrilov&#64;gmail.com" title=3D"mikhail.v.gavrilov&#64;gmail.com=
">mikhail.v.gavrilov&#64;gmail.com</a>
</span></b>
        <pre>$ inxi -bM
System:    Host: localhost.localdomain Kernel: 4.19.0-0.rc3.git3.1.fc30.x86=
_64
x86_64 bits: 64=20
           Desktop: Gnome 3.30.0 Distro: Fedora release 30 (Rawhide)=20
Machine:   Type: Desktop Mobo: ASUSTeK model: ROG STRIX X470-I GAMING v: Rev
1.xx serial: &lt;root required&gt;=20
           UEFI: American Megatrends v: 0901 date: 07/23/2018=20
CPU:       8-Core: AMD Ryzen 7 2700X type: MT MCP speed: 2145 MHz min/max:
2200/3700 MHz=20
Graphics:  Device-1: NVIDIA GT218 [GeForce 210] driver: nouveau v: kernel=20
           Display: wayland server: Fedora Project X.org 11.0 driver: nouve=
au
resolution: 1920x1080~60Hz=20
           OpenGL: renderer: NVA8 v: 3.3 Mesa 18.2.0=20
Network:   Device-1: Intel I211 Gigabit Network driver: igb=20
           Device-2: Realtek RTL8822BE 802.11a/b/g/n/ac WiFi adapter driver:
r8822be=20
Drives:    Local Storage: total: 11.35 TiB used: 17.08 GiB (0.1%)=20
Info:      Processes: 349 Uptime: 42m Memory: 31.36 GiB used: 3.23 GiB (10.=
3%)
Shell: bash inxi: 3.0.24</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15372124820.321eEa.7345--

--===============1950519060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1950519060==--
