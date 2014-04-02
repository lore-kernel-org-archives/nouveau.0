From: Roger <rogerx.oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: CH7007A (AKA CH7006) TV OUT Support for NV11 (NVidia
 GeForce2 Go Dell I8K Laptop)
Date: Wed, 02 Apr 2014 13:24:48 -0800
Message-ID: <20140402212448.GA3509@localhost4.local>
References: <20140401035741.GA3535@localhost4.local>
 <CAKb7Uvj6EL60VY0wkvm_JGPh+VZYtU8J51gpvt8JsoQQq5qiDw@mail.gmail.com>
 <20140401223030.GA22211@localhost4.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-reply-to: <20140401223030.GA22211-bi+AKbBUZKbeRWJqFmQP6g@public.gmane.org>
Content-disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

After analyzing verbose nouveau & drm dmesg, I have found seemingly no more 
useful details pertaining to having no TV-1 device.  The TV-1 device might be 
getting lost within DRM, by setting the TV-1 (SVIDEO, Composite) device into 
DPMS mode or Full Power Down mode, and the ch7006 datasheet does say in this 
mode, all but the i2c circuits are disabled!  Looking at 
"drivers/gpu/drm/i2c/ch7006_mode.c", seems to be now setting the ch7006
"CH7006_POWER_LEVEL, FULL_POWER_OFF" on chips >=20, in which my chip ID is 50.  
This is upon the condition of, "if (priv->last_dpms == DRM_MODE_DPMS_ON)"

I've already tried disabling DPMS, but seems the only switch I can find is 
apci=off, which disables nouveau completely and the nouvea.runpm=0 doesn't seem 
to have any effect, or it doesn't effect DRM dpms or DRM power management.


I've provided the minimal logs first, prior to the more longer dmesg log 
output.  (I've used grep to avoid irrelevant data, and pretty sure I have all 
necessary filters.)


=== XRANDR ===
Nothing more is shown using --verbose

$ xrandr

Screen 0: minimum 320 x 200, current 1280 x 1024, maximum 4096 x 4096

VGA-1 disconnected (normal left inverted right x axis y axis)

LVDS-1 connected 1280x1024+0+0 (normal left inverted right x axis y axis) 0mm x 0mm
   1280x1024      59.9*+
   1400x1050      60.0 +   60.0  
   1280x960       59.9  
   1152x864       60.0  
   1024x768       59.9  
   800x600        59.9  
   640x480        59.4  
   720x400        59.6  
   640x400        60.0  
   640x350        59.8  


=== SYS/SYSFS ===

$ cat /sys/bus/i2c/devices/1-0075/name
ch7006

$ cat /sys/bus/i2c/devices/i2c-0/name 
nouveau-0000:01:00.0-0

$ cat /sys/bus/i2c/devices/i2c-1/name 
nouveau-0000:01:00.0-1

$ cat /sys/bus/i2c/devices/i2c-2/name
nouveau-0000:01:00.0-2

$ ls /sys/class/drm/
card0@  card0-LVDS-1@  card0-VGA-1@  controlD64@  ttm@  version


=== DMESG ===

$ dmesg |grep 'drm\|i2c\|nouveau\|tv' -i

