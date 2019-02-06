From: Dan Espen <dan1espen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: 640x480 does not fill screen
Date: Wed, 06 Feb 2019 15:28:09 -0500
Message-ID: <ico97o64rq.fsf@home.home>
References: <icmun8j2to.fsf@home.home>
 <CAKb7UvjPd4QexPZe+XBAeEugcJOsZS1XqEv=mKnR3XbZeRYcfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
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
To: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--=-=-=
Content-Type: text/plain

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> writes:

> It would be useful to know how the screen is connected. Also please
> grab the monitor's EDID from /sys/class/drm/cardN-connector/edid and
> attach it here. It would also be interesting to get a boot with
> "drm.debug=0x1e nouveau.debug=disp=trace" which has the modeswitch in
> question.

The screen is connected using the MDP port.
I don't find any cardN-connector directory,
the closest match is:

/sys/class/drm/card0-DP-1/edid

which contains:


--=-=-=
Content-Type: application/octet-stream
Content-Disposition: inline; filename=edid-nv
Content-Transfer-Encoding: base64

AP///////wAQrO5ASTA3NyQbAQS1PiJ4OgiloldPoigPUFSlSwDRwKlAgYCBAHFPAQEBAQEBTdAA
oPBwPoAwIDUAbVUhAAAaAAAA/wBNVEtUMTc5ODc3MEkKAAAA/ABERUxMIFMyODE3UQogAAAA/QAd
Sx+MNgEKICAgICAgAbECAx3xUBAfIAUUBBMSEQMCFhUHBgEjCQcHgwEAAKNmAKDwcB+AMCA1AG1V
IQAAGlZeAKCgoClQMCA1AG1VIQAAGk1sgKBwcD6AMCA6AG1VIQAAGhFEAKCAACVQMCA2AG1VIQAA
GgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA2w==
--=-=-=
Content-Type: text/plain


Here is the content of ~/.local//share/xorg/Xorg.0.log


--=-=-=
Content-Type: text/plain
Content-Disposition: inline; filename=Xorg.0.log

[    20.532] 
X.Org X Server 1.20.3
X Protocol Version 11, Revision 0
[    20.532] Build Operating System:  4.19.10-300.fc29.x86_64 
[    20.532] Current Operating System: Linux home.home 4.20.4-200.fc29.x86_64 #1 SMP Wed Jan 23 16:11:28 UTC 2019 x86_64
[    20.532] Kernel command line: BOOT_IMAGE=/vmlinuz-4.20.4-200.fc29.x86_64 root=UUID=5f238074-3db6-4f91-9b91-e2de08d085cc ro quiet vga=0x318 LANG=en_US.UTF-8 drm.debug=0x1e nouveau.debug=disp=trace
[    20.532] Build Date: 11 January 2019  12:47:38PM
[    20.532] Build ID: xorg-x11-server 1.20.3-3.fc29 
[    20.532] Current version of pixman: 0.34.0
[    20.532] 	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
[    20.532] Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[    20.532] (==) Log file: "/home/dane/.local/share/xorg/Xorg.0.log", Time: Wed Feb  6 15:11:03 2019
[    20.533] (==) Using config directory: "/etc/X11/xorg.conf.d"
[    20.533] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[    20.534] (==) No Layout section.  Using the first Screen section.
[    20.534] (==) No screen section available. Using defaults.
[    20.534] (**) |-->Screen "Default Screen Section" (0)
[    20.534] (**) |   |-->Monitor "<default monitor>"
[    20.535] (==) No monitor specified for screen "Default Screen Section".
	Using a default monitor configuration.
[    20.535] (==) Automatically adding devices
[    20.535] (==) Automatically enabling devices
[    20.535] (==) Automatically adding GPU devices
[    20.535] (==) Automatically binding GPU devices
[    20.536] (==) Max clients allowed: 256, resource mask: 0x1fffff
[    20.536] (==) FontPath set to:
	catalogue:/etc/X11/fontpath.d,
	built-ins
[    20.536] (==) ModulePath set to "/usr/lib64/xorg/modules"
[    20.536] (II) The server relies on udev to provide the list of input devices.
	If no devices become available, reconfigure udev or disable AutoAddDevices.
[    20.536] (II) Loader magic: 0x56157d71be00
[    20.536] (II) Module ABI versions:
[    20.536] 	X.Org ANSI C Emulation: 0.4
[    20.536] 	X.Org Video Driver: 24.0
[    20.536] 	X.Org XInput driver : 24.1
[    20.536] 	X.Org Server Extension : 10.0
[    20.537] (++) using VT number 1

[    20.540] (II) systemd-logind: took control of session /org/freedesktop/login1/session/_31
[    20.540] (II) xfree86: Adding drm device (/dev/dri/card0)
[    20.541] (II) systemd-logind: got fd for /dev/dri/card0 226:0 fd 11 paused 0
[    20.546] (--) PCI:*(1@0:0:0) 10de:1c82:19da:a454 rev 161, Mem @ 0xfb000000/16777216, 0xc0000000/268435456, 0xde000000/33554432, I/O @ 0x0000ef00/128, BIOS @ 0x????????/65536
[    20.546] (II) LoadModule: "glx"
[    20.547] (II) Loading /usr/lib64/xorg/modules/extensions/libglx.so
[    20.561] (II) Module glx: vendor="X.Org Foundation"
[    20.561] 	compiled for 1.20.3, module version = 1.0.0
[    20.561] 	ABI class: X.Org Server Extension, version 10.0
[    20.683] (==) Matched modesetting as autoconfigured driver 0
[    20.683] (==) Matched fbdev as autoconfigured driver 1
[    20.683] (==) Matched vesa as autoconfigured driver 2
[    20.683] (==) Assigned the driver to the xf86ConfigLayout
[    20.683] (II) LoadModule: "modesetting"
[    20.685] (II) Loading /usr/lib64/xorg/modules/drivers/modesetting_drv.so
[    20.686] (II) Module modesetting: vendor="X.Org Foundation"
[    20.686] 	compiled for 1.20.3, module version = 1.20.3
[    20.686] 	Module class: X.Org Video Driver
[    20.686] 	ABI class: X.Org Video Driver, version 24.0
[    20.686] (II) LoadModule: "fbdev"
[    20.687] (II) Loading /usr/lib64/xorg/modules/drivers/fbdev_drv.so
[    20.687] (II) Module fbdev: vendor="X.Org Foundation"
[    20.687] 	compiled for 1.20.0, module version = 0.5.0
[    20.687] 	Module class: X.Org Video Driver
[    20.687] 	ABI class: X.Org Video Driver, version 24.0
[    20.687] (II) LoadModule: "vesa"
[    20.687] (II) Loading /usr/lib64/xorg/modules/drivers/vesa_drv.so
[    20.689] (II) Module vesa: vendor="X.Org Foundation"
[    20.689] 	compiled for 1.20.0, module version = 2.4.0
[    20.689] 	Module class: X.Org Video Driver
[    20.689] 	ABI class: X.Org Video Driver, version 24.0
[    20.689] (II) modesetting: Driver for Modesetting Kernel Drivers: kms
[    20.689] (II) FBDEV: driver for framebuffer: fbdev
[    20.689] (II) VESA: driver for VESA chipsets: vesa
[    20.689] xf86EnableIOPorts: failed to set IOPL for I/O (Operation not permitted)
[    20.689] (II) modeset(0): using drv /dev/dri/card0
[    20.689] (WW) Falling back to old probe method for fbdev
[    20.689] (II) Loading sub module "fbdevhw"
[    20.689] (II) LoadModule: "fbdevhw"
[    20.689] (II) Loading /usr/lib64/xorg/modules/libfbdevhw.so
[    20.690] (II) Module fbdevhw: vendor="X.Org Foundation"
[    20.690] 	compiled for 1.20.3, module version = 0.0.2
[    20.690] 	ABI class: X.Org Video Driver, version 24.0
[    20.690] (EE) open /dev/fb0: Permission denied
[    20.690] (WW) VGA arbiter: cannot open kernel arbiter, no multi-card support
[    20.690] (II) modeset(0): Creating default Display subsection in Screen section
	"Default Screen Section" for depth/fbbpp 24/32
