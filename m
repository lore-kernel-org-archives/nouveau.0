From: Megaf <mmegaf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: nouveau locking up on Debian Jessie.
Date: Fri, 20 Mar 2015 22:02:14 +0000
Message-ID: <CAH0ntzyWJLoMuGoDrviRG9ufDR7vO02TaQPppQGW0xZ092dsWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0166658823=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

--===============0166658823==
Content-Type: multipart/alternative; boundary=001a11c2eff27ba60f0511bf7ac0

--001a11c2eff27ba60f0511bf7ac0
Content-Type: text/plain; charset=UTF-8

Hi Ladies and Gentlemans.

I'd like to report a possible bug and ask for help in solving it.

I have a Mid 2010 Macbook Pro running Debian Jessie.
The bug seems to happen at random, but mainly when using a 3D application
with other apps running, such as Chromium (Chrome) and Iceweasel (Firefox).
It happens when watching videos with VLC and mplayer2.

I hope someone will manage to help.
Thanks.



[*] Here is some information on the GPU itself according to kernel messages.
======================================================

Mar 17 23:31:31 MacSam kernel: [    4.116055] nouveau  [
PTHERM][0000:04:00.0] FAN control: none / external
Mar 17 23:31:31 MacSam kernel: [    4.116064] nouveau  [
PTHERM][0000:04:00.0] fan management: automatic
Mar 17 23:31:31 MacSam kernel: [    4.116068] nouveau  [
PTHERM][0000:04:00.0] internal sensor: yes
Mar 17 23:31:31 MacSam kernel: [    4.116092] nouveau  [
CLK][0000:04:00.0] 03: core 405 MHz shader 405 MHz memory 405 MHz
Mar 17 23:31:31 MacSam kernel: [    4.116098] nouveau  [
CLK][0000:04:00.0] 07: core 450 MHz shader 810 MHz memory 450 MHz
Mar 17 23:31:31 MacSam kernel: [    4.116101] nouveau  [
CLK][0000:04:00.0] 0e: core 450 MHz shader 810 MHz memory 450 MHz
Mar 17 23:31:31 MacSam kernel: [    4.116104] nouveau  [
CLK][0000:04:00.0] 0f: core 450 MHz shader 950 MHz memory 450 MHz
Mar 17 23:31:31 MacSam kernel: [    4.116119] nouveau  [
CLK][0000:04:00.0] --: core 405 MHz shader 810 MHz
Mar 17 23:31:31 MacSam kernel: [    4.116168] nouveau W[
PCE0][0000:04:00.0] disabled, PCE0=1 to enable
Mar 17 23:31:31 MacSam kernel: [    4.116301] [TTM] Zone  kernel: Available
graphics memory: 1897648 kiB
Mar 17 23:31:31 MacSam kernel: [    4.116303] [TTM] Initializing pool
allocator
Mar 17 23:31:31 MacSam kernel: [    4.116309] [TTM] Initializing DMA pool
allocator
Mar 17 23:31:31 MacSam kernel: [    4.116321] nouveau  [     DRM] VRAM: 256
MiB
Mar 17 23:31:31 MacSam kernel: [    4.116323] nouveau  [     DRM] GART:
1048576 MiB
Mar 17 23:31:31 MacSam kernel: [    4.116327] nouveau  [     DRM] TMDS
table version 2.0
Mar 17 23:31:31 MacSam kernel: [    4.116329] nouveau  [     DRM] DCB
version 4.0
Mar 17 23:31:31 MacSam kernel: [    4.116332] nouveau  [     DRM] DCB outp
00: 01800113 00010030
Mar 17 23:31:31 MacSam kernel: [    4.116334] nouveau  [     DRM] DCB outp
01: 020112a6 0f220010
Mar 17 23:31:31 MacSam kernel: [    4.116336] nouveau  [     DRM] DCB outp
02: 02011262 00020010
Mar 17 23:31:31 MacSam kernel: [    4.116337] nouveau  [     DRM] DCB conn
00: 00000040
Mar 17 23:31:31 MacSam kernel: [    4.116339] nouveau  [     DRM] DCB conn
01: 00101146
Mar 17 23:31:31 MacSam kernel: [    4.124954] [drm] Supports vblank
timestamp caching Rev 2 (21.10.2013).
Mar 17 23:31:31 MacSam kernel: [    4.124956] [drm] Driver supports precise
vblank timestamp query.
Mar 17 23:31:31 MacSam kernel: [    4.136978] nouveau  [     DRM] MM: using
M2MF for buffer copies
Mar 17 23:31:31 MacSam kernel: [    4.151394] input: HDA NVidia Headphone
as /devices/pci0000:00/0000:00:08.0/sound/card0/input10
Mar 17 23:31:31 MacSam kernel: [    4.151527] input: HDA NVidia
HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:08.0/sound/card0/input11
Mar 17 23:31:31 MacSam kernel: [    4.151654] input: HDA NVidia
HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:08.0/sound/card0/input12
Mar 17 23:31:31 MacSam kernel: [    4.151780] input: HDA NVidia
HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:08.0/sound/card0/input13
Mar 17 23:31:31 MacSam kernel: [    4.252701] nouveau  [     DRM] allocated
1280x800 fb: 0x50000, bo ffff8800aa383800
Mar 17 23:31:31 MacSam kernel: [    4.252825] fbcon: nouveaufb (fb0) is
primary device
Mar 17 23:31:31 MacSam kernel: [    4.326232] Console: switching to colour
frame buffer device 160x50
Mar 17 23:31:31 MacSam kernel: [    4.328317] nouveau 0000:04:00.0: fb0:
nouveaufb frame buffer device
Mar 17 23:31:31 MacSam kernel: [    4.328319] nouveau 0000:04:00.0:
registered panic notifier
Mar 17 23:31:31 MacSam kernel: [    4.336093] usb 4-5: new low-speed USB
device number 3 using ohci-pci
Mar 17 23:31:31 MacSam kernel: [    4.340098] [drm] Initialized nouveau
1.1.2 20120801 for 0000:04:00.0 on minor 0

It's a nvidia 320M by the way.

[*] And here is the bug itself.
===================

