From: ilje <iljebosanac-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Fan speed control Nvidia GeForce GTX 760
Date: Sat, 26 Nov 2016 20:42:08 +0100
Message-ID: <CA+9M_ZMidOBOOoXXQJQ1rKKwRv19tVm1P5va9AB-C2t0ANVuWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0419961160=="
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

--===============0419961160==
Content-Type: multipart/alternative; boundary=001a114aca3a2153640542396faf

--001a114aca3a2153640542396faf
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

hi i have problem with nouveau drivers gpu fan always runs at maximum speed
my pc OS: fedora 25 wayland/xorg
lspci -v -s 01:00.0
01:00.0 VGA compatible controller: NVIDIA Corporation GK104 [GeForce GTX
760] (rev a1) (prog-if 00 [VGA controller])
Subsystem: CardExpert Technology Device 1187
Flags: bus master, fast devsel, latency 0, IRQ 29
Memory at f6000000 (32-bit, non-prefetchable) [size=3D16M]
Memory at e8000000 (64-bit, prefetchable) [size=3D128M]
Memory at f0000000 (64-bit, prefetchable) [size=3D32M]
I/O ports at e000 [size=3D128]
Expansion ROM at 000c0000 [disabled] [size=3D128K]
Capabilities: [60] Power Management version 3
Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
Capabilities: [78] Express Endpoint, MSI 00
Capabilities: [b4] Vendor Specific Information: Len=3D14 <?>
Capabilities: [100] Virtual Channel
Capabilities: [128] Power Budgeting <?>
Capabilities: [600] Vendor Specific Information: ID=3D0001 Rev=3D1 Len=3D02=
4 <?>
Capabilities: [900] #19
Kernel driver in use: nouveau
Kernel modules: nouveau

nouveau-pci-0100
Adapter: PCI adapter
GPU core:     +0.85 V  (min =3D  +0.82 V, max =3D  +1.21 V)
fan1:        2280 RPM
temp1:        +34.0=C2=B0C  (high =3D +95.0=C2=B0C, hyst =3D  +3.0=C2=B0C)
                       (crit =3D +105.0=C2=B0C, hyst =3D  +5.0=C2=B0C)
                       (emerg =3D +135.0=C2=B0C, hyst =3D  +5.0=C2=B0C)
power1:        9.01 W

--001a114aca3a2153640542396faf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>hi i have problem with nouveau drivers gpu fan a=
lways runs at maximum speed<br></div>my pc OS: fedora 25 wayland/xorg<br>ls=
pci -v -s 01:00.0<br>
01:00.0 VGA compatible controller: NVIDIA Corporation GK104 [GeForce GTX 76=
0] (rev a1) (prog-if 00 [VGA controller])<br>
	Subsystem: CardExpert Technology Device 1187<br>
	Flags: bus master, fast devsel, latency 0, IRQ 29<br>
	Memory at f6000000 (32-bit, non-prefetchable) [size=3D16M]<br>
	Memory at e8000000 (64-bit, prefetchable) [size=3D128M]<br>
	Memory at f0000000 (64-bit, prefetchable) [size=3D32M]<br>
	I/O ports at e000 [size=3D128]<br>
	Expansion ROM at 000c0000 [disabled] [size=3D128K]<br>
	Capabilities: [60] Power Management version 3<br>
	Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+<br>
	Capabilities: [78] Express Endpoint, MSI 00<br>
	Capabilities: [b4] Vendor Specific Information: Len=3D14 &lt;?&gt;<br>
	Capabilities: [100] Virtual Channel<br>
	Capabilities: [128] Power Budgeting &lt;?&gt;<br>
	Capabilities: [600] Vendor Specific Information: ID=3D0001 Rev=3D1 Len=3D0=
24 &lt;?&gt;<br>
	Capabilities: [900] #19<br>
	Kernel driver in use: nouveau<br>
	Kernel modules: nouveau<br><br>nouveau-pci-0100<br>Adapter: PCI adapter<br=
>GPU core:=C2=A0=C2=A0=C2=A0=C2=A0 +0.85 V=C2=A0 (min =3D=C2=A0 +0.82 V, ma=
x =3D=C2=A0 +1.21 V)<br>fan1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 228=
0 RPM<br>temp1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +34.0=C2=B0C=C2=
=A0 (high =3D +95.0=C2=B0C, hyst =3D=C2=A0 +3.0=C2=B0C)<br>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (crit =3D +105.0=C2=B0C, hyst =
=3D=C2=A0 +5.0=C2=B0C)<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 (emerg =3D +135.0=C2=B0C, hyst =3D=C2=A0 +5.0=C2=B0C)<br>power1:=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.01 W=C2=A0 <br></div></div>

--001a114aca3a2153640542396faf--

--===============0419961160==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0419961160==--
