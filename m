From: Marcelo Ribeiro <mbribeiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: nVidia ION on Acer Revo out of signal after boot.
Date: Sun, 12 Mar 2017 15:27:15 +0000
Message-ID: <CADRxDdevdh8sYZuXs5hKxiD6n5Tk56X8fPV2qugV92KzTUi+5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1126165480=="
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

--===============1126165480==
Content-Type: multipart/alternative; boundary=94eb2c07aadc6c39b7054a8a3bff

--94eb2c07aadc6c39b7054a8a3bff
Content-Type: text/plain; charset=UTF-8

Hi, I am changing from proprietary nvidia drivers to Nouveau drivers in my
mediacenter.

I run a Gentoo linux in this hardware and I am facing an out of signal
screen just after the boot (when the nouveau module is loaded). If I
blacklist this module and modprobe it in the prompt, the screen gets out of
signal in my 1080p TV in this moment.

I tried recompile the kernel enabling and disabling a lot of modules but
the result is always the same. By a ssh I can access my media center and
all the logs are normal, even Xorg (it thinks it is sending its image to
hdmi as it should).
I tryed system rescue cd and it uses nouveau driver and it works well. It
uses kernel  3.14.31-std451-amd64  and I am using 4.9.6-gentoo-r1 #5.

Here is some output from my non-working dmesg.

4.9.6-gentoo-r1 #5

[    8.450837] [drm] Initialized
[    8.733804] ACPI: PCI Interrupt Link [LAZA] enabled at IRQ 22
[    8.733830] snd_hda_intel 0000:00:08.0: Disabling MSI
[    9.224126] ACPI: PCI Interrupt Link [SGRU] enabled at IRQ 21
[    9.224489] nouveau 0000:03:00.0: NVIDIA MCP79/MCP7A (0ace80b1)
[    9.244211] nouveau 0000:03:00.0: bios: version 62.79.6c.00.01
[    9.266689] nouveau 0000:03:00.0: fb: 256 MiB stolen system memory
[    9.317562] [TTM] Zone  kernel: Available graphics memory: 1413098 kiB
[    9.317566] [TTM] Initializing pool allocator
[    9.317599] [TTM] Initializing DMA pool allocator
[    9.317677] nouveau 0000:03:00.0: DRM: VRAM: 256 MiB
[    9.317682] nouveau 0000:03:00.0: DRM: GART: 1048576 MiB
[    9.317692] nouveau 0000:03:00.0: DRM: TMDS table version 2.0
[    9.317697] nouveau 0000:03:00.0: DRM: DCB version 4.0
[    9.317704] nouveau 0000:03:00.0: DRM: DCB outp 00: 02021332 00020010
[    9.317709] nouveau 0000:03:00.0: DRM: DCB outp 01: 02000300 0000001e
[    9.317714] nouveau 0000:03:00.0: DRM: DCB conn 00: 00000000
[    9.317719] nouveau 0000:03:00.0: DRM: DCB conn 01: 00002161
[    9.368777] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    9.368784] [drm] Driver supports precise vblank timestamp query.
[    9.369124] snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC662
rev1: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:hp
[    9.369135] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=0
(0x0/0x0/0x0/0x0/0x0)
[    9.369142] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=0
(0x0/0x0/0x0/0x0/0x0)
[    9.369147] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
[    9.369152] snd_hda_codec_realtek hdaudioC0D0:    dig-out=0x1e/0x0
[    9.369156] snd_hda_codec_realtek hdaudioC0D0:    inputs:
[    9.369165] snd_hda_codec_realtek hdaudioC0D0:      Mic=0x18
[    9.434609] nouveau 0000:03:00.0: DRM: MM: using M2MF for buffer copies
[    9.529103] nouveau 0000:03:00.0: DRM: allocated 1920x1080 fb: 0x50000,
bo ffff8800baac3000
[    9.529521] fbcon: nouveaufb (fb0) is primary device
[   10.595960] input: HDA NVidia Mic as
/devices/pci0000:00/0000:00:08.0/sound/card0/input9
[   10.596707] input: HDA NVidia Headphone as
/devices/pci0000:00/0000:00:08.0/sound/card0/input10
[   16.284253] Console: switching to colour frame buffer device 240x67
[   16.287137] nouveau 0000:03:00.0: fb0: nouveaufb frame buffer device
[   16.295232] [drm] Initialized nouveau 1.3.1 20120801 for 0000:03:00.0 on
minor 0