[    0.000000] Kernel command line: BOOT_IMAGE=/vmlinuz-3.13.7-200.fc20.i686 root=UUID=6451f7ed-f2ff-4434-8aca-b130a49fb7d5 ro rd.md=0 rd.lvm=0 rd.dm=0 vconsole.keymap=us rd.luks=0 vconsole.font=ter-128n resume=/dev/sda2 real_resume=/dev/sda2 console=tty1 video=LVDS-1:1024x768@60 video=VGA-1:800x600@60 video=TV-1:e video=TV:e gfxpayload=1024x768x16 selinux=0 nouveau.tv_disable=0 nouveau.tv_norm=NTSC-M nouveau.debug=1 ch7006.debug=2 ch7006.tv_norm=NTSC-M ch7006.scale=2 i2c-algo-bit.bit_test=1 rd.modules-load=i2c-dev rd.modules-load=i2c-i801 rd.modules-load=i2c-smbus nouveau.debug=debug drm.debug=0xe nouveau.runpm=0
[    2.528246] i2c /dev entries driver
[    3.740520] [drm] Initialized drm 1.1.0 20060810
[    4.094412] [drm] hdmi device  not found 1 0 1
[    4.094564] nouveau D[  DEVICE][0000:01:00.0] initialised
[    4.094768] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x011200b2
[    4.094905] nouveau  [  DEVICE][0000:01:00.0] Chipset: NV11 (NV11)
[    4.095081] nouveau  [  DEVICE][0000:01:00.0] Family : NV11
[    4.095209] nouveau D[  DEVICE][0000:01:00.0] crystal freq: 14318KHz
[    4.106081] nouveau D[  DEVICE][0000:01:00.0][0x80000080][dcf013c0] created
[    4.106101] nouveau D[  DEVICE][0000:01:00.0][0x80000080][dcf013c0] initialised
[    4.106141] nouveau D[  DEVICE][0000:01:00.0] stopped
[    4.106149] nouveau D[  DEVICE][0000:01:00.0][0x80000080][dcf013c0] stopped
[    4.106160] nouveau D[  DEVICE][0000:01:00.0][0x80000080][dcf013c0] destroying
[    4.106171] nouveau D[  DEVICE][0000:01:00.0] initialised
[    4.106189] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    4.176075] nouveau  [   VBIOS][0000:01:00.0] ... checksum invalid
[    4.176205] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[    4.176651] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    4.176801] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for image...
[    4.176940] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    4.177089] nouveau  [   VBIOS][0000:01:00.0] checking PCIROM for image...
[    4.218112] nouveau  [   VBIOS][0000:01:00.0] ... checksum invalid
[    4.218254] nouveau  [   VBIOS][0000:01:00.0] checking PLATFORM for image...
[    4.218387] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    4.218518] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    4.218673] nouveau  [   VBIOS][0000:01:00.0] BMP version 5.14
[    4.219261] nouveau  [   VBIOS][0000:01:00.0] version 03.11.01.44.00
[    4.219388] nouveau D[   VBIOS][0000:01:00.0] created
[    4.222967] nouveau D[ DEVINIT][0000:01:00.0] created
[    4.222985] nouveau D[    GPIO][0000:01:00.0] created
[    4.223069] nouveau-0000:01:00.0-0: SDA stuck high!
[    4.225183] nouveau D[     I2C][0000:01:00.0][0x00000000][dbcad800] created
[    4.225217] nouveau-0000:01:00.0-1: SDA stuck high!
[    4.230971] nouveau D[     I2C][0000:01:00.0][0x00000000][dbcadc00] created
[    4.231089] nouveau-0000:01:00.0-2: SDA stuck high!
[    4.235873] nouveau D[     I2C][0000:01:00.0][0x00000000][c0089000] created
[    4.235895] nouveau D[     I2C][0000:01:00.0] created
[    4.235905] nouveau D[   VBIOS][0000:01:00.0] reset
[    4.235912] nouveau D[   VBIOS][0000:01:00.0] initialised
[    4.235940] nouveau D[ DEVINIT][0000:01:00.0] reset
[    4.236084] nouveau D[ DEVINIT][0000:01:00.0] initialised
[    4.236093] nouveau D[    GPIO][0000:01:00.0] reset
[    4.236100] nouveau D[    GPIO][0000:01:00.0] initialised
[    4.236108] nouveau D[     I2C][0000:01:00.0] reset
[    4.236114] nouveau D[     I2C][0000:01:00.0] initialised
[    4.238614] nouveau D[     PMC][0000:01:00.0] created
[    4.238629] nouveau D[     PMC][0000:01:00.0] reset
[    4.238636] nouveau D[     PMC][0000:01:00.0] initialised
[    4.238646] nouveau D[    PBUS][0000:01:00.0] created
[    4.238653] nouveau D[    PBUS][0000:01:00.0] reset
[    4.238659] nouveau D[    PBUS][0000:01:00.0] initialised
[    4.238668] nouveau D[  PTIMER][0000:01:00.0] created
[    4.238675] nouveau D[  PTIMER][0000:01:00.0] reset
[    4.238682] nouveau W[  PTIMER][0000:01:00.0] unknown input clock freq
[    4.238833] nouveau D[  PTIMER][0000:01:00.0] initialised
[    4.238848] nouveau D[     PFB][0000:01:00.0][0x00000000][dcf01a80] created
[    4.238857] nouveau  [     PFB][0000:01:00.0] RAM type: DDR1
[    4.238996] nouveau  [     PFB][0000:01:00.0] RAM size: 32 MiB
[    4.239172] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    4.239301] nouveau D[     PFB][0000:01:00.0] created
[    4.239308] nouveau D[     PFB][0000:01:00.0] reset
[    4.239334] nouveau D[     PFB][0000:01:00.0] initialised
[    4.252755] nouveau D[ INSTMEM][0000:01:00.0][0x04000000][dbc7e540] created
[    4.252910] nouveau D[ INSTMEM][0000:01:00.0][0x02000000][dcfdd900] created
[    4.252921] nouveau D[ INSTMEM][0000:01:00.0][0x04000000][dbc7e5c0] created
[    4.254551] nouveau D[ INSTMEM][0000:01:00.0][0x04000000][dbc7e640] created
[    4.254621] nouveau D[ INSTMEM][0000:01:00.0][0x02000000][dcfdd300] created
[    4.254632] nouveau D[ INSTMEM][0000:01:00.0][0x04000000][dbc7e680] created
[    4.254644] nouveau D[ INSTMEM][0000:01:00.0][0x02000000][dcfdd9c0] created
[    4.254682] nouveau D[ INSTMEM][0000:01:00.0] created
[    4.254693] nouveau D[ INSTMEM][0000:01:00.0] reset
[    4.254791] nouveau D[ INSTMEM][0000:01:00.0] initialised
[    4.254826] nouveau D[ INSTMEM][0000:01:00.0][0x04000000][dbc7e780] created
[    4.258359] nouveau D[ PCIGART][0000:01:00.0][0x02000000][dcfdd960] created
[    4.258367] nouveau D[ PCIGART][0000:01:00.0] created
[    4.258374] nouveau D[ PCIGART][0000:01:00.0] reset
[    4.258381] nouveau D[ PCIGART][0000:01:00.0] initialised
[    4.260447] nouveau D[     CLK][0000:01:00.0] created
[    4.260461] nouveau  [     CLK][0000:01:00.0] --:   
[    4.260645] nouveau D[     CLK][0000:01:00.0] initialised
[    4.264184] nouveau D[  DMAOBJ][0000:01:00.0] created
[    4.264197] nouveau D[  DMAOBJ][0000:01:00.0] reset
[    4.264215] nouveau D[   PFIFO][0000:01:00.0] created
[    4.264224] nouveau D[   PFIFO][0000:01:00.0] reset
[    4.264233] nouveau D[      SW][0000:01:00.0] created
[    4.264239] nouveau D[      SW][0000:01:00.0] reset
[    4.264249] nouveau D[  PGRAPH][0000:01:00.0] created
[    4.264257] nouveau D[  PGRAPH][0000:01:00.0] reset
[    4.264267] nouveau D[ DISPLAY][0000:01:00.0] created
[    4.264273] nouveau D[ DISPLAY][0000:01:00.0] reset
[    4.264282] nouveau D[  DEVICE][0000:01:00.0][0x80000080][dcf013c0] created
[    4.264335] nouveau D[  DEVICE][0000:01:00.0][0x80000080][dcf013c0] initialised
[    4.265116] nouveau 0000:01:00.0: putting AGP V2 device into 4x mode
[    4.275239] nouveau  [     DRM] VRAM: 31 MiB
[    4.275414] nouveau  [     DRM] GART: 64 MiB
[    4.275552] nouveau  [     DRM] BMP version 5.20
[    4.275696] nouveau  [     DRM] DCB version 1.5
[    4.275836] nouveau  [     DRM] DCB outp 00: f0003f00 000088b8
[    4.275972] nouveau  [     DRM] DCB outp 01: f2045f14 0000ffff
[    4.276148] nouveau  [     DRM] DCB outp 02: f4204011 ffffffff
[    4.276592] nouveau  [     DRM] BIOS FP mode: 1400x1050 (108000kHz pixel clock)
[    4.281237] nouveau  [     DRM] Saving VGA fonts
[    4.353818] nouveau D[ DISPLAY][0000:01:00.0] reset
[    4.353833] nouveau D[ DISPLAY][0000:01:00.0] initialised
[    4.362272] nouveau D[ DISPLAY][0000:01:00.0][0x00000046][dbc7dda0] created
[    4.362292] nouveau D[ DISPLAY][0000:01:00.0][0x00000046][dbc7dda0] initialised
[    4.362670] nouveau D[     I2C][0000:01:00.0] probing TV encoders on bus: 1
[    4.363885] nouveau  [     I2C][0000:01:00.0] detected TV encoder: ch7006
[    4.552433] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    4.552598] [drm] No driver support for vblank timestamp query.
[    4.619144] nouveau D[  DEVICE][0000:01:00.0][0x0000fffe][dcfc8780] created
[    4.619165] nouveau D[  DEVICE][0000:01:00.0][0x0000fffe][dcfc8780] initialised
[    4.624824] nouveau D[  DMAOBJ][0000:01:00.0] reset
[    4.624837] nouveau D[  DMAOBJ][0000:01:00.0] initialised
[    4.624851] nouveau D[  DMAOBJ][0000:01:00.0][0x00000002][dbc26a40] created
[    4.624864] nouveau D[  DMAOBJ][0000:01:00.0][0x00000002][dbc26a40] initialised
[    4.624888] nouveau D[  DEVICE][0000:01:00.0][0x80000080][dcf013c0] illegal class 0xa06f
[    4.624901] nouveau D[  DEVICE][0000:01:00.0][0x80000080][dcf013c0] illegal class 0x906f
[    4.624914] nouveau D[  DEVICE][0000:01:00.0][0x80000080][dcf013c0] illegal class 0x826f
[    4.624927] nouveau D[  DEVICE][0000:01:00.0][0x80000080][dcf013c0] illegal class 0x506f
[    4.624944] nouveau D[  DMAOBJ][0000:01:00.0] stopped
[    4.624954] nouveau D[  DMAOBJ][0000:01:00.0][0x00000002][dbc26a40] stopped
[    4.624964] nouveau D[  DMAOBJ][0000:01:00.0][0x00000002][dbc26a40] destroying
[    4.625004] nouveau  [     DRM] ib channel create, -22
[    4.629566] nouveau D[  DMAOBJ][0000:01:00.0] reset
[    4.629578] nouveau D[  DMAOBJ][0000:01:00.0] initialised
[    4.629591] nouveau D[  DMAOBJ][0000:01:00.0][0x00000002][dbc26480] created
[    4.629603] nouveau D[  DMAOBJ][0000:01:00.0][0x00000002][dbc26480] initialised
[    4.629626] nouveau D[  DEVICE][0000:01:00.0][0x80000080][dcf013c0] illegal class 0x406e
[    4.629639] nouveau D[  DEVICE][0000:01:00.0][0x80000080][dcf013c0] illegal class 0x176e
[    4.629652] nouveau D[   PFIFO][0000:01:00.0] reset
[    4.629660] nouveau D[   PFIFO][0000:01:00.0] initialised
[    4.629676] nouveau D[ INSTMEM][0000:01:00.0][0x04000000][dbc26540] created
[    4.629689] nouveau D[   PFIFO][0000:01:00.0][0x03001014][dbf387e0] created
[    4.629709] nouveau D[   PFIFO][0000:01:00.0][0x02000000][dbf38a80] created
[    4.629734] nouveau D[   PFIFO][0000:01:00.0][0xc000006e][dbf25e80] created
[    4.629752] nouveau D[ INSTMEM][0000:01:00.0][0x04000000][dbc26540] initialised
[    4.629760] nouveau D[   PFIFO][0000:01:00.0][0x03001014][dbf387e0] initialised
[    4.629769] nouveau D[   PFIFO][0000:01:00.0][0xc000006e][dbf25e80] initialised
[    4.629798] nouveau D[  DMAOBJ][0000:01:00.0][0x02000000][dbf38060] created
[    4.629808] nouveau D[  DMAOBJ][0000:01:00.0][0x02000000][dbf38060] created
[    4.629823] nouveau D[  DMAOBJ][0000:01:00.0][0x0000003d][dbc26d00] initialised
[    4.629831] nouveau D[  DMAOBJ][0000:01:00.0][0x02000000][dbf38060] initialised
[    4.629863] nouveau D[  DMAOBJ][0000:01:00.0][0x02000000][dbf38000] created
[    4.629873] nouveau D[  DMAOBJ][0000:01:00.0][0x02000000][dbf38000] created
[    4.629888] nouveau D[  DMAOBJ][0000:01:00.0][0x0000003d][dbc26dc0] initialised
[    4.629896] nouveau D[  DMAOBJ][0000:01:00.0][0x02000000][dbf38000] initialised
[    4.629921] nouveau D[      SW][0000:01:00.0] reset
[    4.629928] nouveau D[      SW][0000:01:00.0] initialised
[    4.629940] nouveau D[      SW][0000:01:00.0][0x01000415][dbf25080] created
[    4.629950] nouveau D[      SW][0000:01:00.0][0x0000016e][dcfc88e0] created
[    4.629967] nouveau D[   PFIFO][0000:01:00.0][0xc000006e][dbf25e80] attached SW context
[    4.629975] nouveau D[      SW][0000:01:00.0][0x01000415][dbf25080] initialised
[    4.629984] nouveau D[      SW][0000:01:00.0][0x0000016e][dcfc88e0] initialised
[    4.630047] nouveau D[ INSTMEM][0000:01:00.0][0x04000000][dbc26f00] created
[    4.634371] nouveau D[  DEVICE][0000:01:00.0][0x02000000][dbf384e0] created
[    4.634400] nouveau D[  DMAOBJ][0000:01:00.0][0x02000000][dbf38ae0] created
[    4.634412] nouveau D[  DMAOBJ][0000:01:00.0][0x02000000][dbf38ae0] created
[    4.634428] nouveau D[  DMAOBJ][0000:01:00.0][0x0000003d][dbc26a00] initialised
[    4.634436] nouveau D[  DMAOBJ][0000:01:00.0][0x02000000][dbf38ae0] initialised
[    4.634465] nouveau D[   PFIFO][0000:01:00.0][0xc000006e][dbf25e80] illegal class 0xa0b5
[    4.634478] nouveau D[   PFIFO][0000:01:00.0][0xc000006e][dbf25e80] illegal class 0x85b5
[    4.634490] nouveau D[   PFIFO][0000:01:00.0][0xc000006e][dbf25e80] illegal class 0x74c1
[    4.634503] nouveau D[   PFIFO][0000:01:00.0][0xc000006e][dbf25e80] illegal class 0x9039
[    4.634515] nouveau D[   PFIFO][0000:01:00.0][0xc000006e][dbf25e80] illegal class 0x5039
[    4.634529] nouveau D[  PGRAPH][0000:01:00.0] reset
[    4.634621] nouveau D[  PGRAPH][0000:01:00.0] initialised
[    4.634652] nouveau D[  PGRAPH][0000:01:00.0][0x01001016][dd08a000] created
[    4.634667] nouveau D[  PGRAPH][0000:01:00.0][0x02000039][dbf38b40] created
[    4.634682] nouveau D[  PGRAPH][0000:01:00.0][0x01001016][dd08a000] initialised
[    4.634691] nouveau D[  PGRAPH][0000:01:00.0][0x02000039][dbf38b40] initialised
[    4.634711] nouveau  [     DRM] MM: using M2MF for buffer copies
[    4.634857] nouveau  [     DRM] Setting dpms mode 3 on vga encoder (output 0)
[    4.634991] nouveau  [     DRM] Setting dpms mode 3 on lvds encoder (output 1)
[    4.635242] nouveau  [     DRM] Calling LVDS script 1:
[    4.635382] nouveau  [     DRM] Calling LVDS script 6:
[    4.635509] nouveau  [     DRM] 0xC43B: Parsing digital output script table
[    5.155719] nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 2)
[    5.206211] [drm:drm_fb_helper_parse_command_line], cmdline mode for connector VGA-1 800x600@60Hz
[    5.206225] [drm:drm_fb_helper_parse_command_line], cmdline mode for connector LVDS-1 1024x768@60Hz
[    5.206236] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1]
[    5.264489] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1] disconnected
[    5.264508] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
[    5.302438] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[    5.339425] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[    5.376396] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[    5.414088] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[    5.415422] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[    5.415554] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[    5.428731] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
[    5.428745] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[    5.428756] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
[    5.428767] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
[    5.428778] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
[    5.428789] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
[    5.428800] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[    5.428811] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
[    5.428822] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
[    5.428833] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
[    5.428844] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
[    5.428855] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
[    5.428867] [drm:drm_setup_crtcs], 
[    5.428873] [drm:drm_enable_connectors], connector 11 enabled? no
[    5.428880] [drm:drm_enable_connectors], connector 13 enabled? yes
[    5.428887] [drm:drm_target_preferred], looking for cmdline mode on connector 13
[    5.428894] [drm:drm_target_preferred], found mode 1024x768
[    5.428900] [drm:drm_setup_crtcs], picking CRTCs for 4096x4096 config
[    5.428910] [drm:drm_setup_crtcs], desired mode 1024x768 set on crtc 10
[    5.430713] nouveau D[  PGRAPH][0000:01:00.0][0x02000062][dbf38360] created
[    5.430729] nouveau D[  PGRAPH][0000:01:00.0][0x02000062][dbf38360] initialised
[    5.430767] nouveau D[  PGRAPH][0000:01:00.0][0x02000019][dbf38420] created
[    5.430779] nouveau D[  PGRAPH][0000:01:00.0][0x02000019][dbf38420] initialised
[    5.430810] nouveau D[  PGRAPH][0000:01:00.0][0x02000043][dbf38d80] created
[    5.430823] nouveau D[  PGRAPH][0000:01:00.0][0x02000043][dbf38d80] initialised
[    5.430853] nouveau D[  PGRAPH][0000:01:00.0][0x02000044][dbf383c0] created
[    5.430866] nouveau D[  PGRAPH][0000:01:00.0][0x02000044][dbf383c0] initialised
[    5.430897] nouveau D[  PGRAPH][0000:01:00.0][0x0200004a][dbf38e40] created
[    5.430910] nouveau D[  PGRAPH][0000:01:00.0][0x0200004a][dbf38e40] initialised
[    5.430941] nouveau D[  PGRAPH][0000:01:00.0][0x0200009f][dbf38ea0] created
[    5.430953] nouveau D[  PGRAPH][0000:01:00.0][0x0200009f][dbf38ea0] initialised
[    5.431138] nouveau  [     DRM] allocated 1024x768 fb: 0x8000, bo dcf71c00
[    5.432639] fbcon: nouveaufb (fb0) is primary device
[    5.434845] [drm:drm_crtc_helper_set_config], 
[    5.434849] [drm:drm_crtc_helper_set_config], [CRTC:9] [NOFB]
[    5.434861] nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 2)
[    5.434878] [drm:drm_crtc_helper_set_config], 
[    5.434883] [drm:drm_crtc_helper_set_config], [CRTC:10] [FB:50] #connectors=1 (x y) (0 0)
[    5.434895] [drm:drm_crtc_helper_set_config], crtc has no fb, full mode set
[    5.434899] [drm:drm_crtc_helper_set_config], modes are different, full mode set
[    5.434908] [drm:drm_mode_debug_printmodeline], Modeline 0:"" 0 0 0 0 0 0 0 0 0 0 0x0 0x0
[    5.434917] [drm:drm_mode_debug_printmodeline], Modeline 49:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[    5.434921] [drm:drm_crtc_helper_set_config], encoder changed, full mode switch
[    5.434925] [drm:drm_crtc_helper_set_config], crtc changed, full mode switch
[    5.434931] [drm:drm_crtc_helper_set_config], [CONNECTOR:13:LVDS-1] to [CRTC:10]
[    5.434934] [drm:drm_crtc_helper_set_config], attempting to set mode from userspace
[    5.434943] [drm:drm_mode_debug_printmodeline], Modeline 49:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[    5.434953] [drm:drm_crtc_helper_set_mode], [CRTC:10]
[    5.434961] nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 2)
[    5.435000] nouveau  [     DRM] Setting dpms mode 3 on CRTC 1
[    5.445055] nouveau  [     DRM] CTRC mode on CRTC 1:
[    5.445065] [drm:drm_mode_debug_printmodeline], Modeline 51:"1024x768" 60 108000 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[    5.445097] nouveau  [     DRM] vpll: n1 181 n2 1 m1 12 m2 1 log2p 1
[    5.445105] [drm:drm_crtc_helper_set_mode], [ENCODER:14:LVDS-14] set [MODE:49:1024x768]
[    5.445109] nouveau  [     DRM] Output mode on CRTC 1:
[    5.445118] [drm:drm_mode_debug_printmodeline], Modeline 37:"1400x1050" 0 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[    5.445757] nouveau  [     DRM] index 1
[    5.446179] nouveau  [     DRM] Setting dpms mode 0 on CRTC 1
[    5.456205] nouveau  [     DRM] Calling LVDS script 2:
[    5.456211] nouveau  [     DRM] 0xC468: Parsing digital output script table
[    5.472287] nouveau  [     DRM] Setting dpms mode 0 on lvds encoder (output 1)
[    5.472291] nouveau  [     DRM] Calling LVDS script 5:
[    5.472296] nouveau  [     DRM] 0xC3C4: Parsing digital output script table
[    5.680343] nouveau  [     DRM] Output LVDS-1 is running on CRTC 1 using output B
[    5.687850] [drm:drm_crtc_helper_set_config], Setting connector DPMS state to on
[    5.687858] [drm:drm_crtc_helper_set_config], 	[CONNECTOR:13:LVDS-1] set DPMS on
[    5.687871] nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 2)
[    5.687990] [drm:drm_crtc_helper_set_config], 
[    5.687996] [drm:drm_crtc_helper_set_config], [CRTC:10] [FB:50] #connectors=1 (x y) (0 0)
[    5.688058] [drm:drm_crtc_helper_set_config], [CONNECTOR:13:LVDS-1] to [CRTC:10]
[    5.690713] [drm:drm_crtc_helper_set_config], 
[    5.690718] [drm:drm_crtc_helper_set_config], [CRTC:10] [FB:50] #connectors=1 (x y) (0 0)
[    5.690726] [drm:drm_crtc_helper_set_config], [CONNECTOR:13:LVDS-1] to [CRTC:10]
[    5.693607] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    5.693633] nouveau 0000:01:00.0: registered panic notifier
[    5.693674] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on minor 0
[    5.698732] nouveau D[plymouthd[128]] fini running
[    5.698748] nouveau D[plymouthd[128]] fini completed with 0
[    5.698754] nouveau D[plymouthd[128]] destroying
[    5.698807] nouveau D[plymouthd[128]] fini running
[    5.698815] nouveau D[plymouthd[128]] fini completed with 0
[    5.698821] nouveau D[plymouthd[128]] destroying
[    5.699056] [drm:drm_mode_getresources], CRTC[2] CONNECTORS[2] ENCODERS[3]
[    5.699095] [drm:drm_mode_getresources], CRTC[2] CONNECTORS[2] ENCODERS[3]
[    5.699110] [drm:drm_mode_getconnector], [CONNECTOR:11:?]
[    5.699121] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1]
[    5.717091] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1] disconnected
[    5.717799] [drm:drm_mode_getconnector], [CONNECTOR:11:?]
[    5.717812] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1]
[    5.735732] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1] disconnected
[    5.736383] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[    5.736393] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
[    5.779204] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[    5.832625] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[    5.910619] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[    5.957674] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[    5.967848] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[    5.968869] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[    6.006768] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
[    6.006782] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[    6.006794] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
[    6.006805] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
[    6.006816] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
[    6.006827] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
[    6.006838] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[    6.006849] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
[    6.006860] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
[    6.006871] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
[    6.006882] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
[    6.006893] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
[    6.008190] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[    6.030361] [drm:drm_mode_addfb], [FB:51]
[   25.606410] [drm:drm_crtc_helper_set_config], 
[   25.606416] [drm:drm_crtc_helper_set_config], [CRTC:10] [FB:50] #connectors=1 (x y) (0 0)
[   25.606433] [drm:drm_crtc_helper_set_config], [CONNECTOR:13:LVDS-1] to [CRTC:10]
[   25.869762] nouveau D[plymouthd[128]] fini running
[   25.869779] nouveau D[plymouthd[128]] fini completed with 0
[   25.869786] nouveau D[plymouthd[128]] destroying
[   26.303947] [drm:drm_crtc_helper_set_config], 
[   26.303954] [drm:drm_crtc_helper_set_config], [CRTC:10] [FB:50] #connectors=1 (x y) (0 0)
[   26.303972] [drm:drm_crtc_helper_set_config], [CONNECTOR:13:LVDS-1] to [CRTC:10]
[   91.155422] nouveau D[  X[662]] fini running
[   91.155440] nouveau D[  X[662]] fini completed with 0
[   91.155448] nouveau D[  X[662]] destroying
[   91.571980] nouveau D[  X[662]] fini running
[   91.571998] nouveau D[  X[662]] fini completed with 0
[   91.572067] nouveau D[  X[662]] destroying
[   91.572369] nouveau D[  X[662]] fini running
[   91.572381] nouveau D[  X[662]] fini completed with 0
[   91.572389] nouveau D[  X[662]] destroying
[   91.572781] nouveau D[  X[662]] fini running
[   91.572792] nouveau D[  X[662]] fini completed with 0
[   91.572801] nouveau D[  X[662]] destroying
[   91.576365] [drm:drm_mode_getresources], CRTC[2] CONNECTORS[2] ENCODERS[3]
[   91.576392] [drm:drm_mode_getresources], CRTC[2] CONNECTORS[2] ENCODERS[3]
[   91.578430] [drm:drm_mode_getconnector], [CONNECTOR:11:?]
[   91.578448] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1]
[   91.595087] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1] disconnected
[   91.595134] [drm:drm_mode_getconnector], [CONNECTOR:11:?]
[   91.595146] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1]
[   91.612079] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1] disconnected
[   91.612306] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[   91.612319] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
[   91.650683] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[   91.685764] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[   91.724420] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[   91.759331] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[   91.759416] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[   91.759430] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[   91.777152] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
[   91.777166] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[   91.777182] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
[   91.777197] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
[   91.777212] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
[   91.777227] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
[   91.777242] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[   91.777257] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
[   91.777272] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
[   91.777287] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
[   91.777302] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
[   91.777317] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
[   91.777359] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[   91.777596] [drm:drm_mode_getconnector], [CONNECTOR:11:?]
[   91.777608] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1]
[   91.795083] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1] disconnected
[   91.798614] [drm:drm_mode_getconnector], [CONNECTOR:11:?]
[   91.798630] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1]
[   91.817536] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1] disconnected
[   91.817697] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[   91.817709] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
[   91.856047] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[   91.890941] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[   91.929335] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[   91.964272] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[   91.964357] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[   91.964372] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[   91.976830] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
[   91.976842] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[   91.976858] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
[   91.976873] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
[   91.976888] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
[   91.976903] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
[   91.976918] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[   91.976933] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
[   91.976948] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
[   91.976963] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
[   91.976978] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
[   91.976993] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
[   91.977060] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[   92.051246] nouveau D[  DEVICE][0000:01:00.0][0x80000080][dcd3e540] created
[   92.051269] nouveau D[  DEVICE][0000:01:00.0][0x80000080][dcd3e540] initialised
[   92.054618] nouveau D[  DMAOBJ][0000:01:00.0][0x00000002][ddd09d80] created
[   92.054640] nouveau D[  DMAOBJ][0000:01:00.0][0x00000002][ddd09d80] initialised
[   92.054670] nouveau D[  DEVICE][0000:01:00.0][0x80000080][dcd3e540] illegal class 0xa06f
[   92.054688] nouveau D[  DEVICE][0000:01:00.0][0x80000080][dcd3e540] illegal class 0x906f
[   92.054706] nouveau D[  DEVICE][0000:01:00.0][0x80000080][dcd3e540] illegal class 0x826f
[   92.054724] nouveau D[  DEVICE][0000:01:00.0][0x80000080][dcd3e540] illegal class 0x506f
[   92.054750] nouveau D[  DMAOBJ][0000:01:00.0][0x00000002][ddd09d80] stopped
[   92.054764] nouveau D[  DMAOBJ][0000:01:00.0][0x00000002][ddd09d80] destroying
[   92.054809] nouveau  [  X[662]] ib channel create, -22
[   92.058773] nouveau D[  DMAOBJ][0000:01:00.0][0x00000002][ddd09e40] created
[   92.058794] nouveau D[  DMAOBJ][0000:01:00.0][0x00000002][ddd09e40] initialised
[   92.058823] nouveau D[  DEVICE][0000:01:00.0][0x80000080][dcd3e540] illegal class 0x406e
[   92.058841] nouveau D[  DEVICE][0000:01:00.0][0x80000080][dcd3e540] illegal class 0x176e
[   92.058866] nouveau D[ INSTMEM][0000:01:00.0][0x04000000][ddd09bc0] created
[   92.058886] nouveau D[   PFIFO][0000:01:00.0][0x03001014][ddc1ad80] created
[   92.058911] nouveau D[   PFIFO][0000:01:00.0][0x02000000][ddc1ac60] created
[   92.058947] nouveau D[   PFIFO][0000:01:00.0][0xc000006e][de361600] created
[   92.058972] nouveau D[ INSTMEM][0000:01:00.0][0x04000000][ddd09bc0] initialised
[   92.058983] nouveau D[   PFIFO][0000:01:00.0][0x03001014][ddc1ad80] initialised
[   92.058996] nouveau D[   PFIFO][0000:01:00.0][0xc000006e][de361600] initialised
[   92.059078] nouveau D[  DMAOBJ][0000:01:00.0][0x02000000][ddc1a180] created
[   92.059094] nouveau D[  DMAOBJ][0000:01:00.0][0x02000000][ddc1a180] created
[   92.059115] nouveau D[  DMAOBJ][0000:01:00.0][0x0000003d][dcee6180] initialised
[   92.059126] nouveau D[  DMAOBJ][0000:01:00.0][0x02000000][ddc1a180] initialised
[   92.059169] nouveau D[  DMAOBJ][0000:01:00.0][0x02000000][ddc1a6c0] created
[   92.059183] nouveau D[  DMAOBJ][0000:01:00.0][0x02000000][ddc1a6c0] created
[   92.059204] nouveau D[  DMAOBJ][0000:01:00.0][0x0000003d][dcee67c0] initialised
[   92.059216] nouveau D[  DMAOBJ][0000:01:00.0][0x02000000][ddc1a6c0] initialised
[   92.067737] nouveau D[  DMAOBJ][0000:01:00.0][0x02000000][ddc1acc0] created
[   92.067759] nouveau D[  DMAOBJ][0000:01:00.0][0x02000000][ddc1acc0] created
[   92.067780] nouveau D[  DMAOBJ][0000:01:00.0][0x0000003d][de36fc40] initialised
[   92.067792] nouveau D[  DMAOBJ][0000:01:00.0][0x02000000][ddc1acc0] initialised
[   92.067872] nouveau D[  PGRAPH][0000:01:00.0][0x01001016][dd09e000] created
[   92.067892] nouveau D[  PGRAPH][0000:01:00.0][0x02000030][ddc1a900] created
[   92.067913] nouveau D[  PGRAPH][0000:01:00.0][0x01001016][dd09e000] initialised
[   92.067925] nouveau D[  PGRAPH][0000:01:00.0][0x02000030][ddc1a900] initialised
[   92.067982] nouveau D[  PGRAPH][0000:01:00.0][0x02000062][ddc1aba0] created
[   92.068000] nouveau D[  PGRAPH][0000:01:00.0][0x02000062][ddc1aba0] initialised
[   92.068154] nouveau D[  PGRAPH][0000:01:00.0][0x02000012][ddc1a9c0] created
[   92.068173] nouveau D[  PGRAPH][0000:01:00.0][0x02000012][ddc1a9c0] initialised
[   92.068225] nouveau D[  PGRAPH][0000:01:00.0][0x02000072][ddc1a720] created
[   92.068243] nouveau D[  PGRAPH][0000:01:00.0][0x02000072][ddc1a720] initialised
[   92.068293] nouveau D[  PGRAPH][0000:01:00.0][0x02000044][ddc1a0c0] created
[   92.068311] nouveau D[  PGRAPH][0000:01:00.0][0x02000044][ddc1a0c0] initialised
[   92.068361] nouveau D[  PGRAPH][0000:01:00.0][0x02000043][ddc1ade0] created
[   92.068379] nouveau D[  PGRAPH][0000:01:00.0][0x02000043][ddc1ade0] initialised
[   92.068430] nouveau D[  PGRAPH][0000:01:00.0][0x0200004a][dded0780] created
[   92.068448] nouveau D[  PGRAPH][0000:01:00.0][0x0200004a][dded0780] initialised
[   92.068498] nouveau D[  PGRAPH][0000:01:00.0][0x0200009f][dded0a20] created
[   92.068516] nouveau D[  PGRAPH][0000:01:00.0][0x0200009f][dded0a20] initialised
[   92.068568] nouveau D[  PGRAPH][0000:01:00.0][0x02000089][dded0c60] created
[   92.068586] nouveau D[  PGRAPH][0000:01:00.0][0x02000089][dded0c60] initialised
[   92.068636] nouveau D[  PGRAPH][0000:01:00.0][0x02000019][dded05a0] created
[   92.068654] nouveau D[  PGRAPH][0000:01:00.0][0x02000019][dded05a0] initialised
[   92.068705] nouveau D[  PGRAPH][0000:01:00.0][0x0200008a][dd0eae40] created
[   92.068723] nouveau D[  PGRAPH][0000:01:00.0][0x0200008a][dd0eae40] initialised
[   92.068775] nouveau D[  PGRAPH][0000:01:00.0][0x02000039][dd0eade0] created
[   92.068793] nouveau D[  PGRAPH][0000:01:00.0][0x02000039][dd0eade0] initialised
[   92.068849] nouveau D[  PGRAPH][0000:01:00.0][0x02000096][dd0eaf00] created
[   92.068867] nouveau D[  PGRAPH][0000:01:00.0][0x02000096][dd0eaf00] initialised
[   92.390211] [drm:drm_mode_addfb], [FB:51]
[   92.390278] [drm:drm_mode_setcrtc], [CRTC:10]
[   92.390296] [drm:drm_mode_setcrtc], [CONNECTOR:13:LVDS-1]
[   92.390307] [drm:drm_crtc_helper_set_config], 
[   92.390315] [drm:drm_crtc_helper_set_config], [CRTC:10] [FB:51] #connectors=1 (x y) (0 0)
[   92.390334] [drm:drm_crtc_helper_set_config], modes are different, full mode set
[   92.390343] [drm:drm_mode_debug_printmodeline], Modeline 49:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[   92.390359] [drm:drm_mode_debug_printmodeline], Modeline 52:"" 0 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x0 0x6
[   92.390376] [drm:drm_crtc_helper_set_config], [CONNECTOR:13:LVDS-1] to [CRTC:10]
[   92.390387] [drm:drm_crtc_helper_set_config], attempting to set mode from userspace
[   92.390395] [drm:drm_mode_debug_printmodeline], Modeline 52:"" 0 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x0 0x6
[   92.390415] [drm:drm_crtc_helper_set_mode], [CRTC:10]
[   92.390432] nouveau  [     DRM] Setting dpms mode 3 on lvds encoder (output 1)
[   92.390446] nouveau  [     DRM] Calling LVDS script 6:
[   92.390459] nouveau  [     DRM] 0xC43B: Parsing digital output script table
[   92.910362] nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 2)
[   92.910423] nouveau  [     DRM] Setting dpms mode 3 on CRTC 1
[   92.920460] nouveau  [     DRM] CTRC mode on CRTC 1:
[   92.920469] [drm:drm_mode_debug_printmodeline], Modeline 53:"" 0 108000 1280 1368 1496 1712 1024 1027 1034 1063 0x0 0x6
[   92.924470] nouveau  [     DRM] vpll: n1 181 n2 1 m1 12 m2 1 log2p 1
[   92.924485] [drm:drm_crtc_helper_set_mode], [ENCODER:14:LVDS-14] set [MODE:52:]
[   92.924497] nouveau  [     DRM] Output mode on CRTC 1:
[   92.924502] [drm:drm_mode_debug_printmodeline], Modeline 37:"1400x1050" 0 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[   92.927538] nouveau  [     DRM] index 1
[   92.927962] nouveau  [     DRM] Setting dpms mode 0 on CRTC 1
[   92.937994] nouveau  [     DRM] Calling LVDS script 2:
[   92.938027] nouveau  [     DRM] 0xC468: Parsing digital output script table
[   92.954106] nouveau  [     DRM] Setting dpms mode 0 on lvds encoder (output 1)
[   92.954113] nouveau  [     DRM] Calling LVDS script 5:
[   92.954122] nouveau  [     DRM] 0xC3C4: Parsing digital output script table
[   93.162180] nouveau  [     DRM] Output LVDS-1 is running on CRTC 1 using output B
[   93.163218] [drm:drm_crtc_helper_set_config], Setting connector DPMS state to on
[   93.163228] [drm:drm_crtc_helper_set_config], 	[CONNECTOR:13:LVDS-1] set DPMS on
[   93.163240] nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 2)
[  102.534484] [drm:drm_mode_getconnector], [CONNECTOR:11:?]
[  102.534509] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1]
[  102.553618] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1] disconnected
[  102.558094] [drm:drm_mode_getconnector], [CONNECTOR:11:?]
[  102.558115] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1]
[  102.579086] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1] disconnected
[  102.584126] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  102.584147] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
[  102.622147] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  102.695697] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  102.764619] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  102.836618] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  102.836693] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[  102.836707] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[  102.900340] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
[  102.900357] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[  102.900368] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
[  102.900380] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
[  102.900391] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
[  102.900402] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
[  102.900413] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[  102.900424] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
[  102.900435] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
[  102.900446] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
[  102.900457] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
[  102.900468] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
[  102.900641] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  110.703223] [drm:drm_mode_getconnector], [CONNECTOR:11:?]
[  110.703252] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1]
[  110.722649] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1] disconnected
[  110.722683] [drm:drm_mode_getconnector], [CONNECTOR:11:?]
[  110.722694] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1]
[  110.740492] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1] disconnected
[  110.740579] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  110.740591] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
[  110.778975] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  110.816370] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  110.851302] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  110.889508] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  110.889596] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[  110.889611] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[  110.909947] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
[  110.909964] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[  110.909980] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
[  110.909995] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
[  110.910048] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
[  110.910065] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
[  110.910080] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[  110.910096] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
[  110.910111] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
[  110.910126] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
[  110.910141] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
[  110.910156] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
[  110.913729] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  131.320900] [drm:drm_mode_getconnector], [CONNECTOR:11:?]
[  131.320929] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1]
[  131.338148] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1] disconnected
[  131.338182] [drm:drm_mode_getconnector], [CONNECTOR:11:?]
[  131.338193] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1]
[  131.356693] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1] disconnected
[  131.356774] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  131.356786] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
[  131.395305] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  131.430273] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  131.468363] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  131.509045] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  131.509134] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[  131.509149] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[  131.527290] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
[  131.527308] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[  131.527324] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
[  131.527339] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
[  131.527354] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
[  131.527370] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
[  131.527385] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[  131.527400] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
[  131.527415] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
[  131.527430] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
[  131.527445] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
[  131.527460] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
[  131.527540] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  131.534932] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  131.534956] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
[  131.573568] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  131.608475] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  131.646596] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  131.687220] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  131.687308] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[  131.687323] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[  131.703993] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
[  131.704050] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[  131.704067] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
[  131.704082] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
[  131.704097] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
[  131.704113] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
[  131.704128] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[  131.704143] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
[  131.704158] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
[  131.704173] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
[  131.704188] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
[  131.704203] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
[  131.707739] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  131.710201] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  131.710223] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
[  131.748771] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  131.783681] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  131.821795] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  131.856735] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  131.856820] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[  131.856835] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[  131.874166] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
[  131.874182] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[  131.874197] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
[  131.874212] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
[  131.874227] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
[  131.874242] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
[  131.874258] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[  131.874273] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
[  131.874288] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
[  131.874303] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
[  131.874318] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
[  131.874333] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
[  131.874404] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  131.875903] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  131.875920] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
[  131.913423] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  131.967921] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  132.002844] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  132.040824] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  132.040911] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[  132.040926] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[  132.055473] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
[  132.055489] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[  132.055505] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
[  132.055520] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
[  132.055535] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
[  132.055550] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
[  132.055565] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[  132.055580] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
[  132.055595] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
[  132.055610] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
[  132.055625] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
[  132.055640] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
[  132.055722] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  132.058811] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  132.058831] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
[  132.096450] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  132.139071] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  132.173654] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  132.210682] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  132.210748] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[  132.210760] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[  132.229339] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
[  132.229354] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[  132.229366] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
[  132.229377] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
[  132.229388] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
[  132.229399] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
[  132.229410] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[  132.229421] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
[  132.229433] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
[  132.229444] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
[  132.229455] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
[  132.229466] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
[  132.229537] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  132.233524] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  132.233542] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
[  132.271311] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  132.305833] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  132.342864] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  132.381658] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  132.381725] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[  132.381737] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[  132.396988] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
[  132.397003] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[  132.397048] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
[  132.397059] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
[  132.397070] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
[  132.397082] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
[  132.397093] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[  132.397104] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
[  132.397115] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
[  132.397126] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
[  132.397137] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
[  132.397148] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
[  132.399778] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  132.402142] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  132.402161] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
[  132.440062] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  132.474669] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  132.511628] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  132.550471] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  132.550540] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[  132.550552] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[  132.566091] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
[  132.566106] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[  132.566118] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
[  132.566129] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
[  132.566140] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
[  132.566151] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
[  132.566162] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[  132.566173] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
[  132.566184] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
[  132.566196] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
[  132.566206] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
[  132.566218] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
[  132.566284] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  132.570085] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  132.570103] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
[  132.607785] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  132.642334] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  132.679221] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  132.713811] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  132.713875] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[  132.713886] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[  132.725540] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
[  132.725549] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[  132.725561] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
[  132.725572] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
[  132.725583] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
[  132.725594] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
[  132.725605] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[  132.725616] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
[  132.725628] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
[  132.725639] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
[  132.725650] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
[  132.725661] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
[  132.725721] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  132.726454] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  132.726467] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
[  132.763426] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  132.816007] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  132.852686] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  132.887280] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  132.887343] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[  132.887356] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[  132.902625] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
[  132.902638] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[  132.902650] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
[  132.902661] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
[  132.902672] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
[  132.902683] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
[  132.902694] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[  132.902706] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
[  132.902717] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
[  132.902728] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
[  132.902739] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
[  132.902750] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
[  132.902819] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  132.905770] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  132.905787] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
[  132.943062] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  132.983281] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  133.017851] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  133.054842] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  133.054908] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[  133.054920] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[  133.072664] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
[  133.072678] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[  133.072690] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
[  133.072701] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
[  133.072712] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
[  133.072723] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
[  133.072734] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[  133.072745] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
[  133.072756] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
[  133.072767] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
[  133.072778] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
[  133.072789] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
[  133.072857] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  133.076679] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  133.076699] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
[  133.114569] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  133.149166] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  133.186197] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  133.225114] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  133.225182] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[  133.225195] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[  133.240565] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
[  133.240580] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[  133.240591] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
[  133.240602] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
[  133.240613] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
[  133.240625] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
[  133.240636] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[  133.240647] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
[  133.240658] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
[  133.240669] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
[  133.240680] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
[  133.240691] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
[  133.240758] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  133.244910] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  133.244929] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
[  133.282773] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  133.317420] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  133.354333] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  133.389037] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  133.389100] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[  133.389112] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[  133.405755] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
[  133.405769] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[  133.405780] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
[  133.405791] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
[  133.405802] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
[  133.405814] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
[  133.405825] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[  133.405836] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
[  133.405847] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
[  133.405858] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
[  133.405869] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
[  133.405880] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
[  133.405942] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  138.772106] [drm:drm_mode_getconnector], [CONNECTOR:11:?]
[  138.772134] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1]
[  138.789095] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1] disconnected
[  138.789130] [drm:drm_mode_getconnector], [CONNECTOR:11:?]
[  138.789141] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1]
[  138.806238] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1] disconnected
[  138.806403] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  138.806415] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
[  138.844859] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  138.882293] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  138.917215] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  138.955247] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  138.955334] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[  138.955350] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[  138.975389] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
[  138.975406] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[  138.975422] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
[  138.975437] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
[  138.975452] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
[  138.975467] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
[  138.975483] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[  138.975498] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
[  138.975513] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
[  138.975528] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
[  138.975543] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
[  138.975558] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
[  138.975641] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  138.982123] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  138.982146] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
[  139.020565] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  139.055560] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  139.094134] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  139.129070] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  139.129156] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[  139.129171] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[  139.145324] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
[  139.145341] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[  139.145357] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
[  139.145372] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
[  139.145387] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
[  139.145402] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
[  139.145417] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[  139.145432] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
[  139.145447] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
[  139.145462] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
[  139.145477] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
[  139.145492] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
[  139.145563] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  139.148147] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  139.148163] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
[  139.185711] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  139.228627] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  139.267842] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  139.302381] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  139.302446] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[  139.302458] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[  139.317530] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
[  139.317543] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[  139.317555] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
[  139.317566] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
[  139.317577] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
[  139.317588] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
[  139.317599] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[  139.317610] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
[  139.317621] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
[  139.317632] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
[  139.317643] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
[  139.317654] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
[  139.317722] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  139.319673] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  139.319685] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
[  139.356801] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  139.391381] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  139.426584] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  139.473704] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  139.473773] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[  139.473785] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[  139.489075] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
[  139.489089] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[  139.489101] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
[  139.489112] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
[  139.489123] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
[  139.489134] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
[  139.489145] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[  139.489157] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
[  139.489168] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
[  139.489179] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
[  139.489190] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
[  139.489200] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
[  139.489268] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  139.489711] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  139.489721] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
[  139.529815] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  139.564552] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  139.601512] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  139.636123] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  139.636186] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[  139.636198] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[  139.648562] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
[  139.648571] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[  139.648583] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
[  139.648594] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
[  139.648605] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
[  139.648616] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
[  139.648627] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[  139.648638] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
[  139.648649] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
[  139.648660] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
[  139.648671] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
[  139.648682] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
[  139.648740] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  139.649182] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  139.649192] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
[  139.686088] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  139.732936] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  139.769559] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  139.804191] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  139.804255] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[  139.804268] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[  139.819167] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
[  139.819181] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[  139.819192] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
[  139.819203] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
[  139.819214] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
[  139.819226] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
[  139.819237] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[  139.819248] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
[  139.819259] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
[  139.819270] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
[  139.819281] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
[  139.819292] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
[  139.819359] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  139.821868] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  139.821880] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
[  139.858989] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  139.898838] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  139.933468] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  139.970384] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  139.970449] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[  139.970461] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[  139.988222] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
[  139.988235] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[  139.988247] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
[  139.988258] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
[  139.988269] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
[  139.988280] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
[  139.988291] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[  139.988302] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
[  139.988313] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
[  139.988324] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
[  139.988335] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
[  139.988346] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
[  139.988413] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  139.988849] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  139.988859] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
[  140.028919] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  140.066168] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  140.100770] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  140.140534] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  140.140605] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[  140.140618] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[  140.156441] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
[  140.156457] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[  140.156468] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
[  140.156479] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
[  140.156491] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
[  140.156502] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
[  140.156513] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[  140.156524] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
[  140.156535] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
[  140.156546] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
[  140.156557] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
[  140.156568] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
[  140.156635] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  140.161272] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  140.161294] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
[  140.199253] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  140.233834] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  140.270800] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  140.305426] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  140.305490] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[  140.305503] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[  140.317753] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
[  140.317764] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[  140.317775] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
[  140.317786] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
[  140.317797] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
[  140.317809] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
[  140.317820] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[  140.317831] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
[  140.317842] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
[  140.317853] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
[  140.317864] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
[  140.317875] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
[  140.317938] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  140.318784] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  140.318795] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
[  140.355684] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  140.406739] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  140.441316] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  140.478253] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  140.478318] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[  140.478332] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[  140.495234] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
[  140.495248] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[  140.495260] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
[  140.495271] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
[  140.495282] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
[  140.495293] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
[  140.495304] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[  140.495315] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
[  140.495327] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
[  140.495338] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
[  140.495349] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
[  140.495360] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
[  140.495429] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  140.495968] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  140.495978] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
[  140.536117] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  140.570680] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  140.607603] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  140.642262] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  140.642325] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[  140.642337] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[  140.654727] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
[  140.654737] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[  140.654749] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
[  140.654760] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
[  140.654771] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
[  140.654782] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
[  140.654793] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[  140.654804] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
[  140.654815] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
[  140.654826] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
[  140.654837] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
[  140.654848] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
[  140.654917] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  140.655668] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  140.655678] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
[  140.692605] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  140.744547] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  140.779138] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  140.827846] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  140.827924] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[  140.827938] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[  140.848314] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
[  140.848330] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[  140.848341] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
[  140.848353] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
[  140.848364] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
[  140.848375] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
[  140.848386] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[  140.848397] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
[  140.848408] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
[  140.848419] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
[  140.848430] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
[  140.848441] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
[  140.848515] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  162.856742] [drm:drm_mode_getconnector], [CONNECTOR:11:?]
[  162.856771] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1]
[  162.874093] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1] disconnected
[  162.874127] [drm:drm_mode_getconnector], [CONNECTOR:11:?]
[  162.874138] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1]
[  162.891082] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:11:VGA-1] disconnected
[  162.891165] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
[  162.891177] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1]
[  162.929567] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  162.964448] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  163.002812] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  163.043583] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 239
[  163.043672] nouveau 0000:01:00.0: LVDS-1: EDID block 0 invalid.
[  163.043687] nouveau E[     DRM] DDC responded, but no EDID for LVDS-1
[  163.060481] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:13:LVDS-1] probed modes :
[  163.060500] [drm:drm_mode_debug_printmodeline], Modeline 38:"1400x1050" 60 108000 1400 1448 1560 1688 1050 1051 1054 1066 0x48 0xa
[  163.060515] [drm:drm_mode_debug_printmodeline], Modeline 39:"1400x1050" 60 121750 1400 1488 1632 1864 1050 1053 1057 1089 0x40 0x6
[  163.060530] [drm:drm_mode_debug_printmodeline], Modeline 40:"1280x1024" 60 109000 1280 1368 1496 1712 1024 1027 1034 1063 0x40 0x6
[  163.060545] [drm:drm_mode_debug_printmodeline], Modeline 41:"1280x960" 60 101250 1280 1360 1488 1696 960 963 967 996 0x40 0x6
[  163.060560] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 60 81750 1152 1216 1336 1520 864 867 871 897 0x40 0x6
[  163.060575] [drm:drm_mode_debug_printmodeline], Modeline 43:"1024x768" 60 63500 1024 1072 1176 1328 768 771 775 798 0x40 0x6
[  163.060590] [drm:drm_mode_debug_printmodeline], Modeline 44:"800x600" 60 38250 800 832 912 1024 600 603 607 624 0x40 0x6
[  163.060605] [drm:drm_mode_debug_printmodeline], Modeline 46:"640x480" 59 23750 640 664 720 800 480 483 487 500 0x40 0x6
[  163.060620] [drm:drm_mode_debug_printmodeline], Modeline 45:"720x400" 60 22250 720 744 808 896 400 403 413 417 0x40 0x6
[  163.060635] [drm:drm_mode_debug_printmodeline], Modeline 47:"640x400" 60 20000 640 664 720 800 400 403 409 417 0x40 0x6
[  163.060650] [drm:drm_mode_debug_printmodeline], Modeline 48:"640x350" 60 17500 640 664 720 800 350 353 363 366 0x40 0x6
[  163.060733] [drm:drm_mode_getconnector], [CONNECTOR:13:?]
