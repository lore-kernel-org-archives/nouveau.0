From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 85495] nouveau: xft fonts not rendered on Dell M4800
	(QHD+)
Date: Tue, 28 Oct 2014 22:27:04 +0000
Message-ID: <bug-85495-8800-5oOqCEXDGl@http.bugs.freedesktop.org/>
References: <bug-85495-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0937609024=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-85495-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0937609024==
Content-Type: multipart/alternative; boundary="1414535224.2AEbB1.12751"; charset="UTF-8"


--1414535224.2AEbB1.12751
Date: Tue, 28 Oct 2014 22:27:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=85495

--- Comment #1 from Ed Santiago <freedesktop-aVMt7ygKTj2t/hvpvFFPbQ@public.gmane.org> ---
More context:

  * about one out of every ten boots, everything is fine. Fonts look good.

  * On a bad boot, xvinfo gives an error and mplayer cannot display using Xv.
On a good boot, mplayer works great and xvinfo spits out 50+ lines including:

        Adaptor #0: "Nouveau GeForce 8/9 Textured Video"

System logs from a successful boot:

   # journalctl -b | grep -1 nouv | [sed chain for legibility]
   15:58:53 d laptop-mode[3067]: enabled, not active
   15:58:53 d k: nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e63c0a1
   15:58:53 d k: nouveau  [  DEVICE][0000:01:00.0] Chipset: GK106 (NVE6)
   15:58:53 d k: nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
   15:58:53 d k: nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
   15:58:53 d k: nouveau  [   VBIOS][0000:01:00.0] ... signature not found
   15:58:53 d k: nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
   15:58:53 d k: nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
   15:58:53 d k: nouveau  [   VBIOS][0000:01:00.0] using image from PROM
   15:58:53 d k: nouveau  [   VBIOS][0000:01:00.0] BIT signature found
   15:58:53 d k: nouveau  [   VBIOS][0000:01:00.0] version 80.06.7d.00.06
   15:58:53 d laptop-mode[3138]: Laptop mode
   15:58:53 d laptop-mode[3139]: enabled, not active
   15:58:53 d k: nouveau  [     MXM][0000:01:00.0] BIOS version 3.0
   15:58:53 d laptop-mode[3191]: Laptop mode
   --
   15:58:53 d k: ACPI Warning: \_SB_.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20140424/nsarguments-95)
   15:58:53 d k: nouveau  [     MXM][0000:01:00.0] MXMS Version 3.0
   15:58:53 d k: nouveau 0000:01:00.0: irq 46 for MSI/MSI-X
   15:58:53 d k: nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
   15:58:53 d k: nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
   15:58:53 d k: nouveau  [     PFB][0000:01:00.0] RAM size: 2048 MiB
   15:58:53 d k: nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
   15:58:53 d k: nouveau  [    VOLT][0000:01:00.0] GPU voltage: 600000uv
   15:58:53 d laptop-mode[3209]: Laptop mode
   15:58:53 d laptop-mode[3211]: enabled, not active
   15:58:53 d k: nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
   15:58:53 d k: nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
   15:58:53 d k: nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
   15:58:53 d k: nouveau  [     CLK][0000:01:00.0] 07: core 405 MHz memory 810
MHz 
   15:58:53 d k: nouveau  [     CLK][0000:01:00.0] 0a: core 405-666 MHz memory
1620 MHz 
   15:58:53 d k: nouveau  [     CLK][0000:01:00.0] 0f: core 405-666 MHz memory
3008 MHz 
   15:58:53 d k: nouveau  [     CLK][0000:01:00.0] --: core 405 MHz memory 810
MHz 
   15:58:53 d k: nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000
