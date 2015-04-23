From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89047] linux-3.19 nvd9 Invalid rom content
Date: Thu, 23 Apr 2015 21:17:12 +0000
Message-ID: <bug-89047-8800-me6dcilsNl@http.bugs.freedesktop.org/>
References: <bug-89047-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1758143758=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89047-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1758143758==
Content-Type: multipart/alternative; boundary="1429823832.ab3ddEcb2.5606"; charset="UTF-8"


--1429823832.ab3ddEcb2.5606
Date: Thu, 23 Apr 2015 21:17:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D89047

--- Comment #9 from Ren=C3=A9 <renda.krell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I tried the > to >=3D changes just in shadowacpi.c like advised on the Open=
SUSE
build system, kernel 4.0.0. Before that, in 3.19 I had the same error like
originally reported, with the recommended fix I still get in trouble on a HP
ZBook 15:
--
2015-04-23T22:57:04.778565+02:00 rkrell kernel: [    4.402505] nouveau  [=20
DEVICE][0000:01:00.0] BOOT0  : 0x108390a1
2015-04-23T22:57:04.778565+02:00 rkrell kernel: [    4.402509] nouveau  [=20
DEVICE][0000:01:00.0] Chipset: GK208 (NV108)
2015-04-23T22:57:04.778565+02:00 rkrell kernel: [    4.402510] nouveau  [=20
DEVICE][0000:01:00.0] Family : NVE0
2015-04-23T22:57:04.778566+02:00 rkrell kernel: [    4.405997] nouveau  [=
=20=20
VBIOS][0000:01:00.0] using image from ACPI
2015-04-23T22:57:04.778566+02:00 rkrell kernel: [    4.406261] nouveau  [=
=20=20
VBIOS][0000:01:00.0] BIT signature found
2015-04-23T22:57:04.778567+02:00 rkrell kernel: [    4.406265] nouveau  [=
=20=20
VBIOS][0000:01:00.0] version 80.28.52.00.09
2015-04-23T22:57:04.778568+02:00 rkrell kernel: [    4.406271] nouveau W[=
=20=20
VBIOS][0000:01:00.0] DCB header validation failed
2015-04-23T22:57:04.778569+02:00 rkrell kernel: [    4.406272] nouveau W[=
=20=20
VBIOS][0000:01:00.0] DCB header validation failed
2015-04-23T22:57:04.778570+02:00 rkrell kernel: [    4.406278] nouveau E[=
=20=20
VBIOS][0000:01:00.0] 0xfffe[ ]: unknown opcode 0x00
2015-04-23T22:57:04.778570+02:00 rkrell kernel: [    4.406282] nouveau E[
DEVINIT][0000:01:00.0] init failed, -22
2015-04-23T22:57:04.778571+02:00 rkrell kernel: [    4.406284] nouveau E[=
=20=20=20=20
DRM] failed to create 0x00000080, -22
2015-04-23T22:57:04.778571+02:00 rkrell kernel: [    4.406509] nouveau: pro=
be
of 0000:01:00.0 failed with error -22
--

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1429823832.ab3ddEcb2.5606
Date: Thu, 23 Apr 2015 21:17:12 +0000
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
   title=3D"NEW - linux-3.19 nvd9 Invalid rom content"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89047#c9">Comment=
 # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - linux-3.19 nvd9 Invalid rom content"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89047">bug 89047<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
renda.krell&#64;gmail.com" title=3D"Ren=C3=A9 &lt;renda.krell&#64;gmail.com=
&gt;"> <span class=3D"fn">Ren=C3=A9</span></a>
</span></b>
        <pre>I tried the &gt; to &gt;=3D changes just in shadowacpi.c like =
advised on the OpenSUSE
build system, kernel 4.0.0. Before that, in 3.19 I had the same error like
originally reported, with the recommended fix I still get in trouble on a HP
ZBook 15:
--
2015-04-23T22:57:04.778565+02:00 rkrell kernel: [    4.402505] nouveau  [=20
DEVICE][0000:01:00.0] BOOT0  : 0x108390a1
2015-04-23T22:57:04.778565+02:00 rkrell kernel: [    4.402509] nouveau  [=20
DEVICE][0000:01:00.0] Chipset: GK208 (NV108)
2015-04-23T22:57:04.778565+02:00 rkrell kernel: [    4.402510] nouveau  [=20
DEVICE][0000:01:00.0] Family : NVE0
2015-04-23T22:57:04.778566+02:00 rkrell kernel: [    4.405997] nouveau  [=
=20=20
VBIOS][0000:01:00.0] using image from ACPI
2015-04-23T22:57:04.778566+02:00 rkrell kernel: [    4.406261] nouveau  [=
=20=20
VBIOS][0000:01:00.0] BIT signature found
2015-04-23T22:57:04.778567+02:00 rkrell kernel: [    4.406265] nouveau  [=
=20=20
VBIOS][0000:01:00.0] version 80.28.52.00.09
2015-04-23T22:57:04.778568+02:00 rkrell kernel: [    4.406271] nouveau W[=
=20=20
VBIOS][0000:01:00.0] DCB header validation failed
2015-04-23T22:57:04.778569+02:00 rkrell kernel: [    4.406272] nouveau W[=
=20=20
VBIOS][0000:01:00.0] DCB header validation failed
2015-04-23T22:57:04.778570+02:00 rkrell kernel: [    4.406278] nouveau E[=
=20=20
VBIOS][0000:01:00.0] 0xfffe[ ]: unknown opcode 0x00
2015-04-23T22:57:04.778570+02:00 rkrell kernel: [    4.406282] nouveau E[
DEVINIT][0000:01:00.0] init failed, -22
2015-04-23T22:57:04.778571+02:00 rkrell kernel: [    4.406284] nouveau E[=
=20=20=20=20
DRM] failed to create 0x00000080, -22
2015-04-23T22:57:04.778571+02:00 rkrell kernel: [    4.406509] nouveau: pro=
be
of 0000:01:00.0 failed with error -22
--</pre>
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

--1429823832.ab3ddEcb2.5606--

--===============1758143758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1758143758==--
