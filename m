From: "3rik.gm" <3rik.gm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Latest linux-nouveau : Firefox 13.01 to 15.0.1 makes X
	freeze
Date: Sun, 23 Sep 2012 16:15:25 +0200
Message-ID: <CA+T9nP9E+-VftbTNns82nsSgxdJnourSoC7gfW3gBWnxPzvz2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1358753214=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1358753214==
Content-Type: multipart/alternative; boundary=f46d040167edbbd3cd04ca5f1abe

--f46d040167edbbd3cd04ca5f1abe
Content-Type: text/plain; charset=ISO-8859-1

Hello,

All is said. I had more Xorg freeze, but now only Firefox is a
linux-nouveau issue :

Here is dmesg | grep nouveau :

[    0.602330] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0c8000a1
[    0.602334] nouveau  [  DEVICE][0000:01:00.0] Chipset: GF110 (NVC8)
[    0.602335] nouveau  [  DEVICE][0000:01:00.0] Family : NVC0
[    0.603514] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for
image...
[    0.703194] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    0.703195] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    0.703270] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    0.703271] nouveau  [   VBIOS][0000:01:00.0] version 70.10.17.00
[    0.703483] nouveau  [     MXM][0000:01:00.0] no VBIOS data, nothing to
do
[    0.725588] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
[    0.725590] nouveau  [     PFB][0000:01:00.0] RAM size: 1536 MiB
[    0.739861] nouveau  [     DRM] VRAM: 1536MiB
[    0.739862] nouveau  [     DRM] GART: 512MiB
[    0.739866] nouveau  [     DRM] BIT BIOS found
[    0.739868] nouveau  [     DRM] Bios version 70.10.17.00
[    0.739871] nouveau  [     DRM] TMDS table version 2.0
[    0.739873] nouveau  [     DRM] DCB version 4.0
[    0.739876] nouveau  [     DRM] DCB outp 00: 02000300 00000000
[    0.739878] nouveau  [     DRM] DCB outp 01: 01000302 00020030
[    0.739880] nouveau  [     DRM] DCB outp 02: 04011380 00000000
[    0.739882] nouveau  [     DRM] DCB outp 03: 08011382 00020030
[    0.739884] nouveau  [     DRM] DCB outp 04: 02022362 00020010
[    0.739886] nouveau  [     DRM] DCB conn 00: 00001030
[    0.739889] nouveau  [     DRM] DCB conn 01: 00010130
[    0.739891] nouveau  [     DRM] DCB conn 02: 00002261
[    0.777687] nouveau  [     DRM] 0 available performance level(s)
[    0.777689] nouveau  [     DRM] c: core 50MHz shader 101MHz memory
135MHz voltage 963mV fanspeed 40%
[    0.790243] nouveau  [     DRM] MM: using COPY0 for buffer copies
[    1.072052] nouveau  [     DRM] allocated 1920x1200 fb: 0x60000, bo
ffff88031fb3b400
[    1.072215] fbcon: nouveaufb (fb0) is primary device
[    1.112738] fb0: nouveaufb frame buffer device
[    1.112741] [drm] Initialized nouveau 1.1.0 20120801 for 0000:01:00.0 on
minor 0
[    1.112752] nouveau 0000:02:00.0: enabling device (0004 -> 0007)
[    1.113197] nouveau  [  DEVICE][0000:02:00.0] BOOT0  : 0x0c8000a1
[    1.113203] nouveau  [  DEVICE][0000:02:00.0] Chipset: GF110 (NVC8)
[    1.113204] nouveau  [  DEVICE][0000:02:00.0] Family : NVC0
[    1.114061] nouveau  [   VBIOS][0000:02:00.0] checking PRAMIN for
image...
[    1.123781] nouveau  [   VBIOS][0000:02:00.0] ... signature not found
[    1.123783] nouveau  [   VBIOS][0000:02:00.0] checking PROM for image...
[    1.383381] nouveau  [   VBIOS][0000:02:00.0] ... appears to be valid
[    1.383382] nouveau  [   VBIOS][0000:02:00.0] using image from PROM
[    1.383460] nouveau  [   VBIOS][0000:02:00.0] BIT signature found
[    1.383462] nouveau  [   VBIOS][0000:02:00.0] version 70.10.17.00
[    1.383762] nouveau  [     MXM][0000:02:00.0] no VBIOS data, nothing to
do
[    1.383776] nouveau  [ DEVINIT][0000:02:00.0] adaptor not initialised
[    1.383777] nouveau  [   VBIOS][0000:02:00.0] running init tables
[    1.493277] nouveau  [     PFB][0000:02:00.0] RAM type: GDDR5
[    1.493278] nouveau  [     PFB][0000:02:00.0] RAM size: 1536 MiB
[    1.507206] nouveau  [     DRM] VRAM: 1536MiB
[    1.507207] nouveau  [     DRM] GART: 512MiB
[    1.507208] nouveau  [     DRM] BIT BIOS found
[    1.507210] nouveau  [     DRM] Bios version 70.10.17.00
[    1.507211] nouveau  [     DRM] TMDS table version 2.0
[    1.507212] nouveau  [     DRM] DCB version 4.0
[    1.507213] nouveau  [     DRM] DCB outp 00: 02000300 00000000
[    1.507214] nouveau  [     DRM] DCB outp 01: 01000302 00020030
[    1.507215] nouveau  [     DRM] DCB outp 02: 04011380 00000000
[    1.507216] nouveau  [     DRM] DCB outp 03: 08011382 00020030
[    1.507217] nouveau  [     DRM] DCB outp 04: 02022362 00020010
[    1.507218] nouveau  [     DRM] DCB conn 00: 00001030
[    1.507219] nouveau  [     DRM] DCB conn 01: 00010130
[    1.507220] nouveau  [     DRM] DCB conn 02: 00002261
[    1.514491] nouveau  [     DRM] 0 available performance level(s)
[    1.514493] nouveau  [     DRM] c: core 50MHz shader 101MHz memory
135MHz voltage 963mV fanspeed 40%
[    1.527248] nouveau  [     DRM] MM: using COPY0 for buffer copies
[    1.825805] nouveau  [     DRM] allocated 1024x768 fb: 0x60000, bo
ffff88031ec03800
[    1.825960] fb1: nouveaufb frame buffer device
[    1.825965] [drm] Initialized nouveau 1.1.0 20120801 for 0000:02:00.0 on
minor 1
[  257.520077] nouveau W[   PFIFO][0000:01:00.0] unknown status 0x40000000
[  324.410050] nouveau W[   PFIFO][0000:01:00.0] unknown status 0x40000000
[  338.895490] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x0000000000
[PAGE_NOT_PRESENT] from PGRAPH/CTXCTL on channel 0x005fcbb000
[  338.895495] nouveau W[   PFIFO][0000:01:00.0] unknown status 0x40000000
[  422.276435] nouveau E[     DRM] GPU lockup - switching to software fbcon
[  425.277136] nouveau E[     595] failed to idle channel 0xcccc0001
[  427.276437] nouveau E[   PFIFO][0000:01:00.0] channel 2 kick timeout
[  427.277739] nouveau  [   PFIFO][0000:01:00.0] unknown status 0x00000100
[  429.275787] nouveau E[   PFIFO][0000:01:00.0] playlist update failed
[  429.276987] nouveau ![   PFIFO][0000:01:00.0] unhandled status 0x00000001
[  432.273549] nouveau E[     595] failed to idle channel 0xcccc0000
[  434.272829] nouveau E[   PFIFO][0000:01:00.0] channel 1 kick timeout
[  436.272182] nouveau E[   PFIFO][0000:01:00.0] playlist update failed
[  439.276654] nouveau E[    1194] failed to idle channel 0xcccc0000
[  441.274744] nouveau E[   PFIFO][0000:01:00.0] channel 3 kick timeout
[  443.272903] nouveau E[   PFIFO][0000:01:00.0] playlist update failed