log # lsmod
Module                  Size  Used by
auth_rpcgss            39557  0
oid_registry            2754  1 auth_rpcgss
nfsv4                 444263  2
nfs                   189555  2 nfsv4
lockd                  57722  1 nfs
grace                   2426  1 lockd
sunrpc                248435  10 auth_rpcgss,nfsv4,lockd,nfs
snd_hda_codec_hdmi     30572  1
snd_hda_codec_realtek    68090  1
snd_hda_codec_generic    48982  1 snd_hda_codec_realtek
nouveau              1302011  1
video                  30144  1 nouveau
snd_hda_intel          25892  0
i2c_algo_bit            5273  1 nouveau
drm_kms_helper        110022  1 nouveau
snd_hda_codec          97219  4
snd_hda_intel,snd_hda_codec_hdmi,snd_hda_codec_generic,snd_hda_codec_realtek
cfbfillrect             3374  1 drm_kms_helper
snd_hwdep               5801  1 snd_hda_codec
syscopyarea             3010  1 drm_kms_helper
cfbimgblt               2352  1 drm_kms_helper
snd_hda_core           54864  5
snd_hda_intel,snd_hda_codec,snd_hda_codec_hdmi,snd_hda_codec_generic,snd_hda_codec_realtek
sysfillrect             3246  1 drm_kms_helper
sysimgblt               2288  1 drm_kms_helper
fb_sys_fops             1602  1 drm_kms_helper
cfbcopyarea             3138  1 drm_kms_helper
snd_pcm                82027  4
snd_hda_intel,snd_hda_codec,snd_hda_core,snd_hda_codec_hdmi
ttm                    74797  1 nouveau
snd_timer              19853  1 snd_pcm
drm                   293837  4 nouveau,ttm,drm_kms_helper
snd                    61356  8
snd_hda_intel,snd_hwdep,snd_hda_codec,snd_timer,snd_hda_codec_hdmi,snd_hda_codec_generic,snd_hda_codec_realtek,snd_pcm
soundcore               6047  1 snd
i2c_nforce2             5414  0
-----------------------------------------------------------------
and here is the output of the working version in Rescue Cd.

Linux sysresccd 3.14.31-std451-amd64

