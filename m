From: Marcelo Ribeiro <mbribeiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nVidia ION on Acer Revo out of signal after boot.
Date: Mon, 13 Mar 2017 00:19:38 +0000
Message-ID: <CADRxDdex6n5Jjz1gMCEs--LayKkoScscQgVaSgDBnSbBgcSiLA@mail.gmail.com>
References: <CADRxDdevdh8sYZuXs5hKxiD6n5Tk56X8fPV2qugV92KzTUi+5A@mail.gmail.com>
 <CAKb7Uvg5i2z1p3cyvqs9CvxeCohBuJ1f85ScfWqgdnRxf0pS8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1251866116=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7Uvg5i2z1p3cyvqs9CvxeCohBuJ1f85ScfWqgdnRxf0pS8g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1251866116==
Content-Type: multipart/alternative; boundary=94eb2c07aadc5b16cb054a91ab6f

--94eb2c07aadc5b16cb054a91ab6f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thank you, that worked like a charm!

Em dom, 12 de mar de 2017 =C3=A0s 12:37, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
escreveu:

> I think you want kernel 4.10, or cherry-pick upstream commit
> 7dfee6827780d4228148263545af936d0cae8930.
>
> On Sun, Mar 12, 2017 at 11:27 AM, Marcelo Ribeiro <mbribeiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> wrote:
> > Hi, I am changing from proprietary nvidia drivers to Nouveau drivers in
> my
> > mediacenter.
> >
> > I run a Gentoo linux in this hardware and I am facing an out of signal
> > screen just after the boot (when the nouveau module is loaded). If I
> > blacklist this module and modprobe it in the prompt, the screen gets ou=
t
> of
> > signal in my 1080p TV in this moment.
> >
> > I tried recompile the kernel enabling and disabling a lot of modules bu=
t
> the
> > result is always the same. By a ssh I can access my media center and al=
l
> the
> > logs are normal, even Xorg (it thinks it is sending its image to hdmi a=
s
> it
> > should).
> > I tryed system rescue cd and it uses nouveau driver and it works well. =
It
> > uses kernel  3.14.31-std451-amd64  and I am using 4.9.6-gentoo-r1 #5.
> >
> > Here is some output from my non-working dmesg.
> >
> > 4.9.6-gentoo-r1 #5
> >
> > [    8.450837] [drm] Initialized
> > [    8.733804] ACPI: PCI Interrupt Link [LAZA] enabled at IRQ 22
> > [    8.733830] snd_hda_intel 0000:00:08.0: Disabling MSI
> > [    9.224126] ACPI: PCI Interrupt Link [SGRU] enabled at IRQ 21
> > [    9.224489] nouveau 0000:03:00.0: NVIDIA MCP79/MCP7A (0ace80b1)
> > [    9.244211] nouveau 0000:03:00.0: bios: version 62.79.6c.00.01
> > [    9.266689] nouveau 0000:03:00.0: fb: 256 MiB stolen system memory
> > [    9.317562] [TTM] Zone  kernel: Available graphics memory: 1413098 k=
iB
> > [    9.317566] [TTM] Initializing pool allocator
> > [    9.317599] [TTM] Initializing DMA pool allocator
> > [    9.317677] nouveau 0000:03:00.0: DRM: VRAM: 256 MiB
> > [    9.317682] nouveau 0000:03:00.0: DRM: GART: 1048576 MiB
> > [    9.317692] nouveau 0000:03:00.0: DRM: TMDS table version 2.0
> > [    9.317697] nouveau 0000:03:00.0: DRM: DCB version 4.0
> > [    9.317704] nouveau 0000:03:00.0: DRM: DCB outp 00: 02021332 0002001=
0
> > [    9.317709] nouveau 0000:03:00.0: DRM: DCB outp 01: 02000300 0000001=
e
> > [    9.317714] nouveau 0000:03:00.0: DRM: DCB conn 00: 00000000
> > [    9.317719] nouveau 0000:03:00.0: DRM: DCB conn 01: 00002161
> > [    9.368777] [drm] Supports vblank timestamp caching Rev 2
> (21.10.2013).
> > [    9.368784] [drm] Driver supports precise vblank timestamp query.
> > [    9.369124] snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC662
> > rev1: line_outs=3D1 (0x14/0x0/0x0/0x0/0x0) type:hp
> > [    9.369135] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=3D0
> > (0x0/0x0/0x0/0x0/0x0)
> > [    9.369142] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=3D0
> > (0x0/0x0/0x0/0x0/0x0)
> > [    9.369147] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=3D0=
x0
> > [    9.369152] snd_hda_codec_realtek hdaudioC0D0:    dig-out=3D0x1e/0x0
> > [    9.369156] snd_hda_codec_realtek hdaudioC0D0:    inputs:
> > [    9.369165] snd_hda_codec_realtek hdaudioC0D0:      Mic=3D0x18
> > [    9.434609] nouveau 0000:03:00.0: DRM: MM: using M2MF for buffer
> copies
> > [    9.529103] nouveau 0000:03:00.0: DRM: allocated 1920x1080 fb:
> 0x50000,
> > bo ffff8800baac3000
> > [    9.529521] fbcon: nouveaufb (fb0) is primary device
> > [   10.595960] input: HDA NVidia Mic as
> > /devices/pci0000:00/0000:00:08.0/sound/card0/input9
> > [   10.596707] input: HDA NVidia Headphone as
> > /devices/pci0000:00/0000:00:08.0/sound/card0/input10
> > [   16.284253] Console: switching to colour frame buffer device 240x67
> > [   16.287137] nouveau 0000:03:00.0: fb0: nouveaufb frame buffer device
> > [   16.295232] [drm] Initialized nouveau 1.3.1 20120801 for 0000:03:00.=
0
> on
> > minor 0
> >
> > log # lsmod
> > Module                  Size  Used by
> > auth_rpcgss            39557  0
> > oid_registry            2754  1 auth_rpcgss
> > nfsv4                 444263  2
> > nfs                   189555  2 nfsv4
> > lockd                  57722  1 nfs
> > grace                   2426  1 lockd
> > sunrpc                248435  10 auth_rpcgss,nfsv4,lockd,nfs
> > snd_hda_codec_hdmi     30572  1
> > snd_hda_codec_realtek    68090  1
> > snd_hda_codec_generic    48982  1 snd_hda_codec_realtek
> > nouveau              1302011  1
> > video                  30144  1 nouveau
> > snd_hda_intel          25892  0
> > i2c_algo_bit            5273  1 nouveau
> > drm_kms_helper        110022  1 nouveau
> > snd_hda_codec          97219  4
> >
> snd_hda_intel,snd_hda_codec_hdmi,snd_hda_codec_generic,snd_hda_codec_real=
tek
> > cfbfillrect             3374  1 drm_kms_helper
> > snd_hwdep               5801  1 snd_hda_codec
> > syscopyarea             3010  1 drm_kms_helper
> > cfbimgblt               2352  1 drm_kms_helper
> > snd_hda_core           54864  5
> >
> snd_hda_intel,snd_hda_codec,snd_hda_codec_hdmi,snd_hda_codec_generic,snd_=
hda_codec_realtek
> > sysfillrect             3246  1 drm_kms_helper
> > sysimgblt               2288  1 drm_kms_helper
> > fb_sys_fops             1602  1 drm_kms_helper
> > cfbcopyarea             3138  1 drm_kms_helper
> > snd_pcm                82027  4
> > snd_hda_intel,snd_hda_codec,snd_hda_core,snd_hda_codec_hdmi
> > ttm                    74797  1 nouveau
> > snd_timer              19853  1 snd_pcm
> > drm                   293837  4 nouveau,ttm,drm_kms_helper
> > snd                    61356  8
> >
> snd_hda_intel,snd_hwdep,snd_hda_codec,snd_timer,snd_hda_codec_hdmi,snd_hd=
a_codec_generic,snd_hda_codec_realtek,snd_pcm
> > soundcore               6047  1 snd
> > i2c_nforce2             5414  0
> > -----------------------------------------------------------------
> > and here is the output of the working version in Rescue Cd.
> >
> > Linux sysresccd 3.14.31-std451-amd64
> >
> > [    6.736180] [drm] Initialized drm 1.1.0 20060810
> > [    6.794441] [drm] hdmi device  not found 3 0 1
> > [    6.794523] nouveau  [  DEVICE][0000:03:00.0] BOOT0  : 0x0ace80b1
> > [    6.794532] nouveau  [  DEVICE][0000:03:00.0] Chipset: MCP79/MCP7A
> (NVAC)
> > [    6.794538] nouveau  [  DEVICE][0000:03:00.0] Family : NV50
> > [    6.794655] nouveau  [   VBIOS][0000:03:00.0] checking PRAMIN for
> > image...
> > [    6.868390] nouveau  [   VBIOS][0000:03:00.0] ... appears to be vali=
d
> > [    6.868400] nouveau  [   VBIOS][0000:03:00.0] using image from PRAMI=
N
> > [    6.869141] nouveau  [   VBIOS][0000:03:00.0] BIT signature found
> > [    6.869151] nouveau  [   VBIOS][0000:03:00.0] version 62.79.6c.00.01
> > [    6.890670] nouveau 0000:03:00.0: irq 41 for MSI/MSI-X
> > [    6.890713] nouveau  [     PMC][0000:03:00.0] MSI interrupts enabled
> > [    6.890790] nouveau  [     PFB][0000:03:00.0] RAM type: stolen syste=
m
> > memory
> > [    6.890797] nouveau  [     PFB][0000:03:00.0] RAM size: 256 MiB
> > [    6.890803] nouveau  [     PFB][0000:03:00.0]    ZCOMP: 0 tags
> > [    6.917639] nouveau  [  PTHERM][0000:03:00.0] FAN control: none /
> > external
> > [    6.917677] nouveau  [  PTHERM][0000:03:00.0] fan management:
> automatic
> > [    6.917686] nouveau  [  PTHERM][0000:03:00.0] internal sensor: yes
> > [    6.917714] nouveau  [     CLK][0000:03:00.0] 03: core 200 MHz shade=
r
> 400
> > MHz vdec 200 MHz
> > [    6.917732] nouveau  [     CLK][0000:03:00.0] 05: core 300 MHz shade=
r
> 600
> > MHz vdec 300 MHz
> > [    6.917744] nouveau  [     CLK][0000:03:00.0] 07: core 350 MHz shade=
r
> 800
> > MHz vdec 350 MHz
> > [    6.917756] nouveau  [     CLK][0000:03:00.0] 0f: core 450 MHz shade=
r
> > 1100 MHz vdec 450 MHz
> > [    6.917786] nouveau  [     CLK][0000:03:00.0] --: core 450 MHz shade=
r
> > 1100 MHz vdec 450 MHz
> > [    6.918199] [TTM] Zone  kernel: Available graphics memory: 1411362 k=
iB
> > [    6.918205] [TTM] Initializing pool allocator
> > [    6.918231] [TTM] Initializing DMA pool allocator
> > [    6.918282] nouveau  [     DRM] VRAM: 256 MiB
> > [    6.918288] nouveau  [     DRM] GART: 1048576 MiB
> > [    6.918299] nouveau  [     DRM] TMDS table version 2.0
> > [    6.918305] nouveau  [     DRM] DCB version 4.0
> > [    6.918313] nouveau  [     DRM] DCB outp 00: 02021332 00020010
> > [    6.918320] nouveau  [     DRM] DCB outp 01: 02000300 0000001e
> > [    6.918326] nouveau  [     DRM] DCB conn 00: 00000000
> > [    6.918333] nouveau  [     DRM] DCB conn 01: 00002161
> > [    6.936583] [drm] Supports vblank timestamp caching Rev 2
> (21.10.2013).
> > [    6.936592] [drm] Driver supports precise vblank timestamp query.
> > [    6.960336] nouveau  [     DRM] MM: using M2MF for buffer copies
> > [    7.031184] nouveau  [     DRM] allocated 1920x1080 fb: 0x50000, bo
> > ffff8800023de400
> > [    7.031578] fbcon: nouveaufb (fb0) is primary device
> > [    7.094997] Console: switching to colour frame buffer device 240x67
> > [    7.097873] nouveau 0000:03:00.0: fb0: nouveaufb frame buffer device
> > [    7.097880] nouveau 0000:03:00.0: registered panic notifier
> > [    7.097896] [drm] Initialized nouveau 1.1.2 20120801 for 0000:03:00.=
0
> on
> > minor 0
> >
> > lsmod
> > root@sysresccd /var/log % lsmod
> > Module                  Size  Used by
> > arc4                   12390  2
> > rt2800pci              12437  0
> > rt2800mmio             14394  1 rt2800pci
> > rt2800lib              73558  2 rt2800pci,rt2800mmio
> > rt2x00pci              12719  1 rt2800pci
> > rt2x00mmio             12863  2 rt2800pci,rt2800mmio
> > rt2x00lib              48382  5
> > rt2x00pci,rt2800lib,rt2800pci,rt2800mmio,rt2x00mmio
> > eeprom_93cx6           12739  1 rt2800pci
> > mac80211              421465  3 rt2x00lib,rt2x00pci,rt2800lib
> > cfg80211              320349  2 mac80211,rt2x00lib
> > crc_ccitt              12519  1 rt2800lib
> > coretemp               12390  0
> > rfkill                 18094  2 cfg80211
> > microcode              41719  0
> > joydev                 16535  0
> > serio_raw              12439  0
> > i2c_nforce2            12523  0
> > shpchp                 29571  0
> > raid10                 37123  0
> > raid456                57671  0
> > async_raid6_recov      12621  1 raid456
> > async_pq               12640  2 raid456,async_raid6_recov
> > async_xor              12573  3 async_pq,raid456,async_raid6_recov
> > async_memcpy           12464  2 raid456,async_raid6_recov
> > async_tx               12840  5
> > async_pq,raid456,async_xor,async_memcpy,async_raid6_recov
> > raid1                  28900  0
> > raid0                  16515  0
> > multipath              12390  0
> > linear                 12390  0
> > nouveau               793903  2
> > ttm                    66567  1 nouveau
> > drm_kms_helper         37632  1 nouveau
> > drm                   216971  4 ttm,drm_kms_helper,nouveau
> > i2c_algo_bit           12633  1 nouveau
> > i2c_core               28421  5
> > drm,drm_kms_helper,i2c_algo_bit,nouveau,i2c_nforce2
> > mxm_wmi                12672  1 nouveau
> > video                  16832  1 nouveau
> > usb_storage            52365  1
> > forcedeth              49417  0
> > wmi                    13114  2 mxm_wmi,nouveau
> > ---------------------------------------------------------------------
> >
> > Sorry for the huge e-mail. I would appreciate any help.
> >
> > Thanks in advance.
> >
> > Marcelo.
> >
> >
> >
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
> >
>

