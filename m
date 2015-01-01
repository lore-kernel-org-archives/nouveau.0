From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87942] [NVE7] Unable to use nouveau
Date: Thu, 01 Jan 2015 19:01:41 +0000
Message-ID: <bug-87942-8800-emRKmgquUV@http.bugs.freedesktop.org/>
References: <bug-87942-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0279740870=="
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


--===============0279740870==
Content-Type: multipart/alternative; boundary="1420138901.D3fbF151.9371"; charset="UTF-8"


--1420138901.D3fbF151.9371
Date: Thu, 1 Jan 2015 19:01:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D87942

--- Comment #4 from bruno.pagani-vYW+cPY1g1pg9hUCZPvPmw@public.gmane.org ---
Created attachment 111622
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D111622&action=3Dedit
xorg.conf.nouveau

(In reply to Ilia Mirkin from comment #3)
>=20
> Two observations --
>=20
> (a) nouveau isn't being added as a GPU but rather as a "primary" video ca=
rd.

That is supposed to be the behavior of Bumblebee (two X.org server, one with
the integrated card only, another with the dedicated one only, fired up at
demand, i.e. when you do optirun something), unless I misunderstood somethi=
ng
somewhere.

> I had assumed you had one of the new-fangled optimus situations where the
> screens are attached to the igpu and 3d offloading can be done to the
> secondary gpu -- is that not the case? Using an xorg.conf with Device
> entries tends to mess all of that up, btw.

Indeed, every outputs are attached to my igpu. About xorg.conf files, I have
/etc/bumblebee/xorg.conf.nouveau, which is used by Bumblebee and is attache=
d,
but I=E2=80=99ve also just seen that I have this in /etc/X11/xorg.conf.d/20=
-intel.conf:

Section "ServerLayout"
    Identifier  "Layout0"
    Option      "AutoAddGPU" "false"
EndSection

I=E2=80=99m going to comment that section and restart X to see if it change=
s anything
about DRI_PRIME.

> (b) That error should have caused some nasties to be printed to dmesg. I
> think I know what they are, but I still want to see them.

You=E2=80=99re absolutely right, here they are:

On first attempt:
nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x41888=
0 [
IBUS ]
nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x418c6=
4 [
IBUS ]
nouveau E[   PIBUS][0000:02:00.0] GPC0: 0x419f74 0x00000555 (0x3800820c)
nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x41bff=
8 [
IBUS ]
nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000002 FAULT at 0x50091=
4 [
IBUS ]
nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000002 FAULT at 0x4188a=
c [
IBUS ]
nouveau E[    PBUS][0000:02:00.0] MMIO write of 0xbadf1008 FAULT at 0x419cc=
0 [
IBUS ]
nouveau E[   PIBUS][0000:02:00.0] GPC0: 0x419cc0 0xbadf1008 (0x3800820c)
nouveau E[    PBUS][0000:02:00.0] MMIO write of 0xbadf1000 FAULT at 0x419eb=
4 [
IBUS ]
nouveau E[   PIBUS][0000:02:00.0] GPC0: 0x419eb4 0xbadf1000 (0x3800820c)
nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x40580=
4 [
IBUS ]
nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x3f800000 FAULT at 0x40580=
4 [
IBUS ]
nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x40580=
4 [
IBUS ]
nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x3f800000 FAULT at 0x40580=
4 [
IBUS ]
nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x40581=
8 [
IBUS ]
nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x3f800000 FAULT at 0x40581=
8 [
IBUS ]
nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x40581=
c [
IBUS ]
nouveau E[   PIBUS][0000:02:00.0] HUB0: 0x404170 0x00000012 (0x0e008201)
nouveau E[  PGRAPH][0000:02:00.0] HUB_INIT timed out
nouveau E[  PGRAPH][0000:02:00.0] 409000 - done 0x00000204
nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000000 0x00000000
0x00000000 0x00000000
nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000000 0x00000000
0x00000002 0x00000009
nouveau E[  PGRAPH][0000:02:00.0] 502000 - done 0x00000300
nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000000 0x00000000
0x00000000 0x00000000
nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000000 0x00000000
0x00000000 0x00000000
nouveau E[  PGRAPH][0000:02:00.0] init failed, -16

And next ones are all identical to:

nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x41888=
0 [
IBUS ]
nouveau E[   PIBUS][0000:02:00.0] GPC0: 0x419eb4 0xbadf1000 (0x3800820c)
nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000002 FAULT at 0x40582=
0 [
IBUS ]
nouveau E[   PIBUS][0000:02:00.0] HUB0: 0x404170 0x00000012 (0x0e008201)
nouveau E[  PGRAPH][0000:02:00.0] HUB_INIT timed out
nouveau E[  PGRAPH][0000:02:00.0] 409000 - done 0x00000204
nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000000 0x00000000
0x00000000 0x00000000
nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000000 0x00000000
0x00000002 0x00000009
nouveau E[  PGRAPH][0000:02:00.0] 502000 - done 0x00000300
nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000000 0x00000000
0x00000000 0x00000000
nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000000 0x00000000
0x00000000 0x00000000
nouveau E[  PGRAPH][0000:02:00.0] init failed, -16

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1420138901.D3fbF151.9371
Date: Thu, 1 Jan 2015 19:01:41 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D87942#c4">Comment=
 # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE7] Unable to use nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D87942">bug 87942<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bruno.pagani&#64;ens-lyon.org" title=3D"bruno.pagani&#64;ens-lyon.org">brun=
o.pagani&#64;ens-lyon.org</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D111622=
" name=3D"attach_111622" title=3D"xorg.conf.nouveau">attachment 111622</a> =
<a href=3D"attachment.cgi?id=3D111622&amp;action=3Dedit" title=3D"xorg.conf=
.nouveau">[details]</a></span>
xorg.conf.nouveau

(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D87942#c3">commen=
t #3</a>)
<span class=3D"quote">&gt;=20
&gt; Two observations --
&gt;=20
&gt; (a) nouveau isn't being added as a GPU but rather as a &quot;primary&q=
uot; video card.</span >

That is supposed to be the behavior of Bumblebee (two X.org server, one with
the integrated card only, another with the dedicated one only, fired up at
demand, i.e. when you do optirun something), unless I misunderstood somethi=
ng
somewhere.

<span class=3D"quote">&gt; I had assumed you had one of the new-fangled opt=
imus situations where the
&gt; screens are attached to the igpu and 3d offloading can be done to the
&gt; secondary gpu -- is that not the case? Using an xorg.conf with Device
&gt; entries tends to mess all of that up, btw.</span >

Indeed, every outputs are attached to my igpu. About xorg.conf files, I have
/etc/bumblebee/xorg.conf.nouveau, which is used by Bumblebee and is attache=
d,
but I=E2=80=99ve also just seen that I have this in /etc/X11/xorg.conf.d/20=
-intel.conf:

Section &quot;ServerLayout&quot;
    Identifier  &quot;Layout0&quot;
    Option      &quot;AutoAddGPU&quot; &quot;false&quot;
EndSection

I=E2=80=99m going to comment that section and restart X to see if it change=
s anything
about DRI_PRIME.

<span class=3D"quote">&gt; (b) That error should have caused some nasties t=
o be printed to dmesg. I
&gt; think I know what they are, but I still want to see them.</span >

You=E2=80=99re absolutely right, here they are:

On first attempt:
nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x41888=
0 [
IBUS ]
nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x418c6=
4 [
IBUS ]
nouveau E[   PIBUS][0000:02:00.0] GPC0: 0x419f74 0x00000555 (0x3800820c)
nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x41bff=
8 [
IBUS ]
nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000002 FAULT at 0x50091=
4 [
IBUS ]
nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000002 FAULT at 0x4188a=
c [
IBUS ]
nouveau E[    PBUS][0000:02:00.0] MMIO write of 0xbadf1008 FAULT at 0x419cc=
0 [
IBUS ]
nouveau E[   PIBUS][0000:02:00.0] GPC0: 0x419cc0 0xbadf1008 (0x3800820c)
nouveau E[    PBUS][0000:02:00.0] MMIO write of 0xbadf1000 FAULT at 0x419eb=
4 [
IBUS ]
nouveau E[   PIBUS][0000:02:00.0] GPC0: 0x419eb4 0xbadf1000 (0x3800820c)
nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x40580=
4 [
IBUS ]
nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x3f800000 FAULT at 0x40580=
4 [
IBUS ]
nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x40580=
4 [
IBUS ]
nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x3f800000 FAULT at 0x40580=
4 [
IBUS ]
nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x40581=
8 [
IBUS ]
nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x3f800000 FAULT at 0x40581=
8 [
IBUS ]
nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x40581=
c [
IBUS ]
nouveau E[   PIBUS][0000:02:00.0] HUB0: 0x404170 0x00000012 (0x0e008201)
nouveau E[  PGRAPH][0000:02:00.0] HUB_INIT timed out
nouveau E[  PGRAPH][0000:02:00.0] 409000 - done 0x00000204
nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000000 0x00000000
0x00000000 0x00000000
nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000000 0x00000000
0x00000002 0x00000009
nouveau E[  PGRAPH][0000:02:00.0] 502000 - done 0x00000300
nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000000 0x00000000
0x00000000 0x00000000
nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000000 0x00000000
0x00000000 0x00000000
nouveau E[  PGRAPH][0000:02:00.0] init failed, -16

And next ones are all identical to:

nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x41888=
0 [
IBUS ]
nouveau E[   PIBUS][0000:02:00.0] GPC0: 0x419eb4 0xbadf1000 (0x3800820c)
nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000002 FAULT at 0x40582=
0 [
IBUS ]
nouveau E[   PIBUS][0000:02:00.0] HUB0: 0x404170 0x00000012 (0x0e008201)
nouveau E[  PGRAPH][0000:02:00.0] HUB_INIT timed out
nouveau E[  PGRAPH][0000:02:00.0] 409000 - done 0x00000204
nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000000 0x00000000
0x00000000 0x00000000
nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000000 0x00000000
0x00000002 0x00000009
nouveau E[  PGRAPH][0000:02:00.0] 502000 - done 0x00000300
nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000000 0x00000000
0x00000000 0x00000000
nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000000 0x00000000
0x00000000 0x00000000
nouveau E[  PGRAPH][0000:02:00.0] init failed, -16</pre>
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

--1420138901.D3fbF151.9371--

--===============0279740870==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0279740870==--