[    6.736180] [drm] Initialized drm 1.1.0 20060810
[    6.794441] [drm] hdmi device  not found 3 0 1
[    6.794523] nouveau  [  DEVICE][0000:03:00.0] BOOT0  : 0x0ace80b1
[    6.794532] nouveau  [  DEVICE][0000:03:00.0] Chipset: MCP79/MCP7A (NVAC)
[    6.794538] nouveau  [  DEVICE][0000:03:00.0] Family : NV50
[    6.794655] nouveau  [   VBIOS][0000:03:00.0] checking PRAMIN for
image...
[    6.868390] nouveau  [   VBIOS][0000:03:00.0] ... appears to be valid
[    6.868400] nouveau  [   VBIOS][0000:03:00.0] using image from PRAMIN
[    6.869141] nouveau  [   VBIOS][0000:03:00.0] BIT signature found
[    6.869151] nouveau  [   VBIOS][0000:03:00.0] version 62.79.6c.00.01
[    6.890670] nouveau 0000:03:00.0: irq 41 for MSI/MSI-X
[    6.890713] nouveau  [     PMC][0000:03:00.0] MSI interrupts enabled
[    6.890790] nouveau  [     PFB][0000:03:00.0] RAM type: stolen system
memory
[    6.890797] nouveau  [     PFB][0000:03:00.0] RAM size: 256 MiB
[    6.890803] nouveau  [     PFB][0000:03:00.0]    ZCOMP: 0 tags
[    6.917639] nouveau  [  PTHERM][0000:03:00.0] FAN control: none /
external
[    6.917677] nouveau  [  PTHERM][0000:03:00.0] fan management: automatic
[    6.917686] nouveau  [  PTHERM][0000:03:00.0] internal sensor: yes
[    6.917714] nouveau  [     CLK][0000:03:00.0] 03: core 200 MHz shader
400 MHz vdec 200 MHz
[    6.917732] nouveau  [     CLK][0000:03:00.0] 05: core 300 MHz shader
600 MHz vdec 300 MHz
[    6.917744] nouveau  [     CLK][0000:03:00.0] 07: core 350 MHz shader
800 MHz vdec 350 MHz
[    6.917756] nouveau  [     CLK][0000:03:00.0] 0f: core 450 MHz shader
1100 MHz vdec 450 MHz
[    6.917786] nouveau  [     CLK][0000:03:00.0] --: core 450 MHz shader
1100 MHz vdec 450 MHz
[    6.918199] [TTM] Zone  kernel: Available graphics memory: 1411362 kiB
[    6.918205] [TTM] Initializing pool allocator
[    6.918231] [TTM] Initializing DMA pool allocator
[    6.918282] nouveau  [     DRM] VRAM: 256 MiB
[    6.918288] nouveau  [     DRM] GART: 1048576 MiB
[    6.918299] nouveau  [     DRM] TMDS table version 2.0
[    6.918305] nouveau  [     DRM] DCB version 4.0
[    6.918313] nouveau  [     DRM] DCB outp 00: 02021332 00020010
[    6.918320] nouveau  [     DRM] DCB outp 01: 02000300 0000001e
[    6.918326] nouveau  [     DRM] DCB conn 00: 00000000
[    6.918333] nouveau  [     DRM] DCB conn 01: 00002161
[    6.936583] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    6.936592] [drm] Driver supports precise vblank timestamp query.
[    6.960336] nouveau  [     DRM] MM: using M2MF for buffer copies
[    7.031184] nouveau  [     DRM] allocated 1920x1080 fb: 0x50000, bo
ffff8800023de400
[    7.031578] fbcon: nouveaufb (fb0) is primary device
[    7.094997] Console: switching to colour frame buffer device 240x67
[    7.097873] nouveau 0000:03:00.0: fb0: nouveaufb frame buffer device
[    7.097880] nouveau 0000:03:00.0: registered panic notifier
[    7.097896] [drm] Initialized nouveau 1.1.2 20120801 for 0000:03:00.0 on
minor 0

lsmod
root@sysresccd /var/log % lsmod
Module                  Size  Used by
arc4                   12390  2
rt2800pci              12437  0
rt2800mmio             14394  1 rt2800pci
rt2800lib              73558  2 rt2800pci,rt2800mmio
rt2x00pci              12719  1 rt2800pci
rt2x00mmio             12863  2 rt2800pci,rt2800mmio
rt2x00lib              48382  5
rt2x00pci,rt2800lib,rt2800pci,rt2800mmio,rt2x00mmio
eeprom_93cx6           12739  1 rt2800pci
mac80211              421465  3 rt2x00lib,rt2x00pci,rt2800lib
cfg80211              320349  2 mac80211,rt2x00lib
crc_ccitt              12519  1 rt2800lib
coretemp               12390  0
rfkill                 18094  2 cfg80211
microcode              41719  0
joydev                 16535  0
serio_raw              12439  0
i2c_nforce2            12523  0
shpchp                 29571  0
raid10                 37123  0
raid456                57671  0
async_raid6_recov      12621  1 raid456
async_pq               12640  2 raid456,async_raid6_recov
async_xor              12573  3 async_pq,raid456,async_raid6_recov
async_memcpy           12464  2 raid456,async_raid6_recov
async_tx               12840  5
async_pq,raid456,async_xor,async_memcpy,async_raid6_recov
raid1                  28900  0
raid0                  16515  0
multipath              12390  0
linear                 12390  0
nouveau               793903  2
ttm                    66567  1 nouveau
drm_kms_helper         37632  1 nouveau
drm                   216971  4 ttm,drm_kms_helper,nouveau
i2c_algo_bit           12633  1 nouveau
i2c_core               28421  5
drm,drm_kms_helper,i2c_algo_bit,nouveau,i2c_nforce2
mxm_wmi                12672  1 nouveau
video                  16832  1 nouveau
usb_storage            52365  1
forcedeth              49417  0
wmi                    13114  2 mxm_wmi,nouveau
---------------------------------------------------------------------

Sorry for the huge e-mail. I would appreciate any help.

Thanks in advance.

Marcelo.