FAULT at 0x400700 [ IBUS ]
   15:58:53 d k: [TTM] Zone  kernel: Available graphics memory: 4060754 kiB
   --
   15:58:53 d k: [TTM] Initializing DMA pool allocator
   15:58:53 d k: nouveau  [     DRM] VRAM: 2048 MiB
   15:58:53 d k: nouveau  [     DRM] GART: 1048576 MiB
   15:58:53 d k: nouveau  [     DRM] TMDS table version 2.0
   15:58:53 d k: nouveau  [     DRM] DCB version 4.0
   15:58:53 d k: nouveau  [     DRM] DCB outp 03: 08015fd6 0f420020
   15:58:53 d k: nouveau  [     DRM] DCB outp 04: 08015f92 00020020
   15:58:53 d k: nouveau  [     DRM] DCB outp 05: 08014fc6 0f420010
   15:58:53 d k: nouveau  [     DRM] DCB outp 06: 08014f82 00020010
   15:58:53 d k: nouveau  [     DRM] DCB outp 08: 04038fb6 0f430014
   15:58:53 d k: nouveau  [     DRM] DCB outp 10: 02027fa6 0f420010
   15:58:53 d k: nouveau  [     DRM] DCB outp 11: 02027f62 00020010
   15:58:53 d k: nouveau  [     DRM] DCB outp 13: 02049f00 00000000
   15:58:53 d k: nouveau  [     DRM] DCB conn 00: 00000040
   15:58:53 d k: nouveau  [     DRM] DCB conn 04: 01000446
   15:58:53 d k: nouveau  [     DRM] DCB conn 05: 02000546
   15:58:53 d k: nouveau  [     DRM] DCB conn 07: 00010746
   15:58:53 d k: nouveau  [     DRM] DCB conn 08: 00020847
   15:58:53 d k: nouveau  [     DRM] DCB conn 09: 00000900
   15:58:53 d laptop-mode[3249]: Laptop mode
   --
   15:58:53 d k: [drm] Driver supports precise vblank timestamp query.
   15:58:53 d k: nouveau  [     DRM] MM: using COPY for buffer copies
   15:58:53 d mtp-probe[3264]: checking bus 3, device 3:
"/sys/devices/pci0000:00/0000:00:1a.0/usb3/3-1/3-1.5"
   --
   15:58:54 d k: ACPI: Thermal Zone [THM] (25 C)
   15:58:54 d k: nouveau  [     DRM] allocated 3200x1800 fb: 0x80000, bo
ffff880220e5b800
   15:58:54 d k: fbcon: nouveaufb (fb0) is primary device
   15:58:54 d laptop-mode[3755]: Laptop mode
   --
   15:58:54 d k: Console: switching to colour frame buffer device 400x112
   15:58:54 d k: nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
   15:58:54 d k: nouveau 0000:01:00.0: registered panic notifier
   15:58:54 d k: [drm] Initialized nouveau 1.1.2 20120801 for 0000:01:00.0 on
minor 0
   15:58:54 d k: ieee80211 phy0: Selected rate control algorithm 'iwl-mvm-rs'

...and from an unsuccessful one:

   # journalctl -b -1|grep -1 nouv|<etc>
   15:56:42 d laptop-mode[3618]: enabled, not active
   15:56:42 d k: nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e63c0a1
   15:56:42 d k: nouveau  [  DEVICE][0000:01:00.0] Chipset: GK106 (NVE6)
   15:56:42 d k: nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
   15:56:42 d k: nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
   15:56:42 d k: nouveau  [   VBIOS][0000:01:00.0] ... signature not found
   15:56:42 d k: nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
   15:56:42 d laptop-mode[3635]: Laptop mode
   15:56:42 d laptop-mode[3637]: enabled, not active
   15:56:42 d k: nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
   15:56:42 d k: nouveau  [   VBIOS][0000:01:00.0] using image from PROM
   15:56:42 d k: nouveau  [   VBIOS][0000:01:00.0] BIT signature found
   15:56:42 d k: nouveau  [   VBIOS][0000:01:00.0] version 80.06.7d.00.06
   15:56:42 d k: parport_pc 00:07: activated
   15:56:42 d k: parport_pc 00:07: reported by Plug and Play ACPI
   15:56:42 d k: nouveau  [     MXM][0000:01:00.0] BIOS version 3.0
   15:56:42 d k: dcdbas dcdbas: Dell Systems Management Base Driver (version
5.6.0-3.2)
   --
   15:56:42 d k: ACPI Warning: \_SB_.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20140424/nsarguments-95)
   15:56:42 d k: nouveau  [     MXM][0000:01:00.0] MXMS Version 3.0
   15:56:42 d k: nouveau 0000:01:00.0: irq 46 for MSI/MSI-X
   15:56:42 d k: nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
   15:56:42 d k: nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
   15:56:42 d k: nouveau  [     PFB][0000:01:00.0] RAM size: 2048 MiB
   15:56:42 d k: nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
   15:56:42 d k: nouveau  [    VOLT][0000:01:00.0] GPU voltage: 600000uv
   15:56:42 d laptop-mode[3845]: Laptop mode
   15:56:42 d laptop-mode[3846]: enabled, not active
   15:56:42 d k: nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
   15:56:42 d k: nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
   15:56:42 d k: nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
   15:56:42 d k: nouveau  [     CLK][0000:01:00.0] 07: core 405 MHz memory 810