Mar 20 21:18:42 MacSam kernel: [41316.923835] nouveau E[
PGRAPH][0000:04:00.0] DATA_ERROR INVALID_VALUE
Mar 20 21:18:42 MacSam kernel: [41316.923848] nouveau E[
PGRAPH][0000:04:00.0] ch 3 [0x000fb2a000 Xorg[19317]] subc 2 class 0x502d
mthd 0x060c data 0x00044110
Mar 20 21:18:42 MacSam kernel: [41316.945939] nouveau E[
PFIFO][0000:04:00.0] DMA_PUSHER - ch 3 [Xorg[19317]] get 0x002002c61c put
0x002002ca80 ib_get 0x000001d5 ib_put 0x000001da state 0x80000024 (err:
INVALID_CMD) push 0x003060b0
Mar 20 21:18:42 MacSam kernel: [41316.956144] nouveau E[
PGRAPH][0000:04:00.0] magic set 0:
Mar 20 21:18:42 MacSam kernel: [41316.956152] nouveau E[
PGRAPH][0000:04:00.0]     0x00408604: 0x20090d0f
Mar 20 21:18:42 MacSam kernel: [41316.956155] nouveau E[
PGRAPH][0000:04:00.0]     0x00408608: 0x00206365
Mar 20 21:18:42 MacSam kernel: [41316.956159] nouveau E[
PGRAPH][0000:04:00.0]     0x0040860c: 0x80000432
Mar 20 21:18:42 MacSam kernel: [41316.956162] nouveau E[
PGRAPH][0000:04:00.0]     0x00408610: 0x62100003
Mar 20 21:18:42 MacSam kernel: [41316.956165] nouveau E[
PGRAPH][0000:04:00.0] TRAP_TEXTURE - TP0:  FAULT
Mar 20 21:18:42 MacSam kernel: [41316.956176] nouveau E[
PGRAPH][0000:04:00.0] ch 3 [0x000fb2a000 Xorg[19317]] subc 2 class 0x502d
mthd 0x08dc data 0x00000000
Mar 20 21:18:42 MacSam kernel: [41316.956186] nouveau E[
PFB][0000:04:00.0] trapped read at 0x0020634d00 on channel 0x0000fb2a
[Xorg[19317]] PGRAPH/TEXTURE/00 reason: VRAM_LIMIT
Mar 20 21:18:42 MacSam kernel: [41316.981543] nouveau E[
PFIFO][0000:04:00.0] DMA_PUSHER - ch 3 [Xorg[19317]] get 0x0020036fd8 put
0x0020036fe8 ib_get 0x000001fd ib_put 0x00000204 state 0x80000024 (err:
INVALID_CMD) push 0x00400040
Mar 20 21:18:42 MacSam kernel: [41316.988933] nouveau E[
PGRAPH][0000:04:00.0] TRAP_PROP - TP 0 - DST2D_FAULT - Address 00410e7a00
Mar 20 21:18:42 MacSam kernel: [41316.988945] nouveau E[
PGRAPH][0000:04:00.0] TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c:
012a00f6, e20: 00000011, e24: 0c330000
Mar 20 21:18:42 MacSam kernel: [41316.988954] nouveau E[
PGRAPH][0000:04:00.0] ch 3 [0x000fb2a000 Xorg[19317]] subc 2 class 0x502d
mthd 0x0860 data 0x00000000
Mar 20 21:18:42 MacSam kernel: [41316.988965] nouveau E[
PFB][0000:04:00.0] trapped write at 0x00410e7a00 on channel 0x0000fb2a
[Xorg[19317]] PGRAPH/PROP/DST2D reason: VRAM_LIMIT
Mar 20 21:18:42 MacSam kernel: [41316.988987] nouveau E[
PGRAPH][0000:04:00.0] TRAP_PROP - TP 0 - DST2D_FAULT - Address 00410eae00
Mar 20 21:18:42 MacSam kernel: [41316.988993] nouveau E[
PGRAPH][0000:04:00.0] TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c:
01780000, e20: 00000011, e24: 0c330000
Mar 20 21:18:42 MacSam kernel: [41316.988999] nouveau E[
PGRAPH][0000:04:00.0] ch 3 [0x000fb2a000 Xorg[19317]] subc 2 class 0x502d
mthd 0x024c data 0x0000018d
Mar 20 21:18:42 MacSam kernel: [41316.989031] nouveau E[
PGRAPH][0000:04:00.0] magic set 0:
Mar 20 21:18:42 MacSam kernel: [41316.989036] nouveau E[
PGRAPH][0000:04:00.0]     0x00408604: 0x2009970c
Mar 20 21:18:42 MacSam kernel: [41316.989039] nouveau E[
PGRAPH][0000:04:00.0]     0x00408608: 0x00410e9b
Mar 20 21:18:42 MacSam kernel: [41316.989043] nouveau E[
PGRAPH][0000:04:00.0]     0x0040860c: 0x80000432
Mar 20 21:18:42 MacSam kernel: [41316.989046] nouveau E[
PGRAPH][0000:04:00.0]     0x00408610: 0x09000003
Mar 20 21:18:42 MacSam kernel: [41316.989049] nouveau E[
PGRAPH][0000:04:00.0] TRAP_TEXTURE - TP0:  FAULT
Mar 20 21:18:42 MacSam kernel: [41316.989057] nouveau E[
PGRAPH][0000:04:00.0] ch 3 [0x000fb2a000 Xorg[19317]] subc 2 class 0x502d
mthd 0x08dc data 0x000000ce
Mar 20 21:18:42 MacSam kernel: [41316.989066] nouveau E[
PFB][0000:04:00.0] trapped read at 0x00410e9b00 on channel 0x0000fb2a
[Xorg[19317]] PGRAPH/TEXTURE/00 reason: VRAM_LIMIT
Mar 20 21:18:42 MacSam kernel: [41316.989081] nouveau E[
PGRAPH][0000:04:00.0] magic set 0:
Mar 20 21:18:42 MacSam kernel: [41316.989085] nouveau E[
PGRAPH][0000:04:00.0]     0x00408604: 0x2008b605
Mar 20 21:18:42 MacSam kernel: [41316.989088] nouveau E[
PGRAPH][0000:04:00.0]     0x00408608: 0x00410fc2
Mar 20 21:18:42 MacSam kernel: [41316.989092] nouveau E[
PGRAPH][0000:04:00.0]     0x0040860c: 0x80000432
Mar 20 21:18:42 MacSam kernel: [41316.989095] nouveau E[
PGRAPH][0000:04:00.0]     0x00408610: 0x09000003
Mar 20 21:18:42 MacSam kernel: [41316.989098] nouveau E[
PGRAPH][0000:04:00.0] TRAP_TEXTURE - TP0:  FAULT
Mar 20 21:18:42 MacSam kernel: [41316.989109] nouveau E[
PGRAPH][0000:04:00.0] TRAP_PROP - TP 0 - DST2D_FAULT - Address 0020358000
Mar 20 21:18:42 MacSam kernel: [41316.989115] nouveau E[
PGRAPH][0000:04:00.0] TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c:
00000000, e20: 00000011, e24: 0c330000
Mar 20 21:18:42 MacSam kernel: [41316.989120] nouveau E[
PGRAPH][0000:04:00.0] ch 3 [0x000fb2a000 Xorg[19317]] subc 2 class 0x502d
mthd 0x024c data 0x00000168
Mar 20 21:18:42 MacSam kernel: [41316.989129] nouveau E[
PFB][0000:04:00.0] trapped write at 0x0020358800 on channel 0x0000fb2a
[Xorg[19317]] PGRAPH/PROP/DST2D reason: VRAM_LIMIT
Mar 20 21:18:42 MacSam kernel: [41316.989296] nouveau E[
PGRAPH][0000:04:00.0] magic set 0:
Mar 20 21:18:42 MacSam kernel: [41316.989302] nouveau E[
PGRAPH][0000:04:00.0]     0x00408604: 0x2009a105
Mar 20 21:18:42 MacSam kernel: [41316.989306] nouveau E[
PGRAPH][0000:04:00.0]     0x00408608: 0x002035d9
Mar 20 21:18:42 MacSam kernel: [41316.989309] nouveau E[
PGRAPH][0000:04:00.0]     0x0040860c: 0x80000432
Mar 20 21:18:42 MacSam kernel: [41316.989312] nouveau E[
PGRAPH][0000:04:00.0]     0x00408610: 0x35800003
Mar 20 21:18:42 MacSam kernel: [41316.989315] nouveau E[
PGRAPH][0000:04:00.0] TRAP_TEXTURE - TP0:  FAULT
Mar 20 21:18:42 MacSam kernel: [41316.989324] nouveau E[
PGRAPH][0000:04:00.0] ch 3 [0x000fb2a000 Xorg[19317]] subc 2 class 0x502d
mthd 0x08dc data 0x00000000
Mar 20 21:18:42 MacSam kernel: [41316.989334] nouveau E[
PFB][0000:04:00.0] trapped write at 0x0020358a00 on channel 0x0000fb2a
[Xorg[19317]] PGRAPH/PROP/DST2D reason: VRAM_LIMIT
Mar 20 21:23:01 MacSam kernel: [41576.440234] nouveau E[
PGRAPH][0000:04:00.0] DATA_ERROR BEGIN_END_ACTIVE
Mar 20 21:23:01 MacSam kernel: [41576.440260] nouveau E[
PGRAPH][0000:04:00.0] ch 3 [0x000fb2a000 Xorg[19317]] subc 7 class 0x8697
mthd 0x1360 data 0x00000000
Mar 20 21:23:18 MacSam kernel: [41591.448010] nouveau E[
PGRAPH][0000:04:00.0] PGRAPH TLB flush idle timeout fail