--94eb2c07aadc6c39b7054a8a3bff
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, I am changing from proprietary nvidia drivers to Nouve=
au drivers in my mediacenter.<div><br></div><div>I run a Gentoo linux in th=
is hardware and I am facing an out of signal screen just after the boot (wh=
en the nouveau module is loaded). If I blacklist this module and modprobe i=
t in the prompt, the screen gets out of signal in my 1080p TV in this momen=
t.</div><div><br></div><div>I tried recompile the kernel enabling and disab=
ling a lot of modules but the result is always the same. By a ssh I can acc=
ess my media center and all the logs are normal, even Xorg (it thinks it is=
 sending its image to hdmi as it should).</div><div>I tryed system rescue c=
d and it uses nouveau driver and it works well. It uses kernel=C2=A0=C2=A03=
.14.31-std451-amd64 =C2=A0and I am using=C2=A04.9.6-gentoo-r1 #5.</div><div=
><br></div><div>Here is some output from my non-working dmesg.</div><div><b=
r></div><div><div>4.9.6-gentoo-r1 #5</div><div><br></div><div>[ =C2=A0 =C2=
=A08.450837] [drm] Initialized</div><div>[ =C2=A0 =C2=A08.733804] ACPI: PCI=
 Interrupt Link [LAZA] enabled at IRQ 22</div><div>[ =C2=A0 =C2=A08.733830]=
 snd_hda_intel 0000:00:08.0: Disabling MSI</div><div>[ =C2=A0 =C2=A09.22412=
6] ACPI: PCI Interrupt Link [SGRU] enabled at IRQ 21</div><div>[ =C2=A0 =C2=
=A09.224489] nouveau 0000:03:00.0: NVIDIA MCP79/MCP7A (0ace80b1)</div><div>=
[ =C2=A0 =C2=A09.244211] nouveau 0000:03:00.0: bios: version 62.79.6c.00.01=
</div><div>[ =C2=A0 =C2=A09.266689] nouveau 0000:03:00.0: fb: 256 MiB stole=
n system memory</div><div>[ =C2=A0 =C2=A09.317562] [TTM] Zone =C2=A0kernel:=
 Available graphics memory: 1413098 kiB</div><div>[ =C2=A0 =C2=A09.317566] =
[TTM] Initializing pool allocator</div><div>[ =C2=A0 =C2=A09.317599] [TTM] =
Initializing DMA pool allocator</div><div>[ =C2=A0 =C2=A09.317677] nouveau =
0000:03:00.0: DRM: VRAM: 256 MiB</div><div>[ =C2=A0 =C2=A09.317682] nouveau=
 0000:03:00.0: DRM: GART: 1048576 MiB</div><div>[ =C2=A0 =C2=A09.317692] no=
uveau 0000:03:00.0: DRM: TMDS table version 2.0</div><div>[ =C2=A0 =C2=A09.=
317697] nouveau 0000:03:00.0: DRM: DCB version 4.0</div><div>[ =C2=A0 =C2=
=A09.317704] nouveau 0000:03:00.0: DRM: DCB outp 00: 02021332 00020010</div=
><div>[ =C2=A0 =C2=A09.317709] nouveau 0000:03:00.0: DRM: DCB outp 01: 0200=
0300 0000001e</div><div>[ =C2=A0 =C2=A09.317714] nouveau 0000:03:00.0: DRM:=
 DCB conn 00: 00000000</div><div>[ =C2=A0 =C2=A09.317719] nouveau 0000:03:0=
0.0: DRM: DCB conn 01: 00002161</div><div>[ =C2=A0 =C2=A09.368777] [drm] Su=
pports vblank timestamp caching Rev 2 (21.10.2013).</div><div>[ =C2=A0 =C2=
=A09.368784] [drm] Driver supports precise vblank timestamp query.</div><di=
v>[ =C2=A0 =C2=A09.369124] snd_hda_codec_realtek hdaudioC0D0: autoconfig fo=
r ALC662 rev1: line_outs=3D1 (0x14/0x0/0x0/0x0/0x0) type:hp</div><div>[ =C2=
=A0 =C2=A09.369135] snd_hda_codec_realtek hdaudioC0D0: =C2=A0 =C2=A0speaker=
_outs=3D0 (0x0/0x0/0x0/0x0/0x0)</div><div>[ =C2=A0 =C2=A09.369142] snd_hda_=
codec_realtek hdaudioC0D0: =C2=A0 =C2=A0hp_outs=3D0 (0x0/0x0/0x0/0x0/0x0)</=
div><div>[ =C2=A0 =C2=A09.369147] snd_hda_codec_realtek hdaudioC0D0: =C2=A0=
 =C2=A0mono: mono_out=3D0x0</div><div>[ =C2=A0 =C2=A09.369152] snd_hda_code=
