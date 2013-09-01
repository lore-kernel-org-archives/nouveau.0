From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67161] Blank video after resuming from S3 or S4
Date: Sun, 01 Sep 2013 18:08:17 +0000
Message-ID: <bug-67161-8800-JLfBy3dqKI@http.bugs.freedesktop.org/>
References: <bug-67161-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1699788469=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67161-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1699788469==
Content-Type: multipart/alternative; boundary="1378058897.83371.19761"; charset="us-ascii"


--1378058897.83371.19761
Date: Sun, 1 Sep 2013 18:08:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67161

--- Comment #5 from Mauro Molinari <mauromol-IWqWACnzNjyonA0d6jMUrA@public.gmane.org> ---
Hi Ilia, hi Martin,
I was finally able to test Fedora 19 with a live USB disk and these are the
results.

First of all, no need anymore to use nouveau.noaccel=1 to workaround bug 27211!

Secondly, pm-suspend and pm-hibernate work perfectly now and the system wakes
up correctly!

Well, I would say... great job guys, thank you!

Just a minor glitch that you might want to investigate. When I called
pm-hibernate, before the system switched off I saw an "invalid opcode" message
from nouveau. Here are the messages from nouveau in dmesg (I have the full
dmesg output if you need)

### boot (reporting only nouveau messages and alike)
[    5.177810] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x20044001
[    5.177825] nouveau  [  DEVICE][0000:01:00.0] Chipset: NV04 (NV04)
[    5.177832] nouveau  [  DEVICE][0000:01:00.0] Family : NV04
[    5.183968] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    5.208578] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    5.208588] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    5.208597] nouveau  [   VBIOS][0000:01:00.0] BMP version 1.1
[    5.208786] nouveau  [   VBIOS][0000:01:00.0] version 02.04.18.00.00
[    5.212288] nouveau W[   VBIOS][0000:01:00.0] DCB table not found
[    5.212421] nouveau W[   VBIOS][0000:01:00.0] DCB table not found
[    5.213846] nouveau W[   VBIOS][0000:01:00.0] DCB table not found
[    5.213861] nouveau W[   VBIOS][0000:01:00.0] DCB table not found
[    5.213896] nouveau E[   VBIOS][0000:01:00.0] 0x012e[ ]: unknown opcode 0x43
[    5.213993] nouveau W[  PTIMER][0000:01:00.0] unknown input clock freq
[    5.223816] nouveau  [     PFB][0000:01:00.0] RAM type: SDRAM
[    5.223833] nouveau  [     PFB][0000:01:00.0] RAM size: 16 MiB
[    5.223840] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    5.248437] agpgart-intel 0000:00:00.0: AGP 2.0 bridge
[    5.248473] agpgart-intel 0000:00:00.0: putting AGP V2 device into 2x mode
[    5.248502] nouveau 0000:01:00.0: putting AGP V2 device into 2x mode
[    5.251457] [TTM] Zone  kernel: Available graphics memory: 254344 kiB
[    5.251504] [TTM] Initializing pool allocator
[    5.252727] nouveau  [     DRM] VRAM: 15 MiB
[    5.252817] nouveau  [     DRM] GART: 64 MiB
[    5.252827] nouveau  [     DRM] BMP version 1.1
[    5.252836] nouveau W[     DRM] No DCB data found in VBIOS
[    5.324845] nouveau  [     DRM] Saving VGA fonts
[...]
[    5.389411] nouveau W[     DRM] No DCB data found in VBIOS
[    5.389553] nouveau W[   VBIOS][0000:01:00.0] DCB table not found
[    5.392762] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    5.392776] [drm] No driver support for vblank timestamp query.
[    5.394765] nouveau  [     DRM] 0 available performance level(s)
[    5.394783] nouveau  [     DRM] c: core 90MHz memory 110MHz
[    5.407293] nouveau  [     DRM] MM: using M2MF for buffer copies
[    5.439278] nouveau  [     DRM] allocated 1024x768 fb: 0x4000, bo dfa77600
[    5.440407] fbcon: nouveaufb (fb0) is primary device
[...]
[    5.520380] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    5.520384] nouveau 0000:01:00.0: registered panic notifier
[    5.523489] [drm] Initialized nouveau 1.1.0 20120801 for 0000:01:00.0 on
minor 0
[...]
[   99.820645] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[   99.820677] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[666]] subc 2 class
0x0042 mthd 0x0180 data 0x00003a04
[   99.820697] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[   99.820714] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[666]] subc 6 class
0x0044 mthd 0x0180 data 0x00003a04
[   99.820732] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[   99.820749] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[666]] subc 6 class
0x0043 mthd 0x0180 data 0x00003a04
[   99.821101] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[   99.821121] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[666]] subc 6 class
0x0019 mthd 0x0180 data 0x00003a04