[*] dmesg | grep nouveau:
======================

[    2.654061] fb: switching to nouveaufb from simple
[    2.666836] nouveau 0000:04:00.0: enabling device (0006 -> 0007)
[    2.667790] nouveau  [  DEVICE][0000:04:00.0] BOOT0  : 0x0af000a2
[    2.667793] nouveau  [  DEVICE][0000:04:00.0] Chipset: MCP89 (NVAF)
[    2.667795] nouveau  [  DEVICE][0000:04:00.0] Family : NV50
[    2.667837] nouveau  [   VBIOS][0000:04:00.0] checking PRAMIN for
image...
[    2.730295] nouveau  [   VBIOS][0000:04:00.0] ... appears to be valid
[    2.730298] nouveau  [   VBIOS][0000:04:00.0] using image from PRAMIN
[    2.730399] nouveau  [   VBIOS][0000:04:00.0] BIT signature found
[    2.730402] nouveau  [   VBIOS][0000:04:00.0] version 70.89.02.00.00
[    2.756101] nouveau 0000:04:00.0: irq 45 for MSI/MSI-X
[    2.756117] nouveau  [     PMC][0000:04:00.0] MSI interrupts enabled
[    2.756141] nouveau  [     PFB][0000:04:00.0] RAM type: stolen system
memory
[    2.756143] nouveau  [     PFB][0000:04:00.0] RAM size: 256 MiB
[    2.756145] nouveau  [     PFB][0000:04:00.0]    ZCOMP: 0 tags
[    2.757742] nouveau  [    VOLT][0000:04:00.0] GPU voltage: 810000uv
[    4.120027] nouveau  [  PTHERM][0000:04:00.0] FAN control: none /
external
[    4.120036] nouveau  [  PTHERM][0000:04:00.0] fan management: automatic
[    4.120040] nouveau  [  PTHERM][0000:04:00.0] internal sensor: yes
[    4.120057] nouveau  [     CLK][0000:04:00.0] 03: core 405 MHz shader
405 MHz memory 405 MHz
[    4.120061] nouveau  [     CLK][0000:04:00.0] 07: core 450 MHz shader
810 MHz memory 450 MHz
[    4.120064] nouveau  [     CLK][0000:04:00.0] 0e: core 450 MHz shader
810 MHz memory 450 MHz
[    4.120068] nouveau  [     CLK][0000:04:00.0] 0f: core 450 MHz shader
950 MHz memory 450 MHz
[    4.120083] nouveau  [     CLK][0000:04:00.0] --: core 405 MHz shader
810 MHz
[    4.120130] nouveau W[    PCE0][0000:04:00.0] disabled, PCE0=1 to enable
[    4.120260] nouveau  [     DRM] VRAM: 256 MiB
[    4.120262] nouveau  [     DRM] GART: 1048576 MiB
[    4.120266] nouveau  [     DRM] TMDS table version 2.0
[    4.120268] nouveau  [     DRM] DCB version 4.0
[    4.120271] nouveau  [     DRM] DCB outp 00: 01800113 00010030
[    4.120273] nouveau  [     DRM] DCB outp 01: 020112a6 0f220010
[    4.120275] nouveau  [     DRM] DCB outp 02: 02011262 00020010
[    4.120277] nouveau  [     DRM] DCB conn 00: 00000040
[    4.120279] nouveau  [     DRM] DCB conn 01: 00101146
[    4.141082] nouveau  [     DRM] MM: using M2MF for buffer copies
[    4.252704] nouveau  [     DRM] allocated 1280x800 fb: 0x50000, bo
ffff8800a820e000
[    4.252820] fbcon: nouveaufb (fb0) is primary device
[    4.326530] nouveau 0000:04:00.0: fb0: nouveaufb frame buffer device
[    4.326533] nouveau 0000:04:00.0: registered panic notifier
[    4.340171] [drm] Initialized nouveau 1.1.2 20120801 for 0000:04:00.0 on
minor 0
[    7.847812] nouveau W[    PCE0][0000:04:00.0] disabled, PCE0=1 to enable
[   57.278684] nouveau W[    PCE0][0000:04:00.0] disabled, PCE0=1 to enable
[   80.746844] nouveau W[    PCE0][0000:04:00.0] disabled, PCE0=1 to enable