--f46d040167edbbd3cd04ca5f1abe
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,<br><br>All is said. I had more Xorg freeze, but now only Firefox is =
a linux-nouveau issue :<br><br>Here is dmesg | grep nouveau :<br><br>[=A0=
=A0=A0 0.602330] nouveau=A0 [=A0 DEVICE][0000:01:00.0] BOOT0=A0 : 0x0c8000a=
1<br>[=A0=A0=A0 0.602334] nouveau=A0 [=A0 DEVICE][0000:01:00.0] Chipset: GF=
110 (NVC8)<br>
[=A0=A0=A0 0.602335] nouveau=A0 [=A0 DEVICE][0000:01:00.0] Family : NVC0<br=
>[=A0=A0=A0 0.603514] nouveau=A0 [=A0=A0 VBIOS][0000:01:00.0] checking PRAM=
IN for image...<br>[=A0=A0=A0 0.703194] nouveau=A0 [=A0=A0 VBIOS][0000:01:0=
0.0] ... appears to be valid<br>
[=A0=A0=A0 0.703195] nouveau=A0 [=A0=A0 VBIOS][0000:01:00.0] using image fr=
om PRAMIN<br>[=A0=A0=A0 0.703270] nouveau=A0 [=A0=A0 VBIOS][0000:01:00.0] B=
IT signature found<br>[=A0=A0=A0 0.703271] nouveau=A0 [=A0=A0 VBIOS][0000:0=
1:00.0] version 70.10.17.00<br>[=A0=A0=A0 0.703483] nouveau=A0 [=A0=A0=A0=
=A0 MXM][0000:01:00.0] no VBIOS data, nothing to do<br>
[=A0=A0=A0 0.725588] nouveau=A0 [=A0=A0=A0=A0 PFB][0000:01:00.0] RAM type: =
GDDR5<br>[=A0=A0=A0 0.725590] nouveau=A0 [=A0=A0=A0=A0 PFB][0000:01:00.0] R=
AM size: 1536 MiB<br>[=A0=A0=A0 0.739861] nouveau=A0 [=A0=A0=A0=A0 DRM] VRA=
M: 1536MiB<br>[=A0=A0=A0 0.739862] nouveau=A0 [=A0=A0=A0=A0 DRM] GART: 512M=
iB<br>
[=A0=A0=A0 0.739866] nouveau=A0 [=A0=A0=A0=A0 DRM] BIT BIOS found<br>[=A0=
=A0=A0 0.739868] nouveau=A0 [=A0=A0=A0=A0 DRM] Bios version 70.10.17.00<br>=
[=A0=A0=A0 0.739871] nouveau=A0 [=A0=A0=A0=A0 DRM] TMDS table version 2.0<b=
r>[=A0=A0=A0 0.739873] nouveau=A0 [=A0=A0=A0=A0 DRM] DCB version 4.0<br>
[=A0=A0=A0 0.739876] nouveau=A0 [=A0=A0=A0=A0 DRM] DCB outp 00: 02000300 00=
000000<br>[=A0=A0=A0 0.739878] nouveau=A0 [=A0=A0=A0=A0 DRM] DCB outp 01: 0=
1000302 00020030<br>[=A0=A0=A0 0.739880] nouveau=A0 [=A0=A0=A0=A0 DRM] DCB =
outp 02: 04011380 00000000<br>[=A0=A0=A0 0.739882] nouveau=A0 [=A0=A0=A0=A0=
 DRM] DCB outp 03: 08011382 00020030<br>
