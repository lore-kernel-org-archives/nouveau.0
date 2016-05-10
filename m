From: =?UTF-8?Q?Marius_Gripsg=C3=A5rd?= <mariogrip-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Subject: Nouveau on GeForce GTX 980M
Date: Tue, 10 May 2016 14:31:52 +0200
Message-ID: <CANB0Qd-NP3ZAi5wPo_3CpqivMjY2kD0vrRMApDYZo67g9RXH0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0520997615=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

--===============0520997615==
Content-Type: multipart/alternative; boundary=001a114b42f41915f805327c1c43

--001a114b42f41915f805327c1c43
Content-Type: text/plain; charset=UTF-8

Hi,

I was wondering is it possible to can get my GeForce GTX 980M work with
Nouveau. I see that the non "M" version if GTX 980 is supported (
https://nouveau.freedesktop.org/wiki/CodeNames/) but not the "M" version,
how different are they?

Now it uses Gallium 0.4 on llvmpipe, from my understanding that's fallback
using the cpu right?


*lshw -C video:*

  *-display UNCLAIMED
       description: VGA compatible controller
       product: GM204M [GeForce GTX 980M]
       vendor: NVIDIA Corporation
       physical id: 0
       bus info: pci@0000:01:00.0
       version: a1
       width: 64 bits
       clock: 33MHz
       capabilities: pm msi pciexpress vga_controller cap_list
       configuration: latency=0
       resources: memory:f6000000-f6ffffff memory:e0000000-efffffff
memory:f0000000-f1ffffff ioport:e000(size=128) memory:f7000000-f707ffff


Thanks,
Marius Gripsgard

--001a114b42f41915f805327c1c43
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(0,0,0);font-size:12.8px">Hi,</spa=
n><div style=3D"color:rgb(0,0,0);font-size:12.8px"><br></div><div style=3D"=
color:rgb(0,0,0);font-size:12.8px">I was wondering is it possible to can ge=
t my=C2=A0GeForce GTX 980M work with Nouveau. I see that the non &quot;M&qu=
ot; version if GTX 980 is supported (<a href=3D"https://nouveau.freedesktop=
.org/wiki/CodeNames/" target=3D"_blank">https://nouveau.freedesktop.org/wik=
i/CodeNames/</a>) but not the &quot;M&quot; version, how different are they=
?</div><div style=3D"color:rgb(0,0,0);font-size:12.8px"><br></div><div styl=
e=3D"color:rgb(0,0,0);font-size:12.8px">Now it uses Gallium 0.4 on llvmpipe=
, from my understanding that&#39;s fallback using the cpu right?<div><br></=
div><div><br></div><div><b>lshw -C video:</b><br></div><div><b><br></b></di=
v><div><div>=C2=A0 *-display UNCLAIMED =C2=A0 =C2=A0=C2=A0</div><div>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0description: VGA compatible controller</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0product: GM204M [GeForce GTX 980M]</div><div>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0vendor: NVIDIA Corporation</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0physical id: 0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0bus info: pci=
@0000:01:00.0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0version: a1</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0width: 64 bits</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0clock: 33MHz</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0capabilities: pm ms=
i pciexpress vga_controller cap_list</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0c=
onfiguration: latency=3D0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0resources: m=
emory:f6000000-f6ffffff memory:e0000000-efffffff memory:f0000000-f1ffffff i=
oport:e000(size=3D128) memory:f7000000-f707ffff</div></div><div><br></div><=
/div><div style=3D"color:rgb(0,0,0);font-size:12.8px"><br></div><div style=
=3D"color:rgb(0,0,0);font-size:12.8px">Thanks,</div><div style=3D"color:rgb=
(0,0,0);font-size:12.8px">Marius Gripsgard</div></div>

--001a114b42f41915f805327c1c43--

--===============0520997615==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0520997615==--