Linux MacSam 3.16.0-4-amd64 #1 SMP Debian 3.16.7-ckt7-1 (2015-03-01) x86_64
GNU/Linux
/etc/debian_version
8.0

# glxinfo
name of display: :0.0
display: :0  screen: 0
direct rendering: Yes
server glx vendor string: SGI
server glx version string: 1.4

X.Org X Server 1.16.4
Release Date: 2014-12-20
X Protocol Version 11, Revision 0
Build Operating System: Linux 3.16.0-4-amd64 x86_64 Debian
Current Operating System: Linux MacSam 3.16.0-4-amd64 #1 SMP Debian
3.16.7-ckt7-1 (2015-03-01) x86_64
Kernel command line: BOOT_IMAGE=/boot/vmlinuz-3.16.0-4-amd64
root=UUID=cdf52b77-b313-4cd2-b4b8-f16561761833 ro quiet
Build Date: 11 February 2015  12:32:02AM
xorg-server 2:1.16.4-1 (http://www.debian.org/support)
Current version of pixman: 0.32.6
    Before reporting problems, check http://wiki.x.org
    to make sure that you have the latest version.

--001a11c2eff27ba60f0511bf7ac0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><div>Hi Ladies and Gentleman=
s.<br><br></div>I&#39;d like to report a possible bug and ask for help in s=
olving it.<br><br></div>I have a Mid 2010 Macbook Pro running Debian Jessie=
.<br></div>The bug seems to happen at random, but mainly when using a 3D ap=
plication with other apps running, such as Chromium (Chrome) and Iceweasel =
(Firefox). It happens when watching videos with VLC and mplayer2.<br><br></=
div><div>I hope someone will manage to help.<br></div><div>Thanks.<br><br><=
br></div><div><br></div>[*] Here is some information on the GPU itself acco=
rding to kernel messages.<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br><br><font size=3D"1"><span st=
yle=3D"font-family:monospace,monospace">Mar 17 23:31:31 MacSam kernel: [=C2=
=A0=C2=A0=C2=A0 4.116055] nouveau=C2=A0 [=C2=A0 PTHERM][0000:04:00.0] FAN c=
ontrol: none / external<br>Mar 17 23:31:31 MacSam kernel: [=C2=A0=C2=A0=C2=
=A0 4.116064] nouveau=C2=A0 [=C2=A0 PTHERM][0000:04:00.0] fan management: a=
utomatic<br>Mar 17 23:31:31 MacSam kernel: [=C2=A0=C2=A0=C2=A0 4.116068] no=
uveau=C2=A0 [=C2=A0 PTHERM][0000:04:00.0] internal sensor: yes<br>Mar 17 23=
:31:31 MacSam kernel: [=C2=A0=C2=A0=C2=A0 4.116092] nouveau=C2=A0 [=C2=A0=
=C2=A0=C2=A0=C2=A0 CLK][0000:04:00.0] 03: core 405 MHz shader 405 MHz memor=
y 405 MHz<br>Mar 17 23:31:31 MacSam kernel: [=C2=A0=C2=A0=C2=A0 4.116098] n=
ouveau=C2=A0 [=C2=A0=C2=A0=C2=A0=C2=A0 CLK][0000:04:00.0] 07: core 450 MHz =
shader 810 MHz memory 450 MHz<br>Mar 17 23:31:31 MacSam kernel: [=C2=A0=C2=
=A0=C2=A0 4.116101] nouveau=C2=A0 [=C2=A0=C2=A0=C2=A0=C2=A0 CLK][0000:04:00=
.0] 0e: core 450 MHz shader 810 MHz memory 450 MHz<br>Mar 17 23:31:31 MacSa=
m kernel: [=C2=A0=C2=A0=C2=A0 4.116104] nouveau=C2=A0 [=C2=A0=C2=A0=C2=A0=
=C2=A0 CLK][0000:04:00.0] 0f: core 450 MHz shader 950 MHz memory 450 MHz<br=
>Mar 17 23:31:31 MacSam kernel: [=C2=A0=C2=A0=C2=A0 4.116119] nouveau=C2=A0=
 [=C2=A0=C2=A0=C2=A0=C2=A0 CLK][0000:04:00.0] --: core 405 MHz shader 810 M=
Hz <br>Mar 17 23:31:31 MacSam kernel: [=C2=A0=C2=A0=C2=A0 4.116168] nouveau=
 W[=C2=A0=C2=A0=C2=A0 PCE0][0000:04:00.0] disabled, PCE0=3D1 to enable<br>M=
ar 17 23:31:31 MacSam kernel: [=C2=A0=C2=A0=C2=A0 4.116301] [TTM] Zone=C2=
=A0 kernel: Available graphics memory: 1897648 kiB<br>Mar 17 23:31:31 MacSa=
m kernel: [=C2=A0=C2=A0=C2=A0 4.116303] [TTM] Initializing pool allocator<b=
r>Mar 17 23:31:31 MacSam kernel: [=C2=A0=C2=A0=C2=A0 4.116309] [TTM] Initia=
lizing DMA pool allocator<br>Mar 17 23:31:31 MacSam kernel: [=C2=A0=C2=A0=
=C2=A0 4.116321] nouveau=C2=A0 [=C2=A0=C2=A0=C2=A0=C2=A0 DRM] VRAM: 256 MiB=
<br>Mar 17 23:31:31 MacSam kernel: [=C2=A0=C2=A0=C2=A0 4.116323] nouveau=C2=
=A0 [=C2=A0=C2=A0=C2=A0=C2=A0 DRM] GART: 1048576 MiB<br>Mar 17 23:31:31 Mac=
Sam kernel: [=C2=A0=C2=A0=C2=A0 4.116327] nouveau=C2=A0 [=C2=A0=C2=A0=C2=A0=
=C2=A0 DRM] TMDS table version 2.0<br>Mar 17 23:31:31 MacSam kernel: [=C2=
=A0=C2=A0=C2=A0 4.116329] nouveau=C2=A0 [=C2=A0=C2=A0=C2=A0=C2=A0 DRM] DCB =
version 4.0<br>Mar 17 23:31:31 MacSam kernel: [=C2=A0=C2=A0=C2=A0 4.116332]=
 nouveau=C2=A0 [=C2=A0=C2=A0=C2=A0=C2=A0 DRM] DCB outp 00: 01800113 0001003=
0<br>Mar 17 23:31:31 MacSam kernel: [=C2=A0=C2=A0=C2=A0 4.116334] nouveau=
=C2=A0 [=C2=A0=C2=A0=C2=A0=C2=A0 DRM] DCB outp 01: 020112a6 0f220010<br>Mar=
 17 23:31:31 MacSam kernel: [=C2=A0=C2=A0=C2=A0 4.116336] nouveau=C2=A0 [=
=C2=A0=C2=A0=C2=A0=C2=A0 DRM] DCB outp 02: 02011262 00020010<br>Mar 17 23:3=
1:31 MacSam kernel: [=C2=A0=C2=A0=C2=A0 4.116337] nouveau=C2=A0 [=C2=A0=C2=
=A0=C2=A0=C2=A0 DRM] DCB conn 00: 00000040<br>Mar 17 23:31:31 MacSam kernel=
: [=C2=A0=C2=A0=C2=A0 4.116339] nouveau=C2=A0 [=C2=A0=C2=A0=C2=A0=C2=A0 DRM=
] DCB conn 01: 00101146<br>Mar 17 23:31:31 MacSam kernel: [=C2=A0=C2=A0=C2=
=A0 4.124954] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).<b=
r>Mar 17 23:31:31 MacSam kernel: [=C2=A0=C2=A0=C2=A0 4.124956] [drm] Driver=
 supports precise vblank timestamp query.<br>Mar 17 23:31:31 MacSam kernel:=
 [=C2=A0=C2=A0=C2=A0 4.136978] nouveau=C2=A0 [=C2=A0=C2=A0=C2=A0=C2=A0 DRM]=
 MM: using M2MF for buffer copies<br>Mar 17 23:31:31 MacSam kernel: [=C2=A0=
=C2=A0=C2=A0 4.151394] input: HDA NVidia Headphone as /devices/pci0000:00/0=
000:00:08.0/sound/card0/input10<br>Mar 17 23:31:31 MacSam kernel: [=C2=A0=
=C2=A0=C2=A0 4.151527] input: HDA NVidia HDMI/DP,pcm=3D3 as /devices/pci000=
0:00/0000:00:08.0/sound/card0/input11<br>Mar 17 23:31:31 MacSam kernel: [=
=C2=A0=C2=A0=C2=A0 4.151654] input: HDA NVidia HDMI/DP,pcm=3D7 as /devices/=
pci0000:00/0000:00:08.0/sound/card0/input12<br>Mar 17 23:31:31 MacSam kerne=
l: [=C2=A0=C2=A0=C2=A0 4.151780] input: HDA NVidia HDMI/DP,pcm=3D8 as /devi=
ces/pci0000:00/0000:00:08.0/sound/card0/input13<br>Mar 17 23:31:31 MacSam k=
ernel: [=C2=A0=C2=A0=C2=A0 4.252701] nouveau=C2=A0 [=C2=A0=C2=A0=C2=A0=C2=
=A0 DRM] allocated 1280x800 fb: 0x50000, bo ffff8800aa383800<br>Mar 17 23:3=
1:31 MacSam kernel: [=C2=A0=C2=A0=C2=A0 4.252825] fbcon: nouveaufb (fb0) is=
 primary device<br>Mar 17 23:31:31 MacSam kernel: [=C2=A0=C2=A0=C2=A0 4.326=
232] Console: switching to colour frame buffer device 160x50<br>Mar 17 23:3=
1:31 MacSam kernel: [=C2=A0=C2=A0=C2=A0 4.328317] nouveau 0000:04:00.0: fb0=
: nouveaufb frame buffer device<br>Mar 17 23:31:31 MacSam kernel: [=C2=A0=
=C2=A0=C2=A0 4.328319] nouveau 0000:04:00.0: registered panic notifier<br>M=
ar 17 23:31:31 MacSam kernel: [=C2=A0=C2=A0=C2=A0 4.336093] usb 4-5: new lo=
w-speed USB device number 3 using ohci-pci<br>Mar 17 23:31:31 MacSam kernel=
: [=C2=A0=C2=A0=C2=A0 4.340098] [drm] Initialized nouveau 1.1.2 20120801 fo=
r 0000:04:00.0 on minor 0</span></font><br><br></div>It&#39;s a nvidia 320M=
 by the way.<br><br></div>[*] And here is the bug itself.<br>=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br><br><span style=3D"font-fa=
