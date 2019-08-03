From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107964] [GTX970] system hang when using libreoffice
Date: Sat, 03 Aug 2019 17:09:44 +0000
Message-ID: <bug-107964-8800-xzy7SQIgNs@http.bugs.freedesktop.org/>
References: <bug-107964-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1612493531=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-107964-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1612493531==
Content-Type: multipart/alternative; boundary="15648521843.D07da0e5.31487"
Content-Transfer-Encoding: 7bit


--15648521843.D07da0e5.31487
Date: Sat, 3 Aug 2019 17:09:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107964

--- Comment #1 from Karl Schendel <schendel-zf86OBlHRo2+XT7JhA+gdA@public.gmane.org> ---
I'm getting this exact message (with slightly different addresses) on a GT =
710
setup.  Mouse cursor moves but everything else on the screen is frozen.  I
don't know yet whether the machine is response over the network.  I can't
reproduce it but it seems to happen most often after playing a video in Chr=
ome
and then closing the Chrome window.  I've seen it other times though.

My last messages:
Aug 03 12:50:11 stein kernel: nouveau 0000:07:00.0: fifo: fault 01 [WRITE] =
at
0000000000240000 engine 00 [GR] client 0f [GPC0/PROP_0] reason 82 [] on cha=
nnel
2 [003fbec000 X[1225]]
Aug 03 12:50:11 stein kernel: nouveau 0000:07:00.0: fifo: channel 2: killed
Aug 03 12:50:11 stein kernel: nouveau 0000:07:00.0: fifo: runlist 0: schedu=
led
for recovery
Aug 03 12:50:11 stein kernel: nouveau 0000:07:00.0: fifo: engine 0: schedul=
ed
for recovery
Aug 03 12:50:11 stein kernel: nouveau 0000:07:00.0: X[1225]: channel 2 kill=
ed!

Kernel 5.0.20

lspci -vs 07:00.0
07:00.0 VGA compatible controller: NVIDIA Corporation GK208B [GeForce GT 71=
0]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: Micro-Star International Co., Ltd. [MSI] Device 8c93
        Flags: bus master, fast devsel, latency 0, IRQ 63
        Memory at f6000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at e8000000 (64-bit, prefetchable) [size=3D128M]
        Memory at f0000000 (64-bit, prefetchable) [size=3D32M]
        I/O ports at e000 [size=3D128]
        Expansion ROM at f7000000 [disabled] [size=3D512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [78] Express Legacy Endpoint, MSI 00
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting <?>
        Capabilities: [600] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D024
<?>
        Kernel driver in use: nouveau
        Kernel modules: nouveau

Single 1080p monitor, DVI connection.  Xorg.log from crash attached.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15648521843.D07da0e5.31487
Date: Sat, 3 Aug 2019 17:09:44 +0000
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
   title=3D"NEW - [GTX970] system hang when using libreoffice"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107964#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GTX970] system hang when using libreoffice"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107964">bug 10796=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
schendel&#64;kbcomputer.com" title=3D"Karl Schendel &lt;schendel&#64;kbcomp=
uter.com&gt;"> <span class=3D"fn">Karl Schendel</span></a>
</span></b>
        <pre>I'm getting this exact message (with slightly different addres=
ses) on a GT 710
setup.  Mouse cursor moves but everything else on the screen is frozen.  I
don't know yet whether the machine is response over the network.  I can't
reproduce it but it seems to happen most often after playing a video in Chr=
ome
and then closing the Chrome window.  I've seen it other times though.

My last messages:
Aug 03 12:50:11 stein kernel: nouveau 0000:07:00.0: fifo: fault 01 [WRITE] =
at
0000000000240000 engine 00 [GR] client 0f [GPC0/PROP_0] reason 82 [] on cha=
nnel
2 [003fbec000 X[1225]]
Aug 03 12:50:11 stein kernel: nouveau 0000:07:00.0: fifo: channel 2: killed
Aug 03 12:50:11 stein kernel: nouveau 0000:07:00.0: fifo: runlist 0: schedu=
led
for recovery
Aug 03 12:50:11 stein kernel: nouveau 0000:07:00.0: fifo: engine 0: schedul=
ed
for recovery
Aug 03 12:50:11 stein kernel: nouveau 0000:07:00.0: X[1225]: channel 2 kill=
ed!

Kernel 5.0.20

lspci -vs 07:00.0
07:00.0 VGA compatible controller: NVIDIA Corporation GK208B [GeForce GT 71=
0]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: Micro-Star International Co., Ltd. [MSI] Device 8c93
        Flags: bus master, fast devsel, latency 0, IRQ 63
        Memory at f6000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at e8000000 (64-bit, prefetchable) [size=3D128M]
        Memory at f0000000 (64-bit, prefetchable) [size=3D32M]
        I/O ports at e000 [size=3D128]
        Expansion ROM at f7000000 [disabled] [size=3D512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [78] Express Legacy Endpoint, MSI 00
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting &lt;?&gt;
        Capabilities: [600] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D024
&lt;?&gt;
        Kernel driver in use: nouveau
        Kernel modules: nouveau

Single 1080p monitor, DVI connection.  Xorg.log from crash attached.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15648521843.D07da0e5.31487--

--===============1612493531==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1612493531==--