c_realtek hdaudioC0D0: =C2=A0 =C2=A0dig-out=3D0x1e/0x0</div><div>[ =C2=A0 =
=C2=A09.369156] snd_hda_codec_realtek hdaudioC0D0: =C2=A0 =C2=A0inputs:</di=
v><div>[ =C2=A0 =C2=A09.369165] snd_hda_codec_realtek hdaudioC0D0: =C2=A0 =
=C2=A0 =C2=A0Mic=3D0x18</div><div>[ =C2=A0 =C2=A09.434609] nouveau 0000:03:=
00.0: DRM: MM: using M2MF for buffer copies</div><div>[ =C2=A0 =C2=A09.5291=
03] nouveau 0000:03:00.0: DRM: allocated 1920x1080 fb: 0x50000, bo ffff8800=
baac3000</div><div>[ =C2=A0 =C2=A09.529521] fbcon: nouveaufb (fb0) is prima=
ry device</div><div>[ =C2=A0 10.595960] input: HDA NVidia Mic as /devices/p=
ci0000:00/0000:00:08.0/sound/card0/input9</div><div>[ =C2=A0 10.596707] inp=
ut: HDA NVidia Headphone as /devices/pci0000:00/0000:00:08.0/sound/card0/in=
put10</div><div>[ =C2=A0 16.284253] Console: switching to colour frame buff=
er device 240x67</div><div>[ =C2=A0 16.287137] nouveau 0000:03:00.0: fb0: n=
ouveaufb frame buffer device</div><div>[ =C2=A0 16.295232] [drm] Initialize=
d nouveau 1.3.1 20120801 for 0000:03:00.0 on minor 0</div><div><br></div><d=
iv>log # lsmod</div><div>Module =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0Size =C2=A0Used by</div><div>auth_rpcgss =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A039557 =C2=A00</div><div>oid_registry =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02754 =C2=A01 auth_rpcgss</div><div>nfsv4 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 444263 =C2=A02</div><d=
iv>nfs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 18955=
5 =C2=A02 nfsv4</div><div>lockd =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A057722 =C2=A01 nfs</div><div>grace =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2426 =C2=A01 lockd</div><div>sunr=
pc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0248435 =C2=A010 a=
uth_rpcgss,nfsv4,lockd,nfs</div><div>snd_hda_codec_hdmi =C2=A0 =C2=A0 30572=
 =C2=A01</div><div>snd_hda_codec_realtek =C2=A0 =C2=A068090 =C2=A01</div><d=