mily:monospace,monospace"><font size=3D"1">Mar 20 21:18:42 MacSam kernel: [=
41316.923835] nouveau E[=C2=A0 PGRAPH][0000:04:00.0] DATA_ERROR INVALID_VAL=
UE<br>Mar 20 21:18:42 MacSam kernel: [41316.923848] nouveau E[=C2=A0 PGRAPH=
][0000:04:00.0] ch 3 [0x000fb2a000 Xorg[19317]] subc 2 class 0x502d mthd 0x=
060c data 0x00044110<br>Mar 20 21:18:42 MacSam kernel: [41316.945939] nouve=
au E[=C2=A0=C2=A0 PFIFO][0000:04:00.0] DMA_PUSHER - ch 3 [Xorg[19317]] get =
0x002002c61c put 0x002002ca80 ib_get 0x000001d5 ib_put 0x000001da state 0x8=
0000024 (err: INVALID_CMD) push 0x003060b0<br>Mar 20 21:18:42 MacSam kernel=
: [41316.956144] nouveau E[=C2=A0 PGRAPH][0000:04:00.0] magic set 0:<br>Mar=
 20 21:18:42 MacSam kernel: [41316.956152] nouveau E[=C2=A0 PGRAPH][0000:04=
:00.0] =C2=A0=C2=A0=C2=A0 0x00408604: 0x20090d0f<br>Mar 20 21:18:42 MacSam =
kernel: [41316.956155] nouveau E[=C2=A0 PGRAPH][0000:04:00.0] =C2=A0=C2=A0=
=C2=A0 0x00408608: 0x00206365<br>Mar 20 21:18:42 MacSam kernel: [41316.9561=
59] nouveau E[=C2=A0 PGRAPH][0000:04:00.0] =C2=A0=C2=A0=C2=A0 0x0040860c: 0=
x80000432<br>Mar 20 21:18:42 MacSam kernel: [41316.956162] nouveau E[=C2=A0=
 PGRAPH][0000:04:00.0] =C2=A0=C2=A0=C2=A0 0x00408610: 0x62100003<br>Mar 20 =
