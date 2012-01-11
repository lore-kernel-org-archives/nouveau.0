From: Kieron Gillespie <ciaran.gillespie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: nouveau on Linux/sparc64 SunBlade 100
Date: Wed, 11 Jan 2012 11:52:27 -0500
Message-ID: <4F0DBE4B.7090507@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------010301070405070801010902"
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

This is a multi-part message in MIME format.
--------------010301070405070801010902
Content-Type: multipart/alternative;
 boundary="------------010502090400080905090001"


--------------010502090400080905090001
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone,

Thank you nouveau developers as it seems you may almost of a solution to 
my lack of good graphics options for my aging sun system.

I saw here before back in early December of 2011 a most of someone 
saying that it seemed that the nouveau drivers almost worked with him 
and is Sun Ultra 10. I am someone who is very fond of my Sun systems, I 
have two "SunBlade 100"s, and a "Sun Ultra 5". I have always been 
annoyed at the lack of good video card options when using these systems. 
I would love to have more room on my screen then 1024x768. So when I saw 
this post on the list 
http://lists.freedesktop.org/archives/nouveau/2011-November/009619.html 
from Patrick**Baggett baggett.patrick at gmail.com 
<mailto:nouveau%40lists.freedesktop.org?Subject=Re%3A%20%5BNouveau%5D%20nouveau%20on%20Linux/sparc64%20--%20almost%21&In-Reply-To=%3C4ECC47F8.6020802%40gmail.com%3E>. 
I kept my eyes open for some good old PCI Geforce. Well... I have a 
Geforce, but it's not that old. I got my hands on a GeForce 8400 GS PCI 
and yesterday tried it on Debian Squeeze. Well the module oops. So I 
felt the next best thing was to try again with Wheezy, Debian unstable. 
I got a little farther down the DRM driver initialization but it still 
oopses.

I was wondering if any progress has been made since November. Is there a 
ticket for this bug somewhere?

I'd like to try and give a hand with fixing the driver so that it works 
with Sparc64 systems. I have experience with the Sparc architecture. I 
don't have much experience with debugging drivers. I have a SunBlade 
100, Sun Ultra 5, and an x86_64 system to test on.

I've attached the relevant message logs. I'm going to try to learn how 
to start building the DRM module from source and start learning what I 
can do to fix it. I hope that there are still some people other then me 
interested in solving this problem.

--------------010502090400080905090001
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hello everyone,<br>
    <br>
    Thank you nouveau developers as it seems you may almost of a
    solution to my lack of good graphics options for my aging sun
    system.<br>
    <br>
    I saw here before back in early December of 2011 a most of someone
    saying that it seemed that the nouveau drivers almost worked with
    him and is Sun Ultra 10. I am someone who is very fond of my Sun
    systems, I have two "SunBlade 100"s, and a "Sun Ultra 5". I have
    always been annoyed at the lack of good video card options when
    using these systems. I would love to have more room on my screen
    then 1024x768. So when I saw this post on the list <a
href="http://lists.freedesktop.org/archives/nouveau/2011-November/009619.html">http://lists.freedesktop.org/archives/nouveau/2011-November/009619.html</a>
    from Patrick<b> </b>Baggett <a
href="mailto:nouveau%40lists.freedesktop.org?Subject=Re%3A%20%5BNouveau%5D%20nouveau%20on%20Linux/sparc64%20--%20almost%21&amp;In-Reply-To=%3C4ECC47F8.6020802%40gmail.com%3E"
      title="[Nouveau] nouveau on Linux/sparc64 -- almost!">baggett.patrick
      at gmail.com</a>. I kept my eyes open for some good old PCI
    Geforce. Well... I have a Geforce, but it's not that old. I got my
    hands on a GeForce 8400 GS PCI and yesterday tried it on Debian
    Squeeze. Well the module oops. So I felt the next best thing was to
    try again with Wheezy, Debian unstable. I got a little farther down
    the DRM driver initialization but it still oopses. <br>
    <br>
    I was wondering if any progress has been made since November. Is
    there a ticket for this bug somewhere?<br>
    <br>
    I'd like to try and give a hand with fixing the driver so that it
    works with Sparc64 systems. I have experience with the Sparc
    architecture. I don't have much experience with debugging drivers. I
    have a SunBlade 100, Sun Ultra 5, and an x86_64 system to test on.<br>
    <br>
    I've attached the relevant message logs. I'm going to try to learn
    how to start building the DRM module from source and start learning
    what I can do to fix it. I hope that there are still some people
    other then me interested in solving this problem.<br>
  </body>
