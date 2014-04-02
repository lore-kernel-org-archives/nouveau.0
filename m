From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: CH7007A (AKA CH7006) TV OUT Support for NV11 (NVidia
 GeForce2 Go Dell I8K Laptop)
Date: Wed, 2 Apr 2014 18:12:40 -0400
Message-ID: <CAKb7Uvg3ogHq3rNXDkP0eukvY0J-accaQ0YZ=x8cCEhJBYQ7rQ@mail.gmail.com>
References: <20140401035741.GA3535@localhost4.local>
 <CAKb7Uvj6EL60VY0wkvm_JGPh+VZYtU8J51gpvt8JsoQQq5qiDw@mail.gmail.com>
 <20140401223030.GA22211@localhost4.local>
 <20140402212448.GA3509@localhost4.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20140402212448.GA3509-bi+AKbBUZKbeRWJqFmQP6g@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Roger <rogerx.oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, Apr 2, 2014 at 5:24 PM, Roger <rogerx.oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> After analyzing verbose nouveau & drm dmesg, I have found seemingly no more
> useful details pertaining to having no TV-1 device.  The TV-1 device might be
> getting lost within DRM, by setting the TV-1 (SVIDEO, Composite) device into
> DPMS mode or Full Power Down mode, and the ch7006 datasheet does say in this
> mode, all but the i2c circuits are disabled!  Looking at
> "drivers/gpu/drm/i2c/ch7006_mode.c", seems to be now setting the ch7006
> "CH7006_POWER_LEVEL, FULL_POWER_OFF" on chips >=20, in which my chip ID is 50.
> This is upon the condition of, "if (priv->last_dpms == DRM_MODE_DPMS_ON)"
>
> I've already tried disabling DPMS, but seems the only switch I can find is
> apci=off, which disables nouveau completely and the nouvea.runpm=0 doesn't seem
> to have any effect, or it doesn't effect DRM dpms or DRM power management.

runpm has to do with runtime power management, e.g. optimus setups.
Nothing related to your configuration.

>
>
> I've provided the minimal logs first, prior to the more longer dmesg log
> output.  (I've used grep to avoid irrelevant data, and pretty sure I have all
> necessary filters.)
>
> === SYS/SYSFS ===
>
> $ ls /sys/class/drm/
> card0@  card0-LVDS-1@  card0-VGA-1@  controlD64@  ttm@  version
>
>
> === DMESG ===
>
> $ dmesg |grep 'drm\|i2c\|nouveau\|tv' -i
>
> [    0.000000] Kernel command line: BOOT_IMAGE=/vmlinuz-3.13.7-200.fc20.i686 root=UUID=6451f7ed-f2ff-4434-8aca-b130a49fb7d5 ro rd.md=0 rd.lvm=0 rd.dm=0 vconsole.keymap=us rd.luks=0 vconsole.font=ter-128n resume=/dev/sda2 real_resume=/dev/sda2 console=tty1 video=LVDS-1:1024x768@60 video=VGA-1:800x600@60 video=TV-1:e video=TV:e gfxpayload=1024x768x16 selinux=0 nouveau.tv_disable=0 nouveau.tv_norm=NTSC-M nouveau.debug=1 ch7006.debug=2 ch7006.tv_norm=NTSC-M ch7006.scale=2 i2c-algo-bit.bit_test=1 rd.modules-load=i2c-dev rd.modules-load=i2c-i801 rd.modules-load=i2c-smbus nouveau.debug=debug drm.debug=0xe nouveau.runpm=0

I know you were trying to throw the kitchen sink at the issue, but I'd
recommend getting rid of the majority of these options, they are
likely unhelpful or perhaps actively counter-productive, esp the
video= lines.