[=A0=A0=A0 0.739884] nouveau=A0 [=A0=A0=A0=A0 DRM] DCB outp 04: 02022362 00=
020010<br>[=A0=A0=A0 0.739886] nouveau=A0 [=A0=A0=A0=A0 DRM] DCB conn 00: 0=
0001030<br>[=A0=A0=A0 0.739889] nouveau=A0 [=A0=A0=A0=A0 DRM] DCB conn 01: =
00010130<br>[=A0=A0=A0 0.739891] nouveau=A0 [=A0=A0=A0=A0 DRM] DCB conn 02:=
 00002261<br>
[=A0=A0=A0 0.777687] nouveau=A0 [=A0=A0=A0=A0 DRM] 0 available performance =
level(s)<br>[=A0=A0=A0 0.777689] nouveau=A0 [=A0=A0=A0=A0 DRM] c: core 50MH=
z shader 101MHz memory 135MHz voltage 963mV fanspeed 40%<br>[=A0=A0=A0 0.79=
0243] nouveau=A0 [=A0=A0=A0=A0 DRM] MM: using COPY0 for buffer copies<br>
[=A0=A0=A0 1.072052] nouveau=A0 [=A0=A0=A0=A0 DRM] allocated 1920x1200 fb: =
0x60000, bo ffff88031fb3b400<br>[=A0=A0=A0 1.072215] fbcon: nouveaufb (fb0)=
 is primary device<br>[=A0=A0=A0 1.112738] fb0: nouveaufb frame buffer devi=
