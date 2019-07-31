From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98386] [NVE7] bus: MMIO write of FAULT at [ IBUS ],
 Pointer to {TDMS, flat panel} table invalid
Date: Wed, 31 Jul 2019 05:49:10 +0000
Message-ID: <bug-98386-8800-2WEtz5upZT@http.bugs.freedesktop.org/>
References: <bug-98386-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1709885178=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98386-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1709885178==
Content-Type: multipart/alternative; boundary="15645521504.Ea7eb9c.13893"
Content-Transfer-Encoding: 7bit


--15645521504.Ea7eb9c.13893
Date: Wed, 31 Jul 2019 05:49:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98386

--- Comment #27 from tojestzart <penteljapan-h7QdYz1kt/Q@public.gmane.org> ---
kubuntu 19.04
ASUS K56CB-XO100H
persist
nouveau 0000:01:00.0: bus: MMIO write of 8000001f FAULT at 6013d4 [ IBUS ]
lsd@lsd-K56CB:~/q2jump/src$ lspci -nnk | grep -iA2 vga=20
00:02.0 VGA compatible controller [0300]: Intel Corporation 3rd Gen Core
processor Graphics Controller [8086:0166] (rev 09)
        Subsystem: ASUSTeK Computer Inc. 3rd Gen Core processor Graphics
Controller [1043:1587]
        Kernel driver in use: i915
lsd@lsd-K56CB:~/q2jump/src$ inxi -Gx
Graphics:  Device-1: Intel 3rd Gen Core processor Graphics vendor: ASUSTeK
driver: i915 v: kernel bus ID: 00:02.0=20
           Device-2: NVIDIA GK107M [GeForce GT 740M] vendor: ASUSTeK driver:
nouveau v: kernel bus ID: 01:00.0=20
           Display: x11 server: X.Org 1.20.4 driver: modesetting unloaded:
fbdev,vesa resolution: 1366x768~60Hz=20
           OpenGL: renderer: Mesa DRI Intel Ivybridge Mobile v: 4.2 Mesa 19=
.0.2
direct render: Yes=20
lsd@lsd-K56CB:~/q2jump/src$

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15645521504.Ea7eb9c.13893
Date: Wed, 31 Jul 2019 05:49:10 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer=
 to {TDMS,flat panel} table invalid"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98386#c27">Commen=
t # 27</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer=
 to {TDMS,flat panel} table invalid"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98386">bug 98386<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
penteljapan&#64;o2.pl" title=3D"tojestzart &lt;penteljapan&#64;o2.pl&gt;"> =
<span class=3D"fn">tojestzart</span></a>
</span></b>
        <pre>kubuntu 19.04
ASUS K56CB-XO100H
persist
nouveau 0000:01:00.0: bus: MMIO write of 8000001f FAULT at 6013d4 [ IBUS ]
lsd&#64;lsd-K56CB:~/q2jump/src$ lspci -nnk | grep -iA2 vga=20
00:02.0 VGA compatible controller [0300]: Intel Corporation 3rd Gen Core
processor Graphics Controller [8086:0166] (rev 09)
        Subsystem: ASUSTeK Computer Inc. 3rd Gen Core processor Graphics
Controller [1043:1587]
        Kernel driver in use: i915
lsd&#64;lsd-K56CB:~/q2jump/src$ inxi -Gx
Graphics:  Device-1: Intel 3rd Gen Core processor Graphics vendor: ASUSTeK
driver: i915 v: kernel bus ID: 00:02.0=20
           Device-2: NVIDIA GK107M [GeForce GT 740M] vendor: ASUSTeK driver:
nouveau v: kernel bus ID: 01:00.0=20
           Display: x11 server: X.Org 1.20.4 driver: modesetting unloaded:
fbdev,vesa resolution: 1366x768~60Hz=20
           OpenGL: renderer: Mesa DRI Intel Ivybridge Mobile v: 4.2 Mesa 19=
.0.2
direct render: Yes=20
lsd&#64;lsd-K56CB:~/q2jump/src$</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15645521504.Ea7eb9c.13893--

--===============1709885178==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1709885178==--