### pm-suspend (S3) and subsequent wake up
[ 1105.988458] PM: Syncing filesystems ... done.
[ 1105.990175] PM: Preparing system for mem sleep
[ 1106.339546] Freezing user space processes ... (elapsed 0.01 seconds) done.
[ 1106.351178] Freezing remaining freezable tasks ... (elapsed 0.01 seconds)
done.
[ 1106.362124] PM: Entering mem sleep
[ 1106.362172] Suspending console(s) (use no_console_suspend to debug)
[ 1106.397752] sd 5:0:0:0: [sdg] Synchronizing SCSI cache
[ 1106.397932] sd 5:0:0:0: [sdg] Stopping disk
[ 1106.398150] sd 4:0:0:0: [sdf] Synchronizing SCSI cache
[ 1106.398317] sd 4:0:0:0: [sdf] Stopping disk
[ 1106.398389] sd 3:0:0:0: [sde] Synchronizing SCSI cache
[ 1106.398649] sd 3:0:0:0: [sde] Stopping disk
[ 1106.399775] sd 1:0:1:0: [sdc] Synchronizing SCSI cache
[ 1106.400138] sd 1:0:1:0: [sdc] Stopping disk
[ 1106.400237] sd 0:0:1:0: [sdb] Synchronizing SCSI cache
[ 1106.400415] sd 0:0:1:0: [sdb] Stopping disk
[ 1106.400685] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[ 1106.402582] nouveau  [     DRM] suspending fbcon...
[ 1106.402595] nouveau  [     DRM] suspending display...
[ 1106.402605] nouveau  [     DRM] unpinning framebuffer(s)...
[ 1106.402634] nouveau  [     DRM] evicting buffers...
[ 1106.404877] nouveau  [     DRM] suspending client object trees...
[ 1106.475152] sd 0:0:0:0: [sda] Stopping disk
[ 1107.615245] PM: suspend of devices complete after 1252.689 msecs
[ 1107.615648] PM: late suspend of devices complete after 0.395 msecs
[ 1107.615870] pci 0000:00:1e.0: System wakeup enabled by ACPI
[ 1107.626192] uhci_hcd 0000:00:1f.4: System wakeup enabled by ACPI
[ 1107.626290] uhci_hcd 0000:00:1f.2: System wakeup enabled by ACPI
[ 1107.626393] PM: noirq suspend of devices complete after 10.739 msecs
[ 1107.626580] ACPI: Preparing to enter system sleep state S3
[ 1107.632646] PM: Saving platform NVS memory
[ 1107.632664] Disabling non-boot CPUs ...
[ 1107.632664] ACPI: Low-level resume complete
[ 1107.632664] PM: Restoring platform NVS memory
[ 1107.632664] microcode: CPU0 sig=0x68a, pf=0x10, revision=0x1
[ 1107.632664] ACPI: Waking up from system sleep state S3
[ 1107.644616] uhci_hcd 0000:00:1f.2: System wakeup disabled by ACPI
[ 1107.644719] uhci_hcd 0000:00:1f.4: System wakeup disabled by ACPI
[ 1107.688297] PM: noirq resume of devices complete after 43.906 msecs
[ 1107.688537] PM: early resume of devices complete after 0.199 msecs
[ 1107.688719] pci 0000:00:1e.0: setting latency timer to 64
[ 1107.688740] ata_piix 0000:00:1f.1: setting latency timer to 64
[ 1107.688881] uhci_hcd 0000:00:1f.2: setting latency timer to 64
[ 1107.688908] usb usb1: root hub lost power or was reset
[ 1107.689100] uhci_hcd 0000:00:1f.4: setting latency timer to 64
[ 1107.689122] usb usb2: root hub lost power or was reset
[ 1107.689200] nouveau  [     DRM] re-enabling device...
[ 1107.689214] nouveau  [     DRM] resuming client object trees...
[ 1107.689236] nouveau  [   VBIOS][0000:01:00.0] running init tables
[ 1107.689244] nouveau E[   VBIOS][0000:01:00.0] 0x012e[0]: unknown opcode 0x43
[ 1107.689256] nouveau W[  PTIMER][0000:01:00.0] unknown input clock freq
[ 1107.694871] sata_sil 0000:02:0a.0: Applying R_ERR on DMA activate FIS errata
fix
[ 1107.695058] sata_sil 0000:02:0c.0: Applying R_ERR on DMA activate FIS errata
fix
[ 1107.695083] pci 0000:00:1e.0: System wakeup disabled by ACPI
[ 1107.699653] agpgart-intel 0000:00:00.0: AGP 2.0 bridge
[ 1107.699680] agpgart-intel 0000:00:00.0: putting AGP V2 device into 2x mode
[ 1107.699704] nouveau 0000:01:00.0: putting AGP V2 device into 2x mode
[ 1107.700186] nouveau  [     DRM] resuming display...
[ 1107.850360] ata1.01: ACPI cmd ef/03:45:00:00:00:b0 (SET FEATURES) filtered
out
[ 1107.850367] ata1.01: ACPI cmd ef/03:0c:00:00:00:b0 (SET FEATURES) filtered
out
[ 1107.853310] ata1.00: ACPI cmd ef/03:45:00:00:00:a0 (SET FEATURES) filtered
out
[ 1107.853317] ata1.00: ACPI cmd ef/03:0c:00:00:00:a0 (SET FEATURES) filtered
out
[ 1107.859356] ata1.00: configured for UDMA/100
[ 1107.865347] ata1.01: configured for UDMA/100
[ 1107.865550] sd 0:0:0:0: [sda] Starting disk
[ 1107.865647] sd 0:0:1:0: [sdb] Starting disk
[ 1107.868346] ata2.01: ACPI cmd ef/03:45:00:00:00:b0 (SET FEATURES) filtered
out
[ 1107.868353] ata2.01: ACPI cmd ef/03:0c:00:00:00:b0 (SET FEATURES) filtered
out
[ 1107.898316] ata2.00: ACPI cmd ef/03:42:00:00:00:a0 (SET FEATURES) filtered
out
[ 1107.898323] ata2.00: ACPI cmd ef/03:0c:00:00:00:a0 (SET FEATURES) filtered
out
[ 1107.901217] ata2.00: configured for UDMA/33
[ 1107.923567] ata2.01: configured for UDMA/100
[ 1107.959179] sd 1:0:1:0: [sdc] Starting disk
[ 1108.010045] usb 2-1: reset full-speed USB device number 2 using uhci_hcd
[ 1108.061057] ata3: SATA link up 1.5 Gbps (SStatus 113 SControl 310)
[ 1108.061217] ata5: SATA link up 1.5 Gbps (SStatus 113 SControl 310)
[ 1108.061370] ata4: SATA link up 1.5 Gbps (SStatus 113 SControl 310)
[ 1108.061513] ata6: SATA link down (SStatus 0 SControl 310)
[ 1108.067213] ata4.00: configured for UDMA/100
[ 1108.067339] sd 4:0:0:0: [sdf] Starting disk
[ 1108.141398] ata5.00: configured for UDMA/100
[ 1108.141502] sd 5:0:0:0: [sdg] Starting disk
[ 1108.235065] usb 1-1: reset full-speed USB device number 2 using uhci_hcd
[ 1108.841589] usb 1-1.1: reset low-speed USB device number 3 using uhci_hcd
[ 1108.942508] ata3.00: configured for UDMA/100
[ 1108.942619] sd 3:0:0:0: [sde] Starting disk
[ 1109.379918] usb 1-1.2: reset low-speed USB device number 4 using uhci_hcd
[ 1109.917221] usb 1-1.3: reset low-speed USB device number 5 using uhci_hcd
[ 1110.237460] PM: resume of devices complete after 2548.913 msecs
[ 1110.238281] PM: Finishing wakeup.
[ 1110.238287] Restarting tasks ... done.
[ 1110.403124] sd 2:0:0:0: [sdd] No Caching mode page present
[ 1110.403145] sd 2:0:0:0: [sdd] Assuming drive cache: write through
[ 1110.851671] r8169 0000:02:0e.0 enp2s14: link down
[ 1110.851707] r8169 0000:02:0e.0 enp2s14: link down
[ 1110.861115] IPv6: ADDRCONF(NETDEV_UP): enp2s14: link is not ready
[ 1113.663513] r8169 0000:02:0e.0 enp2s14: link up
[ 1113.663545] IPv6: ADDRCONF(NETDEV_CHANGE): enp2s14: link becomes ready
[ 1226.534609] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[ 1226.534644] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[2044]] subc 2 class
0x0042 mthd 0x0180 data 0x00003a04
[ 1226.534664] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[ 1226.534680] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[2044]] subc 6 class
0x0044 mthd 0x0180 data 0x00003a04
[ 1226.534699] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[ 1226.534716] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[2044]] subc 6 class
0x0043 mthd 0x0180 data 0x00003a04
[ 1226.535080] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[ 1226.535099] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[2044]] subc 6 class
0x0019 mthd 0x0180 data 0x00003a04

