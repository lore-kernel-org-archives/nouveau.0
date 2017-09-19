From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: nVidia GT218M [GeForce 315M] issues on kUbuntu 17.04
	x86-64.
Date: Mon, 18 Sep 2017 23:31:39 -0400
Message-ID: <CAKb7Uvgd7H0wingurzfM_kOp+ufvSFZfTRqDfATdTySNvGoMgw@mail.gmail.com>
References: <7574d8f0a7ff3cb65ed5797d5991dca9@mail2.ca>
 <CAKb7Uvh0UTVO9mxQHcjmtPtHgP0yQ0w6M=XBCxFHHY37zQ=Dgw@mail.gmail.com>
 <CAKb7Uvh0KJBVPNHO7gWZy89STLNBb+FCYkWacNLywu4kG3900A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1175255453=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7Uvh0KJBVPNHO7gWZy89STLNBb+FCYkWacNLywu4kG3900A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: ygrishin-lists-VsQdQPVIGO4@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1175255453==
Content-Type: multipart/alternative; boundary="001a113bfbee4d48680559827fe7"

--001a113bfbee4d48680559827fe7
Content-Type: text/plain; charset="UTF-8"

What seems to be the problem? I think you forgot to include a description
of the issues you're seeing.

On Sep 18, 2017 11:23 PM, <ygrishin-lists-VsQdQPVIGO4@public.gmane.org> wrote:

Hello looks like the device is not supported, the logs are as follows:

---
# dmesg | grep nouve
[    2.789899] fb: switching to nouveaufb from VESA VGA
[    2.790060] nouveau 0000:01:00.0: NVIDIA GT218 (0a8d00b1)
[    2.815596] nouveau 0000:01:00.0: bios: version 70.18.7f.00.14
[    2.816421] nouveau 0000:01:00.0: bios: OOB 1 01452301 01452301
[    2.816427] nouveau 0000:01:00.0: bios: OOB 1 22234d20 22234d20
[    2.816431] nouveau 0000:01:00.0: bios: OOB 1 22234d20 22234d20
[    2.816434] nouveau 0000:01:00.0: bios: OOB 1 22234d20 22234d20
[    2.817560] nouveau 0000:01:00.0: fb: 1024 MiB DDR3
[    2.868651] nouveau 0000:01:00.0: DRM: VRAM: 1024 MiB
[    2.868652] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    2.868655] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    2.868657] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    2.868659] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000323 00010034
[    2.868661] nouveau 0000:01:00.0: DRM: DCB outp 01: 02014300 00000000
[    2.868662] nouveau 0000:01:00.0: DRM: DCB outp 02: 02021362 00020010
[    2.868663] nouveau 0000:01:00.0: DRM: DCB conn 00: 00000340
[    2.868664] nouveau 0000:01:00.0: DRM: DCB conn 01: 00001061
[    2.868665] nouveau 0000:01:00.0: DRM: DCB conn 02: 00000147
[    2.868667] nouveau 0000:01:00.0: DRM: DCB conn 03: 00202346
[    2.868668] nouveau 0000:01:00.0: DRM: DCB conn 04: 00000400
[    2.868669] nouveau 0000:01:00.0: DRM: DCB conn 05: 00000210
[    2.868670] nouveau 0000:01:00.0: DRM: DCB conn 06: 00000211
[    2.868671] nouveau 0000:01:00.0: DRM: DCB conn 07: 00000213
[    2.876862] nouveau 0000:01:00.0: hwmon_device_register() is deprecated.
Please convert the driver to use hwmon_device_register_with_info().
[    2.899146] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    2.947414] nouveau 0000:01:00.0: DRM: allocated 1366x768 fb: 0x70000,
bo ffff98488129b800
[    2.948762] fbcon: nouveaufb (fb0) is primary device
[    2.948872] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    2.996667] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0
[   49.592176] nouveau 0000:01:00.0: Direct firmware load for
nouveau/nva8_fuc084 failed with error -2
[   49.592197] nouveau 0000:01:00.0: Direct firmware load for
nouveau/nva8_fuc084d failed with error -2
[   49.592199] nouveau 0000:01:00.0: msvld: unable to load firmware data
[   49.592206] nouveau 0000:01:00.0: msvld: init failed, -19


01:00.0 VGA compatible controller: NVIDIA Corporation GT218M [GeForce 315M]
(rev a2)
---

