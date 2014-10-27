From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81136] [NV92] Regression in Linux 3.15: GPU lockup
 after suspend
Date: Mon, 27 Oct 2014 22:41:17 +0000
Message-ID: <bug-81136-8800-y3wAioRkaS@http.bugs.freedesktop.org/>
References: <bug-81136-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1156163801=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-81136-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1156163801==
Content-Type: multipart/alternative; boundary="1414449676.b0AE2.14793"; charset="UTF-8"


--1414449676.b0AE2.14793
Date: Mon, 27 Oct 2014 22:41:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D81136

--- Comment #9 from Agust=C3=ADn Dall'Alba <agustin-G80yVrlpk+aH0oMTQjrRWA@public.gmane.org> ---
Another update:

I tried running with a secondary monitor. Unfortunately under that setup the
nouveau.nofbaccel=3D1 workaround doesn't cut it anymore, and only one monit=
or
works after resume. Trying to unplug and replug or use xrandr after this has
happened doesn't make the other monitor work and once even left me with no
screen. I found some new kernel messages, in particular:

<6>[    0.336621] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR3
<6>[    0.336623] nouveau  [     PFB][0000:01:00.0] RAM size: 512 MiB
<3>[    0.336620] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000007
FAULT at 0x00e180
--snip--
<6>[    0.365519] nouveau  [     DRM] VRAM: 512 MiB
<6>[    0.365521] nouveau  [     DRM] GART: 1048576 MiB
--snip--
<3>[    0.366886] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000
FAULT at 0x00e070
<3>[    0.368257] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000
FAULT at 0x00e070

right after nouveau loads, another:

<6>[   75.935933] nouveau  [     DRM] suspending console...
<6>[   75.935944] nouveau  [     DRM] suspending display...
<6>[   75.936012] nouveau  [     DRM] evicting buffers...
<6>[   76.206568] nouveau  [     DRM] waiting for kernel channels to go idl=
e...
<6>[   76.206573] nouveau  [     DRM] suspending client object trees...
<6>[   76.207261] nouveau  [     DRM] suspending kernel object tree...
<3>[   76.267516] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000
FAULT at 0x00e070

immediately before suspend and:

<6>[   78.110864] nouveau  [     DRM] re-enabling device...
<6>[   78.110870] nouveau  [     DRM] resuming kernel object tree...
<6>[   78.110882] nouveau  [   VBIOS][0000:01:00.0] running init tables
<3>[   78.200040] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000
FAULT at 0x00e074
<6>[   78.274292] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 1000000uv
<6>[   78.274303] nouveau  [  PTHERM][0000:01:00.0] fan management: automat=
ic
<6>[   78.274378] nouveau  [     CLK][0000:01:00.0] --: core 399 MHz shader=
 810
MHz memory 499 MHz
<3>[   78.275977] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000
FAULT at 0x00e070
<3>[   78.277301] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000
FAULT at 0x00e070
<6>[   78.277474] nouveau  [     DRM] resuming client object trees...
<6>[   78.277902] nouveau  [     DRM] resuming display...

on resume. Maybe this is another bug?

So now I'm using linux-lts 3.14.22. No problems there, suspend and multi
monitor setups work great.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1414449676.b0AE2.14793
Date: Mon, 27 Oct 2014 22:41:16 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV92] Regression in Linux 3.15: GPU lockup after suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D81136#c9">Comment=
 # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV92] Regression in Linux 3.15: GPU lockup after suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D81136">bug 81136<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
agustin&#64;dallalba.com.ar" title=3D"Agust=C3=ADn Dall'Alba &lt;agustin&#6=
4;dallalba.com.ar&gt;"> <span class=3D"fn">Agust=C3=ADn Dall'Alba</span></a>
</span></b>
        <pre>Another update:

I tried running with a secondary monitor. Unfortunately under that setup the
nouveau.nofbaccel=3D1 workaround doesn't cut it anymore, and only one monit=
or
works after resume. Trying to unplug and replug or use xrandr after this has
happened doesn't make the other monitor work and once even left me with no
screen. I found some new kernel messages, in particular:

&lt;6&gt;[    0.336621] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR3
&lt;6&gt;[    0.336623] nouveau  [     PFB][0000:01:00.0] RAM size: 512 MiB
&lt;3&gt;[    0.336620] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x0=
0000007
FAULT at 0x00e180
--snip--
&lt;6&gt;[    0.365519] nouveau  [     DRM] VRAM: 512 MiB
&lt;6&gt;[    0.365521] nouveau  [     DRM] GART: 1048576 MiB
--snip--
&lt;3&gt;[    0.366886] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x0=
0000000
FAULT at 0x00e070
&lt;3&gt;[    0.368257] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x0=
0000000
FAULT at 0x00e070

right after nouveau loads, another:

&lt;6&gt;[   75.935933] nouveau  [     DRM] suspending console...
&lt;6&gt;[   75.935944] nouveau  [     DRM] suspending display...
&lt;6&gt;[   75.936012] nouveau  [     DRM] evicting buffers...
&lt;6&gt;[   76.206568] nouveau  [     DRM] waiting for kernel channels to =
go idle...
&lt;6&gt;[   76.206573] nouveau  [     DRM] suspending client object trees.=
..
&lt;6&gt;[   76.207261] nouveau  [     DRM] suspending kernel object tree...
&lt;3&gt;[   76.267516] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x0=
0000000
FAULT at 0x00e070

immediately before suspend and:

&lt;6&gt;[   78.110864] nouveau  [     DRM] re-enabling device...
&lt;6&gt;[   78.110870] nouveau  [     DRM] resuming kernel object tree...
&lt;6&gt;[   78.110882] nouveau  [   VBIOS][0000:01:00.0] running init tabl=
es
&lt;3&gt;[   78.200040] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x0=
0000000
FAULT at 0x00e074
&lt;6&gt;[   78.274292] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 1000=
000uv
&lt;6&gt;[   78.274303] nouveau  [  PTHERM][0000:01:00.0] fan management: a=
utomatic
&lt;6&gt;[   78.274378] nouveau  [     CLK][0000:01:00.0] --: core 399 MHz =
shader 810
MHz memory 499 MHz
&lt;3&gt;[   78.275977] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x0=
0000000
FAULT at 0x00e070
&lt;3&gt;[   78.277301] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x0=
0000000
FAULT at 0x00e070
&lt;6&gt;[   78.277474] nouveau  [     DRM] resuming client object trees...
&lt;6&gt;[   78.277902] nouveau  [     DRM] resuming display...

on resume. Maybe this is another bug?

So now I'm using linux-lts 3.14.22. No problems there, suspend and multi
monitor setups work great.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1414449676.b0AE2.14793--

--===============1156163801==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1156163801==--
