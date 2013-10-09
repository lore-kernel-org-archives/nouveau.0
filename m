From: Martin Nyhus <martin.nyhus-KK0ffGbhmjU@public.gmane.org>
Subject: Null pointer deref in nv50.c after 2fb9d6cf
Date: Wed, 09 Oct 2013 22:19:09 +0200
Message-ID: <5255BA3D.1050905@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
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
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

After 2fb9d6cf (drm/nouveau/core: convert event handler apis to split 
create/enable semantics) from the nouveau tree I'm getting a kernel 
panic on boot because pdisp is 0 at core/engine/software/nv50.c:179.

The nouveau part of the call trace is:
nv50_software_context_ctor+0x80/0x130
nouveau_object_ctor+0x2d/0xe0
nouveau_object_new+0xfa/0x230
nouveau_channel_new+0x53b/0x6c0
nouveau_drm_load+0x436/0x6c0
...
nouveau_drm_probe+0x202/0x290
...
nouveau_drm_init+0x43/0x1000

Is there anything else you need?

Martin



$ lspci
00:00.0 Host bridge: Intel Corporation 3rd Gen Core processor DRAM 
Controller (rev 09)
00:01.0 PCI bridge: Intel Corporation Xeon E3-1200 v2/3rd Gen Core 
processor PCI Express Root Port (rev 09)
00:02.0 VGA compatible controller: Intel Corporation 3rd Gen Core 
processor Graphics Controller (rev 09)
00:14.0 USB controller: Intel Corporation 7 Series/C210 Series Chipset 
Family USB xHCI Host Controller (rev 04)
00:16.0 Communication controller: Intel Corporation 7 Series/C210 Series 
Chipset Family MEI Controller #1 (rev 04)
00:1a.0 USB controller: Intel Corporation 7 Series/C210 Series Chipset 
Family USB Enhanced Host Controller #2 (rev 04)
00:1b.0 Audio device: Intel Corporation 7 Series/C210 Series Chipset 
Family High Definition Audio Controller (rev 04)
00:1c.0 PCI bridge: Intel Corporation 7 Series/C210 Series Chipset 
Family PCI Express Root Port 1 (rev c4)
00:1c.1 PCI bridge: Intel Corporation 7 Series/C210 Series Chipset 
Family PCI Express Root Port 2 (rev c4)
00:1c.3 PCI bridge: Intel Corporation 7 Series/C210 Series Chipset 
Family PCI Express Root Port 4 (rev c4)
00:1d.0 USB controller: Intel Corporation 7 Series/C210 Series Chipset 
Family USB Enhanced Host Controller #1 (rev 04)
00:1f.0 ISA bridge: Intel Corporation HM76 Express Chipset LPC 
Controller (rev 04)
00:1f.2 SATA controller: Intel Corporation 7 Series Chipset Family 
6-port SATA Controller [AHCI mode] (rev 04)
00:1f.3 SMBus: Intel Corporation 7 Series/C210 Series Chipset Family 
SMBus Controller (rev 04)
01:00.0 3D controller: NVIDIA Corporation GK107M [GeForce GT 740M] (rev a1)
03:00.0 Network controller: Intel Corporation Centrino Wireless-N 2230 
(rev c4)
04:00.0 Ethernet controller: Qualcomm Atheros AR8161 Gigabit Ethernet 
(rev 10)


$ dmesg | grep nouveau
[    1.816793] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e71f0a2
[    1.816797] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK107 (NVE7)
[    1.816800] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[    1.823291] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for 
image...
[    1.871478] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    1.871481] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[    1.871558] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    1.871560] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for image...
[    1.871562] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    1.871564] nouveau  [   VBIOS][0000:01:00.0] checking PCIROM for 
image...
[    1.871811] nouveau 0000:01:00.0: Invalid ROM contents
[    1.871851] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    1.871852] nouveau  [   VBIOS][0000:01:00.0] checking PLATFORM for 
image...
[    1.871902] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    1.871904] nouveau  [   VBIOS][0000:01:00.0] using image from PLATFORM
[    1.872026] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    1.872031] nouveau  [   VBIOS][0000:01:00.0] version 80.07.95.00.07
[    1.959798] nouveau 0000:01:00.0: irq 43 for MSI/MSI-X
[    1.959823] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[    1.959926] nouveau  [     PFB][0000:01:00.0] RAM type: DDR3
[    1.959928] nouveau  [     PFB][0000:01:00.0] RAM size: 2048 MiB
[    1.959930] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    1.997918] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / 
external
[    1.997926] nouveau  [  PTHERM][0000:01:00.0] fan management: disabled
[    1.997979] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    2.032309] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 
FAULT at 0x300000 [ IBUS ]
[    2.032962] nouveau  [     DRM] VRAM: 2048 MiB
[    2.032966] nouveau  [     DRM] GART: 1048576 MiB
[    2.032972] nouveau E[     DRM] Pointer to TMDS table invalid
[    2.033016] nouveau  [     DRM] DCB version 4.0
[    2.033019] nouveau E[     DRM] Pointer to flat panel table invalid
[    2.033650] nouveau  [     DRM] ACPI backlight interface available, 
not registering our own
[    2.033654] nouveau W[     DRM] voltage table 0x50 unknown
[    2.033659] nouveau  [     DRM] 2 available performance level(s)
[    2.033662] nouveau  [     DRM] 1: core 202MHz shader 405MHz memory 
405MHz voltage 490mV
[    2.033664] nouveau  [     DRM] 3: core 450MHz shader 901MHz memory 
1080MHz voltage 580mV
[    2.033666] nouveau  [     DRM] c:
[    2.046248] nouveau  [     DRM] MM: using COPY for buffer copies
[    2.046253] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 
on minor 0
[   42.063042] nouveau E[    PBUS][0000:01:00.0] MMIO write of 
0x00000000 FAULT at 0x418880 [ IBUS ]
[   42.063087] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x419eb4 
0xbadf1000 (0x3800820c)
[   44.064991] nouveau E[  PGRAPH][0000:01:00.0] HUB_INIT timed out
[   44.065000] nouveau E[  PGRAPH][0000:01:00.0] 409000 - done 0x00000244
[   44.065010] nouveau E[  PGRAPH][0000:01:00.0] 409000 - stat 
0x00000000 0x00000000 0x00000000 0x00000000
[   44.065020] nouveau E[  PGRAPH][0000:01:00.0] 409000 - stat 
0x00000000 0x00000000 0x00000002 0x00000009
[   44.065024] nouveau E[  PGRAPH][0000:01:00.0] 502000 - done 0x00000300
[   44.065029] nouveau E[  PGRAPH][0000:01:00.0] 502000 - stat 
0x00000000 0x00000000 0x00000000 0x00000000
[   44.065035] nouveau E[  PGRAPH][0000:01:00.0] 502000 - stat 
0x00000000 0x00000000 0x00000000 0x00000000
[   44.065037] nouveau E[  PGRAPH][0000:01:00.0] init failed, -16