</html>

--------------010502090400080905090001--

--------------010301070405070801010902
Content-Type: text/plain;
 name="nouveau-error"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="nouveau-error"

Jan 11 08:39:33 BladeRunner kernel: [   51.218404] [drm] nouveau 0000:02:00.0: Detected an NV50 generation card (0x298200a2)
Jan 11 08:39:33 BladeRunner kernel: [   51.294598] [drm] nouveau 0000:02:00.0: Attempting to load BIOS image from PRAMIN
Jan 11 08:39:33 BladeRunner kernel: [   51.306952] [drm] nouveau 0000:02:00.0: ... BIOS signature not found
Jan 11 08:39:33 BladeRunner kernel: [   51.319206] [drm] nouveau 0000:02:00.0: Attempting to load BIOS image from PROM
Jan 11 08:39:33 BladeRunner kernel: [   51.601915] [drm] nouveau 0000:02:00.0: ... appears to be valid
Jan 11 08:39:33 BladeRunner kernel: [   51.613990] [drm] nouveau 0000:02:00.0: BIT BIOS found
Jan 11 08:39:33 BladeRunner kernel: [   51.625897] [drm] nouveau 0000:02:00.0: Bios version 62.98.42.00
Jan 11 08:39:33 BladeRunner kernel: [   51.638099] Kernel unaligned access at TPC[10275e98] parse_bit_i_tbl_entry+0xa8/0x1b8 [nouveau]
Jan 11 08:39:33 BladeRunner kernel: [   51.650462] Kernel unaligned access at TPC[10275da8] parse_bit_A_tbl_entry+0x15c/0x1a4 [nouveau]
Jan 11 08:39:33 BladeRunner kernel: [   51.662632] Kernel unaligned access at TPC[10275a90] parse_script_table_pointers+0x4/0x100 [nouveau]
Jan 11 08:39:33 BladeRunner kernel: [   51.674833] Kernel unaligned access at TPC[10275ab4] parse_script_table_pointers+0x28/0x100 [nouveau]
Jan 11 08:39:33 BladeRunner kernel: [   51.687001] Kernel unaligned access at TPC[10275ad8] parse_script_table_pointers+0x4c/0x100 [nouveau]
Jan 11 08:39:33 BladeRunner kernel: [   51.699003] [drm] nouveau 0000:02:00.0: TMDS table version 2.0
Jan 11 08:39:33 BladeRunner kernel: [   51.710909] [drm] nouveau 0000:02:00.0: Found Display Configuration Block version 4.0
Jan 11 08:39:33 BladeRunner kernel: [   51.722884] [drm] nouveau 0000:02:00.0: Raw DCB entry 0: 02000300 00000028
Jan 11 08:39:33 BladeRunner kernel: [   51.734783] [drm] nouveau 0000:02:00.0: Raw DCB entry 1: 01000302 00020030
Jan 11 08:39:33 BladeRunner kernel: [   51.746517] [drm] nouveau 0000:02:00.0: Raw DCB entry 2: 04011310 00000028
Jan 11 08:39:33 BladeRunner kernel: [   51.757919] [drm] nouveau 0000:02:00.0: Raw DCB entry 3: 010223f1 00c0c080
Jan 11 08:39:33 BladeRunner kernel: [   51.769395] [drm] nouveau 0000:02:00.0: DCB connector table: VHER 0x40 5 16 4
Jan 11 08:39:33 BladeRunner kernel: [   51.780724] [drm] nouveau 0000:02:00.0:   0: 0x00001030: type 0x30 idx 0 tag 0x07
Jan 11 08:39:33 BladeRunner kernel: [   51.792018] [drm] nouveau 0000:02:00.0:   1: 0x00000200: type 0x00 idx 1 tag 0xff
Jan 11 08:39:33 BladeRunner kernel: [   51.803218] [drm] nouveau 0000:02:00.0:   2: 0x00000110: type 0x10 idx 2 tag 0xff
Jan 11 08:39:33 BladeRunner kernel: [   51.814301] [drm] nouveau 0000:02:00.0:   3: 0x00000111: type 0x11 idx 3 tag 0xff
Jan 11 08:39:33 BladeRunner kernel: [   51.825273] [drm] nouveau 0000:02:00.0:   4: 0x00000113: type 0x13 idx 4 tag 0xff
Jan 11 08:39:33 BladeRunner kernel: [   51.836194] [drm] nouveau 0000:02:00.0: Adaptor not initialised, running VBIOS init tables.
Jan 11 08:39:33 BladeRunner kernel: [   51.847146] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 0 at offset 0xD5EA
Jan 11 08:39:33 BladeRunner kernel: [   51.914962] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 1 at offset 0xD99C
Jan 11 08:39:33 BladeRunner kernel: [   51.931761] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 2 at offset 0xE24B
Jan 11 08:39:33 BladeRunner kernel: [   51.942499] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 3 at offset 0xE33D
Jan 11 08:39:33 BladeRunner kernel: [   51.954381] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 4 at offset 0xE54D
Jan 11 08:39:33 BladeRunner kernel: [   51.964796] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table at offset 0xE5B2
Jan 11 08:39:33 BladeRunner kernel: [   53.795866] [drm] nouveau 0000:02:00.0: 0xE5D9: Condition still not met after 2000ms, skipping following opcodes
Jan 11 08:39:33 BladeRunner kernel: [   53.858343] [drm] nouveau 0000:02:00.0: timingset 255 does not exist
Jan 11 08:39:33 BladeRunner kernel: [   54.459810] [drm] nouveau 0000:02:00.0: 1 available performance level(s)
Jan 11 08:39:33 BladeRunner kernel: [   54.469657] [drm] nouveau 0000:02:00.0: 3: memory 500MHz core 567MHz shader 1400MHz fanspeed 100%
Jan 11 08:39:33 BladeRunner kernel: [   54.479826] [drm] nouveau 0000:02:00.0: c: memory 499MHz core 566MHz shader 1400MHz
Jan 11 08:39:33 BladeRunner kernel: [   54.509640] [TTM] Zone  kernel: Available graphics memory: 515388 kiB.
Jan 11 08:39:33 BladeRunner kernel: [   54.519401] [TTM] Initializing pool allocator.
Jan 11 08:39:33 BladeRunner kernel: [   54.529012] [drm] nouveau 0000:02:00.0: Detected 512MiB VRAM
Jan 11 08:39:33 BladeRunner kernel: [   54.538653] [drm] nouveau 0000:02:00.0: 512 MiB GART (aperture)
Jan 11 08:39:33 BladeRunner kernel: [   54.553378] [drm] nouveau 0000:02:00.0: DCB encoder 1 unknown
Jan 11 08:39:33 BladeRunner kernel: [   54.562981] [drm] nouveau 0000:02:00.0: TV-1 has no encoders, removing
Jan 11 08:39:33 BladeRunner kernel: [   54.613141]               \|/ ____ \|/
Jan 11 08:39:33 BladeRunner kernel: [   54.613150]               "@'/ .. \`@"
Jan 11 08:39:33 BladeRunner kernel: [   54.613158]               /_| \__/ |_\
Jan 11 08:39:33 BladeRunner kernel: [   54.613165]                  \__U_/
Jan 11 08:39:33 BladeRunner kernel: [   54.648034] modprobe(320): Oops [#1]
Jan 11 08:39:33 BladeRunner kernel: [   54.656155] TSTATE: 0000004411001602 TPC: 0000000010268dd8 TNPC: 0000000010268ddc Y: 00000000    Not tainted
Jan 11 08:39:33 BladeRunner kernel: [   54.664716] TPC: <nouveau_dma_wait+0x4/0x40c [nouveau]>
Jan 11 08:39:33 BladeRunner kernel: [   54.673112] g0: 000000000045bafc g1: fffff8003e3223f8 g2: 0000000000000068 g3: 000000000078f740
Jan 11 08:39:33 BladeRunner kernel: [   54.681731] g4: fffff8003bcb9860 g5: 4869676820536965 g6: fffff8003c748000 g7: 0000000000000000
Jan 11 08:39:33 BladeRunner kernel: [   54.690413] o0: fffff8003e3223f0 o1: fffff8003e322408 o2: 0000000000636488 o3: 0000000000100100
Jan 11 08:39:33 BladeRunner kernel: [   54.699206] o4: 0000000000000000 o5: fffff8003e00b000 sp: fffff8003c74ac21 ret_pc: 0000000000636488
Jan 11 08:39:33 BladeRunner kernel: [   54.708138] RPC: <drm_mode_config_cleanup+0x94/0x138>
Jan 11 08:39:33 BladeRunner kernel: [   54.716944] l0: 00000000cb8be320 l1: 00000000008083d0 l2: 0000000000895c00 l3: 0000000000896000
Jan 11 08:39:33 BladeRunner kernel: [   54.726094] l4: fffff8003c74b48f l5: 000000000000000f l6: fffffffffffffff4 l7: 000001000077b060
Jan 11 08:39:33 BladeRunner kernel: [   54.735247] i0: 0000000000000000 i1: 0000000000000001 i2: 0000000000000002 i3: 0000000000030000
Jan 11 08:39:33 BladeRunner kernel: [   54.744560] i4: fffff8003e3223b0 i5: fffff8003e3223f0 i6: fffff8003c74acd1 i7: 00000000102c7a24
Jan 11 08:39:33 BladeRunner kernel: [   54.754194] I7: <nv50_display_destroy+0xd4/0x48c [nouveau]>
Jan 11 08:39:33 BladeRunner kernel: [   54.763627] Call Trace:
Jan 11 08:39:33 BladeRunner kernel: [   54.772981]  [00000000102c7a24] nv50_display_destroy+0xd4/0x48c [nouveau]
Jan 11 08:39:33 BladeRunner kernel: [   54.782543]  [00000000102c8070] nv50_display_create+0x294/0x2a4 [nouveau]
Jan 11 08:39:33 BladeRunner kernel: [   54.792100]  [0000000010263b40] nouveau_card_init+0x135c/0x15b8 [nouveau]
Jan 11 08:39:33 BladeRunner kernel: [   54.801659]  [00000000102643d0] nouveau_load+0x550/0x588 [nouveau]
Jan 11 08:39:33 BladeRunner kernel: [   54.811208]  [00000000006334e0] drm_get_pci_dev+0x124/0x21c
Jan 11 08:39:33 BladeRunner kernel: [   54.820677]  [00000000005d42f4] pci_device_probe+0x44/0x7c
Jan 11 08:39:33 BladeRunner kernel: [   54.830194]  [0000000000643aac] driver_probe_device+0xa4/0x154
Jan 11 08:39:33 BladeRunner kernel: [   54.839744]  [0000000000643bb0] __driver_attach+0x54/0x80
Jan 11 08:39:33 BladeRunner kernel: [   54.849376]  [0000000000642d58] bus_for_each_dev+0x3c/0x7c
Jan 11 08:39:33 BladeRunner kernel: [   54.859027]  [00000000006433f8] bus_add_driver+0x9c/0x23c
Jan 11 08:39:33 BladeRunner kernel: [   54.868774]  [0000000000643e74] driver_register+0xb0/0x14c
Jan 11 08:39:33 BladeRunner kernel: [   54.878420]  [00000000005d46e8] __pci_register_driver+0x30/0xb4
Jan 11 08:39:33 BladeRunner kernel: [   54.888080]  [0000000000426b28] do_one_initcall+0x68/0x140
Jan 11 08:39:33 BladeRunner kernel: [   54.897675]  [000000000048b6e4] SyS_init_module+0x68/0x198
Jan 11 08:39:33 BladeRunner kernel: [   54.907375]  [0000000000406094] linux_sparc_syscall32+0x34/0x40
Jan 11 08:39:33 BladeRunner kernel: [   54.917144] Disabling lock debugging due to kernel taint
Jan 11 08:39:33 BladeRunner kernel: [   54.927129] Caller[00000000102c7a24]: nv50_display_destroy+0xd4/0x48c [nouveau]
Jan 11 08:39:33 BladeRunner kernel: [   54.937277] Caller[00000000102c8070]: nv50_display_create+0x294/0x2a4 [nouveau]
Jan 11 08:39:33 BladeRunner kernel: [   54.947523] Caller[0000000010263b40]: nouveau_card_init+0x135c/0x15b8 [nouveau]
Jan 11 08:39:33 BladeRunner kernel: [   54.957802] Caller[00000000102643d0]: nouveau_load+0x550/0x588 [nouveau]
Jan 11 08:39:33 BladeRunner kernel: [   54.968092] Caller[00000000006334e0]: drm_get_pci_dev+0x124/0x21c
Jan 11 08:39:33 BladeRunner kernel: [   54.978223] Caller[00000000005d42f4]: pci_device_probe+0x44/0x7c
Jan 11 08:39:33 BladeRunner kernel: [   54.988586] Caller[0000000000643aac]: driver_probe_device+0xa4/0x154
Jan 11 08:39:33 BladeRunner kernel: [   54.998726] Caller[0000000000643bb0]: __driver_attach+0x54/0x80
Jan 11 08:39:33 BladeRunner kernel: [   55.008737] Caller[0000000000642d58]: bus_for_each_dev+0x3c/0x7c
Jan 11 08:39:33 BladeRunner kernel: [   55.018561] Caller[00000000006433f8]: bus_add_driver+0x9c/0x23c
Jan 11 08:39:33 BladeRunner kernel: [   55.028373] Caller[0000000000643e74]: driver_register+0xb0/0x14c
Jan 11 08:39:33 BladeRunner kernel: [   55.037962] Caller[00000000005d46e8]: __pci_register_driver+0x30/0xb4
Jan 11 08:39:33 BladeRunner kernel: [   55.047609] Caller[0000000000426b28]: do_one_initcall+0x68/0x140
Jan 11 08:39:33 BladeRunner kernel: [   55.057146] Caller[000000000048b6e4]: SyS_init_module+0x68/0x198
Jan 11 08:39:33 BladeRunner kernel: [   55.066681] Caller[0000000000406094]: linux_sparc_syscall32+0x34/0x40
Jan 11 08:39:33 BladeRunner kernel: [   55.076013] Caller[0000000000013c8c]: 0x13c8c
Jan 11 08:39:33 BladeRunner kernel: [   55.085345] Instruction DUMP: 81cfe008  01000000  9de3bf50 <c4062364> 21000061  ba102000  82102000  a01422a0  23080000  

--------------010301070405070801010902
Content-Type: text/x-log;
 name="Xorg.0.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="Xorg.0.log"

[    26.544] 
X.Org X Server 1.11.2.902 (1.11.3 RC 2)
Release Date: 2011-12-09
[    26.545] X Protocol Version 11, Revision 0
[    26.545] Build Operating System: Linux 2.6.32-5-sparc64-smp sparc Debian
[    26.545] Current Operating System: Linux BladeRunner 3.1.0-1-sparc64 #1 Fri Dec 23 20:16:01 UTC 2011 sparc64
[    26.545] Kernel command line: root=/dev/hda2 ro
[    26.546] Build Date: 11 December 2011  11:14:33PM
[    26.546] xorg-server 2:1.11.2.902-1 (Cyril Brulebois <kibi-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>) 
[    26.546] Current version of pixman: 0.24.0
[    26.546] 	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
[    26.546] Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[    26.547] (==) Log file: "/var/log/Xorg.0.log", Time: Wed Jan 11 11:17:23 2012
[    26.611] (==) Using config file: "/etc/X11/xorg.conf"
[    26.611] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[    26.697] (==) ServerLayout "X.org Configured"
[    26.698] (**) |-->Screen "Screen0" (0)
[    26.698] (**) |   |-->Monitor "Monitor0"
[    26.699] (**) |   |-->Device "Card0"
[    26.700] (**) |-->Input Device "Mouse0"
[    26.700] (**) |-->Input Device "Keyboard0"
[    26.700] (==) Automatically adding devices
[    26.700] (==) Automatically enabling devices
[    26.772] (WW) The directory "/usr/share/fonts/X11/cyrillic" does not exist.
[    26.772] 	Entry deleted from font path.
[    26.873] (WW) `fonts.dir' not found (or not valid) in "/var/lib/defoma/x-ttcidfont-conf.d/dirs/TrueType".
[    26.873] 	Entry deleted from font path.
[    26.873] 	(Run 'mkfontdir' on "/var/lib/defoma/x-ttcidfont-conf.d/dirs/TrueType").
[    26.873] (WW) The directory "/usr/share/fonts/X11/cyrillic" does not exist.
[    26.873] 	Entry deleted from font path.
[    26.874] (WW) `fonts.dir' not found (or not valid) in "/var/lib/defoma/x-ttcidfont-conf.d/dirs/TrueType".
[    26.874] 	Entry deleted from font path.
[    26.874] 	(Run 'mkfontdir' on "/var/lib/defoma/x-ttcidfont-conf.d/dirs/TrueType").
[    26.874] (**) FontPath set to:
	/usr/share/fonts/X11/misc,
	/usr/share/fonts/X11/100dpi/:unscaled,
	/usr/share/fonts/X11/75dpi/:unscaled,
	/usr/share/fonts/X11/Type1,
	/usr/share/fonts/X11/100dpi,
	/usr/share/fonts/X11/75dpi,
	built-ins,
	/usr/share/fonts/X11/misc,
	/usr/share/fonts/X11/100dpi/:unscaled,
	/usr/share/fonts/X11/75dpi/:unscaled,
	/usr/share/fonts/X11/Type1,
	/usr/share/fonts/X11/100dpi,
	/usr/share/fonts/X11/75dpi,
	built-ins
[    26.874] (**) ModulePath set to "/usr/lib/xorg/modules"
[    26.874] (WW) Hotplugging is on, devices using drivers 'kbd', 'mouse' or 'vmmouse' will be disabled.
[    26.874] (WW) Disabling Mouse0
[    26.874] (WW) Disabling Keyboard0
[    26.874] (II) Loader magic: 0x701d1830
[    26.874] (II) Module ABI versions:
[    26.875] 	X.Org ANSI C Emulation: 0.4
[    26.875] 	X.Org Video Driver: 11.0
[    26.875] 	X.Org XInput driver : 13.0
[    26.875] 	X.Org Server Extension : 6.0
[    26.883] (!!) More than one possible primary device found
[    26.888] (--) PCI: (0:0:19:0) 1002:4752:0000:0000 rev 39, Mem @ 0x20000000/16777216, 0x00426000/8192, 0x00000000/1, 0x00000000/1, 0x00000000/1, I/O @ 0x00000b00/256, BIOS @ 0x????????/131072
[    26.888] (--) PCI: (0:2:0:0) 10de:06e4:3842:b724 rev 161, Mem @ 0x03000000/16777216, 0x10000000/268435456, 0x00000000/1, 0x04000000/33554432, 0x00000000/1, I/O @ 0x00001000/128, BIOS @ 0x????????/131072
[    26.900] (II) "extmod" will be loaded. This was enabled by default and also specified in the config file.
[    26.900] (II) "dbe" will be loaded. This was enabled by default and also specified in the config file.
[    26.900] (II) "glx" will be loaded. This was enabled by default and also specified in the config file.
[    26.900] (II) "record" will be loaded. This was enabled by default and also specified in the config file.
[    26.900] (II) "dri" will be loaded. This was enabled by default and also specified in the config file.
[    26.901] (II) "dri2" will be loaded. This was enabled by default and also specified in the config file.
[    26.901] (II) LoadModule: "record"
[    26.953] (II) Loading /usr/lib/xorg/modules/extensions/librecord.so
[    26.963] (II) Module record: vendor="X.Org Foundation"
[    26.963] 	compiled for 1.11.2.902, module version = 1.13.0
[    26.963] 	Module class: X.Org Server Extension
[    26.964] 	ABI class: X.Org Server Extension, version 6.0
[    26.964] (II) Loading extension RECORD
[    26.964] (II) LoadModule: "dri2"
[    26.965] (II) Loading /usr/lib/xorg/modules/extensions/libdri2.so
[    26.983] (II) Module dri2: vendor="X.Org Foundation"
[    26.983] 	compiled for 1.11.2.902, module version = 1.2.0
[    26.983] 	ABI class: X.Org Server Extension, version 6.0
[    26.984] (II) Loading extension DRI2
[    26.984] (II) LoadModule: "dbe"
[    26.985] (II) Loading /usr/lib/xorg/modules/extensions/libdbe.so
[    26.996] (II) Module dbe: vendor="X.Org Foundation"
[    26.996] 	compiled for 1.11.2.902, module version = 1.0.0
[    26.996] 	Module class: X.Org Server Extension
[    26.996] 	ABI class: X.Org Server Extension, version 6.0
[    26.996] (II) Loading extension DOUBLE-BUFFER
[    26.996] (II) LoadModule: "dri"
[    26.997] (II) Loading /usr/lib/xorg/modules/extensions/libdri.so
[    27.000] (II) Module dri: vendor="X.Org Foundation"
[    27.000] 	compiled for 1.11.2.902, module version = 1.0.0
[    27.000] 	ABI class: X.Org Server Extension, version 6.0
[    27.000] (II) Loading extension XFree86-DRI
[    27.001] (II) LoadModule: "extmod"
[    27.001] (II) Loading /usr/lib/xorg/modules/extensions/libextmod.so
[    27.022] (II) Module extmod: vendor="X.Org Foundation"
[    27.022] 	compiled for 1.11.2.902, module version = 1.0.0
[    27.022] 	Module class: X.Org Server Extension
[    27.022] 	ABI class: X.Org Server Extension, version 6.0
[    27.023] (II) Loading extension SELinux
[    27.023] (II) Loading extension MIT-SCREEN-SAVER
[    27.023] (II) Loading extension XFree86-VidModeExtension
[    27.023] (II) Loading extension XFree86-DGA
[    27.023] (II) Loading extension DPMS
[    27.023] (II) Loading extension XVideo
[    27.023] (II) Loading extension XVideo-MotionCompensation
[    27.023] (II) Loading extension X-Resource
[    27.023] (II) LoadModule: "glx"
[    27.028] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[    27.042] (II) Module glx: vendor="X.Org Foundation"
[    27.042] 	compiled for 1.11.2.902, module version = 1.0.0
[    27.042] 	ABI class: X.Org Server Extension, version 6.0
[    27.054] (==) AIGLX enabled
[    27.054] (II) Loading extension GLX
[    27.054] (II) LoadModule: "nouveau"
[    27.088] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[    27.135] (II) Module nouveau: vendor="X.Org Foundation"
[    27.135] 	compiled for 1.11.2.901, module version = 0.0.16
[    27.135] 	Module class: X.Org Video Driver
[    27.135] 	ABI class: X.Org Video Driver, version 11.0
[    27.135] (II) NOUVEAU driver Date:   Wed Nov 30 18:56:54 2011 +0100
[    27.135] (II) NOUVEAU driver for NVIDIA chipset families :
[    27.135] 	RIVA TNT        (NV04)
[    27.136] 	RIVA TNT2       (NV05)
[    27.136] 	GeForce 256     (NV10)
[    27.136] 	GeForce 2       (NV11, NV15)
[    27.137] 	GeForce 4MX     (NV17, NV18)
[    27.137] 	GeForce 3       (NV20)
[    27.137] 	GeForce 4Ti     (NV25, NV28)
[    27.137] 	GeForce FX      (NV3x)
[    27.137] 	GeForce 6       (NV4x)
[    27.138] 	GeForce 7       (G7x)
[    27.138] 	GeForce 8       (G8x)
[    27.138] 	GeForce GTX 200 (NVA0)
[    27.138] 	GeForce GTX 400 (NVC0)
[    27.138] (++) using VT number 7

[    27.222] drmOpenDevice: node name is /dev/dri/card0

--------------010301070405070801010902
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------010301070405070801010902--
