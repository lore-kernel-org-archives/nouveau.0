From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101764] [regression] eaa2c988033b breaks GTX1050TI
 (GP107 / NV137)
Date: Wed, 12 Jul 2017 14:05:58 +0000
Message-ID: <bug-101764-8800-iuvvTkhTP8@http.bugs.freedesktop.org/>
References: <bug-101764-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0977713620=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101764-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0977713620==
Content-Type: multipart/alternative; boundary="14998683582.cF4d7.7993";
 charset="UTF-8"


--14998683582.cF4d7.7993
Date: Wed, 12 Jul 2017 14:05:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101764

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Jul 11 16:14:59 endless kernel: nouveau 0000:01:00.0: bus: MMIO read of
00000000 FAULT at 409800 [ TIMEOUT ]
Jul 11 16:15:01 endless kernel: ------------[ cut here ]------------
Jul 11 16:15:01 endless kernel: WARNING: CPU: 1 PID: 11134 at
/usr/src/packages/BUILD/linux-4.11.0/drivers/gpu/drm/nouveau/nvkm/engine/gr=
/gf100.c:1499
gf100_gr_init_ctxctl_ext+0x3cc/0x7f0 [nouveau]
Jul 11 16:15:01 endless kernel: nouveau 0000:01:00.0: timeout

So it's having trouble loading the firmware. Please confirm that you have t=
he
latest firmware for gp107 (as there was a window of time when linux-firmware
contained bad firmware for gp107 -- some time ago now already, but you could
have a bad snapshot).

I believe I've seen this before though, also on a laptop. I see that it's u=
sing
the fancy new thing instead of ACPI DSM for powering it on:

Jul 11 16:14:58 endless kernel: VGA switcheroo: detected Optimus DSM method
\_SB_.PCI0.PEG0.PEGP handle
Jul 11 16:14:58 endless kernel: nouveau: detected PR support, will not use =
DSM

Can you try to boot in a way that forces the ACPI stuff to be used? I think
pcie_pm_port=3Doff is the thing. And nouveau.runpm=3D0 for good measure.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14998683582.cF4d7.7993
Date: Wed, 12 Jul 2017 14:05:58 +0000
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
   title=3D"NEW - [regression] eaa2c988033b breaks GTX1050TI (GP107 / NV137=
)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101764#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [regression] eaa2c988033b breaks GTX1050TI (GP107 / NV137=
)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101764">bug 10176=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Jul 11 16:14:59 endless kernel: nouveau 0000:01:00.0: bus: MMI=
O read of
00000000 FAULT at 409800 [ TIMEOUT ]
Jul 11 16:15:01 endless kernel: ------------[ cut here ]------------
Jul 11 16:15:01 endless kernel: WARNING: CPU: 1 PID: 11134 at
/usr/src/packages/BUILD/linux-4.11.0/drivers/gpu/drm/nouveau/nvkm/engine/gr=
/gf100.c:1499
gf100_gr_init_ctxctl_ext+0x3cc/0x7f0 [nouveau]
Jul 11 16:15:01 endless kernel: nouveau 0000:01:00.0: timeout

So it's having trouble loading the firmware. Please confirm that you have t=
he
latest firmware for gp107 (as there was a window of time when linux-firmware
contained bad firmware for gp107 -- some time ago now already, but you could
have a bad snapshot).

I believe I've seen this before though, also on a laptop. I see that it's u=
sing
the fancy new thing instead of ACPI DSM for powering it on:

Jul 11 16:14:58 endless kernel: VGA switcheroo: detected Optimus DSM method
\_SB_.PCI0.PEG0.PEGP handle
Jul 11 16:14:58 endless kernel: nouveau: detected PR support, will not use =
DSM

Can you try to boot in a way that forces the ACPI stuff to be used? I think
pcie_pm_port=3Doff is the thing. And nouveau.runpm=3D0 for good measure.</p=
re>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14998683582.cF4d7.7993--

--===============0977713620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0977713620==--
