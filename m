From: archit gupta <a.gupta.archit-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Requesting help in Nvidia 940MX card issue
Date: Sun, 16 Dec 2018 13:34:04 +0530
Message-ID: <CALhF8amCuTTDL70twXCk29jtWc3Z4P145m=w5Xzn4MFcJ0yQSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0769358130=="
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

--===============0769358130==
Content-Type: multipart/alternative; boundary="000000000000c939f7057d1f1dce"

--000000000000c939f7057d1f1dce
Content-Type: text/plain; charset="UTF-8"

Hi Nouveau Devs,

I have Nvidia 940MX graphics card on an i7 laptop.
I am observing below errors when i start Fedora and view the logs, but
didnt take them seriously. (my bad)
I am facing random crashes with i play certain (not all) games in (dual
boot) windows 10, and maybe there is a connection with the error emitted by
nouveau driver.
Any help in understanding the meaning of logs and how to fix it would be
appreciated.

Pasting the logs below

$ dmesg --raw  | grep -P "(nouveau|pcieport)"
<6>[    1.020802] pcieport 0000:00:1c.0: AER enabled with IRQ 122
<6>[    1.020819] pcieport 0000:00:1c.4: AER enabled with IRQ 123
<6>[    1.020833] pcieport 0000:00:1c.5: AER enabled with IRQ 124
<6>[    1.020852] pcieport 0000:00:1d.3: AER enabled with IRQ 126
<6>[    1.020875] pcieport 0000:00:1c.0: Signaling PME with IRQ 122
<6>[    1.020883] pcieport 0000:00:1c.4: Signaling PME with IRQ 123
<6>[    1.020890] pcieport 0000:00:1c.5: Signaling PME with IRQ 124
<6>[    1.020902] pcieport 0000:00:1d.0: Signaling PME with IRQ 125
<6>[    1.020909] pcieport 0000:00:1d.3: Signaling PME with IRQ 126
<6>[    2.492922] nouveau: detected PR support, will not use DSM
<6>[    2.492947] nouveau 0000:01:00.0: enabling device (0406 -> 0407)
<6>[    2.493098] nouveau 0000:01:00.0: NVIDIA GM108 (1180d0a2)
<6>[    2.526811] nouveau 0000:01:00.0: bios: version 82.08.6d.00.8d
<6>[    2.571894] nouveau 0000:01:00.0: fb: 4096 MiB DDR3


*<3>[    2.571935] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT
at 6013d4 [ IBUS ]<3>[    2.585938] nouveau 0000:01:00.0: bus: MMIO read of
00000000 FAULT at 10ac08 [ IBUS ]*<6>[    3.227808] nouveau 0000:01:00.0:
DRM: VRAM: 4096 MiB
<6>[    3.227809] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB

*<3>[    3.227811] nouveau 0000:01:00.0: DRM: Pointer to TMDS table
invalid*<6>[
3.227812] nouveau 0000:01:00.0: DRM: DCB version 4.0
<6>[    3.228550] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer
copies
<6>[    3.228555] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0
on minor 1
<6>[    9.618550] pcieport 0000:00:1d.3: AER: Corrected error received:
0000:00:1d.3



*<3>[    9.618579] pcieport 0000:00:1d.3: PCIe Bus Error:
severity=Corrected, type=Physical Layer, (Receiver ID)<3>[    9.618580]
pcieport 0000:00:1d.3:   device [8086:9d1b] error
status/mask=00000001/00002000<3>[    9.618581] pcieport 0000:00:1d.3:    [
0] RxErr                  (First)*<6>[   18.370866] pcieport 0000:00:1d.3:
AER: Corrected error received: 0000:00:1d.3



*<3>[   18.370878] pcieport 0000:00:1d.3: PCIe Bus Error:
severity=Corrected, type=Physical Layer, (Receiver ID)<3>[   18.370884]
pcieport 0000:00:1d.3:   device [8086:9d1b] error
status/mask=00000001/00002000<3>[   18.370889] pcieport 0000:00:1d.3:    [
0] RxErr                  (First)*<6>[   18.450492] pcieport 0000:00:1d.3:
AER: Corrected error received: 0000:00:1d.3




