From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87942] [NVE7] Unable to use nouveau
Date: Thu, 01 Jan 2015 19:27:03 +0000
Message-ID: <bug-87942-8800-sjjDl0oanE@http.bugs.freedesktop.org/>
References: <bug-87942-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0018372152=="
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


--===============0018372152==
Content-Type: multipart/alternative; boundary="1420140423.CCD4B1.18526"; charset="UTF-8"


--1420140423.CCD4B1.18526
Date: Thu, 1 Jan 2015 19:27:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D87942

--- Comment #6 from bruno.pagani-vYW+cPY1g1pg9hUCZPvPmw@public.gmane.org ---
cat /proc/cmdline returns nouveau.runpm=3D0 correctly, but optirun glxinfo =
is
still failing with the exact same error and:

[  250.843476] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 F=
AULT
at 0x418880 [ IBUS ]
[  250.843564] nouveau E[   PIBUS][0000:02:00.0] GPC0: 0x419eb4 0xbadf1000
(0x3800820c)
[  250.843617] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x3f800000 F=
AULT
at 0x405804 [ IBUS ]
[  250.843773] nouveau E[   PIBUS][0000:02:00.0] HUB0: 0x404170 0x00000012
(0x0e008201)
[  252.845769] nouveau E[  PGRAPH][0000:02:00.0] HUB_INIT timed out
[  252.845777] nouveau E[  PGRAPH][0000:02:00.0] 409000 - done 0x00000204
[  252.845787] nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[  252.845796] nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000000
0x00000000 0x00000002 0x00000009
[  252.845799] nouveau E[  PGRAPH][0000:02:00.0] 502000 - done 0x00000300
[  252.845804] nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[  252.845808] nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[  252.845810] nouveau E[  PGRAPH][0000:02:00.0] init failed, -16

And as for what is concerning PRIME, commenting the AutoAddGPU device didn=
=E2=80=99t
changed anything, except for Xorg.0.log reporting this obviously:
[   136.219] (=3D=3D) Automatically adding GPU devices

It think the issue is somewhere here (from the page you=E2=80=99ve linked):
KMS drivers for both GPUs loaded.
DDX drivers for both GPUs loaded.

nouveau does not load automatically at boot, I need to modprobe it manually=
. Is
there a way to check or ensure nouveau KMS is loaded?

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1420140423.CCD4B1.18526
Date: Thu, 1 Jan 2015 19:27:03 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D87942#c6">Comment=
 # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE7] Unable to use nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D87942">bug 87942<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bruno.pagani&#64;ens-lyon.org" title=3D"bruno.pagani&#64;ens-lyon.org">brun=
o.pagani&#64;ens-lyon.org</a>
</span></b>
        <pre>cat /proc/cmdline returns nouveau.runpm=3D0 correctly, but opt=
irun glxinfo is
still failing with the exact same error and:

[  250.843476] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 F=
AULT
at 0x418880 [ IBUS ]
[  250.843564] nouveau E[   PIBUS][0000:02:00.0] GPC0: 0x419eb4 0xbadf1000
(0x3800820c)
[  250.843617] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x3f800000 F=
AULT
at 0x405804 [ IBUS ]
[  250.843773] nouveau E[   PIBUS][0000:02:00.0] HUB0: 0x404170 0x00000012
(0x0e008201)
[  252.845769] nouveau E[  PGRAPH][0000:02:00.0] HUB_INIT timed out
[  252.845777] nouveau E[  PGRAPH][0000:02:00.0] 409000 - done 0x00000204
[  252.845787] nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[  252.845796] nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000000
0x00000000 0x00000002 0x00000009
[  252.845799] nouveau E[  PGRAPH][0000:02:00.0] 502000 - done 0x00000300
[  252.845804] nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[  252.845808] nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[  252.845810] nouveau E[  PGRAPH][0000:02:00.0] init failed, -16

And as for what is concerning PRIME, commenting the AutoAddGPU device didn=
=E2=80=99t
changed anything, except for Xorg.0.log reporting this obviously:
[   136.219] (=3D=3D) Automatically adding GPU devices

It think the issue is somewhere here (from the page you=E2=80=99ve linked):
KMS drivers for both GPUs loaded.
DDX drivers for both GPUs loaded.

nouveau does not load automatically at boot, I need to modprobe it manually=
. Is
there a way to check or ensure nouveau KMS is loaded?</pre>
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

--1420140423.CCD4B1.18526--

--===============0018372152==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0018372152==--
