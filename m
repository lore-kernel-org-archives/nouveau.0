From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87942] [NVE7] Unable to use nouveau
Date: Thu, 01 Jan 2015 21:23:55 +0000
Message-ID: <bug-87942-8800-C0mXrn8ztA@http.bugs.freedesktop.org/>
References: <bug-87942-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1614590535=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87942-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1614590535==
Content-Type: multipart/alternative; boundary="1420147435.Fdb251.25507"; charset="UTF-8"


--1420147435.Fdb251.25507
Date: Thu, 1 Jan 2015 21:23:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D87942

--- Comment #10 from bruno.pagani-vYW+cPY1g1pg9hUCZPvPmw@public.gmane.org ---
Created attachment 111625
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D111625&action=3Dedit
Xorg.0.log

(In reply to Ilia Mirkin from comment #9)
> The GPU's graph unit, responsible for all acceleration, is having trouble
> initializing. You would still be able to use reverse-prime though, I thin=
k.
> (i.e. use the intel gpu to render to screens attached to the nvidia gpu --
> sometimes HDMI/etc are that way).

OK, but that=E2=80=99s pointless here, I=E2=80=99ve choose this laptop afte=
r being sure that
HDMI and mini-DP were wired to the Intel GPU.

> > > X has to start after nouveau loads, otherwise it doesn't know about t=
he
> > > nouveau adapter. (This may no longer be the case with DRI3-based offl=
oading
> > > actually...)
> >=20
> > Then, is there a way to force nouveau to load at boot, and else, is
> > restarting X after loading nouveau supposed to work (for the record, tr=
ied
> > that, and it doesn=E2=80=99t work either, but I=E2=80=99m not sure if i=
t is supposed to work
> > since it looks like I=E2=80=99m indeed affected by the issue you=E2=80=
=99ve linked).
>=20
> Depends on the "it" that you're talking about. You should be seeing
> NOUVEAU(GPU-0) messages in your xorg log if you start X after nouveau has
> loaded. Do you not?

I was talking of restarting X after loading nouveau, since I know no way to
force nouveau to load at boot. I wasn=E2=80=99t seeing those lines, but I=
=E2=80=99ve figured
out it was because of this section of the multiple xorg.conf files:

Section "Device"
   Identifier  "Intel Graphics"
   Driver      "intel"
   Option      "Backlight"     "intel_backlight"
EndSection

Since I=E2=80=99m currently not needing it (because in my actual configurat=
ion it has
no effect, but that=E2=80=99s another story), I commented this out, and it =
does =E2=80=9Cwork=E2=80=9D,
in the sense that I get the attached Xorg.0.log, and obviously the following
lines in dmesg:

[ 6509.306972] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 F=
AULT
at 0x418880 [ IBUS ]
[ 6509.307022] nouveau E[   PIBUS][0000:02:00.0] GPC0: 0x419eb4 0xbadf1000
(0x3800820c)
[ 6509.307071] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x3f800000 F=
AULT
at 0x405804 [ IBUS ]
[ 6509.307263] nouveau E[   PIBUS][0000:02:00.0] HUB0: 0x404170 0x00000012
(0x0e008201)
[ 6511.309246] nouveau E[  PGRAPH][0000:02:00.0] HUB_INIT timed out
[ 6511.309254] nouveau E[  PGRAPH][0000:02:00.0] 409000 - done 0x00000204
[ 6511.309263] nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[ 6511.309273] nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000000
0x00000000 0x00000002 0x00000009
[ 6511.309276] nouveau E[  PGRAPH][0000:02:00.0] 502000 - done 0x00000300
[ 6511.309281] nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[ 6511.309285] nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[ 6511.309287] nouveau E[  PGRAPH][0000:02:00.0] init failed, -16

Also:

xrandr --listproviders
Providers: number : 2
Provider 0: id: 0x69 cap: 0xb, Source Output, Sink Output, Sink Offload crt=
cs:
4 outputs: 6 associated providers: 0 name:Intel
Provider 1: id: 0x3f cap: 0x5, Source Output, Source Offload crtcs: 0 outpu=
ts:
0 associated providers: 0 name:nouveau

But after =E2=80=9Cxrandr --setprovideroffloadsink nouveau Intel=E2=80=9D, =
=E2=80=9CDRI_PRIME=3D1
glxinfo=E2=80=9D results in X.org crashing with:

[  7519.419] (EE)=20
[  7519.419] (EE) Backtrace:
[  7519.419] (EE) 0: /usr/bin/Xorg.bin (xorg_backtrace+0x56) [0x594276]
[  7519.419] (EE) 1: /usr/bin/Xorg.bin (0x400000+0x1983c9) [0x5983c9]
[  7519.419] (EE) 2: /usr/lib/libc.so.6 (0x7f51e163a000+0x33b20)
[0x7f51e166db20]
[  7519.419] (EE) 3: /usr/bin/Xorg.bin (0x400000+0x1632a4) [0x5632a4]
[  7519.419] (EE) 4: /usr/bin/Xorg.bin (0x400000+0x1632dd) [0x5632dd]
[  7519.419] (EE) 5: /usr/bin/Xorg.bin (DRI2Connect+0x3d) [0x56537d]
[  7519.419] (EE) 6: /usr/bin/Xorg.bin (0x400000+0x16611a) [0x56611a]
[  7519.419] (EE) 7: /usr/bin/Xorg.bin (0x400000+0x37807) [0x437807]
[  7519.419] (EE) 8: /usr/bin/Xorg.bin (0x400000+0x3b9a6) [0x43b9a6]
[  7519.419] (EE) 9: /usr/lib/libc.so.6 (__libc_start_main+0xf0)
[0x7f51e165a040]
[  7519.419] (EE) 10: /usr/bin/Xorg.bin (0x400000+0x25dce) [0x425dce]
[  7519.419] (EE)=20
[  7519.419] (EE) Segmentation fault at address 0x28
[  7519.420] (EE)=20
Fatal server error:
[  7519.420] (EE) Caught signal 11 (Segmentation fault). Server aborting
[  7519.420] (EE)=20
[  7519.420] (EE)=20
Please consult the The X.Org Foundation support=20
         at http://wiki.x.org
 for help.=20
[  7519.420] (EE) Please also check the log file at "/var/log/Xorg.0.log" f=
or
additional information.
[  7519.420] (EE)=20
[  7519.420] (II) AIGLX: Suspending AIGLX clients for VT switch
[  7519.435] (EE) Server terminated with error (1). Closing log file.

So I suppose that now this can be closed and that I should follow on bug 70=
354.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1420147435.Fdb251.25507
Date: Thu, 1 Jan 2015 21:23:55 +0000
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
   title=3D"NEW - [NVE7] Unable to use nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D87942#c10">Commen=
t # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE7] Unable to use nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D87942">bug 87942<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bruno.pagani&#64;ens-lyon.org" title=3D"bruno.pagani&#64;ens-lyon.org">brun=
o.pagani&#64;ens-lyon.org</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D111625=
" name=3D"attach_111625" title=3D"Xorg.0.log">attachment 111625</a> <a href=
=3D"attachment.cgi?id=3D111625&amp;action=3Dedit" title=3D"Xorg.0.log">[det=
ails]</a></span>
Xorg.0.log

(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D87942#c9">commen=
t #9</a>)
<span class=3D"quote">&gt; The GPU's graph unit, responsible for all accele=
ration, is having trouble
&gt; initializing. You would still be able to use reverse-prime though, I t=
hink.
&gt; (i.e. use the intel gpu to render to screens attached to the nvidia gp=
u --
&gt; sometimes HDMI/etc are that way).</span >

OK, but that=E2=80=99s pointless here, I=E2=80=99ve choose this laptop afte=
r being sure that
HDMI and mini-DP were wired to the Intel GPU.

<span class=3D"quote">&gt; &gt; &gt; X has to start after nouveau loads, ot=
herwise it doesn't know about the
&gt; &gt; &gt; nouveau adapter. (This may no longer be the case with DRI3-b=
ased offloading
&gt; &gt; &gt; actually...)
&gt; &gt;=20
&gt; &gt; Then, is there a way to force nouveau to load at boot, and else, =
is
&gt; &gt; restarting X after loading nouveau supposed to work (for the reco=
rd, tried
&gt; &gt; that, and it doesn=E2=80=99t work either, but I=E2=80=99m not sur=
e if it is supposed to work
&gt; &gt; since it looks like I=E2=80=99m indeed affected by the issue you=
=E2=80=99ve linked).
&gt;=20
&gt; Depends on the &quot;it&quot; that you're talking about. You should be=
 seeing
&gt; NOUVEAU(GPU-0) messages in your xorg log if you start X after nouveau =
has
&gt; loaded. Do you not?</span >

I was talking of restarting X after loading nouveau, since I know no way to
force nouveau to load at boot. I wasn=E2=80=99t seeing those lines, but I=
=E2=80=99ve figured
out it was because of this section of the multiple xorg.conf files:

Section &quot;Device&quot;
   Identifier  &quot;Intel Graphics&quot;
   Driver      &quot;intel&quot;
   Option      &quot;Backlight&quot;     &quot;intel_backlight&quot;
EndSection

Since I=E2=80=99m currently not needing it (because in my actual configurat=
ion it has
no effect, but that=E2=80=99s another story), I commented this out, and it =
does =E2=80=9Cwork=E2=80=9D,
in the sense that I get the attached Xorg.0.log, and obviously the following
lines in dmesg:

[ 6509.306972] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 F=
AULT
at 0x418880 [ IBUS ]
[ 6509.307022] nouveau E[   PIBUS][0000:02:00.0] GPC0: 0x419eb4 0xbadf1000
(0x3800820c)
[ 6509.307071] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x3f800000 F=
AULT
at 0x405804 [ IBUS ]
[ 6509.307263] nouveau E[   PIBUS][0000:02:00.0] HUB0: 0x404170 0x00000012
(0x0e008201)
[ 6511.309246] nouveau E[  PGRAPH][0000:02:00.0] HUB_INIT timed out
[ 6511.309254] nouveau E[  PGRAPH][0000:02:00.0] 409000 - done 0x00000204
[ 6511.309263] nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[ 6511.309273] nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000000
0x00000000 0x00000002 0x00000009
[ 6511.309276] nouveau E[  PGRAPH][0000:02:00.0] 502000 - done 0x00000300
[ 6511.309281] nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[ 6511.309285] nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[ 6511.309287] nouveau E[  PGRAPH][0000:02:00.0] init failed, -16

Also:

xrandr --listproviders
Providers: number : 2
Provider 0: id: 0x69 cap: 0xb, Source Output, Sink Output, Sink Offload crt=
cs:
4 outputs: 6 associated providers: 0 name:Intel
Provider 1: id: 0x3f cap: 0x5, Source Output, Source Offload crtcs: 0 outpu=
ts:
0 associated providers: 0 name:nouveau

But after =E2=80=9Cxrandr --setprovideroffloadsink nouveau Intel=E2=80=9D, =
=E2=80=9CDRI_PRIME=3D1
glxinfo=E2=80=9D results in X.org crashing with:

[  7519.419] (EE)=20
[  7519.419] (EE) Backtrace:
[  7519.419] (EE) 0: /usr/bin/Xorg.bin (xorg_backtrace+0x56) [0x594276]
[  7519.419] (EE) 1: /usr/bin/Xorg.bin (0x400000+0x1983c9) [0x5983c9]
[  7519.419] (EE) 2: /usr/lib/libc.so.6 (0x7f51e163a000+0x33b20)
[0x7f51e166db20]
[  7519.419] (EE) 3: /usr/bin/Xorg.bin (0x400000+0x1632a4) [0x5632a4]
[  7519.419] (EE) 4: /usr/bin/Xorg.bin (0x400000+0x1632dd) [0x5632dd]
[  7519.419] (EE) 5: /usr/bin/Xorg.bin (DRI2Connect+0x3d) [0x56537d]
[  7519.419] (EE) 6: /usr/bin/Xorg.bin (0x400000+0x16611a) [0x56611a]
[  7519.419] (EE) 7: /usr/bin/Xorg.bin (0x400000+0x37807) [0x437807]
[  7519.419] (EE) 8: /usr/bin/Xorg.bin (0x400000+0x3b9a6) [0x43b9a6]
[  7519.419] (EE) 9: /usr/lib/libc.so.6 (__libc_start_main+0xf0)
[0x7f51e165a040]
[  7519.419] (EE) 10: /usr/bin/Xorg.bin (0x400000+0x25dce) [0x425dce]
[  7519.419] (EE)=20
[  7519.419] (EE) Segmentation fault at address 0x28
[  7519.420] (EE)=20
Fatal server error:
[  7519.420] (EE) Caught signal 11 (Segmentation fault). Server aborting
[  7519.420] (EE)=20
[  7519.420] (EE)=20
Please consult the The X.Org Foundation support=20
         at <a href=3D"http://wiki.x.org">http://wiki.x.org</a>
 for help.=20
[  7519.420] (EE) Please also check the log file at &quot;/var/log/Xorg.0.l=
og&quot; for
additional information.
[  7519.420] (EE)=20
[  7519.420] (II) AIGLX: Suspending AIGLX clients for VT switch
[  7519.435] (EE) Server terminated with error (1). Closing log file.

So I suppose that now this can be closed and that I should follow on <a cla=
ss=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn=
't help"
   href=3D"show_bug.cgi?id=3D70354">bug 70354</a>.</pre>
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

--1420147435.Fdb251.25507--

--===============1614590535==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1614590535==--
