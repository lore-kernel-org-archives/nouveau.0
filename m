From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87942] [NVE7] Unable to use nouveau
Date: Thu, 01 Jan 2015 19:09:04 +0000
Message-ID: <bug-87942-8800-3fBQqbcwMb@http.bugs.freedesktop.org/>
References: <bug-87942-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1703653882=="
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


--===============1703653882==
Content-Type: multipart/alternative; boundary="1420139344.f3C32.11858"; charset="UTF-8"


--1420139344.f3C32.11858
Date: Thu, 1 Jan 2015 19:09:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D87942

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to bruno.pagani from comment #4)
> /etc/X11/xorg.conf.d/20-intel.conf:
>=20
> Section "ServerLayout"
>     Identifier  "Layout0"
>     Option      "AutoAddGPU" "false"
> EndSection

Right, so this will disable adding the nouveau as a "GPU" screen, which mea=
ns
no prime.
>=20
> > (b) That error should have caused some nasties to be printed to dmesg. I
> > think I know what they are, but I still want to see them.
>=20
> You=E2=80=99re absolutely right, here they are:
>=20
> On first attempt:
> nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x418=
880
> [ IBUS ]
> nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x418=
c64
> [ IBUS ]
> nouveau E[   PIBUS][0000:02:00.0] GPC0: 0x419f74 0x00000555 (0x3800820c)
> nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x41b=
ff8
> [ IBUS ]
> nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000002 FAULT at 0x500=
914
> [ IBUS ]
> nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000002 FAULT at 0x418=
8ac
> [ IBUS ]
> nouveau E[    PBUS][0000:02:00.0] MMIO write of 0xbadf1008 FAULT at 0x419=
cc0
> [ IBUS ]
> nouveau E[   PIBUS][0000:02:00.0] GPC0: 0x419cc0 0xbadf1008 (0x3800820c)
> nouveau E[    PBUS][0000:02:00.0] MMIO write of 0xbadf1000 FAULT at 0x419=
eb4
> [ IBUS ]
> nouveau E[   PIBUS][0000:02:00.0] GPC0: 0x419eb4 0xbadf1000 (0x3800820c)
> nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x405=
804
> [ IBUS ]
> nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x3f800000 FAULT at 0x405=
804
> [ IBUS ]
> nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x405=
804
> [ IBUS ]
> nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x3f800000 FAULT at 0x405=
804
> [ IBUS ]
> nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x405=
818
> [ IBUS ]
> nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x3f800000 FAULT at 0x405=
818
> [ IBUS ]
> nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x405=
81c
> [ IBUS ]
> nouveau E[   PIBUS][0000:02:00.0] HUB0: 0x404170 0x00000012 (0x0e008201)
> nouveau E[  PGRAPH][0000:02:00.0] HUB_INIT timed out
> nouveau E[  PGRAPH][0000:02:00.0] 409000 - done 0x00000204
> nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000000 0x00000000
> 0x00000000 0x00000000
> nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000000 0x00000000
> 0x00000002 0x00000009
> nouveau E[  PGRAPH][0000:02:00.0] 502000 - done 0x00000300
> nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000000 0x00000000
> 0x00000000 0x00000000
> nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000000 0x00000000
> 0x00000000 0x00000000
> nouveau E[  PGRAPH][0000:02:00.0] init failed, -16
>=20
> And next ones are all identical to:
>=20
> nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x418=
880
> [ IBUS ]
> nouveau E[   PIBUS][0000:02:00.0] GPC0: 0x419eb4 0xbadf1000 (0x3800820c)
> nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000002 FAULT at 0x405=
820
> [ IBUS ]
> nouveau E[   PIBUS][0000:02:00.0] HUB0: 0x404170 0x00000012 (0x0e008201)
> nouveau E[  PGRAPH][0000:02:00.0] HUB_INIT timed out
> nouveau E[  PGRAPH][0000:02:00.0] 409000 - done 0x00000204
> nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000000 0x00000000
> 0x00000000 0x00000000
> nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000000 0x00000000
> 0x00000002 0x00000009
> nouveau E[  PGRAPH][0000:02:00.0] 502000 - done 0x00000300
> nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000000 0x00000000
> 0x00000000 0x00000000
> nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000000 0x00000000
> 0x00000000 0x00000000
> nouveau E[  PGRAPH][0000:02:00.0] init failed, -16

Yep, those are the errors I was afraid of. Try booting with "nouveau.runpm=
=3D0"
-- this will disable the auto-sleep thing I talked about. Not a permanent
solution, but I want to see if that gets things going or not.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1420139344.f3C32.11858
Date: Thu, 1 Jan 2015 19:09:04 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D87942#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE7] Unable to use nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D87942">bug 87942<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to bruno.pagani from <a href=3D"show_bug.cgi?id=3D87=
942#c4">comment #4</a>)
<span class=3D"quote">&gt; /etc/X11/xorg.conf.d/20-intel.conf:
&gt;=20
&gt; Section &quot;ServerLayout&quot;
&gt;     Identifier  &quot;Layout0&quot;
&gt;     Option      &quot;AutoAddGPU&quot; &quot;false&quot;
&gt; EndSection</span >