--94eb2c07aadc5b16cb054a91ab6f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you, that worked like a charm!</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">Em dom, 12 de mar de 2017 =C3=A0s 12:37, =
Ilia Mirkin &lt;<a href=3D"mailto:imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org">imirkin-FrUbXkNCsVen+EJxYGL2xA@public.gmane.org=
u</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I think you wan=
t kernel 4.10, or cherry-pick upstream commit<br class=3D"gmail_msg">
7dfee6827780d4228148263545af936d0cae8930.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
On Sun, Mar 12, 2017 at 11:27 AM, Marcelo Ribeiro &lt;<a href=3D"mailto:mbr=
ibeiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" class=3D"gmail_msg" target=3D"_blank">mbribeiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
</a>&gt; wrote:<br class=3D"gmail_msg">
&gt; Hi, I am changing from proprietary nvidia drivers to Nouveau drivers i=
n my<br class=3D"gmail_msg">
&gt; mediacenter.<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; I run a Gentoo linux in this hardware and I am facing an out of signal=
<br class=3D"gmail_msg">
&gt; screen just after the boot (when the nouveau module is loaded). If I<b=
r class=3D"gmail_msg">
&gt; blacklist this module and modprobe it in the prompt, the screen gets o=
ut of<br class=3D"gmail_msg">
&gt; signal in my 1080p TV in this moment.<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; I tried recompile the kernel enabling and disabling a lot of modules b=
ut the<br class=3D"gmail_msg">
&gt; result is always the same. By a ssh I can access my media center and a=
ll the<br class=3D"gmail_msg">
&gt; logs are normal, even Xorg (it thinks it is sending its image to hdmi =
as it<br class=3D"gmail_msg">
&gt; should).<br class=3D"gmail_msg">
&gt; I tryed system rescue cd and it uses nouveau driver and it works well.=
 It<br class=3D"gmail_msg">
