From: "3rik.gm" <3rik.gm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: GTX 580 : X freezes
Date: Tue, 28 Aug 2012 20:32:48 +0200
Message-ID: <CA+T9nP_HJ3g12Cw7taq5NXs1SqWRRdxK9KBJ5Xor_6c-_8Lhkw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1984282893=="
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

--===============1984282893==
Content-Type: multipart/alternative; boundary=f46d0401723f55df3604c857abb3

--f46d0401723f55df3604c857abb3
Content-Type: text/plain; charset=ISO-8859-1

Hello,

Running Archlinux x86_64, kernel 3.4.9, xf86-video-nouveau-git and mesa-full

No matter what I do, X freezes.

Here is the kernel log as regards nouveau :

[    1.147790] [drm] nouveau 0000:01:00.0: Detected an NVc0 generation
card (0x0c8000a1)
[    1.148583] fb: conflicting fb hw usage nouveaufb vs VESA VGA -
removing generic driver
[    1.151874] [drm] nouveau 0000:01:00.0: Checking PRAMIN for VBIOS
[    1.251089] [drm] nouveau 0000:01:00.0: ... appears to be valid
[    1.251090] [drm] nouveau 0000:01:00.0: Using VBIOS from PRAMIN
[    1.251092] [drm] nouveau 0000:01:00.0: BIT BIOS found
[    1.251093] [drm] nouveau 0000:01:00.0: Bios version 70.10.17.00
[    1.251094] [drm] nouveau 0000:01:00.0: TMDS table version 2.0
[    1.251253] [drm] nouveau 0000:01:00.0: MXM: no VBIOS data, nothing to do
[    1.251255] [drm] nouveau 0000:01:00.0: DCB version 4.0
[    1.251256] [drm] nouveau 0000:01:00.0: DCB outp 00: 02000300 00000000
[    1.251258] [drm] nouveau 0000:01:00.0: DCB outp 01: 01000302 00020030
[    1.251259] [drm] nouveau 0000:01:00.0: DCB outp 02: 04011380 00000000
[    1.251260] [drm] nouveau 0000:01:00.0: DCB outp 03: 08011382 00020030
[    1.251261] [drm] nouveau 0000:01:00.0: DCB outp 04: 02022362 00020010
[    1.251262] [drm] nouveau 0000:01:00.0: DCB conn 00: 00001030
[    1.251264] [drm] nouveau 0000:01:00.0: DCB conn 01: 00010130
[    1.251265] [drm] nouveau 0000:01:00.0: DCB conn 02: 00002261
[    1.251268] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0
at offset 0x69CF
[    1.272470] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1
at offset 0x706F
[    1.279827] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2
at offset 0x84CC
[    1.279829] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3
at offset 0x84D6
[    1.279903] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4
at offset 0x874A
[    1.279905] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table at
offset 0x87AF
[    1.299888] [drm] nouveau 0000:01:00.0: 0x87AF: Condition still not
met after 20ms, skipping following opcodes
[    1.305265] [drm] nouveau 0000:01:00.0: Detected 1536MiB VRAM (GDDR5)
[    1.305284] [drm] nouveau 0000:01:00.0: 512 MiB GART (aperture)
[    1.324224] [drm] nouveau 0000:01:00.0: 0 available performance level(s)
[    1.324226] [drm] nouveau 0000:01:00.0: c: core 50MHz shader 101MHz
memory 135MHz voltage 963mV fanspeed 40%
[    1.616099] [drm] nouveau 0000:01:00.0: allocated 1920x1200 fb:
0x1e0000, bo ffff88031c662800
[    1.616250] fbcon: nouveaufb (fb0) is primary device
[    1.643495] fb0: nouveaufb frame buffer device
[    1.643498] [drm] Initialized nouveau 1.0.0 20120316 for
0000:01:00.0 on minor 0
[    1.643507] nouveau 0000:02:00.0: enabling device (0000 -> 0003)
[    1.643964] [drm] nouveau 0000:02:00.0: Detected an NVc0 generation
card (0x0c8000a1)
[    1.647488] [drm] nouveau 0000:02:00.0: Checking PRAMIN for VBIOS
[    1.657203] [drm] nouveau 0000:02:00.0: ... BIOS signature not found
[    1.657206] [drm] nouveau 0000:02:00.0: Checking PROM for VBIOS
[    1.916632] [drm] nouveau 0000:02:00.0: ... appears to be valid
[    1.916633] [drm] nouveau 0000:02:00.0: Using VBIOS from PROM
[    1.916635] [drm] nouveau 0000:02:00.0: BIT BIOS found
[    1.916636] [drm] nouveau 0000:02:00.0: Bios version 70.10.17.00
[    1.916637] [drm] nouveau 0000:02:00.0: TMDS table version 2.0
[    1.916817] [drm] nouveau 0000:02:00.0: MXM: no VBIOS data, nothing to do
[    1.916819] [drm] nouveau 0000:02:00.0: DCB version 4.0
[    1.916820] [drm] nouveau 0000:02:00.0: DCB outp 00: 02000300 00000000
[    1.916822] [drm] nouveau 0000:02:00.0: DCB outp 01: 01000302 00020030
[    1.916823] [drm] nouveau 0000:02:00.0: DCB outp 02: 04011380 00000000
[    1.916825] [drm] nouveau 0000:02:00.0: DCB outp 03: 08011382 00020030
[    1.916826] [drm] nouveau 0000:02:00.0: DCB outp 04: 02022362 00020010
[    1.916827] [drm] nouveau 0000:02:00.0: DCB conn 00: 00001030
[    1.916828] [drm] nouveau 0000:02:00.0: DCB conn 01: 00010130
[    1.916829] [drm] nouveau 0000:02:00.0: DCB conn 02: 00002261
[    1.916843] [drm] nouveau 0000:02:00.0: Adaptor not initialised,
running VBIOS init tables.
[    1.916845] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 0
at offset 0x69CF
[    1.978917] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 1
at offset 0x706F
[    2.006404] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 2
at offset 0x84CC
[    2.006410] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 3
at offset 0x84D6
[    2.006536] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 4
at offset 0x874A
[    2.006537] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table at
offset 0x87AF
[    2.031813] [drm] nouveau 0000:02:00.0: Detected 1536MiB VRAM (GDDR5)
[    2.031825] [drm] nouveau 0000:02:00.0: 512 MiB GART (aperture)
[    2.050859] [drm] nouveau 0000:02:00.0: 0 available performance level(s)
[    2.050861] [drm] nouveau 0000:02:00.0: c: core 50MHz shader 101MHz
memory 135MHz voltage 963mV fanspeed 40%
[    2.334686] [drm] nouveau 0000:02:00.0: allocated 1024x768 fb:
0x1e0000, bo ffff88031b80a800
[    2.334862] fb1: nouveaufb frame buffer device
[    2.334865] [drm] Initialized nouveau 1.0.0 20120316 for
0000:02:00.0 on minor 1
[ 1642.831909] [drm] nouveau 0000:01:00.0: illegal object class: 0x906e
[ 1642.831911] [drm] nouveau 0000:01:00.0: Error creating object: -22
(1/0x001f906e)
[ 4730.269562] [drm] nouveau 0000:01:00.0: illegal object class: 0x906e
[ 4730.269565] [drm] nouveau 0000:01:00.0: Error creating object: -22
(3/0x001f906e)