This is 2011 Toshiba Satellite.
_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--001a113bfbee4d48680559827fe7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>What seems to be the problem? I think you forgot to =
include a description of the issues you&#39;re seeing.<br><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Sep 18, 2017 11:23 PM,  &lt;<a =
href=3D"mailto:ygrishin-lists-VsQdQPVIGO4@public.gmane.org">ygrishin-lists-VsQdQPVIGO4@public.gmane.org</a>&gt; wro=
te:<br type=3D"attribution"><blockquote class=3D"quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello looks like the d=
evice is not supported, the logs are as follows:<br>
<br>
---<br>
# dmesg | grep nouve<br>
[=C2=A0 =C2=A0 2.789899] fb: switching to nouveaufb from VESA VGA<br>
[=C2=A0 =C2=A0 2.790060] nouveau 0000:01:00.0: NVIDIA GT218 (0a8d00b1)<br>
[=C2=A0 =C2=A0 2.815596] nouveau 0000:01:00.0: bios: version 70.18.7f.00.14=
<br>
[=C2=A0 =C2=A0 2.816421] nouveau 0000:01:00.0: bios: OOB 1 01452301 0145230=
1<br>
[=C2=A0 =C2=A0 2.816427] nouveau 0000:01:00.0: bios: OOB 1 22234d20 22234d2=
0<br>
[=C2=A0 =C2=A0 2.816431] nouveau 0000:01:00.0: bios: OOB 1 22234d20 22234d2=
0<br>
[=C2=A0 =C2=A0 2.816434] nouveau 0000:01:00.0: bios: OOB 1 22234d20 22234d2=
0<br>
[=C2=A0 =C2=A0 2.817560] nouveau 0000:01:00.0: fb: 1024 MiB DDR3<br>
[=C2=A0 =C2=A0 2.868651] nouveau 0000:01:00.0: DRM: VRAM: 1024 MiB<br>
[=C2=A0 =C2=A0 2.868652] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB<br>
[=C2=A0 =C2=A0 2.868655] nouveau 0000:01:00.0: DRM: TMDS table version 2.0<=
br>
[=C2=A0 =C2=A0 2.868657] nouveau 0000:01:00.0: DRM: DCB version 4.0<br>
[=C2=A0 =C2=A0 2.868659] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000323 0=
0010034<br>
[=C2=A0 =C2=A0 2.868661] nouveau 0000:01:00.0: DRM: DCB outp 01: 02014300 0=
0000000<br>
[=C2=A0 =C2=A0 2.868662] nouveau 0000:01:00.0: DRM: DCB outp 02: 02021362 0=
0020010<br>
[=C2=A0 =C2=A0 2.868663] nouveau 0000:01:00.0: DRM: DCB conn 00: 00000340<b=
r>
[=C2=A0 =C2=A0 2.868664] nouveau 0000:01:00.0: DRM: DCB conn 01: 00001061<b=
r>
[=C2=A0 =C2=A0 2.868665] nouveau 0000:01:00.0: DRM: DCB conn 02: 00000147<b=
r>
[=C2=A0 =C2=A0 2.868667] nouveau 0000:01:00.0: DRM: DCB conn 03: 00202346<b=
r>
[=C2=A0 =C2=A0 2.868668] nouveau 0000:01:00.0: DRM: DCB conn 04: 00000400<b=
r>
[=C2=A0 =C2=A0 2.868669] nouveau 0000:01:00.0: DRM: DCB conn 05: 00000210<b=
r>
[=C2=A0 =C2=A0 2.868670] nouveau 0000:01:00.0: DRM: DCB conn 06: 00000211<b=
r>
[=C2=A0 =C2=A0 2.868671] nouveau 0000:01:00.0: DRM: DCB conn 07: 00000213<b=
r>
[=C2=A0 =C2=A0 2.876862] nouveau 0000:01:00.0: hwmon_device_register() is d=
eprecated. Please convert the driver to use hwmon_device_register_with_inf<=
wbr>o().<br>
[=C2=A0 =C2=A0 2.899146] nouveau 0000:01:00.0: DRM: MM: using COPY for buff=
er copies<br>
[=C2=A0 =C2=A0 2.947414] nouveau 0000:01:00.0: DRM: allocated 1366x768 fb: =
0x70000, bo ffff98488129b800<br>
[=C2=A0 =C2=A0 2.948762] fbcon: nouveaufb (fb0) is primary device<br>
[=C2=A0 =C2=A0 2.948872] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer =
device<br>
[=C2=A0 =C2=A0 2.996667] [drm] Initialized nouveau 1.3.1 20120801 for 0000:=
01:00.0 on minor 0<br>
[=C2=A0 =C2=A049.592176] nouveau 0000:01:00.0: Direct firmware load for nou=
veau/nva8_fuc084 failed with error -2<br>
[=C2=A0 =C2=A049.592197] nouveau 0000:01:00.0: Direct firmware load for nou=
veau/nva8_fuc084d failed with error -2<br>
[=C2=A0 =C2=A049.592199] nouveau 0000:01:00.0: msvld: unable to load firmwa=
re data<br>
[=C2=A0 =C2=A049.592206] nouveau 0000:01:00.0: msvld: init failed, -19<br>
<br>
<br>
01:00.0 VGA compatible controller: NVIDIA Corporation GT218M [GeForce 315M]=
 (rev a2)<br>
---<br>
<br>
This is 2011 Toshiba Satellite.<br>
______________________________<wbr>_________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" target=3D"_blank">Nouveau@=
lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/<wbr>mailman/lis=
tinfo/nouveau</a><br>
</blockquote></div><br></div></div></div>

--001a113bfbee4d48680559827fe7--

--===============1175255453==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1175255453==--