### pm-hibernate (S4) and subsequent wakeup
[ 1301.541575] PM: Marking nosave pages: [mem 0x0009e000-0x000fffff]
[ 1301.541591] PM: Basic memory bitmaps created
[ 1301.541596] PM: Syncing filesystems ... done.
[ 1301.547614] Freezing user space processes ... (elapsed 0.01 seconds) done.
[ 1301.559202] PM: Preallocating image memory... done (allocated 79784 pages)
[ 1302.485315] PM: Allocated 319136 kbytes in 0.92 seconds (346.88 MB/s)
[ 1302.485324] Freezing remaining freezable tasks ... (elapsed 0.01 seconds)
done.
[ 1302.496522] Suspending console(s) (use no_console_suspend to debug)
[ 1302.497946] nouveau  [     DRM] suspending fbcon...
[ 1302.497973] nouveau  [     DRM] suspending display...
[ 1302.497981] nouveau  [     DRM] unpinning framebuffer(s)...
[ 1302.498050] nouveau  [     DRM] evicting buffers...
[ 1302.502362] nouveau  [     DRM] suspending client object trees...
[ 1302.698339] PM: freeze of devices complete after 201.792 msecs
[ 1302.698766] PM: late freeze of devices complete after 0.420 msecs
[ 1302.699221] PM: noirq freeze of devices complete after 0.446 msecs
[ 1302.699488] ACPI: Preparing to enter system sleep state S4
[ 1302.705424] PM: Saving platform NVS memory
[ 1302.705444] Disabling non-boot CPUs ...
[ 1302.705554] PM: Creating hibernation image:
[ 1302.706004] PM: Need to copy 50494 pages
[ 1302.706004] PM: Normal pages needed: 50494 + 1024, available pages: 80443
[ 1302.706004] PM: Restoring platform NVS memory
[ 1302.706004] microcode: CPU0 sig=0x68a, pf=0x10, revision=0x1
[ 1302.706004] ACPI: Waking up from system sleep state S4
[ 1302.717718] PM: noirq restore of devices complete after 0.578 msecs
[ 1302.717946] PM: early restore of devices complete after 0.189 msecs
[ 1302.771620] pci 0000:00:1e.0: setting latency timer to 64
[ 1302.771645] ata_piix 0000:00:1f.1: setting latency timer to 64
[ 1302.771659] uhci_hcd 0000:00:1f.2: setting latency timer to 64
[ 1302.771685] usb usb1: root hub lost power or was reset
[ 1302.771887] uhci_hcd 0000:00:1f.4: setting latency timer to 64
[ 1302.771908] usb usb2: root hub lost power or was reset
[ 1302.771928] nouveau  [     DRM] re-enabling device...
[ 1302.771943] nouveau  [     DRM] resuming client object trees...
[ 1302.771967] nouveau  [   VBIOS][0000:01:00.0] running init tables
[ 1302.771975] nouveau E[   VBIOS][0000:01:00.0] 0x012e[0]: unknown opcode 0x43
[ 1302.771988] nouveau W[  PTIMER][0000:01:00.0] unknown input clock freq
[ 1302.782526] agpgart-intel 0000:00:00.0: AGP 2.0 bridge
[ 1302.782553] agpgart-intel 0000:00:00.0: putting AGP V2 device into 2x mode
[ 1302.782578] nouveau 0000:01:00.0: putting AGP V2 device into 2x mode
[ 1302.783067] nouveau  [     DRM] resuming display...
[ 1302.935338] ata1.01: ACPI cmd ef/03:45:00:00:00:b0 (SET FEATURES) filtered
out
[ 1302.935345] ata1.01: ACPI cmd ef/03:0c:00:00:00:b0 (SET FEATURES) filtered
out
[ 1302.946040] ata2.01: ACPI cmd ef/03:45:00:00:00:b0 (SET FEATURES) filtered
out
[ 1302.946047] ata2.01: ACPI cmd ef/03:0c:00:00:00:b0 (SET FEATURES) filtered
out
[ 1302.949309] ata2.00: ACPI cmd ef/03:42:00:00:00:a0 (SET FEATURES) filtered
out
[ 1302.949316] ata2.00: ACPI cmd ef/03:0c:00:00:00:a0 (SET FEATURES) filtered
out
[ 1302.949871] ata1.00: ACPI cmd ef/03:45:00:00:00:a0 (SET FEATURES) filtered
out
[ 1302.949878] ata1.00: ACPI cmd ef/03:0c:00:00:00:a0 (SET FEATURES) filtered
out
[ 1302.952183] ata2.00: configured for UDMA/33
[ 1302.956356] ata1.00: configured for UDMA/100
[ 1302.962339] ata1.01: configured for UDMA/100
[ 1302.962580] sd 0:0:0:0: [sda] Starting disk
[ 1302.962610] sd 0:0:1:0: [sdb] Starting disk
[ 1302.974573] ata2.01: configured for UDMA/100
[ 1302.974892] sd 1:0:1:0: [sdc] Starting disk
[ 1303.084065] ata5: SATA link up 1.5 Gbps (SStatus 113 SControl 310)
[ 1303.084174] ata6: SATA link down (SStatus 0 SControl 310)
[ 1303.099076] usb 1-1: reset full-speed USB device number 2 using uhci_hcd
[ 1303.101051] ata4: SATA link up 1.5 Gbps (SStatus 113 SControl 310)
[ 1303.101153] ata3: SATA link up 1.5 Gbps (SStatus 113 SControl 310)
[ 1303.108220] ata4.00: configured for UDMA/100
[ 1303.108410] sd 4:0:0:0: [sdf] Starting disk
[ 1303.108899] ata3.00: configured for UDMA/100
[ 1303.108997] sd 3:0:0:0: [sde] Starting disk
[ 1303.164409] ata5.00: configured for UDMA/100
[ 1303.164532] sd 5:0:0:0: [sdg] Starting disk
[ 1303.327081] usb 2-1: reset full-speed USB device number 2 using uhci_hcd
[ 1303.706828] usb 1-1.1: reset low-speed USB device number 3 using uhci_hcd
[ 1304.244615] usb 1-1.2: reset low-speed USB device number 4 using uhci_hcd
[ 1304.782389] usb 1-1.3: reset low-speed USB device number 5 using uhci_hcd
[ 1305.103483] PM: restore of devices complete after 2332.213 msecs
[ 1305.104253] PM: Image restored successfully.
[ 1305.104261] Restarting tasks ... done.
[ 1305.108183] PM: Basic memory bitmaps freed

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378058897.83371.19761
Date: Sun, 1 Sep 2013 18:08:17 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - Blank video after resuming from S3 or S4"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67161#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - Blank video after resuming from S3 or S4"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67161">bug 67161</a>
              from <span class="vcard"><a class="email" href="mailto:mauromol&#64;tiscali.it" title="Mauro Molinari &lt;mauromol&#64;tiscali.it&gt;"> <span class="fn">Mauro Molinari</span></a>