Tried with stable nouveau, no way.

Nothing wrong in Xorg log...

Thanks for your help,

Eric

--f46d0401723f55df3604c857abb3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,<br><br>Running Archlinux x86_64, kernel 3.4.9, xf86-video-nouveau-gi=
t and mesa-full<br><br>No matter what I do, X freezes.<br><br>Here is the k=
ernel log as regards nouveau :<br><br><pre>[    1.147790] [drm] nouveau 000=
0:01:00.0: Detected an NVc0 generation card (0x0c8000a1)
[    1.148583] fb: conflicting fb hw usage nouveaufb vs VESA VGA - removing=
 generic driver
[    1.151874] [drm] nouveau 0000:01:00.0: Checking PRAMIN for VBIOS
[    1.251089] [drm] nouveau 0000:01:00.0: ... appears to be valid
[    1.251090] [drm] nouveau 0000:01:00.0: Using VBIOS from PRAMIN
[    1.251092] [drm] nouveau 0000:01:00.0: BIT BIOS found
[    1.251093] [drm] nouveau 0000:01:00.0: Bios version 70.10.17.00
[    1.251094] [drm] nouveau 0000:01:00.0: TMDS table version 2.0
[    1.251253] [drm] nouveau 0000:01:00.0: MXM: no VBIOS data, nothing to d=
o
[    1.251255] [drm] nouveau 0000:01:00.0: DCB version 4.0
[    1.251256] [drm] nouveau 0000:01:00.0: DCB outp 00: 02000300 00000000
[    1.251258] [drm] nouveau 0000:01:00.0: DCB outp 01: 01000302 00020030
[    1.251259] [drm] nouveau 0000:01:00.0: DCB outp 02: 04011380 00000000
[    1.251260] [drm] nouveau 0000:01:00.0: DCB outp 03: 08011382 00020030
[    1.251261] [drm] nouveau 0000:01:00.0: DCB outp 04: 02022362 00020010
[    1.251262] [drm] nouveau 0000:01:00.0: DCB conn 00: 00001030
[    1.251264] [drm] nouveau 0000:01:00.0: DCB conn 01: 00010130
[    1.251265] [drm] nouveau 0000:01:00.0: DCB conn 02: 00002261
[    1.251268] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at of=
fset 0x69CF
[    1.272470] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at of=
fset 0x706F
[    1.279827] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at of=
fset 0x84CC
[    1.279829] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at of=
fset 0x84D6
[    1.279903] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at of=
fset 0x874A
[    1.279905] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table at offs=
et 0x87AF
[    1.299888] [drm] nouveau 0000:01:00.0: 0x87AF: Condition still not met =
after 20ms, skipping following opcodes
[    1.305265] [drm] nouveau 0000:01:00.0: Detected 1536MiB VRAM (GDDR5)
[    1.305284] [drm] nouveau 0000:01:00.0: 512 MiB GART (aperture)
[    1.324224] [drm] nouveau 0000:01:00.0: 0 available performance level(s)
[    1.324226] [drm] nouveau 0000:01:00.0: c: core 50MHz shader 101MHz memo=
ry 135MHz voltage 963mV fanspeed 40%
[    1.616099] [drm] nouveau 0000:01:00.0: allocated 1920x1200 fb: 0x1e0000=
, bo ffff88031c662800
[    1.616250] fbcon: nouveaufb (fb0) is primary device
[    1.643495] fb0: nouveaufb frame buffer device
[    1.643498] [drm] Initialized nouveau 1.0.0 20120316 for 0000:01:00.0 on=
 minor 0