MHz 
   15:56:42 d k: nouveau  [     CLK][0000:01:00.0] 0a: core 405-666 MHz memory
1620 MHz 
   15:56:42 d k: nouveau  [     CLK][0000:01:00.0] 0f: core 405-666 MHz memory
3008 MHz 
   15:56:42 d k: nouveau  [     CLK][0000:01:00.0] --: core 405 MHz memory 810
MHz 
   15:56:42 d k: nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000
FAULT at 0x400700 [ IBUS ]
   15:56:42 d k: [TTM] Zone  kernel: Available graphics memory: 4060754 kiB
   --
   15:56:42 d k: [TTM] Initializing DMA pool allocator
   15:56:42 d k: nouveau  [     DRM] VRAM: 2048 MiB
   15:56:42 d k: nouveau  [     DRM] GART: 1048576 MiB
   15:56:42 d k: nouveau  [     DRM] TMDS table version 2.0
   15:56:42 d k: nouveau  [     DRM] DCB version 4.0
   15:56:42 d k: nouveau  [     DRM] DCB outp 03: 08015fd6 0f420020
   15:56:42 d k: nouveau  [     DRM] DCB outp 04: 08015f92 00020020
   15:56:42 d k: nouveau  [     DRM] DCB outp 05: 08014fc6 0f420010
   15:56:42 d k: nouveau  [     DRM] DCB outp 06: 08014f82 00020010
   15:56:42 d k: nouveau  [     DRM] DCB outp 08: 04038fb6 0f430014
   15:56:42 d k: nouveau  [     DRM] DCB outp 10: 02027fa6 0f420010
   15:56:42 d k: nouveau  [     DRM] DCB outp 11: 02027f62 00020010
   15:56:42 d k: nouveau  [     DRM] DCB outp 13: 02049f00 00000000
   15:56:42 d k: nouveau  [     DRM] DCB conn 00: 00000040
   15:56:42 d k: nouveau  [     DRM] DCB conn 04: 01000446
   15:56:42 d k: nouveau  [     DRM] DCB conn 05: 02000546
   15:56:42 d k: nouveau  [     DRM] DCB conn 07: 00010746
   15:56:42 d k: nouveau  [     DRM] DCB conn 08: 00020847
   15:56:42 d k: nouveau  [     DRM] DCB conn 09: 00000900
   15:56:42 d k: thermal LNXTHERM:00: registered as thermal_zone1
   --
   15:56:42 d k: parport_pc 00:07: disabled
   15:56:42 d k: nouveau  [     DRM] MM: using COPY for buffer copies
   15:56:42 d laptop-mode[3942]: Laptop mode
   --
   15:56:42 d k: ieee80211 phy0: Selected rate control algorithm 'iwl-mvm-rs'
   15:56:45 d k: nouveau E[  PGRAPH][0000:01:00.0] HUB_INIT timed out
   15:56:45 d k: nouveau E[  PGRAPH][0000:01:00.0] 409000 - done 0x00000240
   15:56:45 d k: nouveau E[  PGRAPH][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
   15:56:45 d k: nouveau E[  PGRAPH][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000006 0x00000000
   15:56:45 d k: nouveau E[  PGRAPH][0000:01:00.0] 502000 - done 0x00000300
   15:56:45 d k: nouveau E[  PGRAPH][0000:01:00.0] 502000 - stat 0x00000000
0x00008c00 0x00000000 0x00000000
   15:56:45 d k: nouveau E[  PGRAPH][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
   15:56:45 d k: nouveau E[  PGRAPH][0000:01:00.0] 50a000 - done 0x00000300
   15:56:45 d k: nouveau E[  PGRAPH][0000:01:00.0] 50a000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
   15:56:45 d k: nouveau E[  PGRAPH][0000:01:00.0] 50a000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
   15:56:45 d k: nouveau E[  PGRAPH][0000:01:00.0] init failed, -16
   15:56:45 d k: nouveau  [     DRM] allocated 3200x1800 fb: 0x80000, bo
ffff880224e4d400
   15:56:45 d k: fbcon: nouveaufb (fb0) is primary device
   15:56:45 d k: Console: switching to colour frame buffer device 400x112
   15:56:45 d k: nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
   15:56:45 d k: nouveau 0000:01:00.0: registered panic notifier
   15:56:45 d k: [drm] Initialized nouveau 1.1.2 20120801 for 0000:01:00.0 on
minor 0
   15:56:45 d lvm[4105]: 2 logical volume(s) in volume group "vg0" now active
   --
   15:56:46 d k: input: Fancy Beeper
   15:56:50 d k: nouveau E[  PGRAPH][0000:01:00.0] HUB_INIT timed out
   15:56:50 d k: nouveau E[  PGRAPH][0000:01:00.0] 409000 - done 0x00000240
   15:56:50 d k: nouveau E[  PGRAPH][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
   15:56:50 d k: nouveau E[  PGRAPH][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000006 0x00000001
   15:56:50 d k: nouveau E[  PGRAPH][0000:01:00.0] 502000 - done 0x00000300
   15:56:50 d k: nouveau E[  PGRAPH][0000:01:00.0] 502000 - stat 0x00000000
0x00008c00 0x00000000 0x00000000
   15:56:50 d k: nouveau E[  PGRAPH][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
   15:56:50 d k: nouveau E[  PGRAPH][0000:01:00.0] 50a000 - done 0x00000300
   15:56:50 d k: nouveau E[  PGRAPH][0000:01:00.0] 50a000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
   15:56:50 d k: nouveau E[  PGRAPH][0000:01:00.0] 50a000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
   15:56:50 d k: nouveau E[  PGRAPH][0000:01:00.0] init failed, -16
   15:56:55 d dhcpcd[4830]: dhcpcd not running
   --
   15:57:19 d chronyd[4711]: Selected source 72.14.183.39
   15:57:29 d k: nouveau E[ X[4703]] failed to idle channel 0xcccc0000
[X[4703]]
   15:57:35 d k: INFO: rcu_sched self-detected stall on CPU { 1}  (t=2100
jiffies g=741 c=740 q=516)
   --
   15:57:35 d k:  [<ffffffff813b9ab3>] ? ioread32+0xb/0x2f
   15:57:35 d k:  [<ffffffffa0bd981d>] ? nouveau_bo_rd32+0x22/0x27 [nouveau]
   15:57:35 d k:  [<ffffffffa0bde528>] nv84_fence_read+0x29/0x2b [nouveau]
   15:57:35 d k:  [<ffffffffa0bd6e2a>] nouveau_fence_done+0x3c/0x75 [nouveau]
   15:57:35 d k:  [<ffffffffa0bd7227>] nouveau_fence_wait+0xde/0x12e [nouveau]
   15:57:35 d k:  [<ffffffffa0bd5c6e>] nouveau_channel_idle+0x36/0x6e [nouveau]
   15:57:35 d k:  [<ffffffffa0bd5cd1>] nouveau_channel_del+0x2b/0xbf [nouveau]
   15:57:35 d k:  [<ffffffffa0bdcd4b>]
nouveau_abi16_chan_fini.isra.4+0x12b/0x174 [nouveau]
   15:57:35 d k:  [<ffffffffa0bdd454>]
nouveau_abi16_ioctl_channel_free+0x46/0x7e [nouveau]
   15:57:35 d k:  [<ffffffff8144527b>] drm_ioctl+0x381/0x3f9
   15:57:35 d k:  [<ffffffff8109b79c>] ? call_rcu_sched+0x12/0x14
   15:57:35 d k:  [<ffffffffa0bdd40e>] ?
nouveau_abi16_ioctl_channel_alloc+0x2e3/0x2e3 [nouveau]
   15:57:35 d k:  [<ffffffff8110e591>] ? __d_free+0x4b/0x50
   15:57:35 d k:  [<ffffffffa0bd4a45>] nouveau_drm_ioctl+0x51/0x7f [nouveau]
   15:57:35 d k:  [<ffffffff8110c091>] do_vfs_ioctl+0x353/0x417
   --
   15:57:35 d k: INFO: NMI handler (arch_trigger_all_cpu_backtrace_handler)
took too long to run: 2.617 msecs
   15:57:44 d k: nouveau E[ X[4703]] failed to idle channel 0xcccc0000
[X[4703]]
   15:57:45 d chronyd[4711]: chronyd exiting

The 15:56 entries are boot time, 15:57 is shutdown time (instead of immediate X
server shutdown, it takes a few seconds and then spits out a call trace).

Hope this is helpful.

OBTW still 3.16.6-gentoo. I am unable to get a successful boot with
3.17.1-gentoo-r1 or 3.18-rc2. As in, not able to get a root login (console,
ssh) and nothing in journalctl -b -1.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1414535224.2AEbB1.12751
Date: Tue, 28 Oct 2014 22:27:04 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau: xft fonts not rendered on Dell M4800 (QHD+)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85495#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau: xft fonts not rendered on Dell M4800 (QHD+)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85495">bug 85495</a>
              from <span class="vcard"><a class="email" href="mailto:freedesktop&#64;edsantiago.com" title="Ed Santiago &lt;freedesktop&#64;edsantiago.com&gt;"> <span class="fn">Ed Santiago</span></a>
</span></b>
        <pre>More context:

  * about one out of every ten boots, everything is fine. Fonts look good.

  * On a bad boot, xvinfo gives an error and mplayer cannot display using Xv.
On a good boot, mplayer works great and xvinfo spits out 50+ lines including:

        Adaptor #0: &quot;Nouveau GeForce 8/9 Textured Video&quot;

System logs from a successful boot:

   # journalctl -b | grep -1 nouv | [sed chain for legibility]
   15:58:53 d laptop-mode[3067]: enabled, not active
   15:58:53 d k: nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e63c0a1
   15:58:53 d k: nouveau  [  DEVICE][0000:01:00.0] Chipset: GK106 (NVE6)
   15:58:53 d k: nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
   15:58:53 d k: nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
   15:58:53 d k: nouveau  [   VBIOS][0000:01:00.0] ... signature not found
   15:58:53 d k: nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
   15:58:53 d k: nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
   15:58:53 d k: nouveau  [   VBIOS][0000:01:00.0] using image from PROM
   15:58:53 d k: nouveau  [   VBIOS][0000:01:00.0] BIT signature found
   15:58:53 d k: nouveau  [   VBIOS][0000:01:00.0] version 80.06.7d.00.06
   15:58:53 d laptop-mode[3138]: Laptop mode
   15:58:53 d laptop-mode[3139]: enabled, not active
   15:58:53 d k: nouveau  [     MXM][0000:01:00.0] BIOS version 3.0
   15:58:53 d laptop-mode[3191]: Laptop mode
   --
   15:58:53 d k: ACPI Warning: \_SB_.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20140424/nsarguments-95)
   15:58:53 d k: nouveau  [     MXM][0000:01:00.0] MXMS Version 3.0
   15:58:53 d k: nouveau 0000:01:00.0: irq 46 for MSI/MSI-X
   15:58:53 d k: nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
   15:58:53 d k: nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
   15:58:53 d k: nouveau  [     PFB][0000:01:00.0] RAM size: 2048 MiB
   15:58:53 d k: nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
   15:58:53 d k: nouveau  [    VOLT][0000:01:00.0] GPU voltage: 600000uv
   15:58:53 d laptop-mode[3209]: Laptop mode
   15:58:53 d laptop-mode[3211]: enabled, not active
   15:58:53 d k: nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
   15:58:53 d k: nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
   15:58:53 d k: nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
   15:58:53 d k: nouveau  [     CLK][0000:01:00.0] 07: core 405 MHz memory 810
MHz 
   15:58:53 d k: nouveau  [     CLK][0000:01:00.0] 0a: core 405-666 MHz memory
1620 MHz 
   15:58:53 d k: nouveau  [     CLK][0000:01:00.0] 0f: core 405-666 MHz memory
3008 MHz 
   15:58:53 d k: nouveau  [     CLK][0000:01:00.0] --: core 405 MHz memory 810
MHz 
   15:58:53 d k: nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000
FAULT at 0x400700 [ IBUS ]
   15:58:53 d k: [TTM] Zone  kernel: Available graphics memory: 4060754 kiB
   --
   15:58:53 d k: [TTM] Initializing DMA pool allocator
   15:58:53 d k: nouveau  [     DRM] VRAM: 2048 MiB
   15:58:53 d k: nouveau  [     DRM] GART: 1048576 MiB
   15:58:53 d k: nouveau  [     DRM] TMDS table version 2.0
   15:58:53 d k: nouveau  [     DRM] DCB version 4.0
   15:58:53 d k: nouveau  [     DRM] DCB outp 03: 08015fd6 0f420020
   15:58:53 d k: nouveau  [     DRM] DCB outp 04: 08015f92 00020020
   15:58:53 d k: nouveau  [     DRM] DCB outp 05: 08014fc6 0f420010
   15:58:53 d k: nouveau  [     DRM] DCB outp 06: 08014f82 00020010
   15:58:53 d k: nouveau  [     DRM] DCB outp 08: 04038fb6 0f430014
   15:58:53 d k: nouveau  [     DRM] DCB outp 10: 02027fa6 0f420010
   15:58:53 d k: nouveau  [     DRM] DCB outp 11: 02027f62 00020010
   15:58:53 d k: nouveau  [     DRM] DCB outp 13: 02049f00 00000000
   15:58:53 d k: nouveau  [     DRM] DCB conn 00: 00000040
   15:58:53 d k: nouveau  [     DRM] DCB conn 04: 01000446
   15:58:53 d k: nouveau  [     DRM] DCB conn 05: 02000546
   15:58:53 d k: nouveau  [     DRM] DCB conn 07: 00010746
   15:58:53 d k: nouveau  [     DRM] DCB conn 08: 00020847
   15:58:53 d k: nouveau  [     DRM] DCB conn 09: 00000900
   15:58:53 d laptop-mode[3249]: Laptop mode
   --
   15:58:53 d k: [drm] Driver supports precise vblank timestamp query.
   15:58:53 d k: nouveau  [     DRM] MM: using COPY for buffer copies
   15:58:53 d mtp-probe[3264]: checking bus 3, device 3:
&quot;/sys/devices/pci0000:00/0000:00:1a.0/usb3/3-1/3-1.5&quot;
   --
   15:58:54 d k: ACPI: Thermal Zone [THM] (25 C)
   15:58:54 d k: nouveau  [     DRM] allocated 3200x1800 fb: 0x80000, bo
ffff880220e5b800
   15:58:54 d k: fbcon: nouveaufb (fb0) is primary device
   15:58:54 d laptop-mode[3755]: Laptop mode
   --
   15:58:54 d k: Console: switching to colour frame buffer device 400x112
   15:58:54 d k: nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
   15:58:54 d k: nouveau 0000:01:00.0: registered panic notifier
   15:58:54 d k: [drm] Initialized nouveau 1.1.2 20120801 for 0000:01:00.0 on
minor 0
   15:58:54 d k: ieee80211 phy0: Selected rate control algorithm 'iwl-mvm-rs'

...and from an unsuccessful one:

   # journalctl -b -1|grep -1 nouv|&lt;etc&gt;
   15:56:42 d laptop-mode[3618]: enabled, not active
   15:56:42 d k: nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e63c0a1
   15:56:42 d k: nouveau  [  DEVICE][0000:01:00.0] Chipset: GK106 (NVE6)
   15:56:42 d k: nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
   15:56:42 d k: nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
   15:56:42 d k: nouveau  [   VBIOS][0000:01:00.0] ... signature not found
   15:56:42 d k: nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
   15:56:42 d laptop-mode[3635]: Laptop mode
   15:56:42 d laptop-mode[3637]: enabled, not active
   15:56:42 d k: nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
   15:56:42 d k: nouveau  [   VBIOS][0000:01:00.0] using image from PROM
   15:56:42 d k: nouveau  [   VBIOS][0000:01:00.0] BIT signature found
   15:56:42 d k: nouveau  [   VBIOS][0000:01:00.0] version 80.06.7d.00.06
   15:56:42 d k: parport_pc 00:07: activated
   15:56:42 d k: parport_pc 00:07: reported by Plug and Play ACPI
   15:56:42 d k: nouveau  [     MXM][0000:01:00.0] BIOS version 3.0
   15:56:42 d k: dcdbas dcdbas: Dell Systems Management Base Driver (version
5.6.0-3.2)
   --
   15:56:42 d k: ACPI Warning: \_SB_.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20140424/nsarguments-95)
   15:56:42 d k: nouveau  [     MXM][0000:01:00.0] MXMS Version 3.0
   15:56:42 d k: nouveau 0000:01:00.0: irq 46 for MSI/MSI-X
   15:56:42 d k: nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
   15:56:42 d k: nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
   15:56:42 d k: nouveau  [     PFB][0000:01:00.0] RAM size: 2048 MiB
   15:56:42 d k: nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
   15:56:42 d k: nouveau  [    VOLT][0000:01:00.0] GPU voltage: 600000uv
   15:56:42 d laptop-mode[3845]: Laptop mode
   15:56:42 d laptop-mode[3846]: enabled, not active
   15:56:42 d k: nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
   15:56:42 d k: nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
   15:56:42 d k: nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
   15:56:42 d k: nouveau  [     CLK][0000:01:00.0] 07: core 405 MHz memory 810
MHz 
   15:56:42 d k: nouveau  [     CLK][0000:01:00.0] 0a: core 405-666 MHz memory
1620 MHz 
   15:56:42 d k: nouveau  [     CLK][0000:01:00.0] 0f: core 405-666 MHz memory
3008 MHz 
   15:56:42 d k: nouveau  [     CLK][0000:01:00.0] --: core 405 MHz memory 810
MHz 
   15:56:42 d k: nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000
FAULT at 0x400700 [ IBUS ]
   15:56:42 d k: [TTM] Zone  kernel: Available graphics memory: 4060754 kiB
   --
   15:56:42 d k: [TTM] Initializing DMA pool allocator
   15:56:42 d k: nouveau  [     DRM] VRAM: 2048 MiB
   15:56:42 d k: nouveau  [     DRM] GART: 1048576 MiB
   15:56:42 d k: nouveau  [     DRM] TMDS table version 2.0
   15:56:42 d k: nouveau  [     DRM] DCB version 4.0
   15:56:42 d k: nouveau  [     DRM] DCB outp 03: 08015fd6 0f420020
   15:56:42 d k: nouveau  [     DRM] DCB outp 04: 08015f92 00020020
   15:56:42 d k: nouveau  [     DRM] DCB outp 05: 08014fc6 0f420010
   15:56:42 d k: nouveau  [     DRM] DCB outp 06: 08014f82 00020010
   15:56:42 d k: nouveau  [     DRM] DCB outp 08: 04038fb6 0f430014
   15:56:42 d k: nouveau  [     DRM] DCB outp 10: 02027fa6 0f420010
   15:56:42 d k: nouveau  [     DRM] DCB outp 11: 02027f62 00020010
   15:56:42 d k: nouveau  [     DRM] DCB outp 13: 02049f00 00000000
   15:56:42 d k: nouveau  [     DRM] DCB conn 00: 00000040
   15:56:42 d k: nouveau  [     DRM] DCB conn 04: 01000446
   15:56:42 d k: nouveau  [     DRM] DCB conn 05: 02000546
   15:56:42 d k: nouveau  [     DRM] DCB conn 07: 00010746
   15:56:42 d k: nouveau  [     DRM] DCB conn 08: 00020847
   15:56:42 d k: nouveau  [     DRM] DCB conn 09: 00000900
   15:56:42 d k: thermal LNXTHERM:00: registered as thermal_zone1
   --
   15:56:42 d k: parport_pc 00:07: disabled
   15:56:42 d k: nouveau  [     DRM] MM: using COPY for buffer copies
   15:56:42 d laptop-mode[3942]: Laptop mode
   --
   15:56:42 d k: ieee80211 phy0: Selected rate control algorithm 'iwl-mvm-rs'
   15:56:45 d k: nouveau E[  PGRAPH][0000:01:00.0] HUB_INIT timed out
   15:56:45 d k: nouveau E[  PGRAPH][0000:01:00.0] 409000 - done 0x00000240
   15:56:45 d k: nouveau E[  PGRAPH][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
   15:56:45 d k: nouveau E[  PGRAPH][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000006 0x00000000
   15:56:45 d k: nouveau E[  PGRAPH][0000:01:00.0] 502000 - done 0x00000300
   15:56:45 d k: nouveau E[  PGRAPH][0000:01:00.0] 502000 - stat 0x00000000
0x00008c00 0x00000000 0x00000000
   15:56:45 d k: nouveau E[  PGRAPH][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
   15:56:45 d k: nouveau E[  PGRAPH][0000:01:00.0] 50a000 - done 0x00000300
   15:56:45 d k: nouveau E[  PGRAPH][0000:01:00.0] 50a000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
   15:56:45 d k: nouveau E[  PGRAPH][0000:01:00.0] 50a000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
   15:56:45 d k: nouveau E[  PGRAPH][0000:01:00.0] init failed, -16
   15:56:45 d k: nouveau  [     DRM] allocated 3200x1800 fb: 0x80000, bo
ffff880224e4d400
   15:56:45 d k: fbcon: nouveaufb (fb0) is primary device
   15:56:45 d k: Console: switching to colour frame buffer device 400x112
   15:56:45 d k: nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
   15:56:45 d k: nouveau 0000:01:00.0: registered panic notifier
   15:56:45 d k: [drm] Initialized nouveau 1.1.2 20120801 for 0000:01:00.0 on
minor 0
   15:56:45 d lvm[4105]: 2 logical volume(s) in volume group &quot;vg0&quot; now active
   --
   15:56:46 d k: input: Fancy Beeper
   15:56:50 d k: nouveau E[  PGRAPH][0000:01:00.0] HUB_INIT timed out
   15:56:50 d k: nouveau E[  PGRAPH][0000:01:00.0] 409000 - done 0x00000240
   15:56:50 d k: nouveau E[  PGRAPH][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
   15:56:50 d k: nouveau E[  PGRAPH][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000006 0x00000001
   15:56:50 d k: nouveau E[  PGRAPH][0000:01:00.0] 502000 - done 0x00000300
   15:56:50 d k: nouveau E[  PGRAPH][0000:01:00.0] 502000 - stat 0x00000000
0x00008c00 0x00000000 0x00000000
   15:56:50 d k: nouveau E[  PGRAPH][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
   15:56:50 d k: nouveau E[  PGRAPH][0000:01:00.0] 50a000 - done 0x00000300
   15:56:50 d k: nouveau E[  PGRAPH][0000:01:00.0] 50a000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
   15:56:50 d k: nouveau E[  PGRAPH][0000:01:00.0] 50a000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
   15:56:50 d k: nouveau E[  PGRAPH][0000:01:00.0] init failed, -16
   15:56:55 d dhcpcd[4830]: dhcpcd not running
   --
   15:57:19 d chronyd[4711]: Selected source 72.14.183.39
   15:57:29 d k: nouveau E[ X[4703]] failed to idle channel 0xcccc0000
[X[4703]]
   15:57:35 d k: INFO: rcu_sched self-detected stall on CPU { 1}  (t=2100
jiffies g=741 c=740 q=516)
   --
   15:57:35 d k:  [&lt;ffffffff813b9ab3&gt;] ? ioread32+0xb/0x2f
   15:57:35 d k:  [&lt;ffffffffa0bd981d&gt;] ? nouveau_bo_rd32+0x22/0x27 [nouveau]
   15:57:35 d k:  [&lt;ffffffffa0bde528&gt;] nv84_fence_read+0x29/0x2b [nouveau]
   15:57:35 d k:  [&lt;ffffffffa0bd6e2a&gt;] nouveau_fence_done+0x3c/0x75 [nouveau]
   15:57:35 d k:  [&lt;ffffffffa0bd7227&gt;] nouveau_fence_wait+0xde/0x12e [nouveau]
   15:57:35 d k:  [&lt;ffffffffa0bd5c6e&gt;] nouveau_channel_idle+0x36/0x6e [nouveau]
   15:57:35 d k:  [&lt;ffffffffa0bd5cd1&gt;] nouveau_channel_del+0x2b/0xbf [nouveau]
   15:57:35 d k:  [&lt;ffffffffa0bdcd4b&gt;]
nouveau_abi16_chan_fini.isra.4+0x12b/0x174 [nouveau]
   15:57:35 d k:  [&lt;ffffffffa0bdd454&gt;]
nouveau_abi16_ioctl_channel_free+0x46/0x7e [nouveau]
   15:57:35 d k:  [&lt;ffffffff8144527b&gt;] drm_ioctl+0x381/0x3f9
   15:57:35 d k:  [&lt;ffffffff8109b79c&gt;] ? call_rcu_sched+0x12/0x14
   15:57:35 d k:  [&lt;ffffffffa0bdd40e&gt;] ?
nouveau_abi16_ioctl_channel_alloc+0x2e3/0x2e3 [nouveau]
   15:57:35 d k:  [&lt;ffffffff8110e591&gt;] ? __d_free+0x4b/0x50
   15:57:35 d k:  [&lt;ffffffffa0bd4a45&gt;] nouveau_drm_ioctl+0x51/0x7f [nouveau]
   15:57:35 d k:  [&lt;ffffffff8110c091&gt;] do_vfs_ioctl+0x353/0x417
   --
   15:57:35 d k: INFO: NMI handler (arch_trigger_all_cpu_backtrace_handler)
took too long to run: 2.617 msecs
   15:57:44 d k: nouveau E[ X[4703]] failed to idle channel 0xcccc0000
[X[4703]]
   15:57:45 d chronyd[4711]: chronyd exiting

The 15:56 entries are boot time, 15:57 is shutdown time (instead of immediate X
server shutdown, it takes a few seconds and then spits out a call trace).

Hope this is helpful.

OBTW still 3.16.6-gentoo. I am unable to get a successful boot with
3.17.1-gentoo-r1 or 3.18-rc2. As in, not able to get a root login (console,
ssh) and nothing in journalctl -b -1.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1414535224.2AEbB1.12751--

--===============0937609024==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0937609024==--