[    20.690] (==) modeset(0): Depth 24, (==) framebuffer bpp 32
[    20.690] (==) modeset(0): RGB weight 888
[    20.690] (==) modeset(0): Default visual is TrueColor
[    20.690] (II) Loading sub module "glamoregl"
[    20.690] (II) LoadModule: "glamoregl"
[    20.690] (II) Loading /usr/lib64/xorg/modules/libglamoregl.so
[    20.705] (II) Module glamoregl: vendor="X.Org Foundation"
[    20.705] 	compiled for 1.20.3, module version = 1.0.1
[    20.705] 	ABI class: X.Org ANSI C Emulation, version 0.4
[    21.019] (II) modeset(0): glamor X acceleration enabled on NV137
[    21.019] (II) modeset(0): glamor initialized
[    21.021] (II) modeset(0): Output DVI-D-1 has no monitor section
[    21.022] (II) modeset(0): Output HDMI-1 has no monitor section
[    21.030] (II) modeset(0): Output DP-1 has no monitor section
[    21.032] (II) modeset(0): EDID for output DVI-D-1
[    21.034] (II) modeset(0): EDID for output HDMI-1
[    21.042] (II) modeset(0): EDID for output DP-1
[    21.042] (II) modeset(0): Manufacturer: DEL  Model: 40ee  Serial#: 926363721
[    21.042] (II) modeset(0): Year: 2017  Week: 36
[    21.042] (II) modeset(0): EDID Version: 1.4
[    21.042] (II) modeset(0): Digital Display Input
[    21.042] (II) modeset(0): 10 bits per channel
[    21.042] (II) modeset(0): Digital interface is DisplayPort
[    21.042] (II) modeset(0): Max Image Size [cm]: horiz.: 62  vert.: 34
[    21.042] (II) modeset(0): Gamma: 2.20
[    21.042] (II) modeset(0): DPMS capabilities: Off
[    21.042] (II) modeset(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4 YCrCb 4:2:2
[    21.042] (II) modeset(0): First detailed timing is preferred mode
[    21.042] (II) modeset(0): Preferred mode is native pixel format and refresh rate
[    21.042] (II) modeset(0): redX: 0.633 redY: 0.340   greenX: 0.311 greenY: 0.633
[    21.042] (II) modeset(0): blueX: 0.158 blueY: 0.061   whiteX: 0.313 whiteY: 0.329
[    21.042] (II) modeset(0): Supported established timings:
[    21.042] (II) modeset(0): 720x400@70Hz
[    21.042] (II) modeset(0): 640x480@60Hz
[    21.042] (II) modeset(0): 640x480@75Hz
[    21.042] (II) modeset(0): 800x600@60Hz
[    21.042] (II) modeset(0): 800x600@75Hz
[    21.042] (II) modeset(0): 1024x768@60Hz
[    21.042] (II) modeset(0): 1024x768@75Hz
[    21.042] (II) modeset(0): 1280x1024@75Hz
[    21.042] (II) modeset(0): Manufacturer's mask: 0
[    21.042] (II) modeset(0): Supported standard timings:
[    21.042] (II) modeset(0): #0: hsize: 1920  vsize 1080  refresh: 60  vid: 49361
[    21.042] (II) modeset(0): #1: hsize: 1600  vsize 1200  refresh: 60  vid: 16553
[    21.042] (II) modeset(0): #2: hsize: 1280  vsize 1024  refresh: 60  vid: 32897
[    21.042] (II) modeset(0): #3: hsize: 1280  vsize 800  refresh: 60  vid: 129
[    21.042] (II) modeset(0): #4: hsize: 1152  vsize 864  refresh: 75  vid: 20337
[    21.042] (II) modeset(0): Supported detailed timing:
[    21.042] (II) modeset(0): clock: 533.2 MHz   Image Size:  621 x 341 mm
[    21.042] (II) modeset(0): h_active: 3840  h_sync: 3888  h_sync_end 3920 h_blank_end 4000 h_border: 0
[    21.042] (II) modeset(0): v_active: 2160  v_sync: 2163  v_sync_end 2168 v_blanking: 2222 v_border: 0
[    21.042] (II) modeset(0): Serial No: MTKT1798770I
[    21.042] (II) modeset(0): Monitor name: DELL S2817Q
[    21.042] (II) modeset(0): Ranges: V min: 29 V max: 75 Hz, H min: 31 H max: 140 kHz, PixClock max 545 MHz
[    21.042] (II) modeset(0): Supported detailed timing:
[    21.042] (II) modeset(0): clock: 262.8 MHz   Image Size:  621 x 341 mm
[    21.042] (II) modeset(0): h_active: 3840  h_sync: 3888  h_sync_end 3920 h_blank_end 4000 h_border: 0
[    21.042] (II) modeset(0): v_active: 2160  v_sync: 2163  v_sync_end 2168 v_blanking: 2191 v_border: 0
[    21.042] (II) modeset(0): Supported detailed timing:
[    21.042] (II) modeset(0): clock: 241.5 MHz   Image Size:  621 x 341 mm
[    21.042] (II) modeset(0): h_active: 2560  h_sync: 2608  h_sync_end 2640 h_blank_end 2720 h_border: 0
[    21.042] (II) modeset(0): v_active: 1440  v_sync: 1443  v_sync_end 1448 v_blanking: 1481 v_border: 0
[    21.042] (II) modeset(0): Supported detailed timing:
[    21.042] (II) modeset(0): clock: 277.2 MHz   Image Size:  621 x 341 mm
[    21.042] (II) modeset(0): h_active: 1920  h_sync: 1968  h_sync_end 2000 h_blank_end 2080 h_border: 0
[    21.042] (II) modeset(0): v_active: 2160  v_sync: 2163  v_sync_end 2173 v_blanking: 2222 v_border: 0
[    21.042] (II) modeset(0): Supported detailed timing:
[    21.042] (II) modeset(0): clock: 174.2 MHz   Image Size:  621 x 341 mm
[    21.042] (II) modeset(0): h_active: 2048  h_sync: 2096  h_sync_end 2128 h_blank_end 2208 h_border: 0
[    21.042] (II) modeset(0): v_active: 1280  v_sync: 1283  v_sync_end 1289 v_blanking: 1317 v_border: 0
[    21.042] (II) modeset(0): Number of EDID sections to follow: 1
[    21.043] (II) modeset(0): EDID (in hex):
[    21.043] (II) modeset(0): 	00ffffffffffff0010acee4049303737
[    21.043] (II) modeset(0): 	241b0104b53e22783a08a5a2574fa228
[    21.043] (II) modeset(0): 	0f5054a54b00d1c0a94081808100714f
[    21.043] (II) modeset(0): 	0101010101014dd000a0f0703e803020
[    21.043] (II) modeset(0): 	35006d552100001a000000ff004d544b
[    21.043] (II) modeset(0): 	5431373938373730490a000000fc0044
[    21.043] (II) modeset(0): 	454c4c205332383137510a20000000fd
[    21.043] (II) modeset(0): 	001d4b1f8c36010a20202020202001b1
[    21.043] (II) modeset(0): 	02031df150101f200514041312110302
[    21.043] (II) modeset(0): 	16150706012309070783010000a36600
[    21.043] (II) modeset(0): 	a0f0701f80302035006d552100001a56
[    21.043] (II) modeset(0): 	5e00a0a0a02950302035006d55210000
[    21.043] (II) modeset(0): 	1a4d6c80a070703e8030203a006d5521
[    21.043] (II) modeset(0): 	00001a114400a080002550302036006d
[    21.043] (II) modeset(0): 	552100001a0000000000000000000000
[    21.043] (II) modeset(0): 	000000000000000000000000000000db
[    21.043] (II) modeset(0): Not using default mode "3840x2160" (bad mode clock/interlace/doublescan)
[    21.043] (II) modeset(0): Not using default mode "2560x1440" (bad mode clock/interlace/doublescan)
[    21.043] (II) modeset(0): Printing probed modes for output DP-1
[    21.043] (II) modeset(0): Modeline "3840x2160"x60.0  533.25  3840 3888 3920 4000  2160 2163 2168 2222 +hsync -vsync (133.3 kHz eP)
[    21.043] (II) modeset(0): Modeline "3840x2160"x60.0  533.00  3840 3888 3920 4000  2160 2163 2168 2222 +hsync -vsync (133.2 kHz d)
[    21.043] (II) modeset(0): Modeline "3840x2160"x30.0  262.75  3840 3888 3920 4000  2160 2163 2168 2191 +hsync -vsync (65.7 kHz e)
[    21.043] (II) modeset(0): Modeline "3200x1800"x60.0  492.00  3200 3456 3800 4400  1800 1803 1808 1865 -hsync +vsync (111.8 kHz d)
[    21.043] (II) modeset(0): Modeline "3200x1800"x59.9  373.00  3200 3248 3280 3360  1800 1803 1808 1852 +hsync -vsync (111.0 kHz d)
[    21.043] (II) modeset(0): Modeline "2880x1620"x60.0  396.25  2880 3096 3408 3936  1620 1623 1628 1679 -hsync +vsync (100.7 kHz d)
[    21.043] (II) modeset(0): Modeline "2880x1620"x60.0  303.75  2880 2928 2960 3040  1620 1623 1628 1666 +hsync -vsync (99.9 kHz d)
[    21.043] (II) modeset(0): Modeline "1920x2160"x60.0  277.25  1920 1968 2000 2080  2160 2163 2173 2222 +hsync -vsync (133.3 kHz e)
[    21.043] (II) modeset(0): Modeline "2560x1600"x60.0  348.50  2560 2760 3032 3504  1600 1603 1609 1658 -hsync +vsync (99.5 kHz d)
[    21.043] (II) modeset(0): Modeline "2560x1600"x60.0  268.50  2560 2608 2640 2720  1600 1603 1609 1646 +hsync -vsync (98.7 kHz d)
[    21.043] (II) modeset(0): Modeline "2560x1440"x60.0  469.12  2560 2584 2600 2640  1440 1441 1444 1481 doublescan +hsync -vsync (177.7 kHz d)
[    21.043] (II) modeset(0): Modeline "2560x1440"x60.0  312.25  2560 2752 3024 3488  1440 1443 1448 1493 -hsync +vsync (89.5 kHz d)
[    21.043] (II) modeset(0): Modeline "2560x1440"x60.0  241.50  2560 2608 2640 2720  1440 1443 1448 1481 +hsync -vsync (88.8 kHz e)
[    21.043] (II) modeset(0): Modeline "2048x1536"x75.0  340.48  2048 2216 2440 2832  1536 1537 1540 1603 -hsync +vsync (120.2 kHz d)
[    21.043] (II) modeset(0): Modeline "2048x1536"x60.0  266.95  2048 2200 2424 2800  1536 1537 1540 1589 -hsync +vsync (95.3 kHz d)
[    21.043] (II) modeset(0): Modeline "1920x1440"x75.0  297.00  1920 2064 2288 2640  1440 1441 1444 1500 -hsync +vsync (112.5 kHz d)
[    21.043] (II) modeset(0): Modeline "1920x1440"x60.0  234.00  1920 2048 2256 2600  1440 1441 1444 1500 -hsync +vsync (90.0 kHz d)
[    21.043] (II) modeset(0): Modeline "2048x1280"x59.9  174.25  2048 2096 2128 2208  1280 1283 1289 1317 +hsync -vsync (78.9 kHz e)
[    21.043] (II) modeset(0): Modeline "1856x1392"x75.0  288.00  1856 1984 2208 2560  1392 1393 1396 1500 -hsync +vsync (112.5 kHz d)
[    21.043] (II) modeset(0): Modeline "1856x1392"x60.0  218.30  1856 1952 2176 2528  1392 1393 1396 1439 -hsync +vsync (86.4 kHz d)
[    21.043] (II) modeset(0): Modeline "1792x1344"x75.0  261.00  1792 1888 2104 2456  1344 1345 1348 1417 -hsync +vsync (106.3 kHz d)
[    21.043] (II) modeset(0): Modeline "1792x1344"x60.0  204.80  1792 1920 2120 2448  1344 1345 1348 1394 -hsync +vsync (83.7 kHz d)
[    21.043] (II) modeset(0): Modeline "2048x1152"x60.0  406.50  2048 2220 2444 2840  1152 1153 1156 1193 doublescan -hsync +vsync (143.1 kHz d)
[    21.043] (II) modeset(0): Modeline "2048x1152"x60.0  302.50  2048 2072 2088 2128  1152 1153 1156 1185 doublescan +hsync -vsync (142.2 kHz d)
[    21.043] (II) modeset(0): Modeline "2048x1152"x59.9  197.00  2048 2184 2400 2752  1152 1155 1160 1195 -hsync +vsync (71.6 kHz d)
[    21.043] (II) modeset(0): Modeline "2048x1152"x59.9  156.75  2048 2096 2128 2208  1152 1155 1160 1185 +hsync -vsync (71.0 kHz d)
[    21.043] (II) modeset(0): Modeline "1920x1200"x59.9  193.25  1920 2056 2256 2592  1200 1203 1209 1245 -hsync +vsync (74.6 kHz d)
[    21.043] (II) modeset(0): Modeline "1920x1200"x60.0  154.00  1920 1968 2000 2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz d)
[    21.043] (II) modeset(0): Modeline "1920x1080"x60.0  356.38  1920 2080 2288 2656  1080 1081 1084 1118 doublescan -hsync +vsync (134.2 kHz d)
[    21.043] (II) modeset(0): Modeline "1920x1080"x60.0  266.50  1920 1944 1960 2000  1080 1081 1084 1111 doublescan +hsync -vsync (133.2 kHz d)
[    21.043] (II) modeset(0): Modeline "1920x1080"x60.0  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync (67.2 kHz d)
[    21.043] (II) modeset(0): Modeline "1920x1080"x60.0  148.50  1920 2008 2052 2200  1080 1084 1089 1125 -hsync -vsync (67.5 kHz e)
[    21.043] (II) modeset(0): Modeline "1920x1080"x60.0  148.50  1920 2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz e)
[    21.043] (II) modeset(0): Modeline "1920x1080"x50.0  148.50  1920 2448 2492 2640  1080 1084 1089 1125 +hsync +vsync (56.2 kHz e)
[    21.043] (II) modeset(0): Modeline "1920x1080"x59.9  148.35  1920 2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (67.4 kHz e)
[    21.043] (II) modeset(0): Modeline "1920x1080"x59.9  138.50  1920 1968 2000 2080  1080 1083 1088 1111 +hsync -vsync (66.6 kHz d)
[    21.043] (II) modeset(0): Modeline "1920x1080i"x60.0   74.25  1920 2008 2052 2200  1080 1084 1094 1125 interlace +hsync +vsync (33.8 kHz e)
[    21.043] (II) modeset(0): Modeline "1920x1080i"x50.0   74.25  1920 2448 2492 2640  1080 1084 1094 1125 interlace +hsync +vsync (28.1 kHz e)
[    21.043] (II) modeset(0): Modeline "1920x1080"x24.0   74.25  1920 2558 2602 2750  1080 1084 1089 1125 +hsync +vsync (27.0 kHz e)
[    21.043] (II) modeset(0): Modeline "1920x1080i"x59.9   74.18  1920 2008 2052 2200  1080 1084 1094 1125 interlace +hsync +vsync (33.7 kHz e)
[    21.043] (II) modeset(0): Modeline "1920x1080"x24.0   74.18  1920 2558 2602 2750  1080 1084 1089 1125 +hsync +vsync (27.0 kHz e)
[    21.043] (II) modeset(0): Modeline "1600x1200"x75.0  202.50  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (93.8 kHz d)
[    21.043] (II) modeset(0): Modeline "1600x1200"x70.0  189.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (87.5 kHz d)
[    21.043] (II) modeset(0): Modeline "1600x1200"x65.0  175.50  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (81.2 kHz d)
[    21.043] (II) modeset(0): Modeline "1600x1200"x60.0  162.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz e)
[    21.043] (II) modeset(0): Modeline "1680x1050"x60.0  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz d)
[    21.043] (II) modeset(0): Modeline "1680x1050"x59.9  119.00  1680 1728 1760 1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz d)
[    21.043] (II) modeset(0): Modeline "1400x1050"x74.8  155.80  1400 1464 1784 1912  1050 1052 1064 1090 +hsync +vsync (81.5 kHz d)
[    21.044] (II) modeset(0): Modeline "1400x1050"x60.0  122.00  1400 1488 1640 1880  1050 1052 1064 1082 +hsync +vsync (64.9 kHz d)
[    21.044] (II) modeset(0): Modeline "1600x900"x60.0  246.00  1600 1728 1900 2200  900 901 904 932 doublescan -hsync +vsync (111.8 kHz d)
[    21.044] (II) modeset(0): Modeline "1600x900"x59.9  186.50  1600 1624 1640 1680  900 901 904 926 doublescan +hsync -vsync (111.0 kHz d)
[    21.044] (II) modeset(0): Modeline "1600x900"x59.9  118.25  1600 1696 1856 2112  900 903 908 934 -hsync +vsync (56.0 kHz d)
[    21.044] (II) modeset(0): Modeline "1600x900"x59.8   97.50  1600 1648 1680 1760  900 903 908 926 +hsync -vsync (55.4 kHz d)
[    21.044] (II) modeset(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    21.044] (II) modeset(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    21.044] (II) modeset(0): Modeline "1400x900"x60.0  103.50  1400 1480 1624 1848  900 903 913 934 -hsync +vsync (56.0 kHz d)
[    21.044] (II) modeset(0): Modeline "1400x900"x59.9   86.50  1400 1448 1480 1560  900 903 913 926 +hsync -vsync (55.4 kHz d)
[    21.044] (II) modeset(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz d)
[    21.044] (II) modeset(0): Modeline "1440x810"x60.0  198.12  1440 1548 1704 1968  810 811 814 839 doublescan -hsync +vsync (100.7 kHz d)
[    21.044] (II) modeset(0): Modeline "1440x810"x60.0  151.88  1440 1464 1480 1520  810 811 814 833 doublescan +hsync -vsync (99.9 kHz d)
[    21.044] (II) modeset(0): Modeline "1368x768"x59.9   85.25  1368 1440 1576 1784  768 771 781 798 -hsync +vsync (47.8 kHz d)
[    21.044] (II) modeset(0): Modeline "1368x768"x59.9   72.25  1368 1416 1448 1528  768 771 781 790 +hsync -vsync (47.3 kHz d)
[    21.044] (II) modeset(0): Modeline "1280x800"x60.0  174.25  1280 1380 1516 1752  800 801 804 829 doublescan -hsync +vsync (99.5 kHz d)
[    21.044] (II) modeset(0): Modeline "1280x800"x60.0  134.25  1280 1304 1320 1360  800 801 804 823 doublescan +hsync -vsync (98.7 kHz d)
[    21.044] (II) modeset(0): Modeline "1280x800"x59.8   83.50  1280 1352 1480 1680  800 803 809 831 -hsync +vsync (49.7 kHz e)
[    21.044] (II) modeset(0): Modeline "1280x800"x59.9   71.00  1280 1328 1360 1440  800 803 809 823 +hsync -vsync (49.3 kHz d)
[    21.044] (II) modeset(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    21.044] (II) modeset(0): Modeline "1280x720"x60.0  156.12  1280 1376 1512 1744  720 721 724 746 doublescan -hsync +vsync (89.5 kHz d)
[    21.044] (II) modeset(0): Modeline "1280x720"x60.0  120.75  1280 1304 1320 1360  720 721 724 740 doublescan +hsync -vsync (88.8 kHz d)
[    21.044] (II) modeset(0): Modeline "1280x720"x59.9   74.50  1280 1344 1472 1664  720 723 728 748 -hsync +vsync (44.8 kHz d)
[    21.044] (II) modeset(0): Modeline "1280x720"x60.0   74.25  1280 1390 1430 1650  720 725 730 750 +hsync +vsync (45.0 kHz e)
[    21.044] (II) modeset(0): Modeline "1280x720"x50.0   74.25  1280 1720 1760 1980  720 725 730 750 +hsync +vsync (37.5 kHz e)
[    21.044] (II) modeset(0): Modeline "1280x720"x59.9   74.18  1280 1390 1430 1650  720 725 730 750 +hsync +vsync (45.0 kHz e)
[    21.044] (II) modeset(0): Modeline "1280x720"x59.7   63.75  1280 1328 1360 1440  720 723 728 741 +hsync -vsync (44.3 kHz d)
[    21.044] (II) modeset(0): Modeline "1024x768"x75.0  170.24  1024 1108 1220 1416  768 768 770 801 doublescan -hsync +vsync (120.2 kHz d)
[    21.044] (II) modeset(0): Modeline "1024x768"x60.0  133.47  1024 1100 1212 1400  768 768 770 794 doublescan -hsync +vsync (95.3 kHz d)
[    21.044] (II) modeset(0): Modeline "1024x768"x75.0   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[    21.044] (II) modeset(0): Modeline "1024x768"x70.1   75.00  1024 1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz d)
[    21.044] (II) modeset(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    21.044] (II) modeset(0): Modeline "960x720"x75.0  148.50  960 1032 1144 1320  720 720 722 750 doublescan -hsync +vsync (112.5 kHz d)
[    21.044] (II) modeset(0): Modeline "960x720"x60.0  117.00  960 1024 1128 1300  720 720 722 750 doublescan -hsync +vsync (90.0 kHz d)
[    21.044] (II) modeset(0): Modeline "928x696"x75.0  144.00  928 992 1104 1280  696 696 698 750 doublescan -hsync +vsync (112.5 kHz d)
[    21.044] (II) modeset(0): Modeline "928x696"x60.1  109.15  928 976 1088 1264  696 696 698 719 doublescan -hsync +vsync (86.4 kHz d)
[    21.044] (II) modeset(0): Modeline "896x672"x75.0  130.50  896 944 1052 1228  672 672 674 708 doublescan -hsync +vsync (106.3 kHz d)
[    21.044] (II) modeset(0): Modeline "896x672"x60.0  102.40  896 960 1060 1224  672 672 674 697 doublescan -hsync +vsync (83.7 kHz d)
[    21.044] (II) modeset(0): Modeline "1024x576"x60.0   98.50  1024 1092 1200 1376  576 577 580 597 doublescan -hsync +vsync (71.6 kHz d)
[    21.044] (II) modeset(0): Modeline "1024x576"x60.0   78.38  1024 1048 1064 1104  576 577 580 592 doublescan +hsync -vsync (71.0 kHz d)
[    21.044] (II) modeset(0): Modeline "1024x576"x59.9   46.50  1024 1064 1160 1296  576 579 584 599 -hsync +vsync (35.9 kHz d)
[    21.044] (II) modeset(0): Modeline "1024x576"x59.8   42.00  1024 1072 1104 1184  576 579 584 593 +hsync -vsync (35.5 kHz d)
[    21.044] (II) modeset(0): Modeline "960x600"x59.9   96.62  960 1028 1128 1296  600 601 604 622 doublescan -hsync +vsync (74.6 kHz d)
[    21.044] (II) modeset(0): Modeline "960x600"x60.0   77.00  960 984 1000 1040  600 601 604 617 doublescan +hsync -vsync (74.0 kHz d)
[    21.044] (II) modeset(0): Modeline "832x624"x74.6   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz d)
[    21.044] (II) modeset(0): Modeline "960x540"x60.0   86.50  960 1024 1124 1288  540 541 544 560 doublescan -hsync +vsync (67.2 kHz d)
[    21.044] (II) modeset(0): Modeline "960x540"x60.0   69.25  960 984 1000 1040  540 541 544 555 doublescan +hsync -vsync (66.6 kHz d)
[    21.044] (II) modeset(0): Modeline "960x540"x59.6   40.75  960 992 1088 1216  540 543 548 562 -hsync +vsync (33.5 kHz d)
[    21.044] (II) modeset(0): Modeline "960x540"x59.8   37.25  960 1008 1040 1120  540 543 548 556 +hsync -vsync (33.3 kHz d)
[    21.044] (II) modeset(0): Modeline "800x600"x75.0  101.25  800 832 928 1080  600 600 602 625 doublescan +hsync +vsync (93.8 kHz d)
[    21.044] (II) modeset(0): Modeline "800x600"x70.0   94.50  800 832 928 1080  600 600 602 625 doublescan +hsync +vsync (87.5 kHz d)
[    21.044] (II) modeset(0): Modeline "800x600"x65.0   87.75  800 832 928 1080  600 600 602 625 doublescan +hsync +vsync (81.2 kHz d)
[    21.044] (II) modeset(0): Modeline "800x600"x60.0   81.00  800 832 928 1080  600 600 602 625 doublescan +hsync +vsync (75.0 kHz d)
[    21.044] (II) modeset(0): Modeline "800x600"x72.2   50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz d)
[    21.044] (II) modeset(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz e)
[    21.044] (II) modeset(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz e)
[    21.044] (II) modeset(0): Modeline "800x600"x56.2   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz d)
[    21.044] (II) modeset(0): Modeline "840x525"x60.0   73.12  840 892 980 1120  525 526 529 544 doublescan -hsync +vsync (65.3 kHz d)
[    21.044] (II) modeset(0): Modeline "840x525"x59.9   59.50  840 864 880 920  525 526 529 540 doublescan +hsync -vsync (64.7 kHz d)
[    21.044] (II) modeset(0): Modeline "864x486"x59.9   32.50  864 888 968 1072  486 489 494 506 -hsync +vsync (30.3 kHz d)
[    21.044] (II) modeset(0): Modeline "864x486"x59.6   30.50  864 912 944 1024  486 489 494 500 +hsync -vsync (29.8 kHz d)
[    21.044] (II) modeset(0): Modeline "720x576"x50.0   27.00  720 732 796 864  576 581 586 625 -hsync -vsync (31.2 kHz e)
[    21.044] (II) modeset(0): Modeline "720x576i"x50.0   13.50  720 732 795 864  576 580 586 625 interlace -hsync -vsync (15.6 kHz e)
[    21.044] (II) modeset(0): Modeline "700x525"x74.8   77.90  700 732 892 956  525 526 532 545 doublescan +hsync +vsync (81.5 kHz d)
[    21.044] (II) modeset(0): Modeline "700x525"x60.0   61.00  700 744 820 940  525 526 532 541 doublescan +hsync +vsync (64.9 kHz d)
[    21.044] (II) modeset(0): Modeline "800x450"x59.9   59.12  800 848 928 1056  450 451 454 467 doublescan -hsync +vsync (56.0 kHz d)
[    21.044] (II) modeset(0): Modeline "800x450"x59.8   48.75  800 824 840 880  450 451 454 463 doublescan +hsync -vsync (55.4 kHz d)
[    21.044] (II) modeset(0): Modeline "720x480"x60.0   27.03  720 736 798 858  480 489 495 525 -hsync -vsync (31.5 kHz e)
[    21.044] (II) modeset(0): Modeline "720x480"x59.9   27.00  720 736 798 858  480 489 495 525 -hsync -vsync (31.5 kHz e)
[    21.044] (II) modeset(0): Modeline "720x480i"x60.0   13.51  720 739 801 858  480 488 494 525 interlace -hsync -vsync (15.8 kHz e)
[    21.044] (II) modeset(0): Modeline "720x480i"x59.9   13.50  720 739 801 858  480 488 494 525 interlace -hsync -vsync (15.7 kHz e)
[    21.044] (II) modeset(0): Modeline "640x512"x75.0   67.50  640 648 720 844  512 512 514 533 doublescan +hsync +vsync (80.0 kHz d)
[    21.044] (II) modeset(0): Modeline "640x512"x60.0   54.00  640 664 720 844  512 512 514 533 doublescan +hsync +vsync (64.0 kHz d)
[    21.044] (II) modeset(0): Modeline "700x450"x60.0   51.75  700 740 812 924  450 451 456 467 doublescan -hsync +vsync (56.0 kHz d)
[    21.044] (II) modeset(0): Modeline "700x450"x59.9   43.25  700 724 740 780  450 451 456 463 doublescan +hsync -vsync (55.4 kHz d)
[    21.044] (II) modeset(0): Modeline "640x480"x60.0   54.00  640 688 744 900  480 480 482 500 doublescan +hsync +vsync (60.0 kHz d)
[    21.044] (II) modeset(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz e)
[    21.044] (II) modeset(0): Modeline "640x480"x72.8   31.50  640 664 704 832  480 489 492 520 -hsync -vsync (37.9 kHz d)
[    21.044] (II) modeset(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz d)
[    21.044] (II) modeset(0): Modeline "640x480"x60.0   25.20  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz e)
[    21.044] (II) modeset(0): Modeline "640x480"x59.9   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz e)
[    21.044] (II) modeset(0): Modeline "720x405"x59.5   22.50  720 744 808 896  405 408 413 422 -hsync +vsync (25.1 kHz d)
[    21.044] (II) modeset(0): Modeline "720x405"x59.0   21.75  720 768 800 880  405 408 413 419 +hsync -vsync (24.7 kHz d)
[    21.044] (II) modeset(0): Modeline "720x400"x70.1   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz e)
[    21.044] (II) modeset(0): Modeline "684x384"x59.9   42.62  684 720 788 892  384 385 390 399 doublescan -hsync +vsync (47.8 kHz d)
[    21.044] (II) modeset(0): Modeline "684x384"x59.9   36.12  684 708 724 764  384 385 390 395 doublescan +hsync -vsync (47.3 kHz d)
[    21.044] (II) modeset(0): Modeline "640x400"x59.9   41.75  640 676 740 840  400 401 404 415 doublescan -hsync +vsync (49.7 kHz d)
[    21.044] (II) modeset(0): Modeline "640x400"x60.0   35.50  640 664 680 720  400 401 404 411 doublescan +hsync -vsync (49.3 kHz d)
[    21.044] (II) modeset(0): Modeline "576x432"x75.0   54.00  576 608 672 800  432 432 434 450 doublescan +hsync +vsync (67.5 kHz d)
[    21.044] (II) modeset(0): Modeline "640x360"x59.9   37.25  640 672 736 832  360 361 364 374 doublescan -hsync +vsync (44.8 kHz d)
[    21.044] (II) modeset(0): Modeline "640x360"x59.8   31.88  640 664 680 720  360 361 364 370 doublescan +hsync -vsync (44.3 kHz d)
[    21.044] (II) modeset(0): Modeline "640x360"x59.8   18.00  640 664 720 800  360 363 368 376 -hsync +vsync (22.5 kHz d)
[    21.044] (II) modeset(0): Modeline "640x360"x59.3   17.75  640 688 720 800  360 363 368 374 +hsync -vsync (22.2 kHz d)
[    21.044] (II) modeset(0): Modeline "512x384"x75.0   39.38  512 520 568 656  384 384 386 400 doublescan +hsync +vsync (60.0 kHz d)
[    21.044] (II) modeset(0): Modeline "512x384"x70.1   37.50  512 524 592 664  384 385 388 403 doublescan -hsync -vsync (56.5 kHz d)
[    21.044] (II) modeset(0): Modeline "512x384"x60.0   32.50  512 524 592 672  384 385 388 403 doublescan -hsync -vsync (48.4 kHz d)
[    21.045] (II) modeset(0): Modeline "512x288"x60.0   23.25  512 532 580 648  288 289 292 299 doublescan -hsync +vsync (35.9 kHz d)
[    21.045] (II) modeset(0): Modeline "512x288"x59.9   21.00  512 536 552 592  288 289 292 296 doublescan +hsync -vsync (35.5 kHz d)
[    21.045] (II) modeset(0): Modeline "416x312"x74.7   28.64  416 432 464 576  312 312 314 333 doublescan -hsync -vsync (49.7 kHz d)
[    21.045] (II) modeset(0): Modeline "480x270"x59.6   20.38  480 496 544 608  270 271 274 281 doublescan -hsync +vsync (33.5 kHz d)
[    21.045] (II) modeset(0): Modeline "480x270"x59.8   18.62  480 504 520 560  270 271 274 278 doublescan +hsync -vsync (33.3 kHz d)
[    21.045] (II) modeset(0): Modeline "400x300"x72.2   25.00  400 428 488 520  300 318 321 333 doublescan +hsync +vsync (48.1 kHz d)
[    21.045] (II) modeset(0): Modeline "400x300"x75.1   24.75  400 408 448 528  300 300 302 312 doublescan +hsync +vsync (46.9 kHz d)
[    21.045] (II) modeset(0): Modeline "400x300"x60.3   20.00  400 420 484 528  300 300 302 314 doublescan +hsync +vsync (37.9 kHz d)
[    21.045] (II) modeset(0): Modeline "400x300"x56.3   18.00  400 412 448 512  300 300 301 312 doublescan +hsync +vsync (35.2 kHz d)
[    21.045] (II) modeset(0): Modeline "432x243"x59.9   16.25  432 444 484 536  243 244 247 253 doublescan -hsync +vsync (30.3 kHz d)
[    21.045] (II) modeset(0): Modeline "432x243"x59.6   15.25  432 456 472 512  243 244 247 250 doublescan +hsync -vsync (29.8 kHz d)
[    21.045] (II) modeset(0): Modeline "320x240"x72.8   15.75  320 332 352 416  240 244 246 260 doublescan -hsync -vsync (37.9 kHz d)
[    21.045] (II) modeset(0): Modeline "320x240"x75.0   15.75  320 328 360 420  240 240 242 250 doublescan -hsync -vsync (37.5 kHz d)
[    21.045] (II) modeset(0): Modeline "320x240"x60.1   12.59  320 328 376 400  240 245 246 262 doublescan -hsync -vsync (31.5 kHz d)
[    21.045] (II) modeset(0): Modeline "360x202"x59.5   11.25  360 372 404 448  202 204 206 211 doublescan -hsync +vsync (25.1 kHz d)
[    21.045] (II) modeset(0): Modeline "360x202"x59.1   10.88  360 384 400 440  202 204 206 209 doublescan +hsync -vsync (24.7 kHz d)
[    21.045] (II) modeset(0): Modeline "320x180"x59.8    9.00  320 332 360 400  180 181 184 188 doublescan -hsync +vsync (22.5 kHz d)
[    21.045] (II) modeset(0): Modeline "320x180"x59.3    8.88  320 344 360 400  180 181 184 187 doublescan +hsync -vsync (22.2 kHz d)
[    21.045] (II) modeset(0): Output DVI-D-1 disconnected
[    21.045] (II) modeset(0): Output HDMI-1 disconnected
[    21.045] (II) modeset(0): Output DP-1 connected
[    21.045] (II) modeset(0): Using exact sizes for initial modes
[    21.045] (II) modeset(0): Output DP-1 using initial mode 3840x2160 +0+0
[    21.045] (==) modeset(0): Using gamma correction (1.0, 1.0, 1.0)
[    21.045] (==) modeset(0): DPI set to (96, 96)
[    21.045] (II) Loading sub module "fb"
[    21.045] (II) LoadModule: "fb"
[    21.045] (II) Loading /usr/lib64/xorg/modules/libfb.so
[    21.046] (II) Module fb: vendor="X.Org Foundation"
[    21.046] 	compiled for 1.20.3, module version = 1.0.0
[    21.046] 	ABI class: X.Org ANSI C Emulation, version 0.4
[    21.046] (II) UnloadModule: "fbdev"
[    21.046] (II) Unloading fbdev
[    21.047] (II) UnloadSubModule: "fbdevhw"
[    21.047] (II) Unloading fbdevhw
[    21.047] (II) UnloadModule: "vesa"
[    21.047] (II) Unloading vesa
[    21.074] (==) modeset(0): Backing store enabled
[    21.074] (==) modeset(0): Silken mouse enabled
[    21.084] (II) modeset(0): Initializing kms color map for depth 24, 8 bpc.
[    21.085] (==) modeset(0): DPMS enabled
[    21.086] (II) modeset(0): [DRI2] Setup complete
[    21.086] (II) modeset(0): [DRI2]   DRI driver: nouveau
[    21.086] (II) modeset(0): [DRI2]   VDPAU driver: nouveau
[    21.086] (II) Initializing extension Generic Event Extension
[    21.087] (II) Initializing extension SHAPE
[    21.087] (II) Initializing extension MIT-SHM
[    21.087] (II) Initializing extension XInputExtension
[    21.088] (II) Initializing extension XTEST
[    21.089] (II) Initializing extension BIG-REQUESTS
[    21.089] (II) Initializing extension SYNC
[    21.089] (II) Initializing extension XKEYBOARD
[    21.089] (II) Initializing extension XC-MISC
[    21.089] (II) Initializing extension XFIXES
[    21.090] (II) Initializing extension RENDER
[    21.090] (II) Initializing extension RANDR
[    21.090] (II) Initializing extension COMPOSITE
[    21.090] (II) Initializing extension DAMAGE
[    21.091] (II) Initializing extension MIT-SCREEN-SAVER
[    21.091] (II) Initializing extension DOUBLE-BUFFER
[    21.091] (II) Initializing extension RECORD
[    21.091] (II) Initializing extension DPMS
[    21.091] (II) Initializing extension Present
[    21.092] (II) Initializing extension DRI3
[    21.092] (II) Initializing extension X-Resource
[    21.092] (II) Initializing extension XVideo
[    21.092] (II) Initializing extension XVideo-MotionCompensation
[    21.092] (II) Initializing extension SELinux
[    21.092] (II) SELinux: Disabled on system
[    21.092] (II) Initializing extension GLX
[    21.096] (II) AIGLX: Loaded and initialized nouveau
[    21.096] (II) GLX: Initialized DRI2 GL provider for screen 0
[    21.096] (II) Initializing extension XFree86-VidModeExtension
[    21.096] (II) Initializing extension XFree86-DGA
[    21.097] (II) Initializing extension XFree86-DRI
[    21.097] (II) Initializing extension DRI2
[    21.101] (II) modeset(0): Damage tracking initialized
[    21.101] (II) modeset(0): Setting screen physical size to 1016 x 571
[    21.178] (II) config/udev: Adding input device Power Button (/dev/input/event1)
[    21.178] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[    21.178] (**) Power Button: Applying InputClass "libinput keyboard catchall"
[    21.178] (**) Power Button: Applying InputClass "system-keyboard"
[    21.178] (II) LoadModule: "libinput"
[    21.178] (II) Loading /usr/lib64/xorg/modules/input/libinput_drv.so
[    21.191] (II) Module libinput: vendor="X.Org Foundation"
[    21.191] 	compiled for 1.20.1, module version = 0.28.1
[    21.191] 	Module class: X.Org XInput Driver
[    21.191] 	ABI class: X.Org XInput driver, version 24.1
[    21.191] (II) Using input driver 'libinput' for 'Power Button'
[    21.192] (II) systemd-logind: got fd for /dev/input/event1 13:65 fd 23 paused 0
[    21.192] (**) Power Button: always reports core events
[    21.192] (**) Option "Device" "/dev/input/event1"
[    21.192] (**) Option "_source" "server/udev"
[    21.203] (II) event1  - Power Button: is tagged by udev as: Keyboard
[    21.203] (II) event1  - Power Button: device is a keyboard
[    21.203] (II) event1  - Power Button: device removed
[    21.203] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/LNXPWRBN:00/input/input1/event1"
[    21.203] (II) XINPUT: Adding extended input device "Power Button" (type: KEYBOARD, id 6)
[    21.203] (**) Option "xkb_layout" "us"
[    21.205] (II) event1  - Power Button: is tagged by udev as: Keyboard
[    21.205] (II) event1  - Power Button: device is a keyboard
[    21.205] (II) config/udev: Adding input device Power Button (/dev/input/event0)
[    21.205] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[    21.205] (**) Power Button: Applying InputClass "libinput keyboard catchall"
[    21.205] (**) Power Button: Applying InputClass "system-keyboard"
[    21.205] (II) Using input driver 'libinput' for 'Power Button'
[    21.206] (II) systemd-logind: got fd for /dev/input/event0 13:64 fd 26 paused 0
[    21.206] (**) Power Button: always reports core events
[    21.206] (**) Option "Device" "/dev/input/event0"
[    21.206] (**) Option "_source" "server/udev"
[    21.207] (II) event0  - Power Button: is tagged by udev as: Keyboard
[    21.207] (II) event0  - Power Button: device is a keyboard
[    21.207] (II) event0  - Power Button: device removed
[    21.207] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0/event0"
[    21.207] (II) XINPUT: Adding extended input device "Power Button" (type: KEYBOARD, id 7)
[    21.207] (**) Option "xkb_layout" "us"
[    21.208] (II) event0  - Power Button: is tagged by udev as: Keyboard
[    21.208] (II) event0  - Power Button: device is a keyboard
[    21.209] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=3 (/dev/input/event12)
[    21.209] (II) No input driver specified, ignoring this device.
[    21.209] (II) This device may have been added with another device file.
[    21.209] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=7 (/dev/input/event13)
[    21.209] (II) No input driver specified, ignoring this device.
[    21.209] (II) This device may have been added with another device file.
[    21.210] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=8 (/dev/input/event14)
[    21.210] (II) No input driver specified, ignoring this device.
[    21.210] (II) This device may have been added with another device file.
[    21.210] (II) config/udev: Adding input device Cypress Cypress USB Keyboard / PS2 Mouse (/dev/input/event2)
[    21.210] (**) Cypress Cypress USB Keyboard / PS2 Mouse: Applying InputClass "evdev keyboard catchall"
[    21.210] (**) Cypress Cypress USB Keyboard / PS2 Mouse: Applying InputClass "libinput keyboard catchall"
[    21.210] (**) Cypress Cypress USB Keyboard / PS2 Mouse: Applying InputClass "system-keyboard"
[    21.210] (II) Using input driver 'libinput' for 'Cypress Cypress USB Keyboard / PS2 Mouse'
[    21.212] (II) systemd-logind: got fd for /dev/input/event2 13:66 fd 27 paused 0
[    21.212] (**) Cypress Cypress USB Keyboard / PS2 Mouse: always reports core events
[    21.212] (**) Option "Device" "/dev/input/event2"
[    21.212] (**) Option "_source" "server/udev"
[    21.213] (II) event2  - Cypress Cypress USB Keyboard / PS2 Mouse: is tagged by udev as: Keyboard
[    21.213] (II) event2  - Cypress Cypress USB Keyboard / PS2 Mouse: device is a keyboard
[    21.213] (II) event2  - Cypress Cypress USB Keyboard / PS2 Mouse: device removed
[    21.213] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:12.2/usb1/1-2/1-2.1/1-2.1.3/1-2.1.3:1.0/0003:04B4:0101.0001/input/input3/event2"
[    21.213] (II) XINPUT: Adding extended input device "Cypress Cypress USB Keyboard / PS2 Mouse" (type: KEYBOARD, id 8)
[    21.213] (**) Option "xkb_layout" "us"
[    21.215] (II) event2  - Cypress Cypress USB Keyboard / PS2 Mouse: is tagged by udev as: Keyboard
[    21.215] (II) event2  - Cypress Cypress USB Keyboard / PS2 Mouse: device is a keyboard
[    21.217] (II) config/udev: Adding input device Cypress Cypress USB Keyboard / PS2 Mouse (/dev/input/event3)
[    21.217] (**) Cypress Cypress USB Keyboard / PS2 Mouse: Applying InputClass "evdev pointer catchall"
[    21.217] (**) Cypress Cypress USB Keyboard / PS2 Mouse: Applying InputClass "libinput pointer catchall"
[    21.217] (II) Using input driver 'libinput' for 'Cypress Cypress USB Keyboard / PS2 Mouse'
[    21.219] (II) systemd-logind: got fd for /dev/input/event3 13:67 fd 28 paused 0
[    21.219] (**) Cypress Cypress USB Keyboard / PS2 Mouse: always reports core events
[    21.219] (**) Option "Device" "/dev/input/event3"
[    21.219] (**) Option "_source" "server/udev"
[    21.221] (II) event3  - Cypress Cypress USB Keyboard / PS2 Mouse: is tagged by udev as: Mouse
[    21.221] (II) event3  - Cypress Cypress USB Keyboard / PS2 Mouse: device is a pointer
[    21.221] (II) event3  - Cypress Cypress USB Keyboard / PS2 Mouse: device removed
[    21.221] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:12.2/usb1/1-2/1-2.1/1-2.1.3/1-2.1.3:1.1/0003:04B4:0101.0002/input/input4/event3"
[    21.221] (II) XINPUT: Adding extended input device "Cypress Cypress USB Keyboard / PS2 Mouse" (type: MOUSE, id 9)
[    21.222] (**) Option "AccelerationScheme" "none"
[    21.222] (**) Cypress Cypress USB Keyboard / PS2 Mouse: (accel) selected scheme none/0
[    21.222] (**) Cypress Cypress USB Keyboard / PS2 Mouse: (accel) acceleration factor: 2.000
[    21.222] (**) Cypress Cypress USB Keyboard / PS2 Mouse: (accel) acceleration threshold: 4
[    21.223] (II) event3  - Cypress Cypress USB Keyboard / PS2 Mouse: is tagged by udev as: Mouse
[    21.223] (II) event3  - Cypress Cypress USB Keyboard / PS2 Mouse: device is a pointer
[    21.224] (II) config/udev: Adding input device Cypress Cypress USB Keyboard / PS2 Mouse (/dev/input/mouse0)
[    21.224] (II) No input driver specified, ignoring this device.
[    21.224] (II) This device may have been added with another device file.
[    21.225] (II) config/udev: Adding input device Cypress Cypress USB Keyboard / PS2 Mouse System Control (/dev/input/event4)
[    21.225] (**) Cypress Cypress USB Keyboard / PS2 Mouse System Control: Applying InputClass "evdev keyboard catchall"
[    21.225] (**) Cypress Cypress USB Keyboard / PS2 Mouse System Control: Applying InputClass "libinput keyboard catchall"
[    21.225] (**) Cypress Cypress USB Keyboard / PS2 Mouse System Control: Applying InputClass "system-keyboard"
[    21.225] (II) Using input driver 'libinput' for 'Cypress Cypress USB Keyboard / PS2 Mouse System Control'
[    21.225] (II) systemd-logind: got fd for /dev/input/event4 13:68 fd 29 paused 0
[    21.225] (**) Cypress Cypress USB Keyboard / PS2 Mouse System Control: always reports core events
[    21.225] (**) Option "Device" "/dev/input/event4"
[    21.225] (**) Option "_source" "server/udev"
[    21.227] (II) event4  - Cypress Cypress USB Keyboard / PS2 Mouse System Control: is tagged by udev as: Keyboard
[    21.227] (II) event4  - Cypress Cypress USB Keyboard / PS2 Mouse System Control: device is a keyboard
[    21.227] (II) event4  - Cypress Cypress USB Keyboard / PS2 Mouse System Control: device removed
[    21.227] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:12.2/usb1/1-2/1-2.1/1-2.1.3/1-2.1.3:1.1/0003:04B4:0101.0002/input/input5/event4"
[    21.227] (II) XINPUT: Adding extended input device "Cypress Cypress USB Keyboard / PS2 Mouse System Control" (type: KEYBOARD, id 10)
[    21.227] (**) Option "xkb_layout" "us"
[    21.228] (II) event4  - Cypress Cypress USB Keyboard / PS2 Mouse System Control: is tagged by udev as: Keyboard
[    21.228] (II) event4  - Cypress Cypress USB Keyboard / PS2 Mouse System Control: device is a keyboard
[    21.229] (II) config/udev: Adding input device Cypress Cypress USB Keyboard / PS2 Mouse Consumer Control (/dev/input/event5)
[    21.229] (**) Cypress Cypress USB Keyboard / PS2 Mouse Consumer Control: Applying InputClass "evdev keyboard catchall"
[    21.229] (**) Cypress Cypress USB Keyboard / PS2 Mouse Consumer Control: Applying InputClass "libinput keyboard catchall"
[    21.229] (**) Cypress Cypress USB Keyboard / PS2 Mouse Consumer Control: Applying InputClass "system-keyboard"
[    21.229] (II) Using input driver 'libinput' for 'Cypress Cypress USB Keyboard / PS2 Mouse Consumer Control'
[    21.229] (II) systemd-logind: got fd for /dev/input/event5 13:69 fd 30 paused 0
[    21.229] (**) Cypress Cypress USB Keyboard / PS2 Mouse Consumer Control: always reports core events
[    21.229] (**) Option "Device" "/dev/input/event5"
[    21.229] (**) Option "_source" "server/udev"
[    21.231] (II) event5  - Cypress Cypress USB Keyboard / PS2 Mouse Consumer Control: is tagged by udev as: Keyboard
[    21.231] (II) event5  - Cypress Cypress USB Keyboard / PS2 Mouse Consumer Control: device is a keyboard
[    21.231] (II) event5  - Cypress Cypress USB Keyboard / PS2 Mouse Consumer Control: device removed
[    21.231] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:12.2/usb1/1-2/1-2.1/1-2.1.3/1-2.1.3:1.1/0003:04B4:0101.0002/input/input6/event5"
[    21.231] (II) XINPUT: Adding extended input device "Cypress Cypress USB Keyboard / PS2 Mouse Consumer Control" (type: KEYBOARD, id 11)
[    21.231] (**) Option "xkb_layout" "us"
[    21.232] (II) event5  - Cypress Cypress USB Keyboard / PS2 Mouse Consumer Control: is tagged by udev as: Keyboard
[    21.232] (II) event5  - Cypress Cypress USB Keyboard / PS2 Mouse Consumer Control: device is a keyboard
[    21.233] (II) config/udev: Adding input device PixArt USB Optical Mouse (/dev/input/event6)
[    21.233] (**) PixArt USB Optical Mouse: Applying InputClass "evdev pointer catchall"
[    21.233] (**) PixArt USB Optical Mouse: Applying InputClass "libinput pointer catchall"
[    21.233] (II) Using input driver 'libinput' for 'PixArt USB Optical Mouse'
[    21.234] (II) systemd-logind: got fd for /dev/input/event6 13:70 fd 31 paused 0
[    21.234] (**) PixArt USB Optical Mouse: always reports core events
[    21.234] (**) Option "Device" "/dev/input/event6"
[    21.234] (**) Option "_source" "server/udev"
[    21.236] (II) event6  - PixArt USB Optical Mouse: is tagged by udev as: Mouse
[    21.236] (II) event6  - PixArt USB Optical Mouse: device set to 1000 DPI
[    21.236] (II) event6  - PixArt USB Optical Mouse: device is a pointer
[    21.236] (II) event6  - PixArt USB Optical Mouse: device removed
[    21.236] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:12.2/usb1/1-2/1-2.1/1-2.1.4/1-2.1.4:1.0/0003:093A:2510.0003/input/input7/event6"
[    21.236] (II) XINPUT: Adding extended input device "PixArt USB Optical Mouse" (type: MOUSE, id 12)
[    21.236] (**) Option "AccelerationScheme" "none"
[    21.236] (**) PixArt USB Optical Mouse: (accel) selected scheme none/0
[    21.236] (**) PixArt USB Optical Mouse: (accel) acceleration factor: 2.000
[    21.236] (**) PixArt USB Optical Mouse: (accel) acceleration threshold: 4
[    21.238] (II) event6  - PixArt USB Optical Mouse: is tagged by udev as: Mouse
[    21.238] (II) event6  - PixArt USB Optical Mouse: device set to 1000 DPI
[    21.238] (II) event6  - PixArt USB Optical Mouse: device is a pointer
[    21.239] (II) config/udev: Adding input device PixArt USB Optical Mouse (/dev/input/mouse1)
[    21.239] (II) No input driver specified, ignoring this device.
[    21.239] (II) This device may have been added with another device file.
[    21.240] (II) config/udev: Adding input device HDA ATI SB Line (/dev/input/event9)
[    21.240] (II) No input driver specified, ignoring this device.
[    21.240] (II) This device may have been added with another device file.
[    21.240] (II) config/udev: Adding input device HDA ATI SB Line Out (/dev/input/event10)
[    21.240] (II) No input driver specified, ignoring this device.
[    21.240] (II) This device may have been added with another device file.
[    21.240] (II) config/udev: Adding input device HDA ATI SB Front Headphone (/dev/input/event11)
[    21.240] (II) No input driver specified, ignoring this device.
[    21.240] (II) This device may have been added with another device file.
[    21.241] (II) config/udev: Adding input device HDA ATI SB Front Mic (/dev/input/event7)
[    21.241] (II) No input driver specified, ignoring this device.
[    21.241] (II) This device may have been added with another device file.
[    21.241] (II) config/udev: Adding input device HDA ATI SB Rear Mic (/dev/input/event8)
[    21.241] (II) No input driver specified, ignoring this device.
[    21.241] (II) This device may have been added with another device file.
[    21.276] (II) modeset(0): Disabling kernel dirty updates, not required.
[   534.009] (II) modeset(0): EDID vendor "DEL", prod id 16622
[   534.012] (II) modeset(0): Using EDID range info for horizontal sync
[   534.012] (II) modeset(0): Using EDID range info for vertical refresh
[   534.012] (II) modeset(0): Printing DDC gathered Modelines:
[   534.012] (II) modeset(0): Modeline "3840x2160"x0.0  533.25  3840 3888 3920 4000  2160 2163 2168 2222 +hsync -vsync (133.3 kHz eP)
[   534.012] (II) modeset(0): Modeline "3840x2160"x0.0  262.75  3840 3888 3920 4000  2160 2163 2168 2191 +hsync -vsync (65.7 kHz e)
[   534.012] (II) modeset(0): Modeline "2560x1440"x0.0  241.50  2560 2608 2640 2720  1440 1443 1448 1481 +hsync -vsync (88.8 kHz e)
[   534.012] (II) modeset(0): Modeline "1920x2160"x0.0  277.25  1920 1968 2000 2080  2160 2163 2173 2222 +hsync -vsync (133.3 kHz e)
[   534.012] (II) modeset(0): Modeline "2048x1280"x0.0  174.25  2048 2096 2128 2208  1280 1283 1289 1317 +hsync -vsync (78.9 kHz e)
[   534.012] (II) modeset(0): Modeline "1920x1080"x0.0  148.50  1920 2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz e)
[   534.013] (II) modeset(0): Modeline "1920x1080"x0.0  148.50  1920 2448 2492 2640  1080 1084 1089 1125 +hsync +vsync (56.2 kHz e)
[   534.013] (II) modeset(0): Modeline "1920x1080"x0.0   74.25  1920 2558 2602 2750  1080 1084 1089 1125 +hsync +vsync (27.0 kHz e)
[   534.013] (II) modeset(0): Modeline "1920x1080i"x0.0   74.25  1920 2008 2052 2200  1080 1084 1094 1125 interlace +hsync +vsync (33.8 kHz e)
[   534.013] (II) modeset(0): Modeline "1920x1080i"x0.0   74.25  1920 2448 2492 2640  1080 1084 1094 1125 interlace +hsync +vsync (28.1 kHz e)
[   534.013] (II) modeset(0): Modeline "1280x720"x0.0   74.25  1280 1390 1430 1650  720 725 730 750 +hsync +vsync (45.0 kHz e)
[   534.013] (II) modeset(0): Modeline "1280x720"x0.0   74.25  1280 1720 1760 1980  720 725 730 750 +hsync +vsync (37.5 kHz e)
[   534.013] (II) modeset(0): Modeline "720x576"x0.0   27.00  720 732 796 864  576 581 586 625 -hsync -vsync (31.2 kHz e)
[   534.013] (II) modeset(0): Modeline "720x480"x0.0   27.00  720 736 798 858  480 489 495 525 -hsync -vsync (31.5 kHz e)
[   534.013] (II) modeset(0): Modeline "1440x576i"x0.0   27.00  1440 1464 1590 1728  576 580 586 625 interlace -hsync -vsync (15.6 kHz e)
[   534.013] (II) modeset(0): Modeline "1440x480i"x0.0   27.00  1440 1478 1602 1716  480 488 494 525 interlace -hsync -vsync (15.7 kHz e)
[   534.013] (II) modeset(0): Modeline "640x480"x0.0   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz e)
[   534.013] (II) modeset(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz e)
[   534.013] (II) modeset(0): Modeline "640x480"x0.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz e)
[   534.013] (II) modeset(0): Modeline "720x400"x0.0   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz e)
[   534.013] (II) modeset(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[   534.013] (II) modeset(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[   534.013] (II) modeset(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[   534.013] (II) modeset(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz e)
[   534.013] (II) modeset(0): Modeline "1600x1200"x0.0  162.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz e)
[   534.013] (II) modeset(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[   534.013] (II) modeset(0): Modeline "1280x800"x0.0   83.50  1280 1352 1480 1680  800 803 809 831 -hsync +vsync (49.7 kHz e)
[   534.013] (II) modeset(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[   534.051] (II) modeset(0): Allocate new frame buffer 640x480 stride
[   575.985] (II) modeset(0): EDID vendor "DEL", prod id 16622
[   575.985] (II) modeset(0): Using hsync ranges from config file
[   575.985] (II) modeset(0): Using vrefresh ranges from config file
[   575.985] (II) modeset(0): Printing DDC gathered Modelines:
[   575.985] (II) modeset(0): Modeline "3840x2160"x0.0  533.25  3840 3888 3920 4000  2160 2163 2168 2222 +hsync -vsync (133.3 kHz eP)
[   575.985] (II) modeset(0): Modeline "3840x2160"x0.0  262.75  3840 3888 3920 4000  2160 2163 2168 2191 +hsync -vsync (65.7 kHz e)
[   575.985] (II) modeset(0): Modeline "2560x1440"x0.0  241.50  2560 2608 2640 2720  1440 1443 1448 1481 +hsync -vsync (88.8 kHz e)
[   575.985] (II) modeset(0): Modeline "1920x2160"x0.0  277.25  1920 1968 2000 2080  2160 2163 2173 2222 +hsync -vsync (133.3 kHz e)
[   575.985] (II) modeset(0): Modeline "2048x1280"x0.0  174.25  2048 2096 2128 2208  1280 1283 1289 1317 +hsync -vsync (78.9 kHz e)
[   575.985] (II) modeset(0): Modeline "1920x1080"x0.0  148.50  1920 2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz e)
[   575.985] (II) modeset(0): Modeline "1920x1080"x0.0  148.50  1920 2448 2492 2640  1080 1084 1089 1125 +hsync +vsync (56.2 kHz e)
[   575.985] (II) modeset(0): Modeline "1920x1080"x0.0   74.25  1920 2558 2602 2750  1080 1084 1089 1125 +hsync +vsync (27.0 kHz e)
[   575.985] (II) modeset(0): Modeline "1920x1080i"x0.0   74.25  1920 2008 2052 2200  1080 1084 1094 1125 interlace +hsync +vsync (33.8 kHz e)
[   575.985] (II) modeset(0): Modeline "1920x1080i"x0.0   74.25  1920 2448 2492 2640  1080 1084 1094 1125 interlace +hsync +vsync (28.1 kHz e)
[   575.985] (II) modeset(0): Modeline "1280x720"x0.0   74.25  1280 1390 1430 1650  720 725 730 750 +hsync +vsync (45.0 kHz e)
[   575.986] (II) modeset(0): Modeline "1280x720"x0.0   74.25  1280 1720 1760 1980  720 725 730 750 +hsync +vsync (37.5 kHz e)
[   575.986] (II) modeset(0): Modeline "720x576"x0.0   27.00  720 732 796 864  576 581 586 625 -hsync -vsync (31.2 kHz e)
[   575.986] (II) modeset(0): Modeline "720x480"x0.0   27.00  720 736 798 858  480 489 495 525 -hsync -vsync (31.5 kHz e)
[   575.986] (II) modeset(0): Modeline "1440x576i"x0.0   27.00  1440 1464 1590 1728  576 580 586 625 interlace -hsync -vsync (15.6 kHz e)
[   575.986] (II) modeset(0): Modeline "1440x480i"x0.0   27.00  1440 1478 1602 1716  480 488 494 525 interlace -hsync -vsync (15.7 kHz e)
[   575.986] (II) modeset(0): Modeline "640x480"x0.0   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz e)
[   575.986] (II) modeset(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz e)
[   575.986] (II) modeset(0): Modeline "640x480"x0.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz e)
[   575.986] (II) modeset(0): Modeline "720x400"x0.0   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz e)
[   575.986] (II) modeset(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[   575.986] (II) modeset(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[   575.986] (II) modeset(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[   575.986] (II) modeset(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz e)
[   575.986] (II) modeset(0): Modeline "1600x1200"x0.0  162.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz e)
[   575.986] (II) modeset(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[   575.986] (II) modeset(0): Modeline "1280x800"x0.0   83.50  1280 1352 1480 1680  800 803 809 831 -hsync +vsync (49.7 kHz e)
[   575.986] (II) modeset(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[   576.022] (II) modeset(0): Allocate new frame buffer 3840x2160 stride

--=-=-=
Content-Type: text/plain


Toward the end I did:

xrandr -s 640x480
xrandr -s 3820x2160

> The thing about 640x480 is that it's not a lot of pixels, too few for
> some modern monitors. I believe some games need to be played in order
> to increase the pixel clock, and I suspect nouveau doesn't play them
> correctly.
>
> Cheers,
>
>   -ilia
>
> On Wed, Feb 6, 2019 at 11:31 AM Dan Espen <dan1espen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>>
>> I've been using the NVidia drivers and recently managed to
>> get Nouveau working.  Well almost working.
>>
>> Running the command:
>>
>> xrandr -s 640x480
>>
>> results in a desktop that spans the monitor but leaves black bands of
>> about a third of the screen on the top and bottom.
>> This results in an unreadable display playing games like Lbrickbuster2.
>> I'd like the display to fill the screen.
>>
>> To confirm that this is a Nouveau issue, I switched back to NVidia
>> where 640x480 looks fine.
>>
>> I'm using Fedora 29 (xorg-x11-drv-nouveau.x86_64 1:1.0.15-6.fc29),
>> NVidia-390 drivers, GeForce GTX 1050 Ti, and a DELL S2817Q.
>>
>> --
>> Dan Espen
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> https://lists.freedesktop.org/mailman/listinfo/nouveau

-- 
Dan Espen

--=-=-=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--=-=-=--