21:18:42 MacSam kernel: [41316.956165] nouveau E[=C2=A0 PGRAPH][0000:04:00.=
0] TRAP_TEXTURE - TP0:=C2=A0 FAULT<br>Mar 20 21:18:42 MacSam kernel: [41316=
.956176] nouveau E[=C2=A0 PGRAPH][0000:04:00.0] ch 3 [0x000fb2a000 Xorg[193=
17]] subc 2 class 0x502d mthd 0x08dc data 0x00000000<br>Mar 20 21:18:42 Mac=
Sam kernel: [41316.956186] nouveau E[=C2=A0=C2=A0=C2=A0=C2=A0 PFB][0000:04:=
00.0] trapped read at 0x0020634d00 on channel 0x0000fb2a [Xorg[19317]] PGRA=
PH/TEXTURE/00 reason: VRAM_LIMIT<br>Mar 20 21:18:42 MacSam kernel: [41316.9=
81543] nouveau E[=C2=A0=C2=A0 PFIFO][0000:04:00.0] DMA_PUSHER - ch 3 [Xorg[=
19317]] get 0x0020036fd8 put 0x0020036fe8 ib_get 0x000001fd ib_put 0x000002=
04 state 0x80000024 (err: INVALID_CMD) push 0x00400040<br>Mar 20 21:18:42 M=
acSam kernel: [41316.988933] nouveau E[=C2=A0 PGRAPH][0000:04:00.0] TRAP_PR=
OP - TP 0 - DST2D_FAULT - Address 00410e7a00<br>Mar 20 21:18:42 MacSam kern=
el: [41316.988945] nouveau E[=C2=A0 PGRAPH][0000:04:00.0] TRAP_PROP - TP 0 =
- e0c: 00000000, e18: 00000000, e1c: 012a00f6, e20: 00000011, e24: 0c330000=
<br>Mar 20 21:18:42 MacSam kernel: [41316.988954] nouveau E[=C2=A0 PGRAPH][=
0000:04:00.0] ch 3 [0x000fb2a000 Xorg[19317]] subc 2 class 0x502d mthd 0x08=
60 data 0x00000000<br>Mar 20 21:18:42 MacSam kernel: [41316.988965] nouveau=
 E[=C2=A0=C2=A0=C2=A0=C2=A0 PFB][0000:04:00.0] trapped write at 0x00410e7a0=
0 on channel 0x0000fb2a [Xorg[19317]] PGRAPH/PROP/DST2D reason: VRAM_LIMIT<=
br>Mar 20 21:18:42 MacSam kernel: [41316.988987] nouveau E[=C2=A0 PGRAPH][0=
000:04:00.0] TRAP_PROP - TP 0 - DST2D_FAULT - Address 00410eae00<br>Mar 20 =
21:18:42 MacSam kernel: [41316.988993] nouveau E[=C2=A0 PGRAPH][0000:04:00.=
0] TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c: 01780000, e20: 000=
00011, e24: 0c330000<br>Mar 20 21:18:42 MacSam kernel: [41316.988999] nouve=
au E[=C2=A0 PGRAPH][0000:04:00.0] ch 3 [0x000fb2a000 Xorg[19317]] subc 2 cl=
ass 0x502d mthd 0x024c data 0x0000018d<br>Mar 20 21:18:42 MacSam kernel: [4=
1316.989031] nouveau E[=C2=A0 PGRAPH][0000:04:00.0] magic set 0:<br>Mar 20 =
21:18:42 MacSam kernel: [41316.989036] nouveau E[=C2=A0 PGRAPH][0000:04:00.=
0] =C2=A0=C2=A0=C2=A0 0x00408604: 0x2009970c<br>Mar 20 21:18:42 MacSam kern=
el: [41316.989039] nouveau E[=C2=A0 PGRAPH][0000:04:00.0] =C2=A0=C2=A0=C2=
=A0 0x00408608: 0x00410e9b<br>Mar 20 21:18:42 MacSam kernel: [41316.989043]=
 nouveau E[=C2=A0 PGRAPH][0000:04:00.0] =C2=A0=C2=A0=C2=A0 0x0040860c: 0x80=
000432<br>Mar 20 21:18:42 MacSam kernel: [41316.989046] nouveau E[=C2=A0 PG=
RAPH][0000:04:00.0] =C2=A0=C2=A0=C2=A0 0x00408610: 0x09000003<br>Mar 20 21:=
18:42 MacSam kernel: [41316.989049] nouveau E[=C2=A0 PGRAPH][0000:04:00.0] =
TRAP_TEXTURE - TP0:=C2=A0 FAULT<br>Mar 20 21:18:42 MacSam kernel: [41316.98=
9057] nouveau E[=C2=A0 PGRAPH][0000:04:00.0] ch 3 [0x000fb2a000 Xorg[19317]=
] subc 2 class 0x502d mthd 0x08dc data 0x000000ce<br>Mar 20 21:18:42 MacSam=
 kernel: [41316.989066] nouveau E[=C2=A0=C2=A0=C2=A0=C2=A0 PFB][0000:04:00.=
0] trapped read at 0x00410e9b00 on channel 0x0000fb2a [Xorg[19317]] PGRAPH/=
TEXTURE/00 reason: VRAM_LIMIT<br>Mar 20 21:18:42 MacSam kernel: [41316.9890=
81] nouveau E[=C2=A0 PGRAPH][0000:04:00.0] magic set 0:<br>Mar 20 21:18:42 =
MacSam kernel: [41316.989085] nouveau E[=C2=A0 PGRAPH][0000:04:00.0] =C2=A0=
=C2=A0=C2=A0 0x00408604: 0x2008b605<br>Mar 20 21:18:42 MacSam kernel: [4131=
6.989088] nouveau E[=C2=A0 PGRAPH][0000:04:00.0] =C2=A0=C2=A0=C2=A0 0x00408=
608: 0x00410fc2<br>Mar 20 21:18:42 MacSam kernel: [41316.989092] nouveau E[=
=C2=A0 PGRAPH][0000:04:00.0] =C2=A0=C2=A0=C2=A0 0x0040860c: 0x80000432<br>M=
ar 20 21:18:42 MacSam kernel: [41316.989095] nouveau E[=C2=A0 PGRAPH][0000:=
04:00.0] =C2=A0=C2=A0=C2=A0 0x00408610: 0x09000003<br>Mar 20 21:18:42 MacSa=
m kernel: [41316.989098] nouveau E[=C2=A0 PGRAPH][0000:04:00.0] TRAP_TEXTUR=
E - TP0:=C2=A0 FAULT<br>Mar 20 21:18:42 MacSam kernel: [41316.989109] nouve=
au E[=C2=A0 PGRAPH][0000:04:00.0] TRAP_PROP - TP 0 - DST2D_FAULT - Address =
0020358000<br>Mar 20 21:18:42 MacSam kernel: [41316.989115] nouveau E[=C2=
=A0 PGRAPH][0000:04:00.0] TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, =
e1c: 00000000, e20: 00000011, e24: 0c330000<br>Mar 20 21:18:42 MacSam kerne=
l: [41316.989120] nouveau E[=C2=A0 PGRAPH][0000:04:00.0] ch 3 [0x000fb2a000=
 Xorg[19317]] subc 2 class 0x502d mthd 0x024c data 0x00000168<br>Mar 20 21:=