&gt; uses kernel=C2=A0 3.14.31-std451-amd64=C2=A0 and I am using 4.9.6-gent=
oo-r1 #5.<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; Here is some output from my non-working dmesg.<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; 4.9.6-gentoo-r1 #5<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 8.450837] [drm] Initialized<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 8.733804] ACPI: PCI Interrupt Link [LAZA] enabled at IR=
Q 22<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 8.733830] snd_hda_intel 0000:00:08.0: Disabling MSI<br =
class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 9.224126] ACPI: PCI Interrupt Link [SGRU] enabled at IR=
Q 21<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 9.224489] nouveau 0000:03:00.0: NVIDIA MCP79/MCP7A (0ac=
e80b1)<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 9.244211] nouveau 0000:03:00.0: bios: version 62.79.6c.=
00.01<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 9.266689] nouveau 0000:03:00.0: fb: 256 MiB stolen syst=
em memory<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 9.317562] [TTM] Zone=C2=A0 kernel: Available graphics m=
emory: 1413098 kiB<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 9.317566] [TTM] Initializing pool allocator<br class=3D=
"gmail_msg">
&gt; [=C2=A0 =C2=A0 9.317599] [TTM] Initializing DMA pool allocator<br clas=
s=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 9.317677] nouveau 0000:03:00.0: DRM: VRAM: 256 MiB<br c=
lass=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 9.317682] nouveau 0000:03:00.0: DRM: GART: 1048576 MiB<=
br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 9.317692] nouveau 0000:03:00.0: DRM: TMDS table version=
 2.0<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 9.317697] nouveau 0000:03:00.0: DRM: DCB version 4.0<br=
 class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 9.317704] nouveau 0000:03:00.0: DRM: DCB outp 00: 02021=