</span></b>
        <pre>Hi Ilia, hi Martin,
I was finally able to test Fedora 19 with a live USB disk and these are the
results.

First of all, no need anymore to use nouveau.noaccel=1 to workaround <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - endless PROTECTION_FAULT logs, Nouveau drm, TNT card"
   href="show_bug.cgi?id=27211">bug 27211</a>!

Secondly, pm-suspend and pm-hibernate work perfectly now and the system wakes
up correctly!

Well, I would say... great job guys, thank you!

Just a minor glitch that you might want to investigate. When I called
pm-hibernate, before the system switched off I saw an &quot;invalid opcode&quot; message
from nouveau. Here are the messages from nouveau in dmesg (I have the full
dmesg output if you need)

### boot (reporting only nouveau messages and alike)
[    5.177810] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x20044001
[    5.177825] nouveau  [  DEVICE][0000:01:00.0] Chipset: NV04 (NV04)
[    5.177832] nouveau  [  DEVICE][0000:01:00.0] Family : NV04
[    5.183968] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    5.208578] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    5.208588] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    5.208597] nouveau  [   VBIOS][0000:01:00.0] BMP version 1.1
[    5.208786] nouveau  [   VBIOS][0000:01:00.0] version 02.04.18.00.00
[    5.212288] nouveau W[   VBIOS][0000:01:00.0] DCB table not found
[    5.212421] nouveau W[   VBIOS][0000:01:00.0] DCB table not found
[    5.213846] nouveau W[   VBIOS][0000:01:00.0] DCB table not found
[    5.213861] nouveau W[   VBIOS][0000:01:00.0] DCB table not found
[    5.213896] nouveau E[   VBIOS][0000:01:00.0] 0x012e[ ]: unknown opcode 0x43
[    5.213993] nouveau W[  PTIMER][0000:01:00.0] unknown input clock freq
[    5.223816] nouveau  [     PFB][0000:01:00.0] RAM type: SDRAM
[    5.223833] nouveau  [     PFB][0000:01:00.0] RAM size: 16 MiB
[    5.223840] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    5.248437] agpgart-intel 0000:00:00.0: AGP 2.0 bridge
[    5.248473] agpgart-intel 0000:00:00.0: putting AGP V2 device into 2x mode
[    5.248502] nouveau 0000:01:00.0: putting AGP V2 device into 2x mode
[    5.251457] [TTM] Zone  kernel: Available graphics memory: 254344 kiB
[    5.251504] [TTM] Initializing pool allocator
[    5.252727] nouveau  [     DRM] VRAM: 15 MiB
[    5.252817] nouveau  [     DRM] GART: 64 MiB
[    5.252827] nouveau  [     DRM] BMP version 1.1
[    5.252836] nouveau W[     DRM] No DCB data found in VBIOS
[    5.324845] nouveau  [     DRM] Saving VGA fonts
[...]
[    5.389411] nouveau W[     DRM] No DCB data found in VBIOS
[    5.389553] nouveau W[   VBIOS][0000:01:00.0] DCB table not found
[    5.392762] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    5.392776] [drm] No driver support for vblank timestamp query.
[    5.394765] nouveau  [     DRM] 0 available performance level(s)
[    5.394783] nouveau  [     DRM] c: core 90MHz memory 110MHz
[    5.407293] nouveau  [     DRM] MM: using M2MF for buffer copies
[    5.439278] nouveau  [     DRM] allocated 1024x768 fb: 0x4000, bo dfa77600
[    5.440407] fbcon: nouveaufb (fb0) is primary device
[...]
[    5.520380] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    5.520384] nouveau 0000:01:00.0: registered panic notifier
[    5.523489] [drm] Initialized nouveau 1.1.0 20120801 for 0000:01:00.0 on
minor 0
[...]
[   99.820645] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[   99.820677] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[666]] subc 2 class
0x0042 mthd 0x0180 data 0x00003a04
[   99.820697] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[   99.820714] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[666]] subc 6 class
0x0044 mthd 0x0180 data 0x00003a04
[   99.820732] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[   99.820749] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[666]] subc 6 class
0x0043 mthd 0x0180 data 0x00003a04
[   99.821101] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[   99.821121] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[666]] subc 6 class
0x0019 mthd 0x0180 data 0x00003a04