Right, so this will disable adding the nouveau as a &quot;GPU&quot; screen,=
 which means
no prime.
<span class=3D"quote">&gt;=20
&gt; &gt; (b) That error should have caused some nasties to be printed to d=
mesg. I
&gt; &gt; think I know what they are, but I still want to see them.
&gt;=20
&gt; You=E2=80=99re absolutely right, here they are:
&gt;=20
&gt; On first attempt:
&gt; nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x=
418880
&gt; [ IBUS ]
&gt; nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x=
418c64
&gt; [ IBUS ]
&gt; nouveau E[   PIBUS][0000:02:00.0] GPC0: 0x419f74 0x00000555 (0x3800820=
c)
&gt; nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x=
41bff8
&gt; [ IBUS ]
&gt; nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000002 FAULT at 0x=
500914
&gt; [ IBUS ]
&gt; nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000002 FAULT at 0x=
4188ac
&gt; [ IBUS ]
&gt; nouveau E[    PBUS][0000:02:00.0] MMIO write of 0xbadf1008 FAULT at 0x=
419cc0
&gt; [ IBUS ]
&gt; nouveau E[   PIBUS][0000:02:00.0] GPC0: 0x419cc0 0xbadf1008 (0x3800820=
c)
&gt; nouveau E[    PBUS][0000:02:00.0] MMIO write of 0xbadf1000 FAULT at 0x=
419eb4
&gt; [ IBUS ]
&gt; nouveau E[   PIBUS][0000:02:00.0] GPC0: 0x419eb4 0xbadf1000 (0x3800820=
c)
&gt; nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x=
405804
&gt; [ IBUS ]
&gt; nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x3f800000 FAULT at 0x=
405804
&gt; [ IBUS ]
&gt; nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x=
405804
&gt; [ IBUS ]
&gt; nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x3f800000 FAULT at 0x=
405804
&gt; [ IBUS ]
&gt; nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x=
405818
&gt; [ IBUS ]
&gt; nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x3f800000 FAULT at 0x=
405818
&gt; [ IBUS ]
&gt; nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x=
40581c
&gt; [ IBUS ]
&gt; nouveau E[   PIBUS][0000:02:00.0] HUB0: 0x404170 0x00000012 (0x0e00820=
1)
&gt; nouveau E[  PGRAPH][0000:02:00.0] HUB_INIT timed out
&gt; nouveau E[  PGRAPH][0000:02:00.0] 409000 - done 0x00000204
&gt; nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000000 0x00000000
&gt; 0x00000000 0x00000000
&gt; nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000000 0x00000000
&gt; 0x00000002 0x00000009
&gt; nouveau E[  PGRAPH][0000:02:00.0] 502000 - done 0x00000300
&gt; nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000000 0x00000000
&gt; 0x00000000 0x00000000
&gt; nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000000 0x00000000
&gt; 0x00000000 0x00000000
&gt; nouveau E[  PGRAPH][0000:02:00.0] init failed, -16
&gt;=20
&gt; And next ones are all identical to:
&gt;=20
&gt; nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT at 0x=
418880
&gt; [ IBUS ]
&gt; nouveau E[   PIBUS][0000:02:00.0] GPC0: 0x419eb4 0xbadf1000 (0x3800820=
c)
&gt; nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000002 FAULT at 0x=
405820
&gt; [ IBUS ]
&gt; nouveau E[   PIBUS][0000:02:00.0] HUB0: 0x404170 0x00000012 (0x0e00820=
1)
&gt; nouveau E[  PGRAPH][0000:02:00.0] HUB_INIT timed out
&gt; nouveau E[  PGRAPH][0000:02:00.0] 409000 - done 0x00000204
&gt; nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000000 0x00000000
&gt; 0x00000000 0x00000000
&gt; nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000000 0x00000000
&gt; 0x00000002 0x00000009
&gt; nouveau E[  PGRAPH][0000:02:00.0] 502000 - done 0x00000300
&gt; nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000000 0x00000000
&gt; 0x00000000 0x00000000
&gt; nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000000 0x00000000
&gt; 0x00000000 0x00000000
&gt; nouveau E[  PGRAPH][0000:02:00.0] init failed, -16</span >

Yep, those are the errors I was afraid of. Try booting with &quot;nouveau.r=
unpm=3D0&quot;
-- this will disable the auto-sleep thing I talked about. Not a permanent
solution, but I want to see if that gets things going or not.</pre>
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

--1420139344.f3C32.11858--

--===============1703653882==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1703653882==--