ce<br>[=A0=A0=A0 1.112741] [drm] Initialized nouveau 1.1.0 20120801 for 000=
0:01:00.0 on minor 0<br>
[=A0=A0=A0 1.112752] nouveau 0000:02:00.0: enabling device (0004 -&gt; 0007=
)<br>[=A0=A0=A0 1.113197] nouveau=A0 [=A0 DEVICE][0000:02:00.0] BOOT0=A0 : =
0x0c8000a1<br>[=A0=A0=A0 1.113203] nouveau=A0 [=A0 DEVICE][0000:02:00.0] Ch=
ipset: GF110 (NVC8)<br>[=A0=A0=A0 1.113204] nouveau=A0 [=A0 DEVICE][0000:02=
:00.0] Family : NVC0<br>
[=A0=A0=A0 1.114061] nouveau=A0 [=A0=A0 VBIOS][0000:02:00.0] checking PRAMI=
N for image...<br>[=A0=A0=A0 1.123781] nouveau=A0 [=A0=A0 VBIOS][0000:02:00=
.0] ... signature not found<br>[=A0=A0=A0 1.123783] nouveau=A0 [=A0=A0 VBIO=
S][0000:02:00.0] checking PROM for image...<br>
[=A0=A0=A0 1.383381] nouveau=A0 [=A0=A0 VBIOS][0000:02:00.0] ... appears to=
 be valid<br>[=A0=A0=A0 1.383382] nouveau=A0 [=A0=A0 VBIOS][0000:02:00.0] u=
sing image from PROM<br>[=A0=A0=A0 1.383460] nouveau=A0 [=A0=A0 VBIOS][0000=
:02:00.0] BIT signature found<br>
[=A0=A0=A0 1.383462] nouveau=A0 [=A0=A0 VBIOS][0000:02:00.0] version 70.10.=
17.00<br>[=A0=A0=A0 1.383762] nouveau=A0 [=A0=A0=A0=A0 MXM][0000:02:00.0] n=
o VBIOS data, nothing to do<br>[=A0=A0=A0 1.383776] nouveau=A0 [ DEVINIT][0=
000:02:00.0] adaptor not initialised<br>
[=A0=A0=A0 1.383777] nouveau=A0 [=A0=A0 VBIOS][0000:02:00.0] running init t=
ables<br>[=A0=A0=A0 1.493277] nouveau=A0 [=A0=A0=A0=A0 PFB][0000:02:00.0] R=
AM type: GDDR5<br>[=A0=A0=A0 1.493278] nouveau=A0 [=A0=A0=A0=A0 PFB][0000:0=
2:00.0] RAM size: 1536 MiB<br>[=A0=A0=A0 1.507206] nouveau=A0 [=A0=A0=A0=A0=
 DRM] VRAM: 1536MiB<br>
[=A0=A0=A0 1.507207] nouveau=A0 [=A0=A0=A0=A0 DRM] GART: 512MiB<br>[=A0=A0=
=A0 1.507208] nouveau=A0 [=A0=A0=A0=A0 DRM] BIT BIOS found<br>[=A0=A0=A0 1.=
507210] nouveau=A0 [=A0=A0=A0=A0 DRM] Bios version 70.10.17.00<br>[=A0=A0=
=A0 1.507211] nouveau=A0 [=A0=A0=A0=A0 DRM] TMDS table version 2.0<br>
[=A0=A0=A0 1.507212] nouveau=A0 [=A0=A0=A0=A0 DRM] DCB version 4.0<br>[=A0=
=A0=A0 1.507213] nouveau=A0 [=A0=A0=A0=A0 DRM] DCB outp 00: 02000300 000000=
00<br>[=A0=A0=A0 1.507214] nouveau=A0 [=A0=A0=A0=A0 DRM] DCB outp 01: 01000=
302 00020030<br>[=A0=A0=A0 1.507215] nouveau=A0 [=A0=A0=A0=A0 DRM] DCB outp=
 02: 04011380 00000000<br>