iv>snd_hda_codec_generic =C2=A0 =C2=A048982 =C2=A01 snd_hda_codec_realtek</=
div><div>nouveau =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01302011 =
=C2=A01</div><div>video =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A030144 =C2=A01 nouveau</div><div>snd_hda_intel =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A025892 =C2=A00</div><div>i2c_algo_bit =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A05273 =C2=A01 nouveau</div><div>drm_kms_helper =C2=
=A0 =C2=A0 =C2=A0 =C2=A0110022 =C2=A01 nouveau</div><div>snd_hda_codec =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A097219 =C2=A04 snd_hda_intel,snd_hda_codec_hd=
mi,snd_hda_codec_generic,snd_hda_codec_realtek</div><div>cfbfillrect =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3374 =C2=A01 drm_kms_helper</div><div>s=
nd_hwdep =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5801 =C2=A01 snd_=
hda_codec</div><div>syscopyarea =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3=
010 =C2=A01 drm_kms_helper</div><div>cfbimgblt =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 2352 =C2=A01 drm_kms_helper</div><div>snd_hda_core =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 54864 =C2=A05 snd_hda_intel,snd_hda_codec,s=
nd_hda_codec_hdmi,snd_hda_codec_generic,snd_hda_codec_realtek</div><div>sys=
fillrect =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3246 =C2=A01 drm_kms_hel=
per</div><div>sysimgblt =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 22=
88 =C2=A01 drm_kms_helper</div><div>fb_sys_fops =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 1602 =C2=A01 drm_kms_helper</div><div>cfbcopyarea =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3138 =C2=A01 drm_kms_helper</div><div>snd_p=
cm =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A082027 =C2=A04 snd=
_hda_intel,snd_hda_codec,snd_hda_core,snd_hda_codec_hdmi</div><div>ttm =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A074797 =C2=
=A01 nouveau</div><div>snd_timer =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A019853 =C2=A01 snd_pcm</div><div>drm =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 293837 =C2=A04 nouveau,ttm,drm_kms_helper</=
div><div>snd =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A061356 =C2=A08 snd_hda_intel,snd_hwdep,snd_hda_codec,snd_timer,snd_hd=
a_codec_hdmi,snd_hda_codec_generic,snd_hda_codec_realtek,snd_pcm</div><div>=
soundcore =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 6047 =C2=A01 snd=
</div><div>i2c_nforce2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5414 =C2=
=A00</div></div><div>------------------------------------------------------=
-----------</div><div>and here is the output of the working version in Resc=
ue Cd.</div><div><br></div><div>Linux sysresccd 3.14.31-std451-amd64=C2=A0<=
/div><div><br></div><div>[ =C2=A0 =C2=A06.736180] [drm] Initialized drm 1.1=
.0 20060810</div><div>[ =C2=A0 =C2=A06.794441] [drm] hdmi device =C2=A0not =
found 3 0 1</div><div>[ =C2=A0 =C2=A06.794523] nouveau =C2=A0[ =C2=A0DEVICE=
][0000:03:00.0] BOOT0 =C2=A0: 0x0ace80b1</div><div>[ =C2=A0 =C2=A06.794532]=
 nouveau =C2=A0[ =C2=A0DEVICE][0000:03:00.0] Chipset: MCP79/MCP7A (NVAC)</d=
iv><div>[ =C2=A0 =C2=A06.794538] nouveau =C2=A0[ =C2=A0DEVICE][0000:03:00.0=
] Family : NV50</div><div>[ =C2=A0 =C2=A06.794655] nouveau =C2=A0[ =C2=A0 V=
BIOS][0000:03:00.0] checking PRAMIN for image...</div><div>[ =C2=A0 =C2=A06=
.868390] nouveau =C2=A0[ =C2=A0 VBIOS][0000:03:00.0] ... appears to be vali=
d</div><div>[ =C2=A0 =C2=A06.868400] nouveau =C2=A0[ =C2=A0 VBIOS][0000:03:=
00.0] using image from PRAMIN</div><div>[ =C2=A0 =C2=A06.869141] nouveau =
=C2=A0[ =C2=A0 VBIOS][0000:03:00.0] BIT signature found</div><div>[ =C2=A0 =
=C2=A06.869151] nouveau =C2=A0[ =C2=A0 VBIOS][0000:03:00.0] version 62.79.6=
c.00.01</div><div>[ =C2=A0 =C2=A06.890670] nouveau 0000:03:00.0: irq 41 for=
 MSI/MSI-X</div><div>[ =C2=A0 =C2=A06.890713] nouveau =C2=A0[ =C2=A0 =C2=A0=
 PMC][0000:03:00.0] MSI interrupts enabled</div><div>[ =C2=A0 =C2=A06.89079=
0] nouveau =C2=A0[ =C2=A0 =C2=A0 PFB][0000:03:00.0] RAM type: stolen system=
 memory</div><div>[ =C2=A0 =C2=A06.890797] nouveau =C2=A0[ =C2=A0 =C2=A0 PF=
B][0000:03:00.0] RAM size: 256 MiB</div><div>[ =C2=A0 =C2=A06.890803] nouve=
au =C2=A0[ =C2=A0 =C2=A0 PFB][0000:03:00.0] =C2=A0 =C2=A0ZCOMP: 0 tags</div=
><div>[ =C2=A0 =C2=A06.917639] nouveau =C2=A0[ =C2=A0PTHERM][0000:03:00.0] =
FAN control: none / external</div><div>[ =C2=A0 =C2=A06.917677] nouveau =C2=
=A0[ =C2=A0PTHERM][0000:03:00.0] fan management: automatic</div><div>[ =C2=
=A0 =C2=A06.917686] nouveau =C2=A0[ =C2=A0PTHERM][0000:03:00.0] internal se=
nsor: yes</div><div>[ =C2=A0 =C2=A06.917714] nouveau =C2=A0[ =C2=A0 =C2=A0 =
CLK][0000:03:00.0] 03: core 200 MHz shader 400 MHz vdec 200 MHz</div><div>[=
 =C2=A0 =C2=A06.917732] nouveau =C2=A0[ =C2=A0 =C2=A0 CLK][0000:03:00.0] 05=