*<3>[   18.450504] pcieport 0000:00:1d.3: PCIe Bus Error:
severity=Corrected, type=Physical Layer, (Receiver ID)<3>[   18.450510]
pcieport 0000:00:1d.3:   device [8086:9d1b] error
status/mask=00000001/00002000<3>[   18.450514] pcieport 0000:00:1d.3:    [
0] RxErr                  (First)<3>[   22.405003] nouveau 0000:01:00.0:
bus: MMIO read of 00000000 FAULT at 6013d4 [ IBUS ]<3>[   73.345270]
nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 6013d4 [ IBUS ]*


Thanks in advance

Regards
Archit Gupta

--000000000000c939f7057d1f1dce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Nouveau Devs,</d=
iv><div><br></div><div>I have Nvidia 940MX graphics card on an i7 laptop. <=
br></div><div>I am observing below errors when i start Fedora and view the =
logs, but didnt take them seriously. (my bad)<br></div><div>I am facing ran=
dom crashes with i play certain (not all) games in (dual boot) windows 10, =
and maybe there is a connection with the error emitted by nouveau driver.<b=
r></div><div>Any help in understanding the meaning of logs and how to fix i=
t would be appreciated.</div><div><br></div><div>Pasting the logs below</di=
v><div><br></div><div><span style=3D"font-family:monospace,monospace">$ dme=
sg --raw=C2=A0 | grep -P &quot;(nouveau|pcieport)&quot; <br>&lt;6&gt;[=C2=
=A0=C2=A0=C2=A0 1.020802] pcieport 0000:00:1c.0: AER enabled with IRQ 122<b=
r>&lt;6&gt;[=C2=A0=C2=A0=C2=A0 1.020819] pcieport 0000:00:1c.4: AER enabled=
 with IRQ 123<br>&lt;6&gt;[=C2=A0=C2=A0=C2=A0 1.020833] pcieport 0000:00:1c=
.5: AER enabled with IRQ 124<br>&lt;6&gt;[=C2=A0=C2=A0=C2=A0 1.020852] pcie=
port 0000:00:1d.3: AER enabled with IRQ 126<br>&lt;6&gt;[=C2=A0=C2=A0=C2=A0=
 1.020875] pcieport 0000:00:1c.0: Signaling PME with IRQ 122<br>&lt;6&gt;[=
=C2=A0=C2=A0=C2=A0 1.020883] pcieport 0000:00:1c.4: Signaling PME with IRQ =
123<br>&lt;6&gt;[=C2=A0=C2=A0=C2=A0 1.020890] pcieport 0000:00:1c.5: Signal=
ing PME with IRQ 124<br>&lt;6&gt;[=C2=A0=C2=A0=C2=A0 1.020902] pcieport 000=
0:00:1d.0: Signaling PME with IRQ 125<br>&lt;6&gt;[=C2=A0=C2=A0=C2=A0 1.020=
909] pcieport 0000:00:1d.3: Signaling PME with IRQ 126<br>&lt;6&gt;[=C2=A0=
=C2=A0=C2=A0 2.492922] nouveau: detected PR support, will not use DSM<br>&l=
t;6&gt;[=C2=A0=C2=A0=C2=A0 2.492947] nouveau 0000:01:00.0: enabling device =
(0406 -&gt; 0407)<br>&lt;6&gt;[=C2=A0=C2=A0=C2=A0 2.493098] nouveau 0000:01=
:00.0: NVIDIA GM108 (1180d0a2)<br>&lt;6&gt;[=C2=A0=C2=A0=C2=A0 2.526811] no=
uveau 0000:01:00.0: bios: version 82.08.6d.00.8d<br>&lt;6&gt;[=C2=A0=C2=A0=
=C2=A0 2.571894] nouveau 0000:01:00.0: fb: 4096 MiB DDR3<br><b>&lt;3&gt;[=
=C2=A0=C2=A0=C2=A0 2.571935] nouveau 0000:01:00.0: bus: MMIO read of 000000=
00 FAULT at 6013d4 [ IBUS ]<br>&lt;3&gt;[=C2=A0=C2=A0=C2=A0 2.585938] nouve=
au 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10ac08 [ IBUS ]<br></b=
>&lt;6&gt;[=C2=A0=C2=A0=C2=A0 3.227808] nouveau 0000:01:00.0: DRM: VRAM: 40=
96 MiB<br>&lt;6&gt;[=C2=A0=C2=A0=C2=A0 3.227809] nouveau 0000:01:00.0: DRM:=
 GART: 1048576 MiB<br><b>&lt;3&gt;[=C2=A0=C2=A0=C2=A0 3.227811] nouveau 000=