332 00020010<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 9.317709] nouveau 0000:03:00.0: DRM: DCB outp 01: 02000=
300 0000001e<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 9.317714] nouveau 0000:03:00.0: DRM: DCB conn 00: 00000=
000<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 9.317719] nouveau 0000:03:00.0: DRM: DCB conn 01: 00002=
161<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 9.368777] [drm] Supports vblank timestamp caching Rev 2=
 (21.10.2013).<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 9.368784] [drm] Driver supports precise vblank timestam=
p query.<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 9.369124] snd_hda_codec_realtek hdaudioC0D0: autoconfig=
 for ALC662<br class=3D"gmail_msg">
&gt; rev1: line_outs=3D1 (0x14/0x0/0x0/0x0/0x0) type:hp<br class=3D"gmail_m=
sg">
&gt; [=C2=A0 =C2=A0 9.369135] snd_hda_codec_realtek hdaudioC0D0:=C2=A0 =C2=
=A0 speaker_outs=3D0<br class=3D"gmail_msg">
&gt; (0x0/0x0/0x0/0x0/0x0)<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 9.369142] snd_hda_codec_realtek hdaudioC0D0:=C2=A0 =C2=
=A0 hp_outs=3D0<br class=3D"gmail_msg">
&gt; (0x0/0x0/0x0/0x0/0x0)<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 9.369147] snd_hda_codec_realtek hdaudioC0D0:=C2=A0 =C2=
=A0 mono: mono_out=3D0x0<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 9.369152] snd_hda_codec_realtek hdaudioC0D0:=C2=A0 =C2=
=A0 dig-out=3D0x1e/0x0<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 9.369156] snd_hda_codec_realtek hdaudioC0D0:=C2=A0 =C2=
=A0 inputs:<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 9.369165] snd_hda_codec_realtek hdaudioC0D0:=C2=A0 =C2=
=A0 =C2=A0 Mic=3D0x18<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 9.434609] nouveau 0000:03:00.0: DRM: MM: using M2MF for=
 buffer copies<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 9.529103] nouveau 0000:03:00.0: DRM: allocated 1920x108=