> [    2.528246] i2c /dev entries driver
> [    3.740520] [drm] Initialized drm 1.1.0 20060810
> [    4.094412] [drm] hdmi device  not found 1 0 1
> [    4.094564] nouveau D[  DEVICE][0000:01:00.0] initialised
> [    4.094768] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x011200b2
> [    4.094905] nouveau  [  DEVICE][0000:01:00.0] Chipset: NV11 (NV11)
> [    4.095081] nouveau  [  DEVICE][0000:01:00.0] Family : NV11
> [    4.095209] nouveau D[  DEVICE][0000:01:00.0] crystal freq: 14318KHz
> [    4.106189] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
> [    4.176075] nouveau  [   VBIOS][0000:01:00.0] ... checksum invalid
> [    4.176205] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
> [    4.176651] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
> [    4.176801] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for image...
> [    4.176940] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
> [    4.177089] nouveau  [   VBIOS][0000:01:00.0] checking PCIROM for image...
> [    4.218112] nouveau  [   VBIOS][0000:01:00.0] ... checksum invalid
> [    4.218254] nouveau  [   VBIOS][0000:01:00.0] checking PLATFORM for image...
> [    4.218387] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
> [    4.218518] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
> [    4.218673] nouveau  [   VBIOS][0000:01:00.0] BMP version 5.14
> [    4.219261] nouveau  [   VBIOS][0000:01:00.0] version 03.11.01.44.00
> [    4.265116] nouveau 0000:01:00.0: putting AGP V2 device into 4x mode
> [    4.275239] nouveau  [     DRM] VRAM: 31 MiB
> [    4.275414] nouveau  [     DRM] GART: 64 MiB
> [    4.275552] nouveau  [     DRM] BMP version 5.20
> [    4.275696] nouveau  [     DRM] DCB version 1.5
> [    4.275836] nouveau  [     DRM] DCB outp 00: f0003f00 000088b8
> [    4.275972] nouveau  [     DRM] DCB outp 01: f2045f14 0000ffff
> [    4.276148] nouveau  [     DRM] DCB outp 02: f4204011 ffffffff
> [    4.276592] nouveau  [     DRM] BIOS FP mode: 1400x1050 (108000kHz pixel clock)
> [    4.281237] nouveau  [     DRM] Saving VGA fonts
> [    4.362670] nouveau D[     I2C][0000:01:00.0] probing TV encoders on bus: 1
> [    4.363885] nouveau  [     I2C][0000:01:00.0] detected TV encoder: ch7006
> [    4.552433] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [    4.552598] [drm] No driver support for vblank timestamp query.
> [    4.634711] nouveau  [     DRM] MM: using M2MF for buffer copies
> [    4.634857] nouveau  [     DRM] Setting dpms mode 3 on vga encoder (output 0)
> [    4.634991] nouveau  [     DRM] Setting dpms mode 3 on lvds encoder (output 1)
> [    4.635242] nouveau  [     DRM] Calling LVDS script 1:
> [    4.635382] nouveau  [     DRM] Calling LVDS script 6:
> [    4.635509] nouveau  [     DRM] 0xC43B: Parsing digital output script table
> [    5.155719] nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 2)

So at this point it has happily detected the TV encoder on output 2,
and sets the DPMS mode on it.

> [    5.206211] [drm:drm_fb_helper_parse_command_line], cmdline mode for connector VGA-1 800x600@60Hz
> [    5.206225] [drm:drm_fb_helper_parse_command_line], cmdline mode for connector LVDS-1 1024x768@60Hz
> [    5.206236] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1]
> [    5.264489] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1] disconnected
> [    5.264508] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
> [    5.302438] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
> [    5.339425] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
> [    5.376396] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
> [    5.414088] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
> [    5.415422] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
> [    5.415554] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
> [    5.428731] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
> [    5.428745] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
> [    5.428756] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
> [    5.428767] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
> [    5.428778] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
> [    5.428789] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
> [    5.428800] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
> [    5.428811] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
> [    5.428822] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
> [    5.428833] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
> [    5.428844] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
> [    5.428855] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
> [    5.428867] [drm:drm_setup_crtcs],
> [    5.428873] [drm:drm_enable_connectors], connector 11 enabled? no
> [    5.428880] [drm:drm_enable_connectors], connector 13 enabled? yes
> [    5.428887] [drm:drm_target_preferred], looking for cmdline mode on connector 13
> [    5.428894] [drm:drm_target_preferred], found mode 1024x768
> [    5.428900] [drm:drm_setup_crtcs], picking CRTCs for 4096x4096 config
> [    5.428910] [drm:drm_setup_crtcs], desired mode 1024x768 set on crtc 10

But at no point does it see the TV-1 connector. I'm guessing something
got busted in the nv04_tv stuff :( NV11 should have 2 CRTC's, but even
if it had only 1, it should still be exposing the TV-1 connector...
I'll try to read the code more carefully, and compare it to the
nv17_tv logic, to maybe see where it goes wrong.

  -ilia
