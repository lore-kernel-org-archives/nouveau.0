From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 85471] [NV86] nouveau/kernel 3.18.0-rc1: nouveau
 deadlocks on 2nd Xorg start or reboot
Date: Thu, 13 Aug 2015 01:47:02 +0000
Message-ID: <bug-85471-8800-KtaUzvBsHR@http.bugs.freedesktop.org/>
References: <bug-85471-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1239655836=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-85471-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1239655836==
Content-Type: multipart/alternative; boundary="1439430422.C84F31Bb1.26904"; charset="UTF-8"


--1439430422.C84F31Bb1.26904
Date: Thu, 13 Aug 2015 01:47:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D85471

--- Comment #8 from D=C4=81vis <davispuh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I've same issue, but on Arch Linux 4.1 with NVIDIA GeForce GTX 650 Ti
nouveau crashes kernel that can't even reboot/poweroff, only with hard rese=
t.

adding nouveau.runpm=3D0 to kernel parameters atleast it doesn't crash.


kernel: [drm] Initialized drm 1.1.0 20060810
kernel: nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e6060a1
kernel: nouveau  [  DEVICE][0000:01:00.0] Chipset: GK106 (NVE6)
kernel: nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
kernel: nouveau  [   VBIOS][0000:01:00.0] using image from PROM
kernel: nouveau  [   VBIOS][0000:01:00.0] BIT signature found
kernel: nouveau  [   VBIOS][0000:01:00.0] version 80.06.21.00.37
kernel: nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
kernel: nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
kernel: nouveau  [     PFB][0000:01:00.0] RAM size: 1024 MiB
kernel: nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
kernel: nouveau  [    VOLT][0000:01:00.0] GPU voltage: 887500uv
kernel: nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM
kernel: nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
kernel: nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
kernel: nouveau  [     CLK][0000:01:00.0] 07: core 324 MHz memory 648 MHz
kernel: nouveau  [     CLK][0000:01:00.0] 0a: core 549 MHz memory 1620 MHz
kernel: nouveau  [     CLK][0000:01:00.0] 0f: core 928-954 MHz memory 5400 =
MHz
kernel: nouveau  [     CLK][0000:01:00.0] --: core 324 MHz memory 648 MHz
kernel: nouveau  [     DRM] VRAM: 1024 MiB
kernel: nouveau  [     DRM] GART: 1048576 MiB
kernel: nouveau  [     DRM] TMDS table version 2.0
kernel: nouveau  [     DRM] DCB version 4.0
kernel: nouveau  [     DRM] DCB outp 00: 01000f02 00020030
kernel: nouveau  [     DRM] DCB outp 01: 02000f00 00020030
kernel: nouveau  [     DRM] DCB outp 02: 08011f82 0f420030
kernel: nouveau  [     DRM] DCB outp 03: 02022f62 0f420010
kernel: nouveau  [     DRM] DCB conn 00: 00001030
kernel: nouveau  [     DRM] DCB conn 01: 00002131
kernel: nouveau  [     DRM] DCB conn 02: 00010263
kernel: [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
kernel: [drm] Driver supports precise vblank timestamp query.
kernel: nouveau  [     DRM] MM: using COPY for buffer copies
kernel: nouveau  [     DRM] allocated 2560x1440 fb: 0x60000, bo
ffff880223222000
kernel: fbcon: nouveaufb (fb0) is primary device
kernel: nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
kernel: nouveau 0000:01:00.0: registered panic notifier
kernel: [drm] Initialized nouveau 1.2.2 20120801 for 0000:01:00.0 on minor 0




kernel: INFO: task kworker/2:2:115 blocked for more than 120 seconds.
kernel:       Not tainted 4.1.0-ARCH-dirty #3
kernel: "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this
message.
kernel: kworker/2:2     D ffff880222da3bb8     0   115      2 0x00000000
kernel: Workqueue: pm pm_runtime_work
kernel:  ffff880222da3bb8 ffff880225240000 ffff880225335180 ffffffff81b1e8e8
kernel:  ffff880222da4000 ffff880224e3e146 ffff880224e3e200 0000000000000000
kernel:  0000000000000000 ffff880222da3bd8 ffffffff81587d77 ffff880224e3e146
kernel: Call Trace:
kernel:  [<ffffffff81587d77>] schedule+0x37/0x90
kernel:  [<ffffffff813ff65d>] rpm_resume+0x20d/0x6b0
kernel:  [<ffffffff810bc6b0>] ? wake_atomic_t_function+0x60/0x60
kernel:  [<ffffffff813ffde3>] pm_runtime_forbid+0x43/0x50
kernel:  [<ffffffffa0368778>] nouveau_pmops_runtime_suspend+0xc8/0xf0 [nouv=
eau]
kernel:  [<ffffffff81311baf>] pci_pm_runtime_suspend+0x5f/0x140
kernel:  [<ffffffff81311b50>] ? pci_legacy_suspend_late+0xf0/0xf0
kernel:  [<ffffffff813fe466>] __rpm_callback+0x36/0x90
kernel:  [<ffffffff813fe4e8>] rpm_callback+0x28/0x90
kernel:  [<ffffffff813feae6>] rpm_suspend+0x126/0x690
kernel:  [<ffffffff8101477c>] ? __switch_to+0x2bc/0x5e0
kernel:  [<ffffffff814002f2>] pm_runtime_work+0x72/0xc0
kernel:  [<ffffffff8109193b>] process_one_work+0x14b/0x470
kernel:  [<ffffffff81091ca8>] worker_thread+0x48/0x4c0
kernel:  [<ffffffff81091c60>] ? process_one_work+0x470/0x470
kernel:  [<ffffffff81091c60>] ? process_one_work+0x470/0x470
kernel:  [<ffffffff810977f8>] kthread+0xd8/0xf0
kernel:  [<ffffffff81097720>] ? kthread_worker_fn+0x170/0x170
kernel:  [<ffffffff8158bda2>] ret_from_fork+0x42/0x70
kernel:  [<ffffffff81097720>] ? kthread_worker_fn+0x170/0x170
kernel: INFO: task Xorg.wrap:1012 blocked for more than 120 seconds.
kernel:       Not tainted 4.1.0-ARCH-dirty #3
kernel: "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this
message.
kernel: Xorg.wrap       D ffff8800bdc979d8     0  1012    962 0x00000000
kernel:  ffff8800bdc979d8 ffff880225241460 ffff880222ccf010 ffff880224ab81b0
kernel:  ffff8800bdc98000 ffff880224e3e146 ffff880224e3e200 0000000000000000
kernel:  0000000000000004 ffff8800bdc979f8 ffffffff81587d77 ffff880224e3e146
kernel: Call Trace:
kernel:  [<ffffffff81587d77>] schedule+0x37/0x90
kernel:  [<ffffffff813ff65d>] rpm_resume+0x20d/0x6b0
kernel:  [<ffffffff810bc6b0>] ? wake_atomic_t_function+0x60/0x60
kernel:  [<ffffffff813ffb3f>] __pm_runtime_resume+0x3f/0x60
kernel:  [<ffffffffa0368d4d>] nouveau_drm_open+0x3d/0x280 [nouveau]
kernel:  [<ffffffff811c2e1e>] ? kmem_cache_alloc_trace+0x1fe/0x230
kernel:  [<ffffffffa007a85f>] drm_open+0x1af/0x4c0 [drm]
kernel:  [<ffffffffa0081799>] drm_stub_open+0xa9/0x120 [drm]
kernel:  [<ffffffff811e594e>] chrdev_open+0xae/0x1f0
kernel:  [<ffffffff811de867>] do_dentry_open+0x227/0x330
kernel:  [<ffffffff811e58a0>] ? cdev_put+0x30/0x30
kernel:  [<ffffffff811dec69>] vfs_open+0x49/0x50
kernel:  [<ffffffff811ef63e>] do_last.isra.11+0x33e/0xf00
kernel:  [<ffffffff811eddfe>] ? path_init+0x17e/0x460
kernel:  [<ffffffff811f0291>] path_openat+0x91/0x690
kernel:  [<ffffffff81166135>] ? filemap_map_pages+0x135/0x270
kernel:  [<ffffffff811f1d29>] do_filp_open+0x49/0xd0
kernel:  [<ffffffff812dde5a>] ? find_next_zero_bit+0x1a/0x30
kernel:  [<ffffffff811ff347>] ? __alloc_fd+0xa7/0x130
kernel:  [<ffffffff811dfe9d>] do_sys_open+0x14d/0x250
kernel:  [<ffffffff811dffbe>] SyS_open+0x1e/0x20
kernel:  [<ffffffff8158b9ae>] system_call_fastpath+0x12/0x71
kernel: INFO: task libvirtd:1463 blocked for more than 120 seconds.
kernel:       Not tainted 4.1.0-ARCH-dirty #3
kernel: "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this
message.
kernel: libvirtd        D ffff8800bc91bc78     0  1463      1 0x00000000
kernel:  ffff8800bc91bc78 ffff880225241e90 ffff8800c0bc8a30 0000000000000000
kernel:  ffff8800bc91c000 ffff880224e3e146 ffff880224e3e200 ffff880224e3e146
kernel:  00007f96227a0c30 ffff8800bc91bc98 ffffffff81587d77 ffff880224e3e146
kernel: Call Trace:
kernel:  [<ffffffff81587d77>] schedule+0x37/0x90
kernel:  [<ffffffff813fe78d>] __pm_runtime_barrier+0xad/0x170
kernel:  [<ffffffff810bc6b0>] ? wake_atomic_t_function+0x60/0x60
kernel:  [<ffffffff813ffc0b>] pm_runtime_barrier+0x5b/0xc0
kernel:  [<ffffffff8130fd5b>] pci_config_pm_runtime_get+0x3b/0x60
kernel:  [<ffffffff81314b36>] pci_read_config+0x96/0x2b0
kernel:  [<ffffffff8125b13a>] sysfs_kf_bin_read+0x4a/0x70
kernel:  [<ffffffff8125a798>] kernfs_fop_read+0xa8/0x170
kernel:  [<ffffffff811e03c7>] __vfs_read+0x37/0x100
kernel:  [<ffffffff8128314e>] ? security_file_permission+0x8e/0xa0
kernel:  [<ffffffff811e0d37>] vfs_read+0x87/0x140
kernel:  [<ffffffff811e1d2a>] SyS_pread64+0x9a/0xc0
kernel:  [<ffffffff8158b9ae>] system_call_fastpath+0x12/0x71
kernel: INFO: task kworker/2:2:115 blocked for more than 120 seconds.
kernel:       Not tainted 4.1.0-ARCH-dirty #3
kernel: "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this
message.
kernel: kworker/2:2     D ffff880222da3bb8     0   115      2 0x00000000
kernel: Workqueue: pm pm_runtime_work
kernel:  ffff880222da3bb8 ffff880225240000 ffff880225335180 ffffffff81b1e8e8
kernel:  ffff880222da4000 ffff880224e3e146 ffff880224e3e200 0000000000000000
kernel:  0000000000000000 ffff880222da3bd8 ffffffff81587d77 ffff880224e3e146
kernel: Call Trace:
kernel:  [<ffffffff81587d77>] schedule+0x37/0x90
kernel:  [<ffffffff813ff65d>] rpm_resume+0x20d/0x6b0
kernel:  [<ffffffff810bc6b0>] ? wake_atomic_t_function+0x60/0x60
kernel:  [<ffffffff813ffde3>] pm_runtime_forbid+0x43/0x50
kernel:  [<ffffffffa0368778>] nouveau_pmops_runtime_suspend+0xc8/0xf0 [nouv=
eau]
kernel:  [<ffffffff81311baf>] pci_pm_runtime_suspend+0x5f/0x140
kernel:  [<ffffffff81311b50>] ? pci_legacy_suspend_late+0xf0/0xf0
kernel:  [<ffffffff813fe466>] __rpm_callback+0x36/0x90
kernel:  [<ffffffff813fe4e8>] rpm_callback+0x28/0x90
kernel:  [<ffffffff813feae6>] rpm_suspend+0x126/0x690
kernel:  [<ffffffff8101477c>] ? __switch_to+0x2bc/0x5e0
kernel:  [<ffffffff814002f2>] pm_runtime_work+0x72/0xc0
kernel:  [<ffffffff8109193b>] process_one_work+0x14b/0x470
kernel:  [<ffffffff81091ca8>] worker_thread+0x48/0x4c0
kernel:  [<ffffffff81091c60>] ? process_one_work+0x470/0x470
kernel:  [<ffffffff81091c60>] ? process_one_work+0x470/0x470
kernel:  [<ffffffff810977f8>] kthread+0xd8/0xf0
kernel:  [<ffffffff81097720>] ? kthread_worker_fn+0x170/0x170
kernel:  [<ffffffff8158bda2>] ret_from_fork+0x42/0x70
kernel:  [<ffffffff81097720>] ? kthread_worker_fn+0x170/0x170



[   185.819] (II) Loader magic: 0x817d60
[   185.819] (II) Module ABI versions:
[   185.819]    X.Org ANSI C Emulation: 0.4
[   185.819]    X.Org Video Driver: 19.0
[   185.819]    X.Org XInput driver : 21.1
[   185.819]    X.Org Server Extension : 9.0
[   185.821] (EE) systemd-logind: failed to get session: PID 2044 does not
belong to any known session
[   185.822] (II) xfree86: Adding drm device (/dev/dri/card0)
[   185.824] (--) PCI:*(0:1:0:0) 10de:11c6:1462:2805 rev 161, Mem @
0xfa000000/16777216, 0xd0000000/134217728, 0xde000000/33554432, I/O @
0x0000af00/128, BIOS @ 0x????????/524288
[   185.825] (II) Open ACPI successful (/var/run/acpid.socket)
[   185.825] (II) LoadModule: "glx"
[   185.825] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[   185.826] (II) Module glx: vendor=3D"X.Org Foundation"
[   185.826]    compiled for 1.17.2, module version =3D 1.0.0
[   185.826]    ABI class: X.Org Server Extension, version 9.0
[   185.826] (=3D=3D) AIGLX enabled
[   185.826] (II) LoadModule: "nouveau"
[   185.826] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[   185.827] (II) Module nouveau: vendor=3D"X.Org Foundation"
[   185.827]    compiled for 1.17.0, module version =3D 1.0.11
[   185.827]    Module class: X.Org Video Driver
[   185.827]    ABI class: X.Org Video Driver, version 19.0
[   185.827] (II) NOUVEAU driver
[   185.827] (II) NOUVEAU driver for NVIDIA chipset families :
[   185.827]    RIVA TNT        (NV04)
[   185.827]    RIVA TNT2       (NV05)
[   185.827]    GeForce 256     (NV10)
[   185.827]    GeForce 2       (NV11, NV15)
[   185.827]    GeForce 4MX     (NV17, NV18)
[   185.827]    GeForce 3       (NV20)
[   185.827]    GeForce 4Ti     (NV25, NV28)
[   185.827]    GeForce FX      (NV3x)
[   185.827]    GeForce 6       (NV4x)
[   185.827]    GeForce 7       (G7x)
[   185.827]    GeForce 8       (G8x)
[   185.827]    GeForce GTX 200 (NVA0)
[   185.827]    GeForce GTX 400 (NVC0)
[   185.827] (++) using VT number 1
[   185.830] (II) [drm] nouveau interface version: 1.2.2
[   185.830] (II) Loading sub module "dri2"
[   185.830] (II) LoadModule: "dri2"
[   185.830] (II) Module "dri2" already built-in
[   185.831] (--) NOUVEAU(0): Chipset: "NVIDIA NVE6"
[   185.831] (**) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
[   185.831] (=3D=3D) NOUVEAU(0): RGB weight 888
[   185.831] (=3D=3D) NOUVEAU(0): Default visual is TrueColor
[   185.831] (=3D=3D) NOUVEAU(0): Using HW cursor
[   185.831] (=3D=3D) NOUVEAU(0): GLX sync to VBlank enabled.
[   185.831] (=3D=3D) NOUVEAU(0): Page flipping enabled
[   185.831] (=3D=3D) NOUVEAU(0): Swap limit set to 1 [Max allowed 2]
[   185.831] (=3D=3D) NOUVEAU(0): Page flipping synced to vblank by kernel.
[   185.831] (II) NOUVEAU(0): Initializing outputs ...
[   185.843] (II) NOUVEAU(0): Output DVI-I-1 using monitor section DVI-I-0
[   185.873] (II) NOUVEAU(0): Output DVI-D-1 has no monitor section
[   185.874] (II) NOUVEAU(0): Output HDMI-1 has no monitor section
[   185.874] (II) NOUVEAU(0): 3 crtcs needed for screen.
[   185.876] (II) NOUVEAU(0): Allocated crtc nr. 0 to this screen.
[   185.876] (II) NOUVEAU(0): Allocated crtc nr. 1 to this screen.
[   185.876] (II) NOUVEAU(0): Allocated crtc nr. 2 to this screen.
[   185.876] (II) NOUVEAU(0): Allocated crtc nr. 3 to this screen.
[   185.888] (II) NOUVEAU(0): EDID for output DVI-I-1
[   185.918] (II) NOUVEAU(0): EDID for output DVI-D-1
[   185.918] (II) NOUVEAU(0): Manufacturer: DEL  Model: 407e  Serial#:
875704403
[   185.918] (II) NOUVEAU(0): Year: 2014  Week: 35
[   185.918] (II) NOUVEAU(0): EDID Version: 1.3
[   185.918] (II) NOUVEAU(0): Digital Display Input
[   185.918] (II) NOUVEAU(0): Max Image Size [cm]: horiz.: 60  vert.: 34
[   185.918] (II) NOUVEAU(0): Gamma: 2.20
[   185.918] (II) NOUVEAU(0): DPMS capabilities: StandBy Suspend Off
[   185.918] (II) NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb 4:=
4:4
[   185.918] (II) NOUVEAU(0): First detailed timing is preferred mode
[   185.918] (II) NOUVEAU(0): redX: 0.653 redY: 0.336   greenX: 0.295 green=
Y:
0.640
[   185.918] (II) NOUVEAU(0): blueX: 0.146 blueY: 0.042   whiteX: 0.313 whi=
teY:
0.329
[   185.918] (II) NOUVEAU(0): Supported established timings:
[   185.918] (II) NOUVEAU(0): 720x400@70Hz
[   185.918] (II) NOUVEAU(0): 640x480@60Hz
[   185.918] (II) NOUVEAU(0): 640x480@75Hz
[   185.918] (II) NOUVEAU(0): 800x600@60Hz
[   185.918] (II) NOUVEAU(0): 800x600@75Hz
[   185.918] (II) NOUVEAU(0): 1024x768@60Hz
[   185.918] (II) NOUVEAU(0): 1024x768@75Hz
[   185.918] (II) NOUVEAU(0): 1280x1024@75Hz
[   185.918] (II) NOUVEAU(0): Manufacturer's mask: 0
[   185.918] (II) NOUVEAU(0): Supported standard timings:
[   185.918] (II) NOUVEAU(0): #0: hsize: 1280  vsize 800  refresh: 60  vid:=
 129
[   185.918] (II) NOUVEAU(0): #1: hsize: 1680  vsize 1050  refresh: 60  vid:
179
[   185.918] (II) NOUVEAU(0): #2: hsize: 1920  vsize 1200  refresh: 60  vid:
209
[   185.918] (II) NOUVEAU(0): #3: hsize: 1152  vsize 864  refresh: 75  vid:
20337
[   185.918] (II) NOUVEAU(0): #4: hsize: 1600  vsize 1200  refresh: 60  vid:
16553
[   185.918] (II) NOUVEAU(0): #5: hsize: 1280  vsize 1024  refresh: 60  vid:
32897
[   185.918] (II) NOUVEAU(0): #6: hsize: 1920  vsize 1080  refresh: 60  vid:
49361
[   185.918] (II) NOUVEAU(0): Supported detailed timing:
[   185.918] (II) NOUVEAU(0): clock: 241.5 MHz   Image Size:  597 x 336 mm
[   185.918] (II) NOUVEAU(0): h_active: 2560  h_sync: 2608  h_sync_end 2640
h_blank_end 2720 h_border: 0
[   185.918] (II) NOUVEAU(0): v_active: 1440  v_sync: 1443  v_sync_end 1448
v_blanking: 1481 v_border: 0
[   185.918] (II) NOUVEAU(0): Serial No: 7JNY548P420S
[   185.918] (II) NOUVEAU(0): Monitor name: DELL U2713HM
[   185.918] (II) NOUVEAU(0): Ranges: V min: 49 V max: 86 Hz, H min: 29 H m=
ax:
113 kHz, PixClock max 285 MHz
[   185.918] (II) NOUVEAU(0): EDID (in hex):
[   185.918] (II) NOUVEAU(0):   00ffffffffffff0010ac7e4053303234
[   185.918] (II) NOUVEAU(0):   23180103803c2278ea4bb5a7564ba325
[   185.918] (II) NOUVEAU(0):   0a5054a54b008100b300d100714fa940
[   185.918] (II) NOUVEAU(0):   8180d1c00101565e00a0a0a029503020
[   185.918] (II) NOUVEAU(0):   350055502100001a000000ff00374a4e
[   185.918] (II) NOUVEAU(0):   5935343850343230530a000000fc0044
[   185.918] (II) NOUVEAU(0):   454c4c205532373133484d0a000000fd
[   185.918] (II) NOUVEAU(0):   0031561d711c000a20202020202000c1
[   185.918] (II) NOUVEAU(0): Printing probed modes for output DVI-D-1
[   185.918] (II) NOUVEAU(0): Modeline "2560x1440"x60.0  241.50  2560 2608 =
2640
2720  1440 1443 1448 1481 +hsync -vsync (88.8 kHz eP)
[   185.918] (II) NOUVEAU(0): Modeline "1920x1200"x60.0  154.00  1920 1968 =
2000
2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz e)
[   185.918] (II) NOUVEAU(0): Modeline "1920x1080"x60.0  172.78  1920 2040 =
2248
2576  1080 1081 1084 1118 -hsync +vsync (67.1 kHz)
[   185.918] (II) NOUVEAU(0): Modeline "1600x1200"x60.0  162.00  1600 1664 =
1856
2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz e)
[   185.918] (II) NOUVEAU(0): Modeline "1680x1050"x59.9  119.00  1680 1728 =
1760
1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz e)
[   185.918] (II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 =
1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[   185.918] (II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 =
1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[   185.918] (II) NOUVEAU(0): Modeline "1280x800"x59.9   71.00  1280 1328 1=
360
1440  800 803 809 823 +hsync -vsync (49.3 kHz e)
[   185.918] (II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1=
344
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[   185.918] (II) NOUVEAU(0): Modeline "1024x768"x75.1   78.80  1024 1040 1=
136
1312  768 769 772 800 +hsync +vsync (60.1 kHz e)
[   185.919] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1=
184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[   185.919] (II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 =
1056
 600 601 604 625 +hsync +vsync (46.9 kHz e)
[   185.919] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 =
1056
 600 601 605 628 +hsync +vsync (37.9 kHz e)
[   185.919] (II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 =
840=20
480 481 484 500 -hsync -vsync (37.5 kHz e)
[   185.919] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 =
800=20
480 490 492 525 -hsync -vsync (31.5 kHz e)
[   185.919] (II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 =
900=20
400 412 414 449 -hsync +vsync (31.5 kHz e)
[   185.920] (II) NOUVEAU(0): EDID for output HDMI-1
[   185.920] (II) NOUVEAU(0): Output DVI-I-1 disconnected
[   185.920] (II) NOUVEAU(0): Output DVI-D-1 connected
[   185.920] (II) NOUVEAU(0): Output HDMI-1 disconnected
[   185.920] (II) NOUVEAU(0): Using exact sizes for initial modes
[   185.920] (II) NOUVEAU(0): Output DVI-D-1 using initial mode 2560x1440
[   185.920] (II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless
otherwise stated.
[   185.920] (--) NOUVEAU(0): Virtual size is 2560x1440 (pitch 0)
[   185.920] (**) NOUVEAU(0):  Driver mode "2560x1440": 241.5 MHz (scaled f=
rom
0.0 MHz), 88.8 kHz, 60.0 Hz
[   185.920] (II) NOUVEAU(0): Modeline "2560x1440"x60.0  241.50  2560 2608 =
2640
2720  1440 1443 1448 1481 +hsync -vsync (88.8 kHz eP)
[   185.920] (**) NOUVEAU(0):  Driver mode "1920x1200": 154.0 MHz (scaled f=
rom
0.0 MHz), 74.0 kHz, 60.0 Hz
[   185.920] (II) NOUVEAU(0): Modeline "1920x1200"x60.0  154.00  1920 1968 =
2000
2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz e)
[   185.920] (**) NOUVEAU(0):  Mode "1920x1080": 172.8 MHz (scaled from 0.0
MHz), 67.1 kHz, 60.0 Hz
[   185.920] (II) NOUVEAU(0): Modeline "1920x1080"x60.0  172.78  1920 2040 =
2248
2576  1080 1081 1084 1118 -hsync +vsync (67.1 kHz)
[   185.920] (**) NOUVEAU(0):  Driver mode "1600x1200": 162.0 MHz (scaled f=
rom
0.0 MHz), 75.0 kHz, 60.0 Hz
[   185.920] (II) NOUVEAU(0): Modeline "1600x1200"x60.0  162.00  1600 1664 =
1856
2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz e)
[   185.920] (**) NOUVEAU(0):  Driver mode "1680x1050": 119.0 MHz (scaled f=
rom
0.0 MHz), 64.7 kHz, 59.9 Hz
[   185.920] (II) NOUVEAU(0): Modeline "1680x1050"x59.9  119.00  1680 1728 =
1760
1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz e)
[   185.920] (**) NOUVEAU(0):  Driver mode "1280x1024": 135.0 MHz (scaled f=
rom
0.0 MHz), 80.0 kHz, 75.0 Hz
[   185.920] (II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 =
1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[   185.920] (**) NOUVEAU(0):  Driver mode "1280x1024": 108.0 MHz (scaled f=
rom
0.0 MHz), 64.0 kHz, 60.0 Hz
[   185.920] (II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 =
1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[   185.920] (**) NOUVEAU(0):  Driver mode "1280x800": 71.0 MHz (scaled from
0.0 MHz), 49.3 kHz, 59.9 Hz
[   185.920] (II) NOUVEAU(0): Modeline "1280x800"x59.9   71.00  1280 1328 1=
360
1440  800 803 809 823 +hsync -vsync (49.3 kHz e)
[   185.920] (**) NOUVEAU(0):  Driver mode "1152x864": 108.0 MHz (scaled fr=
om
0.0 MHz), 67.5 kHz, 75.0 Hz
[   185.920] (II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1=
344
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[   185.920] (**) NOUVEAU(0):  Driver mode "1024x768": 78.8 MHz (scaled from
0.0 MHz), 60.1 kHz, 75.1 Hz
[   185.920] (II) NOUVEAU(0): Modeline "1024x768"x75.1   78.80  1024 1040 1=
136
1312  768 769 772 800 +hsync +vsync (60.1 kHz e)
[   185.920] (**) NOUVEAU(0):  Driver mode "1024x768": 65.0 MHz (scaled from
0.0 MHz), 48.4 kHz, 60.0 Hz
[   185.920] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1=
184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[   185.920] (**) NOUVEAU(0):  Driver mode "800x600": 49.5 MHz (scaled from=
 0.0
MHz), 46.9 kHz, 75.0 Hz
[   185.920] (II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 =
1056
 600 601 604 625 +hsync +vsync (46.9 kHz e)
[   185.920] (**) NOUVEAU(0):  Driver mode "800x600": 40.0 MHz (scaled from=
 0.0
MHz), 37.9 kHz, 60.3 Hz
[   185.920] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 =
1056
 600 601 605 628 +hsync +vsync (37.9 kHz e)
[   185.920] (**) NOUVEAU(0):  Driver mode "640x480": 31.5 MHz (scaled from=
 0.0
MHz), 37.5 kHz, 75.0 Hz
[   185.920] (II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 =
840=20
480 481 484 500 -hsync -vsync (37.5 kHz e)
[   185.920] (**) NOUVEAU(0):  Driver mode "640x480": 25.2 MHz (scaled from=
 0.0
MHz), 31.5 kHz, 60.0 Hz
[   185.920] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 =
800=20
480 490 492 525 -hsync -vsync (31.5 kHz e)
[   185.920] (**) NOUVEAU(0):  Driver mode "720x400": 28.3 MHz (scaled from=
 0.0
MHz), 31.5 kHz, 70.1 Hz
[   185.920] (II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 =
900=20
400 412 414 449 -hsync +vsync (31.5 kHz e)
[   185.920] (=3D=3D) NOUVEAU(0): DPI set to (96, 96)
[   185.920] (II) Loading sub module "fb"
[   185.920] (II) LoadModule: "fb"
[   185.920] (II) Loading /usr/lib/xorg/modules/libfb.so
[   185.920] (II) Module fb: vendor=3D"X.Org Foundation"
[   185.920]    compiled for 1.17.2, module version =3D 1.0.0
[   185.920]    ABI class: X.Org ANSI C Emulation, version 0.4
[   185.920] (II) Loading sub module "shadowfb"
[   185.920] (II) LoadModule: "shadowfb"
[   185.921] (II) Loading /usr/lib/xorg/modules/libshadowfb.so
[   185.921] (II) Module shadowfb: vendor=3D"X.Org Foundation"
[   185.921]    compiled for 1.17.2, module version =3D 1.0.0
[   185.921]    ABI class: X.Org ANSI C Emulation, version 0.4
[   185.921] (--) Depth 24 pixmap format is 32 bpp
[   185.925] (II) NOUVEAU(0): Channel setup complete.
[   185.927] (II) NOUVEAU(0): [COPY] async initialised.
[   185.927] (II) NOUVEAU(0): [DRI2] Setup complete
[   185.927] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau
[   185.927] (II) NOUVEAU(0): [DRI2]   VDPAU driver: nouveau
[   185.927] (II) Loading sub module "exa"
[   185.927] (II) LoadModule: "exa"
[   185.927] (II) Loading /usr/lib/xorg/modules/libexa.so
[   185.927] (II) Module exa: vendor=3D"X.Org Foundation"
[   185.927]    compiled for 1.17.2, module version =3D 2.6.0
[   185.927]    ABI class: X.Org Video Driver, version 19.0
[   185.927] (II) EXA(0): Driver allocated offscreen pixmaps
[   185.927] (II) EXA(0): Driver registered support for the following
operations:
[   185.927] (II)         Solid
[   185.927] (II)         Copy
[   185.927] (II)         Composite (RENDER acceleration)
[   185.927] (II)         UploadToScreen
[   185.927] (II)         DownloadFromScreen
[   185.927] (=3D=3D) NOUVEAU(0): Backing store enabled
[   185.928] (=3D=3D) NOUVEAU(0): Silken mouse enabled
[   185.928] (II) NOUVEAU(0): [XvMC] Associated with Nouveau GeForce 8/9
Textured Video.
[   185.928] (II) NOUVEAU(0): [XvMC] Extension initialized.
[   185.928] (**) NOUVEAU(0): DPMS enabled
[   185.928] (II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR
disabled message.
[   185.928] (--) RandR disabled
[   185.959] (II) AIGLX: enabled GLX_MESA_copy_sub_buffer
[   185.959] (II) AIGLX: enabled GLX_ARB_create_context
[   185.959] (II) AIGLX: enabled GLX_ARB_create_context_profile
[   185.959] (II) AIGLX: enabled GLX_EXT_create_context_es2_profile
[   185.959] (II) AIGLX: enabled GLX_INTEL_swap_event
[   185.959] (II) AIGLX: enabled GLX_SGI_swap_control and GLX_MESA_swap_con=
trol
[   185.959] (II) AIGLX: enabled GLX_EXT_framebuffer_sRGB
[   185.959] (II) AIGLX: enabled GLX_ARB_fbconfig_float
[   185.959] (II) AIGLX: GLX_EXT_texture_from_pixmap backed by buffer objec=
ts
[   185.960] (II) AIGLX: Loaded and initialized nouveau
[   185.960] (II) GLX: Initialized DRI2 GL provider for screen 0
[   185.964] (II) NOUVEAU(0): NVEnterVT is called.
[   185.982] (II) NOUVEAU(0): Setting screen physical size to 677 x 381
[   185.982] resize called 2560 1440
[   186.086] (II) config/udev: Adding input device Power Button
(/dev/input/event1)
[   186.086] (**) Power Button: Applying InputClass "evdev keyboard catchal=
l"
[   186.086] (**) Power Button: Applying InputClass "system-keyboard"
[   186.086] (II) LoadModule: "evdev"
[   186.086] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[   186.086] (II) Module evdev: vendor=3D"X.Org Foundation"
[   186.086]    compiled for 1.17.1, module version =3D 2.9.2
[   186.086]    Module class: X.Org XInput Driver
[   186.086]    ABI class: X.Org XInput driver, version 21.0
[   189.370] (II) AIGLX: Suspending AIGLX clients for VT switch
[   189.370] (II) NOUVEAU(0): NVLeaveVT is called.
[   193.746] (II) Open ACPI successful (/var/run/acpid.socket)
[   193.746] (II) AIGLX: Resuming AIGLX clients after VT switch
[   193.746] (II) NOUVEAU(0): NVEnterVT is called.
[   193.811] (II) NOUVEAU(0): EDID vendor "DEL", prod id 16510
[   193.811] (II) NOUVEAU(0): Using hsync ranges from config file
[   193.811] (II) NOUVEAU(0): Using vrefresh ranges from config file
[   193.811] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[   193.811] (II) NOUVEAU(0): Modeline "2560x1440"x0.0  241.50  2560 2608 2=
640
2720  1440 1443 1448 1481 +hsync -vsync (88.8 kHz eP)
[   193.811] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1=
056=20
600 601 605 628 +hsync +vsync (37.9 kHz e)
[   193.811] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 8=
40=20
480 481 484 500 -hsync -vsync (37.5 kHz e)
[   193.811] (II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 8=
00=20
480 490 492 525 -hsync -vsync (31.5 kHz e)
[   193.811] (II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 9=
00=20
400 412 414 449 -hsync +vsync (31.5 kHz e)
[   193.811] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1=
440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[   193.811] (II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 11=
36
1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[   193.811] (II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 11=
84
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[   193.811] (II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1=
056=20
600 601 604 625 +hsync +vsync (46.9 kHz e)
[   193.811] (II) NOUVEAU(0): Modeline "1280x800"x0.0   71.00  1280 1328 13=
60
1440  800 803 809 823 +hsync -vsync (49.3 kHz e)
[   193.811] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  119.00  1680 1728 1=
760
1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz e)
[   193.811] (II) NOUVEAU(0): Modeline "1920x1200"x0.0  154.00  1920 1968 2=
000
2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz e)
[   193.811] (II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 13=
44
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[   193.811] (II) NOUVEAU(0): Modeline "1600x1200"x0.0  162.00  1600 1664 1=
856
2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz e)
[   193.811] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1=
440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[   193.811] (II) NOUVEAU(0): Modeline "1920x1080"x60.0  172.80  1920 2040 =
2248
2576  1080 1081 1084 1118 -hsync +vsync (67.1 kHz e)
[   196.663] (II) AIGLX: Suspending AIGLX clients for VT switch

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1439430422.C84F31Bb1.26904
Date: Thu, 13 Aug 2015 01:47:02 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV86] nouveau/kernel 3.18.0-rc1: nouveau deadlocks on 2n=
d Xorg start or reboot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D85471#c8">Comment=
 # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV86] nouveau/kernel 3.18.0-rc1: nouveau deadlocks on 2n=
d Xorg start or reboot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D85471">bug 85471<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
davispuh&#64;gmail.com" title=3D"D=C4=81vis &lt;davispuh&#64;gmail.com&gt;"=
> <span class=3D"fn">D=C4=81vis</span></a>
</span></b>
        <pre>I've same issue, but on Arch Linux 4.1 with NVIDIA GeForce GTX=
 650 Ti
nouveau crashes kernel that can't even reboot/poweroff, only with hard rese=
t.

adding nouveau.runpm=3D0 to kernel parameters atleast it doesn't crash.


kernel: [drm] Initialized drm 1.1.0 20060810
kernel: nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e6060a1
kernel: nouveau  [  DEVICE][0000:01:00.0] Chipset: GK106 (NVE6)
kernel: nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
kernel: nouveau  [   VBIOS][0000:01:00.0] using image from PROM
kernel: nouveau  [   VBIOS][0000:01:00.0] BIT signature found
kernel: nouveau  [   VBIOS][0000:01:00.0] version 80.06.21.00.37
kernel: nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
kernel: nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
kernel: nouveau  [     PFB][0000:01:00.0] RAM size: 1024 MiB
kernel: nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
kernel: nouveau  [    VOLT][0000:01:00.0] GPU voltage: 887500uv
kernel: nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM
kernel: nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
kernel: nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
kernel: nouveau  [     CLK][0000:01:00.0] 07: core 324 MHz memory 648 MHz
kernel: nouveau  [     CLK][0000:01:00.0] 0a: core 549 MHz memory 1620 MHz
kernel: nouveau  [     CLK][0000:01:00.0] 0f: core 928-954 MHz memory 5400 =
MHz
kernel: nouveau  [     CLK][0000:01:00.0] --: core 324 MHz memory 648 MHz
kernel: nouveau  [     DRM] VRAM: 1024 MiB
kernel: nouveau  [     DRM] GART: 1048576 MiB
kernel: nouveau  [     DRM] TMDS table version 2.0
kernel: nouveau  [     DRM] DCB version 4.0
kernel: nouveau  [     DRM] DCB outp 00: 01000f02 00020030
kernel: nouveau  [     DRM] DCB outp 01: 02000f00 00020030
kernel: nouveau  [     DRM] DCB outp 02: 08011f82 0f420030
kernel: nouveau  [     DRM] DCB outp 03: 02022f62 0f420010
kernel: nouveau  [     DRM] DCB conn 00: 00001030
kernel: nouveau  [     DRM] DCB conn 01: 00002131
kernel: nouveau  [     DRM] DCB conn 02: 00010263
kernel: [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
kernel: [drm] Driver supports precise vblank timestamp query.
kernel: nouveau  [     DRM] MM: using COPY for buffer copies
kernel: nouveau  [     DRM] allocated 2560x1440 fb: 0x60000, bo
ffff880223222000
kernel: fbcon: nouveaufb (fb0) is primary device
kernel: nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
kernel: nouveau 0000:01:00.0: registered panic notifier
kernel: [drm] Initialized nouveau 1.2.2 20120801 for 0000:01:00.0 on minor 0




kernel: INFO: task kworker/2:2:115 blocked for more than 120 seconds.
kernel:       Not tainted 4.1.0-ARCH-dirty #3
kernel: &quot;echo 0 &gt; /proc/sys/kernel/hung_task_timeout_secs&quot; dis=
ables this
message.
kernel: kworker/2:2     D ffff880222da3bb8     0   115      2 0x00000000
kernel: Workqueue: pm pm_runtime_work
kernel:  ffff880222da3bb8 ffff880225240000 ffff880225335180 ffffffff81b1e8e8
kernel:  ffff880222da4000 ffff880224e3e146 ffff880224e3e200 0000000000000000
kernel:  0000000000000000 ffff880222da3bd8 ffffffff81587d77 ffff880224e3e146
kernel: Call Trace:
kernel:  [&lt;ffffffff81587d77&gt;] schedule+0x37/0x90
kernel:  [&lt;ffffffff813ff65d&gt;] rpm_resume+0x20d/0x6b0
kernel:  [&lt;ffffffff810bc6b0&gt;] ? wake_atomic_t_function+0x60/0x60
kernel:  [&lt;ffffffff813ffde3&gt;] pm_runtime_forbid+0x43/0x50
kernel:  [&lt;ffffffffa0368778&gt;] nouveau_pmops_runtime_suspend+0xc8/0xf0=
 [nouveau]
kernel:  [&lt;ffffffff81311baf&gt;] pci_pm_runtime_suspend+0x5f/0x140
kernel:  [&lt;ffffffff81311b50&gt;] ? pci_legacy_suspend_late+0xf0/0xf0
kernel:  [&lt;ffffffff813fe466&gt;] __rpm_callback+0x36/0x90
kernel:  [&lt;ffffffff813fe4e8&gt;] rpm_callback+0x28/0x90
kernel:  [&lt;ffffffff813feae6&gt;] rpm_suspend+0x126/0x690
kernel:  [&lt;ffffffff8101477c&gt;] ? __switch_to+0x2bc/0x5e0
kernel:  [&lt;ffffffff814002f2&gt;] pm_runtime_work+0x72/0xc0
kernel:  [&lt;ffffffff8109193b&gt;] process_one_work+0x14b/0x470
kernel:  [&lt;ffffffff81091ca8&gt;] worker_thread+0x48/0x4c0
kernel:  [&lt;ffffffff81091c60&gt;] ? process_one_work+0x470/0x470
kernel:  [&lt;ffffffff81091c60&gt;] ? process_one_work+0x470/0x470
kernel:  [&lt;ffffffff810977f8&gt;] kthread+0xd8/0xf0
kernel:  [&lt;ffffffff81097720&gt;] ? kthread_worker_fn+0x170/0x170
kernel:  [&lt;ffffffff8158bda2&gt;] ret_from_fork+0x42/0x70
kernel:  [&lt;ffffffff81097720&gt;] ? kthread_worker_fn+0x170/0x170
kernel: INFO: task Xorg.wrap:1012 blocked for more than 120 seconds.
kernel:       Not tainted 4.1.0-ARCH-dirty #3
kernel: &quot;echo 0 &gt; /proc/sys/kernel/hung_task_timeout_secs&quot; dis=
ables this
message.
kernel: Xorg.wrap       D ffff8800bdc979d8     0  1012    962 0x00000000
kernel:  ffff8800bdc979d8 ffff880225241460 ffff880222ccf010 ffff880224ab81b0
kernel:  ffff8800bdc98000 ffff880224e3e146 ffff880224e3e200 0000000000000000
kernel:  0000000000000004 ffff8800bdc979f8 ffffffff81587d77 ffff880224e3e146
kernel: Call Trace:
kernel:  [&lt;ffffffff81587d77&gt;] schedule+0x37/0x90
kernel:  [&lt;ffffffff813ff65d&gt;] rpm_resume+0x20d/0x6b0
kernel:  [&lt;ffffffff810bc6b0&gt;] ? wake_atomic_t_function+0x60/0x60
kernel:  [&lt;ffffffff813ffb3f&gt;] __pm_runtime_resume+0x3f/0x60
kernel:  [&lt;ffffffffa0368d4d&gt;] nouveau_drm_open+0x3d/0x280 [nouveau]
kernel:  [&lt;ffffffff811c2e1e&gt;] ? kmem_cache_alloc_trace+0x1fe/0x230
kernel:  [&lt;ffffffffa007a85f&gt;] drm_open+0x1af/0x4c0 [drm]
kernel:  [&lt;ffffffffa0081799&gt;] drm_stub_open+0xa9/0x120 [drm]
kernel:  [&lt;ffffffff811e594e&gt;] chrdev_open+0xae/0x1f0
kernel:  [&lt;ffffffff811de867&gt;] do_dentry_open+0x227/0x330
kernel:  [&lt;ffffffff811e58a0&gt;] ? cdev_put+0x30/0x30
kernel:  [&lt;ffffffff811dec69&gt;] vfs_open+0x49/0x50
kernel:  [&lt;ffffffff811ef63e&gt;] do_last.isra.11+0x33e/0xf00
kernel:  [&lt;ffffffff811eddfe&gt;] ? path_init+0x17e/0x460
kernel:  [&lt;ffffffff811f0291&gt;] path_openat+0x91/0x690
kernel:  [&lt;ffffffff81166135&gt;] ? filemap_map_pages+0x135/0x270
kernel:  [&lt;ffffffff811f1d29&gt;] do_filp_open+0x49/0xd0
kernel:  [&lt;ffffffff812dde5a&gt;] ? find_next_zero_bit+0x1a/0x30
kernel:  [&lt;ffffffff811ff347&gt;] ? __alloc_fd+0xa7/0x130
kernel:  [&lt;ffffffff811dfe9d&gt;] do_sys_open+0x14d/0x250
kernel:  [&lt;ffffffff811dffbe&gt;] SyS_open+0x1e/0x20
kernel:  [&lt;ffffffff8158b9ae&gt;] system_call_fastpath+0x12/0x71
kernel: INFO: task libvirtd:1463 blocked for more than 120 seconds.
kernel:       Not tainted 4.1.0-ARCH-dirty #3
kernel: &quot;echo 0 &gt; /proc/sys/kernel/hung_task_timeout_secs&quot; dis=
ables this
message.
kernel: libvirtd        D ffff8800bc91bc78     0  1463      1 0x00000000
kernel:  ffff8800bc91bc78 ffff880225241e90 ffff8800c0bc8a30 0000000000000000
kernel:  ffff8800bc91c000 ffff880224e3e146 ffff880224e3e200 ffff880224e3e146
kernel:  00007f96227a0c30 ffff8800bc91bc98 ffffffff81587d77 ffff880224e3e146
kernel: Call Trace:
kernel:  [&lt;ffffffff81587d77&gt;] schedule+0x37/0x90
kernel:  [&lt;ffffffff813fe78d&gt;] __pm_runtime_barrier+0xad/0x170
kernel:  [&lt;ffffffff810bc6b0&gt;] ? wake_atomic_t_function+0x60/0x60
kernel:  [&lt;ffffffff813ffc0b&gt;] pm_runtime_barrier+0x5b/0xc0
kernel:  [&lt;ffffffff8130fd5b&gt;] pci_config_pm_runtime_get+0x3b/0x60
kernel:  [&lt;ffffffff81314b36&gt;] pci_read_config+0x96/0x2b0
kernel:  [&lt;ffffffff8125b13a&gt;] sysfs_kf_bin_read+0x4a/0x70
kernel:  [&lt;ffffffff8125a798&gt;] kernfs_fop_read+0xa8/0x170
kernel:  [&lt;ffffffff811e03c7&gt;] __vfs_read+0x37/0x100
kernel:  [&lt;ffffffff8128314e&gt;] ? security_file_permission+0x8e/0xa0
kernel:  [&lt;ffffffff811e0d37&gt;] vfs_read+0x87/0x140
kernel:  [&lt;ffffffff811e1d2a&gt;] SyS_pread64+0x9a/0xc0
kernel:  [&lt;ffffffff8158b9ae&gt;] system_call_fastpath+0x12/0x71
kernel: INFO: task kworker/2:2:115 blocked for more than 120 seconds.
kernel:       Not tainted 4.1.0-ARCH-dirty #3
kernel: &quot;echo 0 &gt; /proc/sys/kernel/hung_task_timeout_secs&quot; dis=
ables this
message.
kernel: kworker/2:2     D ffff880222da3bb8     0   115      2 0x00000000
kernel: Workqueue: pm pm_runtime_work
kernel:  ffff880222da3bb8 ffff880225240000 ffff880225335180 ffffffff81b1e8e8
kernel:  ffff880222da4000 ffff880224e3e146 ffff880224e3e200 0000000000000000
kernel:  0000000000000000 ffff880222da3bd8 ffffffff81587d77 ffff880224e3e146
kernel: Call Trace:
kernel:  [&lt;ffffffff81587d77&gt;] schedule+0x37/0x90
kernel:  [&lt;ffffffff813ff65d&gt;] rpm_resume+0x20d/0x6b0
kernel:  [&lt;ffffffff810bc6b0&gt;] ? wake_atomic_t_function+0x60/0x60
kernel:  [&lt;ffffffff813ffde3&gt;] pm_runtime_forbid+0x43/0x50
kernel:  [&lt;ffffffffa0368778&gt;] nouveau_pmops_runtime_suspend+0xc8/0xf0=
 [nouveau]
kernel:  [&lt;ffffffff81311baf&gt;] pci_pm_runtime_suspend+0x5f/0x140
kernel:  [&lt;ffffffff81311b50&gt;] ? pci_legacy_suspend_late+0xf0/0xf0
kernel:  [&lt;ffffffff813fe466&gt;] __rpm_callback+0x36/0x90
kernel:  [&lt;ffffffff813fe4e8&gt;] rpm_callback+0x28/0x90
kernel:  [&lt;ffffffff813feae6&gt;] rpm_suspend+0x126/0x690
kernel:  [&lt;ffffffff8101477c&gt;] ? __switch_to+0x2bc/0x5e0
kernel:  [&lt;ffffffff814002f2&gt;] pm_runtime_work+0x72/0xc0
kernel:  [&lt;ffffffff8109193b&gt;] process_one_work+0x14b/0x470
kernel:  [&lt;ffffffff81091ca8&gt;] worker_thread+0x48/0x4c0
kernel:  [&lt;ffffffff81091c60&gt;] ? process_one_work+0x470/0x470
kernel:  [&lt;ffffffff81091c60&gt;] ? process_one_work+0x470/0x470
kernel:  [&lt;ffffffff810977f8&gt;] kthread+0xd8/0xf0
kernel:  [&lt;ffffffff81097720&gt;] ? kthread_worker_fn+0x170/0x170
kernel:  [&lt;ffffffff8158bda2&gt;] ret_from_fork+0x42/0x70
kernel:  [&lt;ffffffff81097720&gt;] ? kthread_worker_fn+0x170/0x170



[   185.819] (II) Loader magic: 0x817d60
[   185.819] (II) Module ABI versions:
[   185.819]    X.Org ANSI C Emulation: 0.4
[   185.819]    X.Org Video Driver: 19.0
[   185.819]    X.Org XInput driver : 21.1
[   185.819]    X.Org Server Extension : 9.0
[   185.821] (EE) systemd-logind: failed to get session: PID 2044 does not
belong to any known session
[   185.822] (II) xfree86: Adding drm device (/dev/dri/card0)
[   185.824] (--) PCI:*(0:1:0:0) 10de:11c6:1462:2805 rev 161, Mem &#64;
0xfa000000/16777216, 0xd0000000/134217728, 0xde000000/33554432, I/O &#64;
0x0000af00/128, BIOS &#64; 0x????????/524288
[   185.825] (II) Open ACPI successful (/var/run/acpid.socket)
[   185.825] (II) LoadModule: &quot;glx&quot;
[   185.825] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[   185.826] (II) Module glx: vendor=3D&quot;X.Org Foundation&quot;
[   185.826]    compiled for 1.17.2, module version =3D 1.0.0
[   185.826]    ABI class: X.Org Server Extension, version 9.0
[   185.826] (=3D=3D) AIGLX enabled
[   185.826] (II) LoadModule: &quot;nouveau&quot;
[   185.826] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[   185.827] (II) Module nouveau: vendor=3D&quot;X.Org Foundation&quot;
[   185.827]    compiled for 1.17.0, module version =3D 1.0.11
[   185.827]    Module class: X.Org Video Driver
[   185.827]    ABI class: X.Org Video Driver, version 19.0
[   185.827] (II) NOUVEAU driver
[   185.827] (II) NOUVEAU driver for NVIDIA chipset families :
[   185.827]    RIVA TNT        (NV04)
[   185.827]    RIVA TNT2       (NV05)
[   185.827]    GeForce 256     (NV10)
[   185.827]    GeForce 2       (NV11, NV15)
[   185.827]    GeForce 4MX     (NV17, NV18)
[   185.827]    GeForce 3       (NV20)
[   185.827]    GeForce 4Ti     (NV25, NV28)
[   185.827]    GeForce FX      (NV3x)
[   185.827]    GeForce 6       (NV4x)
[   185.827]    GeForce 7       (G7x)
[   185.827]    GeForce 8       (G8x)
[   185.827]    GeForce GTX 200 (NVA0)
[   185.827]    GeForce GTX 400 (NVC0)
[   185.827] (++) using VT number 1
[   185.830] (II) [drm] nouveau interface version: 1.2.2
[   185.830] (II) Loading sub module &quot;dri2&quot;
[   185.830] (II) LoadModule: &quot;dri2&quot;
[   185.830] (II) Module &quot;dri2&quot; already built-in
[   185.831] (--) NOUVEAU(0): Chipset: &quot;NVIDIA NVE6&quot;
[   185.831] (**) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
[   185.831] (=3D=3D) NOUVEAU(0): RGB weight 888
[   185.831] (=3D=3D) NOUVEAU(0): Default visual is TrueColor
[   185.831] (=3D=3D) NOUVEAU(0): Using HW cursor
[   185.831] (=3D=3D) NOUVEAU(0): GLX sync to VBlank enabled.
[   185.831] (=3D=3D) NOUVEAU(0): Page flipping enabled
[   185.831] (=3D=3D) NOUVEAU(0): Swap limit set to 1 [Max allowed 2]
[   185.831] (=3D=3D) NOUVEAU(0): Page flipping synced to vblank by kernel.
[   185.831] (II) NOUVEAU(0): Initializing outputs ...
[   185.843] (II) NOUVEAU(0): Output DVI-I-1 using monitor section DVI-I-0
[   185.873] (II) NOUVEAU(0): Output DVI-D-1 has no monitor section
[   185.874] (II) NOUVEAU(0): Output HDMI-1 has no monitor section
[   185.874] (II) NOUVEAU(0): 3 crtcs needed for screen.
[   185.876] (II) NOUVEAU(0): Allocated crtc nr. 0 to this screen.
[   185.876] (II) NOUVEAU(0): Allocated crtc nr. 1 to this screen.
[   185.876] (II) NOUVEAU(0): Allocated crtc nr. 2 to this screen.
[   185.876] (II) NOUVEAU(0): Allocated crtc nr. 3 to this screen.
[   185.888] (II) NOUVEAU(0): EDID for output DVI-I-1
[   185.918] (II) NOUVEAU(0): EDID for output DVI-D-1
[   185.918] (II) NOUVEAU(0): Manufacturer: DEL  Model: 407e  Serial#:
875704403
[   185.918] (II) NOUVEAU(0): Year: 2014  Week: 35
[   185.918] (II) NOUVEAU(0): EDID Version: 1.3
[   185.918] (II) NOUVEAU(0): Digital Display Input
[   185.918] (II) NOUVEAU(0): Max Image Size [cm]: horiz.: 60  vert.: 34
[   185.918] (II) NOUVEAU(0): Gamma: 2.20
[   185.918] (II) NOUVEAU(0): DPMS capabilities: StandBy Suspend Off
[   185.918] (II) NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb 4:=
4:4
[   185.918] (II) NOUVEAU(0): First detailed timing is preferred mode
[   185.918] (II) NOUVEAU(0): redX: 0.653 redY: 0.336   greenX: 0.295 green=
Y:
0.640
[   185.918] (II) NOUVEAU(0): blueX: 0.146 blueY: 0.042   whiteX: 0.313 whi=
teY:
0.329
[   185.918] (II) NOUVEAU(0): Supported established timings:
[   185.918] (II) NOUVEAU(0): 720x400&#64;70Hz
[   185.918] (II) NOUVEAU(0): 640x480&#64;60Hz
[   185.918] (II) NOUVEAU(0): 640x480&#64;75Hz
[   185.918] (II) NOUVEAU(0): 800x600&#64;60Hz
[   185.918] (II) NOUVEAU(0): 800x600&#64;75Hz
[   185.918] (II) NOUVEAU(0): 1024x768&#64;60Hz
[   185.918] (II) NOUVEAU(0): 1024x768&#64;75Hz
[   185.918] (II) NOUVEAU(0): 1280x1024&#64;75Hz
[   185.918] (II) NOUVEAU(0): Manufacturer's mask: 0
[   185.918] (II) NOUVEAU(0): Supported standard timings:
[   185.918] (II) NOUVEAU(0): #0: hsize: 1280  vsize 800  refresh: 60  vid:=
 129
[   185.918] (II) NOUVEAU(0): #1: hsize: 1680  vsize 1050  refresh: 60  vid:
179
[   185.918] (II) NOUVEAU(0): #2: hsize: 1920  vsize 1200  refresh: 60  vid:
209
[   185.918] (II) NOUVEAU(0): #3: hsize: 1152  vsize 864  refresh: 75  vid:
20337
[   185.918] (II) NOUVEAU(0): #4: hsize: 1600  vsize 1200  refresh: 60  vid:
16553
[   185.918] (II) NOUVEAU(0): #5: hsize: 1280  vsize 1024  refresh: 60  vid:
32897
[   185.918] (II) NOUVEAU(0): #6: hsize: 1920  vsize 1080  refresh: 60  vid:
49361
[   185.918] (II) NOUVEAU(0): Supported detailed timing:
[   185.918] (II) NOUVEAU(0): clock: 241.5 MHz   Image Size:  597 x 336 mm
[   185.918] (II) NOUVEAU(0): h_active: 2560  h_sync: 2608  h_sync_end 2640
h_blank_end 2720 h_border: 0
[   185.918] (II) NOUVEAU(0): v_active: 1440  v_sync: 1443  v_sync_end 1448
v_blanking: 1481 v_border: 0
[   185.918] (II) NOUVEAU(0): Serial No: 7JNY548P420S
[   185.918] (II) NOUVEAU(0): Monitor name: DELL U2713HM
[   185.918] (II) NOUVEAU(0): Ranges: V min: 49 V max: 86 Hz, H min: 29 H m=
ax:
113 kHz, PixClock max 285 MHz
[   185.918] (II) NOUVEAU(0): EDID (in hex):
[   185.918] (II) NOUVEAU(0):   00ffffffffffff0010ac7e4053303234
[   185.918] (II) NOUVEAU(0):   23180103803c2278ea4bb5a7564ba325
[   185.918] (II) NOUVEAU(0):   0a5054a54b008100b300d100714fa940
[   185.918] (II) NOUVEAU(0):   8180d1c00101565e00a0a0a029503020
[   185.918] (II) NOUVEAU(0):   350055502100001a000000ff00374a4e
[   185.918] (II) NOUVEAU(0):   5935343850343230530a000000fc0044
[   185.918] (II) NOUVEAU(0):   454c4c205532373133484d0a000000fd
[   185.918] (II) NOUVEAU(0):   0031561d711c000a20202020202000c1
[   185.918] (II) NOUVEAU(0): Printing probed modes for output DVI-D-1
[   185.918] (II) NOUVEAU(0): Modeline &quot;2560x1440&quot;x60.0  241.50  =
2560 2608 2640
2720  1440 1443 1448 1481 +hsync -vsync (88.8 kHz eP)
[   185.918] (II) NOUVEAU(0): Modeline &quot;1920x1200&quot;x60.0  154.00  =
1920 1968 2000
2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz e)
[   185.918] (II) NOUVEAU(0): Modeline &quot;1920x1080&quot;x60.0  172.78  =
1920 2040 2248
2576  1080 1081 1084 1118 -hsync +vsync (67.1 kHz)
[   185.918] (II) NOUVEAU(0): Modeline &quot;1600x1200&quot;x60.0  162.00  =
1600 1664 1856
2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz e)
[   185.918] (II) NOUVEAU(0): Modeline &quot;1680x1050&quot;x59.9  119.00  =
1680 1728 1760
1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz e)
[   185.918] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x75.0  135.00  =
1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[   185.918] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x60.0  108.00  =
1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[   185.918] (II) NOUVEAU(0): Modeline &quot;1280x800&quot;x59.9   71.00  1=
280 1328 1360
1440  800 803 809 823 +hsync -vsync (49.3 kHz e)
[   185.918] (II) NOUVEAU(0): Modeline &quot;1152x864&quot;x75.0  108.00  1=
152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[   185.918] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x75.1   78.80  1=
024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.1 kHz e)
[   185.919] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x60.0   65.00  1=
024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[   185.919] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x75.0   49.50  80=
0 816 896 1056
 600 601 604 625 +hsync +vsync (46.9 kHz e)
[   185.919] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x60.3   40.00  80=
0 840 968 1056
 600 601 605 628 +hsync +vsync (37.9 kHz e)
[   185.919] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x75.0   31.50  64=
0 656 720 840=20
480 481 484 500 -hsync -vsync (37.5 kHz e)
[   185.919] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x60.0   25.20  64=
0 656 752 800=20
480 490 492 525 -hsync -vsync (31.5 kHz e)
[   185.919] (II) NOUVEAU(0): Modeline &quot;720x400&quot;x70.1   28.32  72=
0 738 846 900=20
400 412 414 449 -hsync +vsync (31.5 kHz e)
[   185.920] (II) NOUVEAU(0): EDID for output HDMI-1
[   185.920] (II) NOUVEAU(0): Output DVI-I-1 disconnected
[   185.920] (II) NOUVEAU(0): Output DVI-D-1 connected
[   185.920] (II) NOUVEAU(0): Output HDMI-1 disconnected
[   185.920] (II) NOUVEAU(0): Using exact sizes for initial modes
[   185.920] (II) NOUVEAU(0): Output DVI-D-1 using initial mode 2560x1440
[   185.920] (II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless
otherwise stated.
[   185.920] (--) NOUVEAU(0): Virtual size is 2560x1440 (pitch 0)
[   185.920] (**) NOUVEAU(0):  Driver mode &quot;2560x1440&quot;: 241.5 MHz=
 (scaled from
0.0 MHz), 88.8 kHz, 60.0 Hz
[   185.920] (II) NOUVEAU(0): Modeline &quot;2560x1440&quot;x60.0  241.50  =
2560 2608 2640
2720  1440 1443 1448 1481 +hsync -vsync (88.8 kHz eP)
[   185.920] (**) NOUVEAU(0):  Driver mode &quot;1920x1200&quot;: 154.0 MHz=
 (scaled from
0.0 MHz), 74.0 kHz, 60.0 Hz
[   185.920] (II) NOUVEAU(0): Modeline &quot;1920x1200&quot;x60.0  154.00  =
1920 1968 2000
2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz e)
[   185.920] (**) NOUVEAU(0):  Mode &quot;1920x1080&quot;: 172.8 MHz (scale=
d from 0.0
MHz), 67.1 kHz, 60.0 Hz
[   185.920] (II) NOUVEAU(0): Modeline &quot;1920x1080&quot;x60.0  172.78  =
1920 2040 2248
2576  1080 1081 1084 1118 -hsync +vsync (67.1 kHz)
[   185.920] (**) NOUVEAU(0):  Driver mode &quot;1600x1200&quot;: 162.0 MHz=
 (scaled from
0.0 MHz), 75.0 kHz, 60.0 Hz
[   185.920] (II) NOUVEAU(0): Modeline &quot;1600x1200&quot;x60.0  162.00  =
1600 1664 1856
2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz e)
[   185.920] (**) NOUVEAU(0):  Driver mode &quot;1680x1050&quot;: 119.0 MHz=
 (scaled from
0.0 MHz), 64.7 kHz, 59.9 Hz
[   185.920] (II) NOUVEAU(0): Modeline &quot;1680x1050&quot;x59.9  119.00  =
1680 1728 1760
1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz e)
[   185.920] (**) NOUVEAU(0):  Driver mode &quot;1280x1024&quot;: 135.0 MHz=
 (scaled from
0.0 MHz), 80.0 kHz, 75.0 Hz
[   185.920] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x75.0  135.00  =
1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[   185.920] (**) NOUVEAU(0):  Driver mode &quot;1280x1024&quot;: 108.0 MHz=
 (scaled from
0.0 MHz), 64.0 kHz, 60.0 Hz
[   185.920] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x60.0  108.00  =
1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[   185.920] (**) NOUVEAU(0):  Driver mode &quot;1280x800&quot;: 71.0 MHz (=
scaled from
0.0 MHz), 49.3 kHz, 59.9 Hz
[   185.920] (II) NOUVEAU(0): Modeline &quot;1280x800&quot;x59.9   71.00  1=
280 1328 1360
1440  800 803 809 823 +hsync -vsync (49.3 kHz e)
[   185.920] (**) NOUVEAU(0):  Driver mode &quot;1152x864&quot;: 108.0 MHz =
(scaled from
0.0 MHz), 67.5 kHz, 75.0 Hz
[   185.920] (II) NOUVEAU(0): Modeline &quot;1152x864&quot;x75.0  108.00  1=
152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[   185.920] (**) NOUVEAU(0):  Driver mode &quot;1024x768&quot;: 78.8 MHz (=
scaled from
0.0 MHz), 60.1 kHz, 75.1 Hz
[   185.920] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x75.1   78.80  1=
024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.1 kHz e)
[   185.920] (**) NOUVEAU(0):  Driver mode &quot;1024x768&quot;: 65.0 MHz (=
scaled from
0.0 MHz), 48.4 kHz, 60.0 Hz
[   185.920] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x60.0   65.00  1=
024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[   185.920] (**) NOUVEAU(0):  Driver mode &quot;800x600&quot;: 49.5 MHz (s=
caled from 0.0
MHz), 46.9 kHz, 75.0 Hz
[   185.920] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x75.0   49.50  80=
0 816 896 1056
 600 601 604 625 +hsync +vsync (46.9 kHz e)
[   185.920] (**) NOUVEAU(0):  Driver mode &quot;800x600&quot;: 40.0 MHz (s=
caled from 0.0
MHz), 37.9 kHz, 60.3 Hz
[   185.920] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x60.3   40.00  80=
0 840 968 1056
 600 601 605 628 +hsync +vsync (37.9 kHz e)
[   185.920] (**) NOUVEAU(0):  Driver mode &quot;640x480&quot;: 31.5 MHz (s=
caled from 0.0
MHz), 37.5 kHz, 75.0 Hz
[   185.920] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x75.0   31.50  64=
0 656 720 840=20
480 481 484 500 -hsync -vsync (37.5 kHz e)
[   185.920] (**) NOUVEAU(0):  Driver mode &quot;640x480&quot;: 25.2 MHz (s=
caled from 0.0
MHz), 31.5 kHz, 60.0 Hz
[   185.920] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x60.0   25.20  64=
0 656 752 800=20
480 490 492 525 -hsync -vsync (31.5 kHz e)
[   185.920] (**) NOUVEAU(0):  Driver mode &quot;720x400&quot;: 28.3 MHz (s=
caled from 0.0
MHz), 31.5 kHz, 70.1 Hz
[   185.920] (II) NOUVEAU(0): Modeline &quot;720x400&quot;x70.1   28.32  72=
0 738 846 900=20
400 412 414 449 -hsync +vsync (31.5 kHz e)
[   185.920] (=3D=3D) NOUVEAU(0): DPI set to (96, 96)
[   185.920] (II) Loading sub module &quot;fb&quot;
[   185.920] (II) LoadModule: &quot;fb&quot;
[   185.920] (II) Loading /usr/lib/xorg/modules/libfb.so
[   185.920] (II) Module fb: vendor=3D&quot;X.Org Foundation&quot;
[   185.920]    compiled for 1.17.2, module version =3D 1.0.0
[   185.920]    ABI class: X.Org ANSI C Emulation, version 0.4
[   185.920] (II) Loading sub module &quot;shadowfb&quot;
[   185.920] (II) LoadModule: &quot;shadowfb&quot;
[   185.921] (II) Loading /usr/lib/xorg/modules/libshadowfb.so
[   185.921] (II) Module shadowfb: vendor=3D&quot;X.Org Foundation&quot;
[   185.921]    compiled for 1.17.2, module version =3D 1.0.0
[   185.921]    ABI class: X.Org ANSI C Emulation, version 0.4
[   185.921] (--) Depth 24 pixmap format is 32 bpp
[   185.925] (II) NOUVEAU(0): Channel setup complete.
[   185.927] (II) NOUVEAU(0): [COPY] async initialised.
[   185.927] (II) NOUVEAU(0): [DRI2] Setup complete
[   185.927] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau
[   185.927] (II) NOUVEAU(0): [DRI2]   VDPAU driver: nouveau
[   185.927] (II) Loading sub module &quot;exa&quot;
[   185.927] (II) LoadModule: &quot;exa&quot;
[   185.927] (II) Loading /usr/lib/xorg/modules/libexa.so
[   185.927] (II) Module exa: vendor=3D&quot;X.Org Foundation&quot;
[   185.927]    compiled for 1.17.2, module version =3D 2.6.0
[   185.927]    ABI class: X.Org Video Driver, version 19.0
[   185.927] (II) EXA(0): Driver allocated offscreen pixmaps
[   185.927] (II) EXA(0): Driver registered support for the following
operations:
[   185.927] (II)         Solid
[   185.927] (II)         Copy
[   185.927] (II)         Composite (RENDER acceleration)
[   185.927] (II)         UploadToScreen
[   185.927] (II)         DownloadFromScreen
[   185.927] (=3D=3D) NOUVEAU(0): Backing store enabled
[   185.928] (=3D=3D) NOUVEAU(0): Silken mouse enabled
[   185.928] (II) NOUVEAU(0): [XvMC] Associated with Nouveau GeForce 8/9
Textured Video.
[   185.928] (II) NOUVEAU(0): [XvMC] Extension initialized.
[   185.928] (**) NOUVEAU(0): DPMS enabled
[   185.928] (II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR
disabled message.
[   185.928] (--) RandR disabled
[   185.959] (II) AIGLX: enabled GLX_MESA_copy_sub_buffer
[   185.959] (II) AIGLX: enabled GLX_ARB_create_context
[   185.959] (II) AIGLX: enabled GLX_ARB_create_context_profile
[   185.959] (II) AIGLX: enabled GLX_EXT_create_context_es2_profile
[   185.959] (II) AIGLX: enabled GLX_INTEL_swap_event
[   185.959] (II) AIGLX: enabled GLX_SGI_swap_control and GLX_MESA_swap_con=
trol
[   185.959] (II) AIGLX: enabled GLX_EXT_framebuffer_sRGB
[   185.959] (II) AIGLX: enabled GLX_ARB_fbconfig_float
[   185.959] (II) AIGLX: GLX_EXT_texture_from_pixmap backed by buffer objec=
ts
[   185.960] (II) AIGLX: Loaded and initialized nouveau
[   185.960] (II) GLX: Initialized DRI2 GL provider for screen 0
[   185.964] (II) NOUVEAU(0): NVEnterVT is called.
[   185.982] (II) NOUVEAU(0): Setting screen physical size to 677 x 381
[   185.982] resize called 2560 1440
[   186.086] (II) config/udev: Adding input device Power Button
(/dev/input/event1)
[   186.086] (**) Power Button: Applying InputClass &quot;evdev keyboard ca=
tchall&quot;
[   186.086] (**) Power Button: Applying InputClass &quot;system-keyboard&q=
uot;
[   186.086] (II) LoadModule: &quot;evdev&quot;
[   186.086] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[   186.086] (II) Module evdev: vendor=3D&quot;X.Org Foundation&quot;
[   186.086]    compiled for 1.17.1, module version =3D 2.9.2
[   186.086]    Module class: X.Org XInput Driver
[   186.086]    ABI class: X.Org XInput driver, version 21.0
[   189.370] (II) AIGLX: Suspending AIGLX clients for VT switch
[   189.370] (II) NOUVEAU(0): NVLeaveVT is called.
[   193.746] (II) Open ACPI successful (/var/run/acpid.socket)
[   193.746] (II) AIGLX: Resuming AIGLX clients after VT switch
[   193.746] (II) NOUVEAU(0): NVEnterVT is called.
[   193.811] (II) NOUVEAU(0): EDID vendor &quot;DEL&quot;, prod id 16510
[   193.811] (II) NOUVEAU(0): Using hsync ranges from config file
[   193.811] (II) NOUVEAU(0): Using vrefresh ranges from config file
[   193.811] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[   193.811] (II) NOUVEAU(0): Modeline &quot;2560x1440&quot;x0.0  241.50  2=
560 2608 2640
2720  1440 1443 1448 1481 +hsync -vsync (88.8 kHz eP)
[   193.811] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x0.0   40.00  800=
 840 968 1056=20
600 601 605 628 +hsync +vsync (37.9 kHz e)
[   193.811] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x0.0   31.50  640=
 656 720 840=20
480 481 484 500 -hsync -vsync (37.5 kHz e)
[   193.811] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x0.0   25.18  640=
 656 752 800=20
480 490 492 525 -hsync -vsync (31.5 kHz e)
[   193.811] (II) NOUVEAU(0): Modeline &quot;720x400&quot;x0.0   28.32  720=
 738 846 900=20
400 412 414 449 -hsync +vsync (31.5 kHz e)
[   193.811] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x0.0  135.00  1=
280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[   193.811] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x0.0   78.75  10=
24 1040 1136
1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[   193.811] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x0.0   65.00  10=
24 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[   193.811] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x0.0   49.50  800=
 816 896 1056=20
600 601 604 625 +hsync +vsync (46.9 kHz e)
[   193.811] (II) NOUVEAU(0): Modeline &quot;1280x800&quot;x0.0   71.00  12=
80 1328 1360
1440  800 803 809 823 +hsync -vsync (49.3 kHz e)
[   193.811] (II) NOUVEAU(0): Modeline &quot;1680x1050&quot;x0.0  119.00  1=
680 1728 1760
1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz e)
[   193.811] (II) NOUVEAU(0): Modeline &quot;1920x1200&quot;x0.0  154.00  1=
920 1968 2000
2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz e)
[   193.811] (II) NOUVEAU(0): Modeline &quot;1152x864&quot;x0.0  108.00  11=
52 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[   193.811] (II) NOUVEAU(0): Modeline &quot;1600x1200&quot;x0.0  162.00  1=
600 1664 1856
2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz e)
[   193.811] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x0.0  108.00  1=
280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[   193.811] (II) NOUVEAU(0): Modeline &quot;1920x1080&quot;x60.0  172.80  =
1920 2040 2248
2576  1080 1081 1084 1118 -hsync +vsync (67.1 kHz e)
[   196.663] (II) AIGLX: Suspending AIGLX clients for VT switch</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1439430422.C84F31Bb1.26904--

--===============1239655836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1239655836==--