18:42 MacSam kernel: [41316.989129] nouveau E[=C2=A0=C2=A0=C2=A0=C2=A0 PFB]=
[0000:04:00.0] trapped write at 0x0020358800 on channel 0x0000fb2a [Xorg[19=
317]] PGRAPH/PROP/DST2D reason: VRAM_LIMIT<br>Mar 20 21:18:42 MacSam kernel=
: [41316.989296] nouveau E[=C2=A0 PGRAPH][0000:04:00.0] magic set 0:<br>Mar=
 20 21:18:42 MacSam kernel: [41316.989302] nouveau E[=C2=A0 PGRAPH][0000:04=
:00.0] =C2=A0=C2=A0=C2=A0 0x00408604: 0x2009a105<br>Mar 20 21:18:42 MacSam =
kernel: [41316.989306] nouveau E[=C2=A0 PGRAPH][0000:04:00.0] =C2=A0=C2=A0=
=C2=A0 0x00408608: 0x002035d9<br>Mar 20 21:18:42 MacSam kernel: [41316.9893=
09] nouveau E[=C2=A0 PGRAPH][0000:04:00.0] =C2=A0=C2=A0=C2=A0 0x0040860c: 0=
x80000432<br>Mar 20 21:18:42 MacSam kernel: [41316.989312] nouveau E[=C2=A0=
 PGRAPH][0000:04:00.0] =C2=A0=C2=A0=C2=A0 0x00408610: 0x35800003<br>Mar 20 =
21:18:42 MacSam kernel: [41316.989315] nouveau E[=C2=A0 PGRAPH][0000:04:00.=
0] TRAP_TEXTURE - TP0:=C2=A0 FAULT<br>Mar 20 21:18:42 MacSam kernel: [41316=
.989324] nouveau E[=C2=A0 PGRAPH][0000:04:00.0] ch 3 [0x000fb2a000 Xorg[193=
17]] subc 2 class 0x502d mthd 0x08dc data 0x00000000<br>Mar 20 21:18:42 Mac=
Sam kernel: [41316.989334] nouveau E[=C2=A0=C2=A0=C2=A0=C2=A0 PFB][0000:04:=
00.0] trapped write at 0x0020358a00 on channel 0x0000fb2a [Xorg[19317]] PGR=
APH/PROP/DST2D reason: VRAM_LIMIT<br>Mar 20 21:23:01 MacSam kernel: [41576.=
440234] nouveau E[=C2=A0 PGRAPH][0000:04:00.0] DATA_ERROR BEGIN_END_ACTIVE<=
br>Mar 20 21:23:01 MacSam kernel: [41576.440260] nouveau E[=C2=A0 PGRAPH][0=
000:04:00.0] ch 3 [0x000fb2a000 Xorg[19317]] subc 7 class 0x8697 mthd 0x136=
0 data 0x00000000<br>Mar 20 21:23:18 MacSam kernel: [41591.448010] nouveau =
E[=C2=A0 PGRAPH][0000:04:00.0] PGRAPH TLB flush idle timeout fail</font></s=
pan><br><br><br></div>[*] dmesg | grep nouveau:<font size=3D"1"><span style=
=3D"font-family:monospace,monospace"><br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br><br>[=C2=A0=C2=A0=C2=A0 2.654061] fb: =
switching to nouveaufb from simple<br>[=C2=A0=C2=A0=C2=A0 2.666836] nouveau=
 0000:04:00.0: enabling device (0006 -&gt; 0007)<br>[=C2=A0=C2=A0=C2=A0 2.6=
67790] nouveau=C2=A0 [=C2=A0 DEVICE][0000:04:00.0] BOOT0=C2=A0 : 0x0af000a2=
<br>[=C2=A0=C2=A0=C2=A0 2.667793] nouveau=C2=A0 [=C2=A0 DEVICE][0000:04:00.=
0] Chipset: MCP89 (NVAF)<br>[=C2=A0=C2=A0=C2=A0 2.667795] nouveau=C2=A0 [=
=C2=A0 DEVICE][0000:04:00.0] Family : NV50<br>[=C2=A0=C2=A0=C2=A0 2.667837]=
 nouveau=C2=A0 [=C2=A0=C2=A0 VBIOS][0000:04:00.0] checking PRAMIN for image=
