From: James <bjlockie-ozXLQgHQwDP3fQ9qLvQP4Q@public.gmane.org>
Subject: Intermittent crashing X.
Date: Wed, 18 Sep 2013 22:09:06 -0400
Message-ID: <523A5CC2.9020308@lockie.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
To: Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


Intermittent crashing X.
I downgraded to xorg-1.13.4 hoping it would be stable.

I have 2 monitors, 1920x1200 and 1920x1080
Things seem stable if I don't connect the second monitor.


This is in my /var/log/kdm.log:

(EE) [mi] EQ overflow continuing.  1000 events have been dropped.
(EE) [mi] No further overflow reports will be reported until the clog is cleared.
(EE) 
(EE) Backtrace:
(EE) 0: /usr/bin/X (xorg_backtrace+0x36) [0x586216]
(EE) 1: /usr/bin/X (0x400000+0x4ef72) [0x44ef72]
(EE) 2: /usr/lib64/xorg/modules/input/evdev_drv.so (0x7f569cb50000+0x6831) [0x7f569cb56831]
(EE) 3: /usr/bin/X (0x400000+0x783d8) [0x4783d8]
(EE) 4: /usr/bin/X (0x400000+0xa0bec) [0x4a0bec]
(EE) 5: /lib64/libpthread.so.0 (0x7f56a2208000+0x10b40) [0x7f56a2218b40]
(EE) 6: /lib64/libc.so.6 (ioctl+0x7) [0x7f56a113d897]
(EE) 7: /usr/lib64/libdrm.so.2 (drmIoctl+0x30) [0x7f56a1ffc230]
(EE) 8: /usr/lib64/libdrm.so.2 (drmCommandWrite+0x1b) [0x7f56a1ffe77b]
(EE) 9: /usr/lib64/libdrm_nouveau.so.2 (nouveau_bo_wait+0x89) [0x7f569faaa989]
(EE) 10: /usr/lib64/libdrm_nouveau.so.2 (nouveau_pushbuf_space+0xc8) [0x7f569faabba8]
(EE) 11: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (0x7f569fcb0000+0x1db89) [0x7f569fccdb89]
(EE) 12: /usr/lib64/xorg/modules/libexa.so (0x7f569f668000+0xebb7) [0x7f569f676bb7]
(EE) 13: /usr/lib64/xorg/modules/libexa.so (0x7f569f668000+0xf4a0) [0x7f569f6774a0]
(EE) 14: /usr/bin/X (0x400000+0x112787) [0x512787]
(EE) 15: /usr/lib64/xorg/modules/libexa.so (0x7f569f668000+0xccb9) [0x7f569f674cb9]
(EE) 16: /usr/bin/X (0x400000+0x1129f1) [0x5129f1]
(EE) 17: /usr/bin/X (0x400000+0x10bce8) [0x50bce8]
(EE) 18: /usr/bin/X (0x400000+0x3af92) [0x43af92]
(EE) 19: /usr/bin/X (0x400000+0x2a06d) [0x42a06d]
(EE) 20: /lib64/libc.so.6 (__libc_start_main+0xf5) [0x7f56a107cbf5]
(EE) 21: /usr/bin/X (0x400000+0x2a3dd) [0x42a3dd]
(EE)



$ dmesg | grep nouveau
[    2.172345] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x092880a2
[    2.172348] nouveau  [  DEVICE][0000:01:00.0] Chipset: G92 (NV92)
[    2.172351] nouveau  [  DEVICE][0000:01:00.0] Family : NV50
[    2.173622] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    2.223545] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    2.223550] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    2.223764] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    2.223768] nouveau  [   VBIOS][0000:01:00.0] version 62.92.12.00.04
[    2.243988] nouveau 0000:01:00.0: irq 75 for MSI/MSI-X
[    2.244001] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[    2.244025] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR3
[    2.244027] nouveau  [     PFB][0000:01:00.0] RAM size: 512 MiB
[    2.244029] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 4032 tags
[    2.261452] nouveau  [  PTHERM][0000:01:00.0] Found an adt7473 at address 0x2e (controlled by lm_sensors, temp offset +8 C)
[    2.261454] nouveau  [     I2C][0000:01:00.0] detected monitoring device: adt7473
[    2.261459] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
[    2.261468] nouveau  [  PTHERM][0000:01:00.0] fan management: disabled
[    2.261471] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    2.261595] nouveau  [     DRM] VRAM: 512 MiB
[    2.261597] nouveau  [     DRM] GART: 1048576 MiB
[    2.261600] nouveau  [     DRM] TMDS table version 2.0
[    2.261602] nouveau  [     DRM] DCB version 4.0
[    2.261604] nouveau  [     DRM] DCB outp 00: 02000300 00000028
[    2.261606] nouveau  [     DRM] DCB outp 01: 01000302 00000030
[    2.261608] nouveau  [     DRM] DCB outp 02: 04011310 00000028
[    2.261610] nouveau  [     DRM] DCB outp 03: 02011312 00000030
[    2.261612] nouveau  [     DRM] DCB outp 04: 010223f1 00c0c080
[    2.261613] nouveau  [     DRM] DCB conn 00: 00001030
[    2.261615] nouveau  [     DRM] DCB conn 01: 00002130
[    2.261617] nouveau  [     DRM] DCB conn 02: 00000210
[    2.261619] nouveau  [     DRM] DCB conn 03: 00000211
[    2.261620] nouveau  [     DRM] DCB conn 04: 00000213
[    2.269266] nouveau W[     DRM] failed to create encoder 0/1/0: -19
[    2.269269] nouveau W[     DRM] TV-1 has no encoders, removing
[    2.269376] nouveau  [     DRM] 1 available performance level(s)
[    2.269380] nouveau  [     DRM] 3: core 600MHz shader 1500MHz memory 1000MHz voltage 1050mV fanspeed 100%                                                    
[    2.269383] nouveau  [     DRM] c: core 399MHz shader 810MHz memory 499MHz voltage 1050mV                                                                    
[    2.277050] nouveau  [     DRM] MM: using CRYPT for buffer copies
[    2.349382] nouveau  [     DRM] allocated 1920x1200 fb: 0x70000, bo ffff8806216d0000                                                                         
[    2.349434] fbcon: nouveaufb (fb0) is primary device
[    2.429699] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    2.429701] nouveau 0000:01:00.0: registered panic notifier
[    2.429709] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on minor 0                                                    

Linux Gentoo-desktop 3.12.0-rc1+ #15 SMP