: core 300 MHz shader 600 MHz vdec 300 MHz</div><div>[ =C2=A0 =C2=A06.91774=
4] nouveau =C2=A0[ =C2=A0 =C2=A0 CLK][0000:03:00.0] 07: core 350 MHz shader=
 800 MHz vdec 350 MHz</div><div>[ =C2=A0 =C2=A06.917756] nouveau =C2=A0[ =
=C2=A0 =C2=A0 CLK][0000:03:00.0] 0f: core 450 MHz shader 1100 MHz vdec 450 =
MHz</div><div>[ =C2=A0 =C2=A06.917786] nouveau =C2=A0[ =C2=A0 =C2=A0 CLK][0=
000:03:00.0] --: core 450 MHz shader 1100 MHz vdec 450 MHz</div><div>[ =C2=
=A0 =C2=A06.918199] [TTM] Zone =C2=A0kernel: Available graphics memory: 141=
1362 kiB</div><div>[ =C2=A0 =C2=A06.918205] [TTM] Initializing pool allocat=
or</div><div>[ =C2=A0 =C2=A06.918231] [TTM] Initializing DMA pool allocator=
</div><div>[ =C2=A0 =C2=A06.918282] nouveau =C2=A0[ =C2=A0 =C2=A0 DRM] VRAM=
: 256 MiB</div><div>[ =C2=A0 =C2=A06.918288] nouveau =C2=A0[ =C2=A0 =C2=A0 =
DRM] GART: 1048576 MiB</div><div>[ =C2=A0 =C2=A06.918299] nouveau =C2=A0[ =
=C2=A0 =C2=A0 DRM] TMDS table version 2.0</div><div>[ =C2=A0 =C2=A06.918305=
] nouveau =C2=A0[ =C2=A0 =C2=A0 DRM] DCB version 4.0</div><div>[ =C2=A0 =C2=
=A06.918313] nouveau =C2=A0[ =C2=A0 =C2=A0 DRM] DCB outp 00: 02021332 00020=
010</div><div>[ =C2=A0 =C2=A06.918320] nouveau =C2=A0[ =C2=A0 =C2=A0 DRM] D=
CB outp 01: 02000300 0000001e</div><div>[ =C2=A0 =C2=A06.918326] nouveau =
=C2=A0[ =C2=A0 =C2=A0 DRM] DCB conn 00: 00000000</div><div>[ =C2=A0 =C2=A06=
.918333] nouveau =C2=A0[ =C2=A0 =C2=A0 DRM] DCB conn 01: 00002161</div><div=
>[ =C2=A0 =C2=A06.936583] [drm] Supports vblank timestamp caching Rev 2 (21=
.10.2013).</div><div>[ =C2=A0 =C2=A06.936592] [drm] Driver supports precise=
 vblank timestamp query.</div><div>[ =C2=A0 =C2=A06.960336] nouveau =C2=A0[=
 =C2=A0 =C2=A0 DRM] MM: using M2MF for buffer copies</div><div>[ =C2=A0 =C2=
=A07.031184] nouveau =C2=A0[ =C2=A0 =C2=A0 DRM] allocated 1920x1080 fb: 0x5=
0000, bo ffff8800023de400</div><div>[ =C2=A0 =C2=A07.031578] fbcon: nouveau=
fb (fb0) is primary device</div><div>[ =C2=A0 =C2=A07.094997] Console: swit=
ching to colour frame buffer device 240x67</div><div>[ =C2=A0 =C2=A07.09787=
3] nouveau 0000:03:00.0: fb0: nouveaufb frame buffer device</div><div>[ =C2=
=A0 =C2=A07.097880] nouveau 0000:03:00.0: registered panic notifier</div><d=
iv>[ =C2=A0 =C2=A07.097896] [drm] Initialized nouveau 1.1.2 20120801 for 00=
00:03:00.0 on minor 0</div><div><br></div><div>lsmod</div><div>root@sysresc=
cd /var/log % lsmod=C2=A0</div><div>Module =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Size =C2=A0Used by</div><div>arc4 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 12390 =C2=A02=C2=A0</d=
iv><div>rt2800pci =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012437 =C2=
=A00=C2=A0</div><div>rt2800mmio =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1=
4394 =C2=A01 rt2800pci</div><div>rt2800lib =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A073558 =C2=A02 rt2800pci,rt2800mmio</div><div>rt2x00pci =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012719 =C2=A01 rt2800pci</div><=
div>rt2x00mmio =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 12863 =C2=A02 rt28=
00pci,rt2800mmio</div><div>rt2x00lib =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A048382 =C2=A05 rt2x00pci,rt2800lib,rt2800pci,rt2800mmio,rt2x00mmio=
</div><div>eeprom_93cx6 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 12739 =C2=A01 rt=
2800pci</div><div>mac80211 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
421465 =C2=A03 rt2x00lib,rt2x00pci,rt2800lib</div><div>cfg80211 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0320349 =C2=A02 mac80211,rt2x00lib</di=
v><div>crc_ccitt =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012519 =C2=
=A01 rt2800lib</div><div>coretemp =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 12390 =C2=A00=C2=A0</div><div>rfkill =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 18094 =C2=A02 cfg80211</div><div>microcode =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A041719 =C2=A00=C2=A0</div><div>=
joydev =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16535 =C2=A0=
0=C2=A0</div><div>serio_raw =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A012439 =C2=A00=C2=A0</div><div>i2c_nforce2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A012523 =C2=A00=C2=A0</div><div>shpchp =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 29571 =C2=A00=C2=A0</div><div>raid10 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 37123 =C2=A00=C2=A0</div>=
<div>raid456 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A057671 =
=C2=A00=C2=A0</div><div>async_raid6_recov =C2=A0 =C2=A0 =C2=A012621 =C2=A01=
 raid456</div><div>async_pq =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 12640 =C2=A02 raid456,async_raid6_recov</div><div>async_xor =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012573 =C2=A03 async_pq,raid456,async_=