0 fb: 0x50000,<br class=3D"gmail_msg">
&gt; bo ffff8800baac3000<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 9.529521] fbcon: nouveaufb (fb0) is primary device<br c=
lass=3D"gmail_msg">
&gt; [=C2=A0 =C2=A010.595960] input: HDA NVidia Mic as<br class=3D"gmail_ms=
g">
&gt; /devices/pci0000:00/0000:00:08.0/sound/card0/input9<br class=3D"gmail_=
msg">
&gt; [=C2=A0 =C2=A010.596707] input: HDA NVidia Headphone as<br class=3D"gm=
ail_msg">
&gt; /devices/pci0000:00/0000:00:08.0/sound/card0/input10<br class=3D"gmail=
_msg">
&gt; [=C2=A0 =C2=A016.284253] Console: switching to colour frame buffer dev=
ice 240x67<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A016.287137] nouveau 0000:03:00.0: fb0: nouveaufb frame bu=
ffer device<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A016.295232] [drm] Initialized nouveau 1.3.1 20120801 for =
0000:03:00.0 on<br class=3D"gmail_msg">
&gt; minor 0<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; log # lsmod<br class=3D"gmail_msg">
&gt; Module=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S=
ize=C2=A0 Used by<br class=3D"gmail_msg">
&gt; auth_rpcgss=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 39557=C2=A0 0<br =
class=3D"gmail_msg">
&gt; oid_registry=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2754=C2=A0 1 aut=
h_rpcgss<br class=3D"gmail_msg">
&gt; nfsv4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0444=
263=C2=A0 2<br class=3D"gmail_msg">
&gt; nfs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0189555=C2=A0 2 nfsv4<br class=3D"gmail_msg">
&gt; lockd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 57=
722=C2=A0 1 nfs<br class=3D"gmail_msg">
&gt; grace=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A02426=C2=A0 1 lockd<br class=3D"gmail_msg">
&gt; sunrpc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 248435=
=C2=A0 10 auth_rpcgss,nfsv4,lockd,nfs<br class=3D"gmail_msg">
&gt; snd_hda_codec_hdmi=C2=A0 =C2=A0 =C2=A030572=C2=A0 1<br class=3D"gmail_=
msg">
&gt; snd_hda_codec_realtek=C2=A0 =C2=A0 68090=C2=A0 1<br class=3D"gmail_msg=
">
&gt; snd_hda_codec_generic=C2=A0 =C2=A0 48982=C2=A0 1 snd_hda_codec_realtek=
<br class=3D"gmail_msg">
&gt; nouveau=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1302011=C2=A0 =
1<br class=3D"gmail_msg">
&gt; video=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 30=
144=C2=A0 1 nouveau<br class=3D"gmail_msg">
&gt; snd_hda_intel=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 25892=C2=A0 0<br class=
=3D"gmail_msg">
&gt; i2c_algo_bit=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5273=C2=A0 1 nou=
veau<br class=3D"gmail_msg">
&gt; drm_kms_helper=C2=A0 =C2=A0 =C2=A0 =C2=A0 110022=C2=A0 1 nouveau<br cl=
ass=3D"gmail_msg">
&gt; snd_hda_codec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 97219=C2=A0 4<br class=
=3D"gmail_msg">
&gt; snd_hda_intel,snd_hda_codec_hdmi,snd_hda_codec_generic,snd_hda_codec_r=
ealtek<br class=3D"gmail_msg">
&gt; cfbfillrect=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03374=C2=A0 =
1 drm_kms_helper<br class=3D"gmail_msg">
&gt; snd_hwdep=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05801=
=C2=A0 1 snd_hda_codec<br class=3D"gmail_msg">
&gt; syscopyarea=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03010=C2=A0 =
1 drm_kms_helper<br class=3D"gmail_msg">
&gt; cfbimgblt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02352=
=C2=A0 1 drm_kms_helper<br class=3D"gmail_msg">
&gt; snd_hda_core=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A054864=C2=A0 5<br =
class=3D"gmail_msg">
&gt; snd_hda_intel,snd_hda_codec,snd_hda_codec_hdmi,snd_hda_codec_generic,s=
nd_hda_codec_realtek<br class=3D"gmail_msg">
&gt; sysfillrect=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03246=C2=A0 =
1 drm_kms_helper<br class=3D"gmail_msg">
&gt; sysimgblt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02288=
=C2=A0 1 drm_kms_helper<br class=3D"gmail_msg">
&gt; fb_sys_fops=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01602=C2=A0 =
1 drm_kms_helper<br class=3D"gmail_msg">
&gt; cfbcopyarea=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03138=C2=A0 =
1 drm_kms_helper<br class=3D"gmail_msg">
&gt; snd_pcm=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 82027=
=C2=A0 4<br class=3D"gmail_msg">
&gt; snd_hda_intel,snd_hda_codec,snd_hda_core,snd_hda_codec_hdmi<br class=
=3D"gmail_msg">
&gt; ttm=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 74797=C2=A0 1 nouveau<br class=3D"gmail_msg">
&gt; snd_timer=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 19853=C2=A0 =
1 snd_pcm<br class=3D"gmail_msg">
&gt; drm=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0293837=C2=A0 4 nouveau,ttm,drm_kms_helper<br class=3D"gmail_msg">
&gt; snd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 61356=C2=A0 8<br class=3D"gmail_msg">
&gt; snd_hda_intel,snd_hwdep,snd_hda_codec,snd_timer,snd_hda_codec_hdmi,snd=
_hda_codec_generic,snd_hda_codec_realtek,snd_pcm<br class=3D"gmail_msg">
&gt; soundcore=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A06047=
=C2=A0 1 snd<br class=3D"gmail_msg">
&gt; i2c_nforce2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05414=C2=A0 =
0<br class=3D"gmail_msg">
&gt; -----------------------------------------------------------------<br c=
lass=3D"gmail_msg">
&gt; and here is the output of the working version in Rescue Cd.<br class=
=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; Linux sysresccd 3.14.31-std451-amd64<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.736180] [drm] Initialized drm 1.1.0 20060810<br class=
=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.794441] [drm] hdmi device=C2=A0 not found 3 0 1<br cl=
ass=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.794523] nouveau=C2=A0 [=C2=A0 DEVICE][0000:03:00.0] B=
OOT0=C2=A0 : 0x0ace80b1<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.794532] nouveau=C2=A0 [=C2=A0 DEVICE][0000:03:00.0] C=
hipset: MCP79/MCP7A (NVAC)<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.794538] nouveau=C2=A0 [=C2=A0 DEVICE][0000:03:00.0] F=
amily : NV50<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.794655] nouveau=C2=A0 [=C2=A0 =C2=A0VBIOS][0000:03:00=
.0] checking PRAMIN for<br class=3D"gmail_msg">
&gt; image...<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.868390] nouveau=C2=A0 [=C2=A0 =C2=A0VBIOS][0000:03:00=
.0] ... appears to be valid<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.868400] nouveau=C2=A0 [=C2=A0 =C2=A0VBIOS][0000:03:00=
.0] using image from PRAMIN<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.869141] nouveau=C2=A0 [=C2=A0 =C2=A0VBIOS][0000:03:00=
.0] BIT signature found<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.869151] nouveau=C2=A0 [=C2=A0 =C2=A0VBIOS][0000:03:00=
.0] version 62.79.6c.00.01<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.890670] nouveau 0000:03:00.0: irq 41 for MSI/MSI-X<br=
 class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.890713] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0PMC][0000:=
03:00.0] MSI interrupts enabled<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.890790] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0PFB][0000:=
03:00.0] RAM type: stolen system<br class=3D"gmail_msg">
&gt; memory<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.890797] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0PFB][0000:=
03:00.0] RAM size: 256 MiB<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.890803] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0PFB][0000:=
03:00.0]=C2=A0 =C2=A0 ZCOMP: 0 tags<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.917639] nouveau=C2=A0 [=C2=A0 PTHERM][0000:03:00.0] F=
AN control: none /<br class=3D"gmail_msg">
&gt; external<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.917677] nouveau=C2=A0 [=C2=A0 PTHERM][0000:03:00.0] f=
an management: automatic<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.917686] nouveau=C2=A0 [=C2=A0 PTHERM][0000:03:00.0] i=
nternal sensor: yes<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.917714] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0CLK][0000:=
03:00.0] 03: core 200 MHz shader 400<br class=3D"gmail_msg">
&gt; MHz vdec 200 MHz<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.917732] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0CLK][0000:=
03:00.0] 05: core 300 MHz shader 600<br class=3D"gmail_msg">
&gt; MHz vdec 300 MHz<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.917744] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0CLK][0000:=
03:00.0] 07: core 350 MHz shader 800<br class=3D"gmail_msg">
&gt; MHz vdec 350 MHz<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.917756] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0CLK][0000:=
03:00.0] 0f: core 450 MHz shader<br class=3D"gmail_msg">
&gt; 1100 MHz vdec 450 MHz<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.917786] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0CLK][0000:=
03:00.0] --: core 450 MHz shader<br class=3D"gmail_msg">
&gt; 1100 MHz vdec 450 MHz<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.918199] [TTM] Zone=C2=A0 kernel: Available graphics m=
emory: 1411362 kiB<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.918205] [TTM] Initializing pool allocator<br class=3D=
"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.918231] [TTM] Initializing DMA pool allocator<br clas=
s=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.918282] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0DRM] VRAM:=
 256 MiB<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.918288] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0DRM] GART:=
 1048576 MiB<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.918299] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0DRM] TMDS =