### pm-suspend (S3) and subsequent wake up
[ 1105.988458] PM: Syncing filesystems ... done.
[ 1105.990175] PM: Preparing system for mem sleep
[ 1106.339546] Freezing user space processes ... (elapsed 0.01 seconds) done.
[ 1106.351178] Freezing remaining freezable tasks ... (elapsed 0.01 seconds)
done.
[ 1106.362124] PM: Entering mem sleep
[ 1106.362172] Suspending console(s) (use no_console_suspend to debug)
[ 1106.397752] sd 5:0:0:0: [sdg] Synchronizing SCSI cache
[ 1106.397932] sd 5:0:0:0: [sdg] Stopping disk
[ 1106.398150] sd 4:0:0:0: [sdf] Synchronizing SCSI cache
[ 1106.398317] sd 4:0:0:0: [sdf] Stopping disk
[ 1106.398389] sd 3:0:0:0: [sde] Synchronizing SCSI cache
[ 1106.398649] sd 3:0:0:0: [sde] Stopping disk
[ 1106.399775] sd 1:0:1:0: [sdc] Synchronizing SCSI cache
[ 1106.400138] sd 1:0:1:0: [sdc] Stopping disk
[ 1106.400237] sd 0:0:1:0: [sdb] Synchronizing SCSI cache
[ 1106.400415] sd 0:0:1:0: [sdb] Stopping disk
[ 1106.400685] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[ 1106.402582] nouveau  [     DRM] suspending fbcon...
[ 1106.402595] nouveau  [     DRM] suspending display...
[ 1106.402605] nouveau  [     DRM] unpinning framebuffer(s)...
[ 1106.402634] nouveau  [     DRM] evicting buffers...
[ 1106.404877] nouveau  [     DRM] suspending client object trees...
[ 1106.475152] sd 0:0:0:0: [sda] Stopping disk
[ 1107.615245] PM: suspend of devices complete after 1252.689 msecs
[ 1107.615648] PM: late suspend of devices complete after 0.395 msecs
[ 1107.615870] pci 0000:00:1e.0: System wakeup enabled by ACPI
[ 1107.626192] uhci_hcd 0000:00:1f.4: System wakeup enabled by ACPI
[ 1107.626290] uhci_hcd 0000:00:1f.2: System wakeup enabled by ACPI
[ 1107.626393] PM: noirq suspend of devices complete after 10.739 msecs
[ 1107.626580] ACPI: Preparing to enter system sleep state S3
[ 1107.632646] PM: Saving platform NVS memory
[ 1107.632664] Disabling non-boot CPUs ...
[ 1107.632664] ACPI: Low-level resume complete
[ 1107.632664] PM: Restoring platform NVS memory
[ 1107.632664] microcode: CPU0 sig=0x68a, pf=0x10, revision=0x1
[ 1107.632664] ACPI: Waking up from system sleep state S3
[ 1107.644616] uhci_hcd 0000:00:1f.2: System wakeup disabled by ACPI
[ 1107.644719] uhci_hcd 0000:00:1f.4: System wakeup disabled by ACPI
[ 1107.688297] PM: noirq resume of devices complete after 43.906 msecs
[ 1107.688537] PM: early resume of devices complete after 0.199 msecs
[ 1107.688719] pci 0000:00:1e.0: setting latency timer to 64
[ 1107.688740] ata_piix 0000:00:1f.1: setting latency timer to 64
[ 1107.688881] uhci_hcd 0000:00:1f.2: setting latency timer to 64
[ 1107.688908] usb usb1: root hub lost power or was reset
[ 1107.689100] uhci_hcd 0000:00:1f.4: setting latency timer to 64
[ 1107.689122] usb usb2: root hub lost power or was reset
[ 1107.689200] nouveau  [     DRM] re-enabling device...
[ 1107.689214] nouveau  [     DRM] resuming client object trees...
[ 1107.689236] nouveau  [   VBIOS][0000:01:00.0] running init tables
[ 1107.689244] nouveau E[   VBIOS][0000:01:00.0] 0x012e[0]: unknown opcode 0x43
[ 1107.689256] nouveau W[  PTIMER][0000:01:00.0] unknown input clock freq
[ 1107.694871] sata_sil 0000:02:0a.0: Applying R_ERR on DMA activate FIS errata
fix
[ 1107.695058] sata_sil 0000:02:0c.0: Applying R_ERR on DMA activate FIS errata
fix
[ 1107.695083] pci 0000:00:1e.0: System wakeup disabled by ACPI
[ 1107.699653] agpgart-intel 0000:00:00.0: AGP 2.0 bridge
[ 1107.699680] agpgart-intel 0000:00:00.0: putting AGP V2 device into 2x mode
[ 1107.699704] nouveau 0000:01:00.0: putting AGP V2 device into 2x mode
[ 1107.700186] nouveau  [     DRM] resuming display...
[ 1107.850360] ata1.01: ACPI cmd ef/03:45:00:00:00:b0 (SET FEATURES) filtered
out
[ 1107.850367] ata1.01: ACPI cmd ef/03:0c:00:00:00:b0 (SET FEATURES) filtered
out
[ 1107.853310] ata1.00: ACPI cmd ef/03:45:00:00:00:a0 (SET FEATURES) filtered
out
[ 1107.853317] ata1.00: ACPI cmd ef/03:0c:00:00:00:a0 (SET FEATURES) filtered
out
[ 1107.859356] ata1.00: configured for UDMA/100
[ 1107.865347] ata1.01: configured for UDMA/100
[ 1107.865550] sd 0:0:0:0: [sda] Starting disk
[ 1107.865647] sd 0:0:1:0: [sdb] Starting disk
[ 1107.868346] ata2.01: ACPI cmd ef/03:45:00:00:00:b0 (SET FEATURES) filtered
out
[ 1107.868353] ata2.01: ACPI cmd ef/03:0c:00:00:00:b0 (SET FEATURES) filtered
out
[ 1107.898316] ata2.00: ACPI cmd ef/03:42:00:00:00:a0 (SET FEATURES) filtered
out
[ 1107.898323] ata2.00: ACPI cmd ef/03:0c:00:00:00:a0 (SET FEATURES) filtered
out
[ 1107.901217] ata2.00: configured for UDMA/33
[ 1107.923567] ata2.01: configured for UDMA/100
[ 1107.959179] sd 1:0:1:0: [sdc] Starting disk
[ 1108.010045] usb 2-1: reset full-speed USB device number 2 using uhci_hcd
[ 1108.061057] ata3: SATA link up 1.5 Gbps (SStatus 113 SControl 310)
[ 1108.061217] ata5: SATA link up 1.5 Gbps (SStatus 113 SControl 310)
[ 1108.061370] ata4: SATA link up 1.5 Gbps (SStatus 113 SControl 310)
[ 1108.061513] ata6: SATA link down (SStatus 0 SControl 310)
[ 1108.067213] ata4.00: configured for UDMA/100
[ 1108.067339] sd 4:0:0:0: [sdf] Starting disk
[ 1108.141398] ata5.00: configured for UDMA/100
[ 1108.141502] sd 5:0:0:0: [sdg] Starting disk
[ 1108.235065] usb 1-1: reset full-speed USB device number 2 using uhci_hcd
[ 1108.841589] usb 1-1.1: reset low-speed USB device number 3 using uhci_hcd
[ 1108.942508] ata3.00: configured for UDMA/100
[ 1108.942619] sd 3:0:0:0: [sde] Starting disk
[ 1109.379918] usb 1-1.2: reset low-speed USB device number 4 using uhci_hcd
[ 1109.917221] usb 1-1.3: reset low-speed USB device number 5 using uhci_hcd
[ 1110.237460] PM: resume of devices complete after 2548.913 msecs
[ 1110.238281] PM: Finishing wakeup.
[ 1110.238287] Restarting tasks ... done.
[ 1110.403124] sd 2:0:0:0: [sdd] No Caching mode page present
[ 1110.403145] sd 2:0:0:0: [sdd] Assuming drive cache: write through
[ 1110.851671] r8169 0000:02:0e.0 enp2s14: link down
[ 1110.851707] r8169 0000:02:0e.0 enp2s14: link down
[ 1110.861115] IPv6: ADDRCONF(NETDEV_UP): enp2s14: link is not ready
[ 1113.663513] r8169 0000:02:0e.0 enp2s14: link up
[ 1113.663545] IPv6: ADDRCONF(NETDEV_CHANGE): enp2s14: link becomes ready
[ 1226.534609] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[ 1226.534644] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[2044]] subc 2 class
0x0042 mthd 0x0180 data 0x00003a04
[ 1226.534664] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[ 1226.534680] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[2044]] subc 6 class
0x0044 mthd 0x0180 data 0x00003a04
[ 1226.534699] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[ 1226.534716] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[2044]] subc 6 class
0x0043 mthd 0x0180 data 0x00003a04
[ 1226.535080] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[ 1226.535099] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[2044]] subc 6 class
0x0019 mthd 0x0180 data 0x00003a04