...<br>[=C2=A0=C2=A0=C2=A0 2.730295] nouveau=C2=A0 [=C2=A0=C2=A0 VBIOS][000=
0:04:00.0] ... appears to be valid<br>[=C2=A0=C2=A0=C2=A0 2.730298] nouveau=
=C2=A0 [=C2=A0=C2=A0 VBIOS][0000:04:00.0] using image from PRAMIN<br>[=C2=
=A0=C2=A0=C2=A0 2.730399] nouveau=C2=A0 [=C2=A0=C2=A0 VBIOS][0000:04:00.0] =
BIT signature found<br>[=C2=A0=C2=A0=C2=A0 2.730402] nouveau=C2=A0 [=C2=A0=
=C2=A0 VBIOS][0000:04:00.0] version 70.89.02.00.00<br>[=C2=A0=C2=A0=C2=A0 2=
.756101] nouveau 0000:04:00.0: irq 45 for MSI/MSI-X<br>[=C2=A0=C2=A0=C2=A0 =
2.756117] nouveau=C2=A0 [=C2=A0=C2=A0=C2=A0=C2=A0 PMC][0000:04:00.0] MSI in=
terrupts enabled<br>[=C2=A0=C2=A0=C2=A0 2.756141] nouveau=C2=A0 [=C2=A0=C2=
=A0=C2=A0=C2=A0 PFB][0000:04:00.0] RAM type: stolen system memory<br>[=C2=
=A0=C2=A0=C2=A0 2.756143] nouveau=C2=A0 [=C2=A0=C2=A0=C2=A0=C2=A0 PFB][0000=
:04:00.0] RAM size: 256 MiB<br>[=C2=A0=C2=A0=C2=A0 2.756145] nouveau=C2=A0 =
[=C2=A0=C2=A0=C2=A0=C2=A0 PFB][0000:04:00.0]=C2=A0=C2=A0=C2=A0 ZCOMP: 0 tag=
s<br>[=C2=A0=C2=A0=C2=A0 2.757742] nouveau=C2=A0 [=C2=A0=C2=A0=C2=A0 VOLT][=
0000:04:00.0] GPU voltage: 810000uv<br>[=C2=A0=C2=A0=C2=A0 4.120027] nouvea=
u=C2=A0 [=C2=A0 PTHERM][0000:04:00.0] FAN control: none / external<br>[=C2=
=A0=C2=A0=C2=A0 4.120036] nouveau=C2=A0 [=C2=A0 PTHERM][0000:04:00.0] fan m=
anagement: automatic<br>[=C2=A0=C2=A0=C2=A0 4.120040] nouveau=C2=A0 [=C2=A0=
 PTHERM][0000:04:00.0] internal sensor: yes<br>[=C2=A0=C2=A0=C2=A0 4.120057=
] nouveau=C2=A0 [=C2=A0=C2=A0=C2=A0=C2=A0 CLK][0000:04:00.0] 03: core 405 M=
Hz shader 405 MHz memory 405 MHz<br>[=C2=A0=C2=A0=C2=A0 4.120061] nouveau=
=C2=A0 [=C2=A0=C2=A0=C2=A0=C2=A0 CLK][0000:04:00.0] 07: core 450 MHz shader=
 810 MHz memory 450 MHz<br>[=C2=A0=C2=A0=C2=A0 4.120064] nouveau=C2=A0 [=C2=
=A0=C2=A0=C2=A0=C2=A0 CLK][0000:04:00.0] 0e: core 450 MHz shader 810 MHz me=
mory 450 MHz<br>[=C2=A0=C2=A0=C2=A0 4.120068] nouveau=C2=A0 [=C2=A0=C2=A0=
=C2=A0=C2=A0 CLK][0000:04:00.0] 0f: core 450 MHz shader 950 MHz memory 450 =
MHz<br>[=C2=A0=C2=A0=C2=A0 4.120083] nouveau=C2=A0 [=C2=A0=C2=A0=C2=A0=C2=
=A0 CLK][0000:04:00.0] --: core 405 MHz shader 810 MHz <br>[=C2=A0=C2=A0=C2=
=A0 4.120130] nouveau W[=C2=A0=C2=A0=C2=A0 PCE0][0000:04:00.0] disabled, PC=
E0=3D1 to enable<br>[=C2=A0=C2=A0=C2=A0 4.120260] nouveau=C2=A0 [=C2=A0=C2=
=A0=C2=A0=C2=A0 DRM] VRAM: 256 MiB<br>[=C2=A0=C2=A0=C2=A0 4.120262] nouveau=
=C2=A0 [=C2=A0=C2=A0=C2=A0=C2=A0 DRM] GART: 1048576 MiB<br>[=C2=A0=C2=A0=C2=
=A0 4.120266] nouveau=C2=A0 [=C2=A0=C2=A0=C2=A0=C2=A0 DRM] TMDS table versi=
on 2.0<br>[=C2=A0=C2=A0=C2=A0 4.120268] nouveau=C2=A0 [=C2=A0=C2=A0=C2=A0=
=C2=A0 DRM] DCB version 4.0<br>[=C2=A0=C2=A0=C2=A0 4.120271] nouveau=C2=A0 =
[=C2=A0=C2=A0=C2=A0=C2=A0 DRM] DCB outp 00: 01800113 00010030<br>[=C2=A0=C2=
=A0=C2=A0 4.120273] nouveau=C2=A0 [=C2=A0=C2=A0=C2=A0=C2=A0 DRM] DCB outp 0=
1: 020112a6 0f220010<br>[=C2=A0=C2=A0=C2=A0 4.120275] nouveau=C2=A0 [=C2=A0=
=C2=A0=C2=A0=C2=A0 DRM] DCB outp 02: 02011262 00020010<br>[=C2=A0=C2=A0=C2=
=A0 4.120277] nouveau=C2=A0 [=C2=A0=C2=A0=C2=A0=C2=A0 DRM] DCB conn 00: 000=
00040<br>[=C2=A0=C2=A0=C2=A0 4.120279] nouveau=C2=A0 [=C2=A0=C2=A0=C2=A0=C2=
=A0 DRM] DCB conn 01: 00101146<br>[=C2=A0=C2=A0=C2=A0 4.141082] nouveau=C2=
=A0 [=C2=A0=C2=A0=C2=A0=C2=A0 DRM] MM: using M2MF for buffer copies<br>[=C2=
=A0=C2=A0=C2=A0 4.252704] nouveau=C2=A0 [=C2=A0=C2=A0=C2=A0=C2=A0 DRM] allo=
cated 1280x800 fb: 0x50000, bo ffff8800a820e000<br>[=C2=A0=C2=A0=C2=A0 4.25=
2820] fbcon: nouveaufb (fb0) is primary device<br>[=C2=A0=C2=A0=C2=A0 4.326=
530] nouveau 0000:04:00.0: fb0: nouveaufb frame buffer device<br>[=C2=A0=C2=
=A0=C2=A0 4.326533] nouveau 0000:04:00.0: registered panic notifier<br>[=C2=
=A0=C2=A0=C2=A0 4.340171] [drm] Initialized nouveau 1.1.2 20120801 for 0000=
:04:00.0 on minor 0<br>[=C2=A0=C2=A0=C2=A0 7.847812] nouveau W[=C2=A0=C2=A0=
=C2=A0 PCE0][0000:04:00.0] disabled, PCE0=3D1 to enable<br>[=C2=A0=C2=A0 57=
.278684] nouveau W[=C2=A0=C2=A0=C2=A0 PCE0][0000:04:00.0] disabled, PCE0=3D=
1 to enable<br>[=C2=A0=C2=A0 80.746844] nouveau W[=C2=A0=C2=A0=C2=A0 PCE0][=
0000:04:00.0] disabled, PCE0=3D1 to enable</span></font><br><br><br>Linux M=
acSam 3.16.0-4-amd64 #1 SMP Debian 3.16.7-ckt7-1 (2015-03-01) x86_64 GNU/Li=
nux<br>/etc/debian_version <br>8.0<br><br># glxinfo <br>name of display: :0=
.0<br>display: :0=C2=A0 screen: 0<br>direct rendering: Yes<br>server glx ve=
ndor string: SGI<br>server glx version string: 1.4<br><br>X.Org X Server 1.=
16.4<br>Release Date: 2014-12-20<br>X Protocol Version 11, Revision 0<br>Bu=
ild Operating System: Linux 3.16.0-4-amd64 x86_64 Debian<br>Current Operati=
ng System: Linux MacSam 3.16.0-4-amd64 #1 SMP Debian 3.16.7-ckt7-1 (2015-03=
-01) x86_64<br>Kernel command line: BOOT_IMAGE=3D/boot/vmlinuz-3.16.0-4-amd=
64 root=3DUUID=3Dcdf52b77-b313-4cd2-b4b8-f16561761833 ro quiet<br>Build Dat=
e: 11 February 2015=C2=A0 12:32:02AM<br>xorg-server 2:1.16.4-1 (<a href=3D"=
http://www.debian.org/support">http://www.debian.org/support</a>) <br>Curre=
nt version of pixman: 0.32.6<br>=C2=A0=C2=A0=C2=A0 Before reporting problem=
s, check <a href=3D"http://wiki.x.org">http://wiki.x.org</a><br>=C2=A0=C2=
=A0=C2=A0 to make sure that you have the latest version.<br><br><br></div>

--001a11c2eff27ba60f0511bf7ac0--

--===============0166658823==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0166658823==--