table version 2.0<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.918305] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0DRM] DCB v=
ersion 4.0<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.918313] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0DRM] DCB o=
utp 00: 02021332 00020010<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.918320] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0DRM] DCB o=
utp 01: 02000300 0000001e<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.918326] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0DRM] DCB c=
onn 00: 00000000<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.918333] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0DRM] DCB c=
onn 01: 00002161<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.936583] [drm] Supports vblank timestamp caching Rev 2=
 (21.10.2013).<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.936592] [drm] Driver supports precise vblank timestam=
p query.<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 6.960336] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0DRM] MM: u=
sing M2MF for buffer copies<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 7.031184] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0DRM] alloc=
ated 1920x1080 fb: 0x50000, bo<br class=3D"gmail_msg">
&gt; ffff8800023de400<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 7.031578] fbcon: nouveaufb (fb0) is primary device<br c=
lass=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 7.094997] Console: switching to colour frame buffer dev=
ice 240x67<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 7.097873] nouveau 0000:03:00.0: fb0: nouveaufb frame bu=
ffer device<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 7.097880] nouveau 0000:03:00.0: registered panic notifi=
er<br class=3D"gmail_msg">
&gt; [=C2=A0 =C2=A0 7.097896] [drm] Initialized nouveau 1.1.2 20120801 for =
0000:03:00.0 on<br class=3D"gmail_msg">
&gt; minor 0<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; lsmod<br class=3D"gmail_msg">
&gt; root@sysresccd /var/log % lsmod<br class=3D"gmail_msg">
&gt; Module=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S=
ize=C2=A0 Used by<br class=3D"gmail_msg">
&gt; arc4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A012390=C2=A0 2<br class=3D"gmail_msg">
&gt; rt2800pci=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 12437=C2=A0 =
0<br class=3D"gmail_msg">
&gt; rt2800mmio=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A014394=C2=A0 =
1 rt2800pci<br class=3D"gmail_msg">
&gt; rt2800lib=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 73558=C2=A0 =
2 rt2800pci,rt2800mmio<br class=3D"gmail_msg">
&gt; rt2x00pci=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 12719=C2=A0 =
1 rt2800pci<br class=3D"gmail_msg">
&gt; rt2x00mmio=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012863=C2=A0 =
2 rt2800pci,rt2800mmio<br class=3D"gmail_msg">
&gt; rt2x00lib=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 48382=C2=A0 =
5<br class=3D"gmail_msg">
&gt; rt2x00pci,rt2800lib,rt2800pci,rt2800mmio,rt2x00mmio<br class=3D"gmail_=
msg">
&gt; eeprom_93cx6=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012739=C2=A0 1 rt2=
800pci<br class=3D"gmail_msg">
&gt; mac80211=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 421465=C2=A0 =
3 rt2x00lib,rt2x00pci,rt2800lib<br class=3D"gmail_msg">
&gt; cfg80211=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 320349=C2=A0 =
2 mac80211,rt2x00lib<br class=3D"gmail_msg">
&gt; crc_ccitt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 12519=C2=A0 =
1 rt2800lib<br class=3D"gmail_msg">
&gt; coretemp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012390=
=C2=A0 0<br class=3D"gmail_msg">
&gt; rfkill=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A018=
094=C2=A0 2 cfg80211<br class=3D"gmail_msg">
&gt; microcode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 41719=C2=A0 =
0<br class=3D"gmail_msg">
&gt; joydev=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016=
535=C2=A0 0<br class=3D"gmail_msg">
&gt; serio_raw=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 12439=C2=A0 =
0<br class=3D"gmail_msg">
&gt; i2c_nforce2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 12523=C2=A0 0<br =
class=3D"gmail_msg">
&gt; shpchp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A029=
571=C2=A0 0<br class=3D"gmail_msg">
&gt; raid10=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A037=
123=C2=A0 0<br class=3D"gmail_msg">
&gt; raid456=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 57671=
=C2=A0 0<br class=3D"gmail_msg">
&gt; async_raid6_recov=C2=A0 =C2=A0 =C2=A0 12621=C2=A0 1 raid456<br class=
=3D"gmail_msg">
&gt; async_pq=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012640=
=C2=A0 2 raid456,async_raid6_recov<br class=3D"gmail_msg">
&gt; async_xor=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 12573=C2=A0 =
3 async_pq,raid456,async_raid6_recov<br class=3D"gmail_msg">
&gt; async_memcpy=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012464=C2=A0 2 rai=
d456,async_raid6_recov<br class=3D"gmail_msg">
&gt; async_tx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012840=
=C2=A0 5<br class=3D"gmail_msg">
&gt; async_pq,raid456,async_xor,async_memcpy,async_raid6_recov<br class=3D"=
gmail_msg">
&gt; raid1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 28=
900=C2=A0 0<br class=3D"gmail_msg">
&gt; raid0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16=
515=C2=A0 0<br class=3D"gmail_msg">
&gt; multipath=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 12390=C2=A0 =
0<br class=3D"gmail_msg">
&gt; linear=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012=
390=C2=A0 0<br class=3D"gmail_msg">
&gt; nouveau=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0793903=
=C2=A0 2<br class=3D"gmail_msg">
&gt; ttm=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 66567=C2=A0 1 nouveau<br class=3D"gmail_msg">
&gt; drm_kms_helper=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A037632=C2=A0 1 nouveau<=
br class=3D"gmail_msg">
&gt; drm=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0216971=C2=A0 4 ttm,drm_kms_helper,nouveau<br class=3D"gmail_msg">
&gt; i2c_algo_bit=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012633=C2=A0 1 nou=
veau<br class=3D"gmail_msg">
&gt; i2c_core=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A028421=
=C2=A0 5<br class=3D"gmail_msg">
&gt; drm,drm_kms_helper,i2c_algo_bit,nouveau,i2c_nforce2<br class=3D"gmail_=
msg">
&gt; mxm_wmi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 12672=
=C2=A0 1 nouveau<br class=3D"gmail_msg">
&gt; video=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16=
832=C2=A0 1 nouveau<br class=3D"gmail_msg">
&gt; usb_storage=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 52365=C2=A0 1<br =
class=3D"gmail_msg">
&gt; forcedeth=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 49417=C2=A0 =
0<br class=3D"gmail_msg">
&gt; wmi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 13114=C2=A0 2 mxm_wmi,nouveau<br class=3D"gmail_msg">
&gt; ---------------------------------------------------------------------<=
br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; Sorry for the huge e-mail. I would appreciate any help.<br class=3D"gm=
ail_msg">
&gt;<br class=3D"gmail_msg">
&gt; Thanks in advance.<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; Marcelo.<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; _______________________________________________<br class=3D"gmail_msg"=
>
&gt; Nouveau mailing list<br class=3D"gmail_msg">
&gt; <a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" class=3D"gmail_msg" t=
arget=3D"_blank">Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a><br class=3D"gmail_msg">
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=
=3D"noreferrer" class=3D"gmail_msg" target=3D"_blank">https://lists.freedes=
ktop.org/mailman/listinfo/nouveau</a><br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
</blockquote></div>

--94eb2c07aadc5b16cb054a91ab6f--

--===============1251866116==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1251866116==--