### pm-hibernate (S4) and subsequent wakeup
[ 1301.541575] PM: Marking nosave pages: [mem 0x0009e000-0x000fffff]
[ 1301.541591] PM: Basic memory bitmaps created
[ 1301.541596] PM: Syncing filesystems ... done.
[ 1301.547614] Freezing user space processes ... (elapsed 0.01 seconds) done.
[ 1301.559202] PM: Preallocating image memory... done (allocated 79784 pages)
[ 1302.485315] PM: Allocated 319136 kbytes in 0.92 seconds (346.88 MB/s)
[ 1302.485324] Freezing remaining freezable tasks ... (elapsed 0.01 seconds)
done.
[ 1302.496522] Suspending console(s) (use no_console_suspend to debug)
[ 1302.497946] nouveau  [     DRM] suspending fbcon...
[ 1302.497973] nouveau  [     DRM] suspending display...
[ 1302.497981] nouveau  [     DRM] unpinning framebuffer(s)...
[ 1302.498050] nouveau  [     DRM] evicting buffers...
[ 1302.502362] nouveau  [     DRM] suspending client object trees...
[ 1302.698339] PM: freeze of devices complete after 201.792 msecs
[ 1302.698766] PM: late freeze of devices complete after 0.420 msecs
[ 1302.699221] PM: noirq freeze of devices complete after 0.446 msecs
[ 1302.699488] ACPI: Preparing to enter system sleep state S4
[ 1302.705424] PM: Saving platform NVS memory
[ 1302.705444] Disabling non-boot CPUs ...
[ 1302.705554] PM: Creating hibernation image:
[ 1302.706004] PM: Need to copy 50494 pages
[ 1302.706004] PM: Normal pages needed: 50494 + 1024, available pages: 80443
[ 1302.706004] PM: Restoring platform NVS memory
[ 1302.706004] microcode: CPU0 sig=0x68a, pf=0x10, revision=0x1
[ 1302.706004] ACPI: Waking up from system sleep state S4
[ 1302.717718] PM: noirq restore of devices complete after 0.578 msecs
[ 1302.717946] PM: early restore of devices complete after 0.189 msecs
[ 1302.771620] pci 0000:00:1e.0: setting latency timer to 64
[ 1302.771645] ata_piix 0000:00:1f.1: setting latency timer to 64
[ 1302.771659] uhci_hcd 0000:00:1f.2: setting latency timer to 64
[ 1302.771685] usb usb1: root hub lost power or was reset
[ 1302.771887] uhci_hcd 0000:00:1f.4: setting latency timer to 64
[ 1302.771908] usb usb2: root hub lost power or was reset
[ 1302.771928] nouveau  [     DRM] re-enabling device...
[ 1302.771943] nouveau  [     DRM] resuming client object trees...
[ 1302.771967] nouveau  [   VBIOS][0000:01:00.0] running init tables
[ 1302.771975] nouveau E[   VBIOS][0000:01:00.0] 0x012e[0]: unknown opcode 0x43
[ 1302.771988] nouveau W[  PTIMER][0000:01:00.0] unknown input clock freq
[ 1302.782526] agpgart-intel 0000:00:00.0: AGP 2.0 bridge
[ 1302.782553] agpgart-intel 0000:00:00.0: putting AGP V2 device into 2x mode
[ 1302.782578] nouveau 0000:01:00.0: putting AGP V2 device into 2x mode
[ 1302.783067] nouveau  [     DRM] resuming display...
[ 1302.935338] ata1.01: ACPI cmd ef/03:45:00:00:00:b0 (SET FEATURES) filtered
out
[ 1302.935345] ata1.01: ACPI cmd ef/03:0c:00:00:00:b0 (SET FEATURES) filtered
out
[ 1302.946040] ata2.01: ACPI cmd ef/03:45:00:00:00:b0 (SET FEATURES) filtered
out
[ 1302.946047] ata2.01: ACPI cmd ef/03:0c:00:00:00:b0 (SET FEATURES) filtered
out
[ 1302.949309] ata2.00: ACPI cmd ef/03:42:00:00:00:a0 (SET FEATURES) filtered
out
[ 1302.949316] ata2.00: ACPI cmd ef/03:0c:00:00:00:a0 (SET FEATURES) filtered
out
[ 1302.949871] ata1.00: ACPI cmd ef/03:45:00:00:00:a0 (SET FEATURES) filtered
out
[ 1302.949878] ata1.00: ACPI cmd ef/03:0c:00:00:00:a0 (SET FEATURES) filtered
out
[ 1302.952183] ata2.00: configured for UDMA/33
[ 1302.956356] ata1.00: configured for UDMA/100
[ 1302.962339] ata1.01: configured for UDMA/100
[ 1302.962580] sd 0:0:0:0: [sda] Starting disk
[ 1302.962610] sd 0:0:1:0: [sdb] Starting disk
[ 1302.974573] ata2.01: configured for UDMA/100
[ 1302.974892] sd 1:0:1:0: [sdc] Starting disk
[ 1303.084065] ata5: SATA link up 1.5 Gbps (SStatus 113 SControl 310)
[ 1303.084174] ata6: SATA link down (SStatus 0 SControl 310)
[ 1303.099076] usb 1-1: reset full-speed USB device number 2 using uhci_hcd
[ 1303.101051] ata4: SATA link up 1.5 Gbps (SStatus 113 SControl 310)
[ 1303.101153] ata3: SATA link up 1.5 Gbps (SStatus 113 SControl 310)
[ 1303.108220] ata4.00: configured for UDMA/100
[ 1303.108410] sd 4:0:0:0: [sdf] Starting disk
[ 1303.108899] ata3.00: configured for UDMA/100
[ 1303.108997] sd 3:0:0:0: [sde] Starting disk
[ 1303.164409] ata5.00: configured for UDMA/100
[ 1303.164532] sd 5:0:0:0: [sdg] Starting disk
[ 1303.327081] usb 2-1: reset full-speed USB device number 2 using uhci_hcd
[ 1303.706828] usb 1-1.1: reset low-speed USB device number 3 using uhci_hcd
[ 1304.244615] usb 1-1.2: reset low-speed USB device number 4 using uhci_hcd
[ 1304.782389] usb 1-1.3: reset low-speed USB device number 5 using uhci_hcd
[ 1305.103483] PM: restore of devices complete after 2332.213 msecs
[ 1305.104253] PM: Image restored successfully.
[ 1305.104261] Restarting tasks ... done.
[ 1305.108183] PM: Basic memory bitmaps freed</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378058897.83371.19761--

--===============1699788469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1699788469==--