[    1.643507] nouveau 0000:02:00.0: enabling device (0000 -&gt; 0003)
[    1.643964] [drm] nouveau 0000:02:00.0: Detected an NVc0 generation card=
 (0x0c8000a1)
[    1.647488] [drm] nouveau 0000:02:00.0: Checking PRAMIN for VBIOS
[    1.657203] [drm] nouveau 0000:02:00.0: ... BIOS signature not found
[    1.657206] [drm] nouveau 0000:02:00.0: Checking PROM for VBIOS
[    1.916632] [drm] nouveau 0000:02:00.0: ... appears to be valid
[    1.916633] [drm] nouveau 0000:02:00.0: Using VBIOS from PROM
[    1.916635] [drm] nouveau 0000:02:00.0: BIT BIOS found
[    1.916636] [drm] nouveau 0000:02:00.0: Bios version 70.10.17.00
[    1.916637] [drm] nouveau 0000:02:00.0: TMDS table version 2.0
[    1.916817] [drm] nouveau 0000:02:00.0: MXM: no VBIOS data, nothing to d=
o
[    1.916819] [drm] nouveau 0000:02:00.0: DCB version 4.0
[    1.916820] [drm] nouveau 0000:02:00.0: DCB outp 00: 02000300 00000000
[    1.916822] [drm] nouveau 0000:02:00.0: DCB outp 01: 01000302 00020030
[    1.916823] [drm] nouveau 0000:02:00.0: DCB outp 02: 04011380 00000000
[    1.916825] [drm] nouveau 0000:02:00.0: DCB outp 03: 08011382 00020030
[    1.916826] [drm] nouveau 0000:02:00.0: DCB outp 04: 02022362 00020010
[    1.916827] [drm] nouveau 0000:02:00.0: DCB conn 00: 00001030
[    1.916828] [drm] nouveau 0000:02:00.0: DCB conn 01: 00010130
[    1.916829] [drm] nouveau 0000:02:00.0: DCB conn 02: 00002261
[    1.916843] [drm] nouveau 0000:02:00.0: Adaptor not initialised, running=
 VBIOS init tables.
[    1.916845] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 0 at of=
fset 0x69CF
[    1.978917] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 1 at of=
fset 0x706F
[    2.006404] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 2 at of=
fset 0x84CC
[    2.006410] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 3 at of=
fset 0x84D6
[    2.006536] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 4 at of=
fset 0x874A
[    2.006537] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table at offs=
et 0x87AF
[    2.031813] [drm] nouveau 0000:02:00.0: Detected 1536MiB VRAM (GDDR5)
[    2.031825] [drm] nouveau 0000:02:00.0: 512 MiB GART (aperture)
[    2.050859] [drm] nouveau 0000:02:00.0: 0 available performance level(s)
[    2.050861] [drm] nouveau 0000:02:00.0: c: core 50MHz shader 101MHz memo=
ry 135MHz voltage 963mV fanspeed 40%
[    2.334686] [drm] nouveau 0000:02:00.0: allocated 1024x768 fb: 0x1e0000,=
 bo ffff88031b80a800
[    2.334862] fb1: nouveaufb frame buffer device
[    2.334865] [drm] Initialized nouveau 1.0.0 20120316 for 0000:02:00.0 on=
 minor 1
[ 1642.831909] [drm] nouveau 0000:01:00.0: illegal object class: 0x906e
[ 1642.831911] [drm] nouveau 0000:01:00.0: Error creating object: -22 (1/0x=
001f906e)
[ 4730.269562] [drm] nouveau 0000:01:00.0: illegal object class: 0x906e
[ 4730.269565] [drm] nouveau 0000:01:00.0: Error creating object: -22 (3/0x=
001f906e)
<br><br>Tried with stable nouveau, no way.<br><br>Nothing wrong in Xorg log=
...<br><br>Thanks for your help,<br><br>Eric<br></pre><br>

--f46d0401723f55df3604c857abb3--

--===============1984282893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1984282893==--