0:01:00.0: DRM: Pointer to TMDS table invalid<br></b>&lt;6&gt;[=C2=A0=C2=A0=
=C2=A0 3.227812] nouveau 0000:01:00.0: DRM: DCB version 4.0<br>&lt;6&gt;[=
=C2=A0=C2=A0=C2=A0 3.228550] nouveau 0000:01:00.0: DRM: MM: using COPY for =
buffer copies<br>&lt;6&gt;[=C2=A0=C2=A0=C2=A0 3.228555] [drm] Initialized n=
ouveau 1.3.1 20120801 for 0000:01:00.0 on minor 1<br>&lt;6&gt;[=C2=A0=C2=A0=
=C2=A0 9.618550] pcieport 0000:00:1d.3: AER: Corrected error received: 0000=
:00:1d.3<br><b>&lt;3&gt;[=C2=A0=C2=A0=C2=A0 9.618579] pcieport 0000:00:1d.3=
: PCIe Bus Error: severity=3DCorrected, type=3DPhysical Layer, (Receiver ID=
)<br>&lt;3&gt;[=C2=A0=C2=A0=C2=A0 9.618580] pcieport 0000:00:1d.3:=C2=A0=C2=
=A0 device [8086:9d1b] error status/mask=3D00000001/00002000<br>&lt;3&gt;[=
=C2=A0=C2=A0=C2=A0 9.618581] pcieport 0000:00:1d.3:=C2=A0=C2=A0=C2=A0 [ 0] =
RxErr=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (First)<br></b>&lt;6&gt;[=C2=A0=C2=A0 18.=
370866] pcieport 0000:00:1d.3: AER: Corrected error received: 0000:00:1d.3<=
br><b>&lt;3&gt;[=C2=A0=C2=A0 18.370878] pcieport 0000:00:1d.3: PCIe Bus Err=
or: severity=3DCorrected, type=3DPhysical Layer, (Receiver ID)<br>&lt;3&gt;=
[=C2=A0=C2=A0 18.370884] pcieport 0000:00:1d.3:=C2=A0=C2=A0 device [8086:9d=
1b] error status/mask=3D00000001/00002000<br>&lt;3&gt;[=C2=A0=C2=A0 18.3708=
89] pcieport 0000:00:1d.3:=C2=A0=C2=A0=C2=A0 [ 0] RxErr=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 (First)<br></b>&lt;6&gt;[=C2=A0=C2=A0 18.450492] pcieport 0000:00=
:1d.3: AER: Corrected error received: 0000:00:1d.3<br><b>&lt;3&gt;[=C2=A0=
=C2=A0 18.450504] pcieport 0000:00:1d.3: PCIe Bus Error: severity=3DCorrect=
ed, type=3DPhysical Layer, (Receiver ID)<br>&lt;3&gt;[=C2=A0=C2=A0 18.45051=
0] pcieport 0000:00:1d.3:=C2=A0=C2=A0 device [8086:9d1b] error status/mask=
=3D00000001/00002000<br>&lt;3&gt;[=C2=A0=C2=A0 18.450514] pcieport 0000:00:=
1d.3:=C2=A0=C2=A0=C2=A0 [ 0] RxErr=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (First)<br>=
&lt;3&gt;[=C2=A0=C2=A0 22.405003] nouveau 0000:01:00.0: bus: MMIO read of 0=
0000000 FAULT at 6013d4 [ IBUS ]<br>&lt;3&gt;[=C2=A0=C2=A0 73.345270] nouve=
au 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 6013d4 [ IBUS ]</b></s=
pan><b><br></b></div><div><b><br></b></div><div><b><br></b></div><div>Thank=
s in advance<b><br></b></div><div><br></div><div><div><div dir=3D"ltr" clas=
s=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div>Regards</=
div>Archit Gupta</div></div></div></div></div></div></div></div></div>

--000000000000c939f7057d1f1dce--

--===============0769358130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0769358130==--
