From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87942] [NVE7] Unable to use nouveau
Date: Thu, 01 Jan 2015 19:33:12 +0000
Message-ID: <bug-87942-8800-6fLpcZZCsF@http.bugs.freedesktop.org/>
References: <bug-87942-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0718207256=="
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


--===============0718207256==
Content-Type: multipart/alternative; boundary="1420140792.04Bc22.20222"; charset="UTF-8"


--1420140792.04Bc22.20222
Date: Thu, 1 Jan 2015 19:33:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D87942

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to bruno.pagani from comment #6)
> cat /proc/cmdline returns nouveau.runpm=3D0 correctly, but optirun glxinf=
o is
> still failing with the exact same error and:
>=20
> [  250.843476] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000
> FAULT at 0x418880 [ IBUS ]
> [  250.843564] nouveau E[   PIBUS][0000:02:00.0] GPC0: 0x419eb4 0xbadf1000
> (0x3800820c)
> [  250.843617] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x3f800000
> FAULT at 0x405804 [ IBUS ]
> [  250.843773] nouveau E[   PIBUS][0000:02:00.0] HUB0: 0x404170 0x00000012
> (0x0e008201)
> [  252.845769] nouveau E[  PGRAPH][0000:02:00.0] HUB_INIT timed out
> [  252.845777] nouveau E[  PGRAPH][0000:02:00.0] 409000 - done 0x00000204
> [  252.845787] nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000000
> 0x00000000 0x00000000 0x00000000
> [  252.845796] nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000000
> 0x00000000 0x00000002 0x00000009
> [  252.845799] nouveau E[  PGRAPH][0000:02:00.0] 502000 - done 0x00000300
> [  252.845804] nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000000
> 0x00000000 0x00000000 0x00000000
> [  252.845808] nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000000
> 0x00000000 0x00000000 0x00000000
> [  252.845810] nouveau E[  PGRAPH][0000:02:00.0] init failed, -16

This means you're not going to get acceleration no matter how hard you try =
to
change your config, I'm afraid. See bug 70354.

>=20
> And as for what is concerning PRIME, commenting the AutoAddGPU device did=
n=E2=80=99t
> changed anything, except for Xorg.0.log reporting this obviously:
> [   136.219] (=3D=3D) Automatically adding GPU devices
>=20
> It think the issue is somewhere here (from the page you=E2=80=99ve linked=
):
> KMS drivers for both GPUs loaded.
> DDX drivers for both GPUs loaded.
>=20
> nouveau does not load automatically at boot, I need to modprobe it manual=
ly.
> Is there a way to check or ensure nouveau KMS is loaded?

X has to start after nouveau loads, otherwise it doesn't know about the nou=
veau
adapter. (This may no longer be the case with DRI3-based offloading
actually...)

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1420140792.04Bc22.20222
Date: Thu, 1 Jan 2015 19:33:12 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D87942#c7">Comment=
 # 7</a>
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
942#c6">comment #6</a>)
<span class=3D"quote">&gt; cat /proc/cmdline returns nouveau.runpm=3D0 corr=
ectly, but optirun glxinfo is
&gt; still failing with the exact same error and:
&gt;=20
&gt; [  250.843476] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000=
000
&gt; FAULT at 0x418880 [ IBUS ]
&gt; [  250.843564] nouveau E[   PIBUS][0000:02:00.0] GPC0: 0x419eb4 0xbadf=
1000
&gt; (0x3800820c)
&gt; [  250.843617] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x3f800=
000
&gt; FAULT at 0x405804 [ IBUS ]
&gt; [  250.843773] nouveau E[   PIBUS][0000:02:00.0] HUB0: 0x404170 0x0000=
0012
&gt; (0x0e008201)
&gt; [  252.845769] nouveau E[  PGRAPH][0000:02:00.0] HUB_INIT timed out
&gt; [  252.845777] nouveau E[  PGRAPH][0000:02:00.0] 409000 - done 0x00000=
204
&gt; [  252.845787] nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000=
000
&gt; 0x00000000 0x00000000 0x00000000
&gt; [  252.845796] nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000=
000
&gt; 0x00000000 0x00000002 0x00000009
&gt; [  252.845799] nouveau E[  PGRAPH][0000:02:00.0] 502000 - done 0x00000=
300
&gt; [  252.845804] nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000=
000
&gt; 0x00000000 0x00000000 0x00000000
&gt; [  252.845808] nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000=
000
&gt; 0x00000000 0x00000000 0x00000000
&gt; [  252.845810] nouveau E[  PGRAPH][0000:02:00.0] init failed, -16</spa=
n >

This means you're not going to get acceleration no matter how hard you try =
to
change your config, I'm afraid. See <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn=
't help"
   href=3D"show_bug.cgi?id=3D70354">bug 70354</a>.

<span class=3D"quote">&gt;=20
&gt; And as for what is concerning PRIME, commenting the AutoAddGPU device =
didn=E2=80=99t
&gt; changed anything, except for Xorg.0.log reporting this obviously:
&gt; [   136.219] (=3D=3D) Automatically adding GPU devices
&gt;=20
&gt; It think the issue is somewhere here (from the page you=E2=80=99ve lin=
ked):
&gt; KMS drivers for both GPUs loaded.
&gt; DDX drivers for both GPUs loaded.
&gt;=20
&gt; nouveau does not load automatically at boot, I need to modprobe it man=
ually.
&gt; Is there a way to check or ensure nouveau KMS is loaded?</span >

X has to start after nouveau loads, otherwise it doesn't know about the nou=
veau
adapter. (This may no longer be the case with DRI3-based offloading
actually...)</pre>
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

--1420140792.04Bc22.20222--

--===============0718207256==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0718207256==--