[=A0=A0=A0 1.507216] nouveau=A0 [=A0=A0=A0=A0 DRM] DCB outp 03: 08011382 00=
020030<br>[=A0=A0=A0 1.507217] nouveau=A0 [=A0=A0=A0=A0 DRM] DCB outp 04: 0=
2022362 00020010<br>[=A0=A0=A0 1.507218] nouveau=A0 [=A0=A0=A0=A0 DRM] DCB =
conn 00: 00001030<br>[=A0=A0=A0 1.507219] nouveau=A0 [=A0=A0=A0=A0 DRM] DCB=
 conn 01: 00010130<br>
[=A0=A0=A0 1.507220] nouveau=A0 [=A0=A0=A0=A0 DRM] DCB conn 02: 00002261<br=
>[=A0=A0=A0 1.514491] nouveau=A0 [=A0=A0=A0=A0 DRM] 0 available performance=
 level(s)<br>[=A0=A0=A0 1.514493] nouveau=A0 [=A0=A0=A0=A0 DRM] c: core 50M=
Hz shader 101MHz memory 135MHz voltage 963mV fanspeed 40%<br>
[=A0=A0=A0 1.527248] nouveau=A0 [=A0=A0=A0=A0 DRM] MM: using COPY0 for buff=
er copies<br>[=A0=A0=A0 1.825805] nouveau=A0 [=A0=A0=A0=A0 DRM] allocated 1=
024x768 fb: 0x60000, bo ffff88031ec03800<br>[=A0=A0=A0 1.825960] fb1: nouve=
aufb frame buffer device<br>[=A0=A0=A0 1.825965] [drm] Initialized nouveau =
1.1.0 20120801 for 0000:02:00.0 on minor 1<br>
[=A0 257.520077] nouveau W[=A0=A0 PFIFO][0000:01:00.0] unknown status 0x400=
00000<br>[=A0 324.410050] nouveau W[=A0=A0 PFIFO][0000:01:00.0] unknown sta=
tus 0x40000000<br>[=A0 338.895490] nouveau E[=A0=A0 PFIFO][0000:01:00.0] re=
ad fault at 0x0000000000 [PAGE_NOT_PRESENT] from PGRAPH/CTXCTL on channel 0=
x005fcbb000<br>
[=A0 338.895495] nouveau W[=A0=A0 PFIFO][0000:01:00.0] unknown status 0x400=
00000<br>[=A0 422.276435] nouveau E[=A0=A0=A0=A0 DRM] GPU lockup - switchin=
g to software fbcon<br>[=A0 425.277136] nouveau E[=A0=A0=A0=A0 595] failed =
to idle channel 0xcccc0001<br>
[=A0 427.276437] nouveau E[=A0=A0 PFIFO][0000:01:00.0] channel 2 kick timeo=
ut<br>[=A0 427.277739] nouveau=A0 [=A0=A0 PFIFO][0000:01:00.0] unknown stat=
us 0x00000100<br>[=A0 429.275787] nouveau E[=A0=A0 PFIFO][0000:01:00.0] pla=
ylist update failed<br>
[=A0 429.276987] nouveau ![=A0=A0 PFIFO][0000:01:00.0] unhandled status 0x0=
0000001<br>[=A0 432.273549] nouveau E[=A0=A0=A0=A0 595] failed to idle chan=
nel 0xcccc0000<br>[=A0 434.272829] nouveau E[=A0=A0 PFIFO][0000:01:00.0] ch=
annel 1 kick timeout<br>
[=A0 436.272182] nouveau E[=A0=A0 PFIFO][0000:01:00.0] playlist update fail=
ed<br>[=A0 439.276654] nouveau E[=A0=A0=A0 1194] failed to idle channel 0xc=
ccc0000<br>[=A0 441.274744] nouveau E[=A0=A0 PFIFO][0000:01:00.0] channel 3=
 kick timeout<br>
[=A0 443.272903] nouveau E[=A0=A0 PFIFO][0000:01:00.0] playlist update fail=
ed<br><br>

--f46d040167edbbd3cd04ca5f1abe--

--===============1358753214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1358753214==--