raid6_recov</div><div>async_memcpy =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 12464=
 =C2=A02 raid456,async_raid6_recov</div><div>async_tx =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 12840 =C2=A05 async_pq,raid456,async_xor,async_=
memcpy,async_raid6_recov</div><div>raid1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A028900 =C2=A00=C2=A0</div><div>raid0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016515 =C2=A00=C2=A0</di=
v><div>multipath =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012390 =C2=
=A00=C2=A0</div><div>linear =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 12390 =C2=A00=C2=A0</div><div>nouveau =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 793903 =C2=A02=C2=A0</div><div>ttm =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A066567 =C2=A01 nouvea=
u</div><div>drm_kms_helper =C2=A0 =C2=A0 =C2=A0 =C2=A0 37632 =C2=A01 nouvea=
u</div><div>drm =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 216971 =C2=A04 ttm,drm_kms_helper,nouveau</div><div>i2c_algo_bit =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 12633 =C2=A01 nouveau</div><div>i2c_core =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 28421 =C2=A05 drm,drm_kms_hel=
per,i2c_algo_bit,nouveau,i2c_nforce2</div><div>mxm_wmi =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012672 =C2=A01 nouveau</div><div>video =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016832 =C2=A01=
 nouveau</div><div>usb_storage =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0523=
65 =C2=A01=C2=A0</div><div>forcedeth =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A049417 =C2=A00=C2=A0</div><div>wmi =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A013114 =C2=A02 mxm_wmi,nouveau=C2=A0</=
div><div>------------------------------------------------------------------=
---</div><div><br></div><div>Sorry for the huge e-mail. I would appreciate =
any help.</div><div><br></div><div>Thanks in advance.</div><div><br></div><=
div>Marcelo.</div><div><br></div><div><br></div><div><br></div></div>

--94eb2c07aadc6c39b7054a8a3bff--

--===============1126165480==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1126165480==--
