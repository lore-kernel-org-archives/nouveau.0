From: Phil Turmel <philip-xiX+HWoRdKcdnm+yROfE0A@public.gmane.org>
Subject: HP Zbook17 Dock and UEFI conflict with GK107GLM aka
	Quadro K1100M
Date: Wed, 1 Feb 2017 10:40:51 -0500
Message-ID: <59c98c36-0245-8e49-98e3-e22395b7f682@turmel.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------7C34C448FF9CC38698F4EF74"
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
To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--------------7C34C448FF9CC38698F4EF74
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi All,

I've been running Gentoo on a ZBook with great success for a couple years,
but I've been stymied in my attempts to implement SecureBoot by an
apparent problem with efifb to nouveaufb handoff, but only when external
monitors are attached.  The handoff works without issue when the BIOS is
in Mixed EFI mode, with and without external monitors, and
works in Native EFI mode without external monitors.

Diffing dmesg from working (mixed) to nonworking (native), I find
numerous lines like the following immediately after handoff:

+nouveau 0000:01:00.0: disp: Base 2:
+nouveau 0000:01:00.0: disp: ^I0080: 00000000              
+nouveau 0000:01:00.0: disp: ^I0084: 00000000 -> 00000010
+nouveau 0000:01:00.0: disp: ^I0088: 00000000 -> 00000200
+nouveau 0000:01:00.0: disp: ^I008c: 00000000              
+nouveau 0000:01:00.0: disp: ^I0090: 00000000 -> 00000001
+nouveau 0000:01:00.0: disp: ^I0094: 00000000 -> f0000000
+nouveau 0000:01:00.0: disp: ^I00a0: 00000000              

None of these show up in any of the working configurations. In non-working
mode, all three displays (laptop + 2 external) are black and I've found no
intervention that will revive them.

One other notable difference that shows up is the BIOS initial video mode
is different in native EFI mode:

@@ -374,11 +379,11 @@
 pciehp: PCI Express Hot Plug Controller Driver version: 0.4
 nvidiafb: Device ID: 10de0ff6 
 efifb: probing for efifb
-efifb: framebuffer at 0x81000000, using 3072k, total 3072k
-efifb: mode is 1024x768x32, linelength=4096, pages=1
+efifb: framebuffer at 0x70000000, using 8100k, total 8100k
+efifb: mode is 1920x1080x32, linelength=7680, pages=1
 efifb: scrolling: redraw
 efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
-Console: switching to colour frame buffer device 128x48
+Console: switching to colour frame buffer device 240x67
 fb0: EFI VGA frame buffer device
 ACPI: AC Adapter [AC] (on-line)
 input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input0

No functional difference was observed after upgrading the BIOS to v1.36,
which was released in November 2016.

One more data point:  There's no problem if the monitors are unplugged from
the dock and the laptop rebooted.  The monitors may be added any time after
boot without any problem.  There is also no problem if the laptop is
put to sleep with no external monitors and then resumed in the dock with
them.

Boot messages for the different cases were collected and the following script
used to prune them for nice diffs:

#! /bin/bash
for x in *.log; do
 egrep -v '((usb|hub) [0-9]+-[0-9]+|raid[0-9]+|Thermal|Battery|Bluetooth|ata[0-9]+|scsi [0-9]+|dracut:|udevd|snd_hda|br[0-9]+|random|sd [0-9]+:)' $x \
 |cut -c16- > ${x%%.log}.boot
done

diff -U3 bios34-uefi-mixed-20170131-1038.boot uefi-mixed-docked-20170131-1211.boot >bios34-36-mixed.diff
diff -U3 bios34-uefi-native-20170131-1034.boot uefi-native-docked-20170131-1209.boot >bios34-36-native.diff
diff -U3 bios34-uefi-mixed-20170131-1038.boot bios34-uefi-native-20170131-1034.boot >bios34-mixed-native.diff
diff -U3 uefi-mixed-undocked-20170131-1226.boot uefi-mixed-docked-20170131-1211.boot >bios36-mixed-undocked-docked.diff
diff -U3 uefi-native-undocked-20170131-1223.boot uefi-native-docked-20170131-1209.boot >bios36-native-undocked-docked.diff 
diff -U3 uefi-mixed-undocked-20170131-1226.boot uefi-native-undocked-20170131-1223.boot >bios36-undocked-mixed-native.diff
diff -U3 uefi-mixed-docked-20170131-1211.boot uefi-native-docked-20170131-1209.boot >bios36-docked-mixed-native.diff 
#

This script, the raw and filtered logs, the diffs, and kernel config and
machine data have all been posted on my personal server:

http://www.turmel.org/lists/nouveau/

The docked diff from mixed to native that shows the problem is attached.

The kernel is self-compiled and assembled with its initramfs into
a direct-bootable EFI file, following the general instructions on
Greg Kroah-Hartman's blog:

http://kroah.com/log/blog/2013/09/02/booting-a-self-signed-linux-kernel/

My intent is to complete those instructions with my own signed kernel after
I can reliably use SecureBoot in my office.

I will also be attempting newer kernels, but I haven't noticed anything recent
that would impact this.  Of course, if I knew how the driver worked, I wouldn't
be asking for help. (-:

Any suggestions for config or debugging options that might help here?  Or
debugging information you might like that would help?

Phil Turmel

--------------7C34C448FF9CC38698F4EF74
Content-Type: text/x-patch;
 name="bios36-docked-mixed-native.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="bios36-docked-mixed-native.diff"

--- uefi-mixed-docked-20170131-1211.boot	2017-01-31 13:36:40.260102387 -0500
+++ uefi-native-docked-20170131-1209.boot	2017-01-31 13:36:40.290102387 -0500
@@ -9,8 +9,8 @@
 e820: BIOS-provided physical RAM map:
 BIOS-e820: [mem 0x0000000000000000-0x0000000000057fff] usable
 BIOS-e820: [mem 0x0000000000058000-0x0000000000058fff] reserved
-BIOS-e820: [mem 0x0000000000059000-0x0000000000097fff] usable
-BIOS-e820: [mem 0x0000000000098000-0x000000000009ffff] reserved
+BIOS-e820: [mem 0x0000000000059000-0x000000000009cfff] usable
+BIOS-e820: [mem 0x000000000009d000-0x000000000009ffff] reserved
 BIOS-e820: [mem 0x0000000000100000-0x000000005db7efff] usable
 BIOS-e820: [mem 0x000000005db7f000-0x000000005ee7efff] reserved
 BIOS-e820: [mem 0x000000005ee7f000-0x000000005ef7efff] ACPI NVS
@@ -24,11 +24,13 @@
 extended physical RAM map:
 reserve setup_data: [mem 0x0000000000000000-0x0000000000057fff] usable
 reserve setup_data: [mem 0x0000000000058000-0x0000000000058fff] reserved
-reserve setup_data: [mem 0x0000000000059000-0x0000000000097fff] usable
-reserve setup_data: [mem 0x0000000000098000-0x000000000009ffff] reserved
-reserve setup_data: [mem 0x0000000000100000-0x0000000052bde017] usable
-reserve setup_data: [mem 0x0000000052bde018-0x0000000052bf6657] usable
-reserve setup_data: [mem 0x0000000052bf6658-0x000000005db7efff] usable
+reserve setup_data: [mem 0x0000000000059000-0x000000000009cfff] usable
+reserve setup_data: [mem 0x000000000009d000-0x000000000009ffff] reserved
+reserve setup_data: [mem 0x0000000000100000-0x0000000052a68017] usable
+reserve setup_data: [mem 0x0000000052a68018-0x0000000052a71257] usable
+reserve setup_data: [mem 0x0000000052a71258-0x0000000052a72017] usable
+reserve setup_data: [mem 0x0000000052a72018-0x0000000052a8a657] usable
+reserve setup_data: [mem 0x0000000052a8a658-0x000000005db7efff] usable
 reserve setup_data: [mem 0x000000005db7f000-0x000000005ee7efff] reserved
 reserve setup_data: [mem 0x000000005ee7f000-0x000000005ef7efff] ACPI NVS
 reserve setup_data: [mem 0x000000005ef7f000-0x000000005effefff] ACPI data
@@ -38,7 +40,7 @@
 reserve setup_data: [mem 0x00000000ff810000-0x00000000ff82efff] reserved
 reserve setup_data: [mem 0x0000000100000000-0x000000089dffffff] usable
 efi: EFI v2.31 by HPQ
-efi:  ACPI=0x5effe000  ACPI 2.0=0x5effe014  SMBIOS=0x5e333198 
+efi:  ACPI=0x5effe000  ACPI 2.0=0x5effe014  SMBIOS=0x5e333298 
 SMBIOS 2.7 present.
 e820: last_pfn = 0x89e000 max_arch_pfn = 0x400000000
 x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WC  UC- WT  
@@ -78,7 +80,7 @@
 Movable zone start for each node
 Early memory node ranges
   node   0: [mem 0x0000000000001000-0x0000000000057fff]
-  node   0: [mem 0x0000000000059000-0x0000000000097fff]
+  node   0: [mem 0x0000000000059000-0x000000000009cfff]
   node   0: [mem 0x0000000000100000-0x000000005db7efff]
   node   0: [mem 0x000000005efff000-0x000000005effffff]
   node   0: [mem 0x0000000100000000-0x000000089dffffff]
@@ -100,10 +102,12 @@
 smpboot: Allowing 8 CPUs, 0 hotplug CPUs
 PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
 PM: Registered nosave memory: [mem 0x00058000-0x00058fff]
-PM: Registered nosave memory: [mem 0x00098000-0x0009ffff]
+PM: Registered nosave memory: [mem 0x0009d000-0x0009ffff]
 PM: Registered nosave memory: [mem 0x000a0000-0x000fffff]
-PM: Registered nosave memory: [mem 0x52bde000-0x52bdefff]
-PM: Registered nosave memory: [mem 0x52bf6000-0x52bf6fff]
+PM: Registered nosave memory: [mem 0x52a68000-0x52a68fff]
+PM: Registered nosave memory: [mem 0x52a71000-0x52a71fff]
+PM: Registered nosave memory: [mem 0x52a72000-0x52a72fff]
+PM: Registered nosave memory: [mem 0x52a8a000-0x52a8afff]
 PM: Registered nosave memory: [mem 0x5db7f000-0x5ee7efff]
 PM: Registered nosave memory: [mem 0x5ee7f000-0x5ef7efff]
 PM: Registered nosave memory: [mem 0x5ef7f000-0x5effefff]
@@ -118,11 +122,11 @@
 clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370452778343963 ns
 setup_percpu: NR_CPUS:64 nr_cpumask_bits:64 nr_cpu_ids:8 nr_node_ids:1
 percpu: Embedded 35 pages/cpu @ffff88089dc00000 s102744 r8192 d32424 u262144
-Built 1 zonelists in Node order, mobility grouping on.  Total pages: 8239096
+Built 1 zonelists in Node order, mobility grouping on.  Total pages: 8240152
 Policy zone: Normal
 Kernel command line: usbcore.autosuspend=-1 rd.auto rd.shell root=/dev/vg0/Root acpi_backlight=vendor 
 PID hash table entries: 4096 (order: 3, 32768 bytes)
-Memory: 32713968K/33483864K available (21006K kernel code, 2971K rwdata, 9600K rodata, 18220K init, 1212K bss, 769896K reserved, 0K cma-reserved)
+Memory: 32709156K/33483884K available (21006K kernel code, 2971K rwdata, 9600K rodata, 18220K init, 1212K bss, 774728K reserved, 0K cma-reserved)
 Preemptible hierarchical RCU implementation.
 ^IRCU debugfs-based tracing is enabled.
 ^IBuild-time adjustment of leaf fanout to 64.
@@ -133,8 +137,8 @@
 console [tty0] enabled
 clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 133484882848 ns
 tsc: Fast TSC calibration using PIT
-tsc: Detected 2693.832 MHz processor
-Calibrating delay loop (skipped), value calculated using timer frequency.. 5389.15 BogoMIPS (lpj=8979440)
+tsc: Detected 2693.820 MHz processor
+Calibrating delay loop (skipped), value calculated using timer frequency.. 5389.12 BogoMIPS (lpj=8979400)
 pid_max: default: 32768 minimum: 301
 ACPI: Core revision 20160422
 ACPI: 8 ACPI AML tables successfully acquired and loaded
@@ -169,12 +173,12 @@
 x86: Booting SMP configuration:
 .... node  #0, CPUs:      #1 #2 #3 #4 #5 #6 #7
 x86: Booted up 1 node, 8 CPUs
-smpboot: Total of 8 processors activated (43127.83 BogoMIPS)
+smpboot: Total of 8 processors activated (43127.67 BogoMIPS)
 devtmpfs: initialized
 PM: Registering ACPI NVS region [mem 0x5ee7f000-0x5ef7efff] (1048576 bytes)
 clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370867519511994 ns
 xor: automatically using best checksumming function:
-   avx       : 37881.600 MB/sec
+   avx       : 37875.600 MB/sec
 pinctrl core: initialized pinctrl subsystem
 NET: Registered protocol family 16
 cpuidle: using governor ladder
@@ -194,11 +198,11 @@
 ACPI: Added _OSI(Processor Aggregator Device)
 ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
 ACPI: Dynamic OEM Table Load:
-ACPI: SSDT 0xFFFF880879514000 0003F3 (v01 PmRef  Cpu0Cst  00003001 INTL 20110112)
+ACPI: SSDT 0xFFFF880878673400 0003F3 (v01 PmRef  Cpu0Cst  00003001 INTL 20110112)
 ACPI: Dynamic OEM Table Load:
-ACPI: SSDT 0xFFFF8808796AF800 0005DB (v01 PmRef  ApIst    00003000 INTL 20110112)
+ACPI: SSDT 0xFFFF880878E76000 0005DB (v01 PmRef  ApIst    00003000 INTL 20110112)
 ACPI: Dynamic OEM Table Load:
-ACPI: SSDT 0xFFFF880878E82A00 000119 (v01 PmRef  ApCst    00003000 INTL 20110112)
+ACPI: SSDT 0xFFFF88087867E600 000119 (v01 PmRef  ApCst    00003000 INTL 20110112)
 ACPI : EC: EC started
 ACPI: Interpreter enabled
 ACPI: (supports S0 S3 S4 S5)
@@ -236,7 +240,7 @@
 pci 0000:00:1c.4: PCI bridge to [bus 3b-5b]
 pci 0000:00:1c.6: PCI bridge to [bus 5c]
 pci 0000:00:1c.7: PCI bridge to [bus 5d]
-ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 *10 11 12 14 15)
+ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 10 11 12 14 15) *0, disabled.
 ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 10 11 12 14 15) *0, disabled.
 ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 10 11 12 14 15) *0, disabled.
 ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 10 11 12 14 15) *0, disabled.
@@ -331,6 +335,7 @@
 RPC: Registered tcp transport module.
 RPC: Registered tcp NFSv4.1 backchannel transport module.
 pci 0000:00:14.0: enabling device (0000 -> 0002)
+pci 0000:00:14.0: xHCI BIOS handoff failed (BIOS bug ?) 00010001
 pci 0000:01:00.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
 PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
 software IO TLB [mem 0x4db80000-0x51b80000] (64MB) mapped at [ffff88004db80000-ffff880051b7ffff]
@@ -374,11 +379,11 @@
 pciehp: PCI Express Hot Plug Controller Driver version: 0.4
 nvidiafb: Device ID: 10de0ff6 
 efifb: probing for efifb
-efifb: framebuffer at 0x81000000, using 3072k, total 3072k
-efifb: mode is 1024x768x32, linelength=4096, pages=1
+efifb: framebuffer at 0x70000000, using 8100k, total 8100k
+efifb: mode is 1920x1080x32, linelength=7680, pages=1
 efifb: scrolling: redraw
 efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
-Console: switching to colour frame buffer device 128x48
+Console: switching to colour frame buffer device 240x67
 fb0: EFI VGA frame buffer device
 ACPI: AC Adapter [AC] (on-line)
 input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input0
@@ -418,7 +423,7 @@
 fb: switching to nouveaufb from EFI VGA
 Console: switching to colour dummy device 120x50
 ACPI Warning: \_SB.PCI0.PEGP.DGFX._DSM: Argument #4 type mismatch - Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
-[TTM] Zone  kernel: Available graphics memory: 16418410 kiB
+[TTM] Zone  kernel: Available graphics memory: 16418400 kiB
 [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
 [TTM] Initializing pool allocator
 [TTM] Initializing DMA pool allocator
@@ -445,10 +450,119 @@
 [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
 [drm] Driver supports precise vblank timestamp query.
 nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
-nouveau 0000:01:00.0: DRM: allocated 1920x1080 fb: 0x60000, bo ffff8808756a2800
+nouveau 0000:01:00.0: DRM: allocated 1920x1080 fb: 0x60000, bo ffff880878b60400
 fbcon: nouveaufb (fb0) is primary device
-tsc: Refined TSC clocksource calibration: 2693.759 MHz
-clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x26d436eef2b, max_idle_ns: 440795316752 ns
+tsc: Refined TSC clocksource calibration: 2693.763 MHz
+clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x26d43a9d412, max_idle_ns: 440795318185 ns
+clocksource: Switched to clocksource tsc
+nouveau 0000:01:00.0: disp: Base 2:
+nouveau 0000:01:00.0: disp: ^I0080: 00000000              
+nouveau 0000:01:00.0: disp: ^I0084: 00000000 -> 00000010
+nouveau 0000:01:00.0: disp: ^I0088: 00000000 -> 00000200
+nouveau 0000:01:00.0: disp: ^I008c: 00000000              
+nouveau 0000:01:00.0: disp: ^I0090: 00000000 -> 00000001
+nouveau 0000:01:00.0: disp: ^I0094: 00000000 -> f0000000
+nouveau 0000:01:00.0: disp: ^I00a0: 00000000              
+nouveau 0000:01:00.0: disp: ^I00a4: 00000000              
+nouveau 0000:01:00.0: disp: ^I00c0: 00000000 -> ffff0000
+nouveau 0000:01:00.0: disp: ^I00c4: 00000000              
+nouveau 0000:01:00.0: disp: ^I00c8: 00000000              
+nouveau 0000:01:00.0: disp: ^I00cc: 00000000              
+nouveau 0000:01:00.0: disp: ^I00e0: 00000000 -> 40000000
+nouveau 0000:01:00.0: disp: ^I00e4: 00000000              
+nouveau 0000:01:00.0: disp: ^I00e8: 00000000              
+nouveau 0000:01:00.0: disp: ^I00ec: 00000000              
+nouveau 0000:01:00.0: disp: ^I00fc: 00000000              
+nouveau 0000:01:00.0: disp: ^I0100: fffe0000              
+nouveau 0000:01:00.0: disp: ^I0104: 00000000              
+nouveau 0000:01:00.0: disp: ^I0108: 18131813              
+nouveau 0000:01:00.0: disp: ^I010c: f0000000              
+nouveau 0000:01:00.0: disp: ^I0110: 00000000              
+nouveau 0000:01:00.0: disp: ^I0114: 00000000              
+nouveau 0000:01:00.0: disp: ^I0118: 00000000              
+nouveau 0000:01:00.0: disp: ^I011c: 00000000              
+nouveau 0000:01:00.0: disp: ^I0130: 00000000              
+nouveau 0000:01:00.0: disp: ^I0134: 00000000              
+nouveau 0000:01:00.0: disp: ^I0138: 00000000              
+nouveau 0000:01:00.0: disp: ^I013c: 00000000              
+nouveau 0000:01:00.0: disp: ^I0140: 00010000              
+nouveau 0000:01:00.0: disp: ^I0144: 00000000              
+nouveau 0000:01:00.0: disp: ^I0148: 00000000              
+nouveau 0000:01:00.0: disp: ^I014c: 00000000              
+nouveau 0000:01:00.0: disp: ^I0150: 00000000              
+nouveau 0000:01:00.0: disp: ^I0154: 00010000              
+nouveau 0000:01:00.0: disp: ^I0158: 00000000              
+nouveau 0000:01:00.0: disp: ^I015c: 00000000              
+nouveau 0000:01:00.0: disp: ^I0160: 00000000              
+nouveau 0000:01:00.0: disp: ^I0164: 00000000              
+nouveau 0000:01:00.0: disp: ^I0168: 00010000              
+nouveau 0000:01:00.0: disp: ^I016c: 00000000              
+nouveau 0000:01:00.0: disp: Base 2 - Image 0:
+nouveau 0000:01:00.0: disp: ^I0400: 00000000 -> 00000600
+nouveau 0000:01:00.0: disp: ^I0404: 00000000              
+nouveau 0000:01:00.0: disp: ^I0408: 00000000 -> 04380780
+nouveau 0000:01:00.0: disp: ^I040c: 00000000 -> 01001e00
+nouveau 0000:01:00.0: disp: ^I0410: 0000e900 -> 0000cf00
+nouveau 0000:01:00.0: disp: Base 2 - Image 1:
+nouveau 0000:01:00.0: disp: ^I0420: 00000000              
+nouveau 0000:01:00.0: disp: ^I0424: 00000000              
+nouveau 0000:01:00.0: disp: ^I0428: 00000000              
+nouveau 0000:01:00.0: disp: ^I042c: 00000000              
+nouveau 0000:01:00.0: disp: ^I0430: 0000e900              
+nouveau 0000:01:00.0: disp: Base 3:
+nouveau 0000:01:00.0: disp: ^I0080: 00000000              
+nouveau 0000:01:00.0: disp: ^I0084: 00000000 -> 00000010
+nouveau 0000:01:00.0: disp: ^I0088: 00000000 -> 00000300
+nouveau 0000:01:00.0: disp: ^I008c: 00000000              
+nouveau 0000:01:00.0: disp: ^I0090: 00000000 -> 00000001
+nouveau 0000:01:00.0: disp: ^I0094: 00000000 -> f0000000
+nouveau 0000:01:00.0: disp: ^I00a0: 00000000              
+nouveau 0000:01:00.0: disp: ^I00a4: 00000000              
+nouveau 0000:01:00.0: disp: ^I00c0: 00000000 -> ffff0000
+nouveau 0000:01:00.0: disp: ^I00c4: 00000000              
+nouveau 0000:01:00.0: disp: ^I00c8: 00000000              
+nouveau 0000:01:00.0: disp: ^I00cc: 00000000              
+nouveau 0000:01:00.0: disp: ^I00e0: 00000000 -> 40000000
+nouveau 0000:01:00.0: disp: ^I00e4: 00000000              
+nouveau 0000:01:00.0: disp: ^I00e8: 00000000              
+nouveau 0000:01:00.0: disp: ^I00ec: 00000000              
+nouveau 0000:01:00.0: disp: ^I00fc: 00000000              
+nouveau 0000:01:00.0: disp: ^I0100: fffe0000              
+nouveau 0000:01:00.0: disp: ^I0104: 00000000              
+nouveau 0000:01:00.0: disp: ^I0108: 18131813              
+nouveau 0000:01:00.0: disp: ^I010c: f0000000              
+nouveau 0000:01:00.0: disp: ^I0110: 00000000              
+nouveau 0000:01:00.0: disp: ^I0114: 00000000              
+nouveau 0000:01:00.0: disp: ^I0118: 00000000              
+nouveau 0000:01:00.0: disp: ^I011c: 00000000              
+nouveau 0000:01:00.0: disp: ^I0130: 00000000              
+nouveau 0000:01:00.0: disp: ^I0134: 00000000              
+nouveau 0000:01:00.0: disp: ^I0138: 00000000              
+nouveau 0000:01:00.0: disp: ^I013c: 00000000              
+nouveau 0000:01:00.0: disp: ^I0140: 00010000              
+nouveau 0000:01:00.0: disp: ^I0144: 00000000              
+nouveau 0000:01:00.0: disp: ^I0148: 00000000              
+nouveau 0000:01:00.0: disp: ^I014c: 00000000              
+nouveau 0000:01:00.0: disp: ^I0150: 00000000              
+nouveau 0000:01:00.0: disp: ^I0154: 00010000              
+nouveau 0000:01:00.0: disp: ^I0158: 00000000              
+nouveau 0000:01:00.0: disp: ^I015c: 00000000              
+nouveau 0000:01:00.0: disp: ^I0160: 00000000              
+nouveau 0000:01:00.0: disp: ^I0164: 00000000              
+nouveau 0000:01:00.0: disp: ^I0168: 00010000              
+nouveau 0000:01:00.0: disp: ^I016c: 00000000              
+nouveau 0000:01:00.0: disp: Base 3 - Image 0:
+nouveau 0000:01:00.0: disp: ^I0400: 00000000 -> 00000600
+nouveau 0000:01:00.0: disp: ^I0404: 00000000              
+nouveau 0000:01:00.0: disp: ^I0408: 00000000 -> 04380780
+nouveau 0000:01:00.0: disp: ^I040c: 00000000 -> 01001e00
+nouveau 0000:01:00.0: disp: ^I0410: 0000e900 -> 0000cf00
+nouveau 0000:01:00.0: disp: Base 3 - Image 1:
+nouveau 0000:01:00.0: disp: ^I0420: 00000000              
+nouveau 0000:01:00.0: disp: ^I0424: 00000000              
+nouveau 0000:01:00.0: disp: ^I0428: 00000000              
+nouveau 0000:01:00.0: disp: ^I042c: 00000000              
+nouveau 0000:01:00.0: disp: ^I0430: 0000e900              
 Console: switching to colour frame buffer device 240x67
 nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
 [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 1
@@ -583,11 +697,10 @@
 usbcore: registered new interface driver usbhid
 usbhid: USB HID core driver
 hp_accel: laptop model unknown, using default axes configuration
-clocksource: Switched to clocksource tsc
+lis3lv02d: 8 bits 3DC sensor found
 sr 1:0:0:0: [sr0] scsi3-mmc drive: 24x/24x writer dvd-ram cd/rw xa/form2 cdda tray
 cdrom: Uniform CD-ROM driver Revision: 3.20
 sr 1:0:0:0: Attached scsi generic sg1 type 5
-lis3lv02d: 8 bits 3DC sensor found
 input: PS/2 Generic Mouse as /devices/platform/i8042/serio2/input/input10
 input: ST LIS3LV02DL Accelerometer as /devices/platform/lis3lv02d/input/input12
 Initializing HPQ6001 module
@@ -650,7 +763,7 @@
 Key type encrypted registered
 console [netcon0] enabled
 netconsole: network logging started
-rtc_cmos 00:04: setting system clock to 2017-01-31 17:10:57 UTC (1485882657)
+rtc_cmos 00:04: setting system clock to 2017-01-31 17:08:52 UTC (1485882532)
 input: HDA Digital PCBeep as /devices/pci0000:00/0000:00:1b.0/sound/card0/input15
 input: HDA Intel PCH Mic as /devices/pci0000:00/0000:00:1b.0/sound/card0/input16
 input: HDA Intel PCH Line as /devices/pci0000:00/0000:00:1b.0/sound/card0/input17
@@ -671,8 +784,8 @@
 Freeing unused kernel memory: 1488K (ffff88000248c000 - ffff880002600000)
 Freeing unused kernel memory: 640K (ffff880002f60000 - ffff880003000000)
 input: Logitech USB Receiver as /devices/pci0000:00/0000:00:14.0/usb3/3-6/3-6:1.0/0003:046D:C52F.0001/input/input24
-hid-generic 0003:046D:C52F.0001: input,hidraw0: USB HID v1.11 Mouse [Logitech USB Receiver] on usb-0000:00:14.0-6/input0
 e1000e 0000:00:19.0 lan1: renamed from eth0
+hid-generic 0003:046D:C52F.0001: input,hidraw0: USB HID v1.11 Mouse [Logitech USB Receiver] on usb-0000:00:14.0-6/input0
 input: Logitech USB Receiver as /devices/pci0000:00/0000:00:14.0/usb3/3-6/3-6:1.1/0003:046D:C52F.0002/input/input25
 iwlwifi 0000:5c:00.0 wifi1: renamed from wlan0
 hid-generic 0003:046D:C52F.0002: input,hiddev0,hidraw1: USB HID v1.11 Device [Logitech USB Receiver] on usb-0000:00:14.0-6/input1
@@ -682,13 +795,10 @@
 hid-generic 0003:413C:2002.0004: input,hidraw3: USB HID v1.10 Device [Dell Dell USB Keyboard Hub] on usb-0000:00:14.0-8.1.1/input1
 EXT4-fs (dm-15): INFO: recovery required on readonly filesystem
 EXT4-fs (dm-15): write access will be enabled during recovery
-EXT4-fs (dm-15): orphan cleanup on readonly fs
-EXT4-fs (dm-15): 2 orphan inodes deleted
 EXT4-fs (dm-15): recovery complete
 EXT4-fs (dm-15): mounted filesystem with ordered data mode. Opts: (null)
 EXT4-fs (dm-15): mounted filesystem with ordered data mode. Opts: acl,user_xattr
 usbcore: registered new interface driver btusb
-tpm_tis 00:01: 1.2 TPM (device-id 0xB, rev-id 16)
 uvcvideo: Found UVC 1.00 device HP HD Webcam (05c8:0369)
 uvcvideo 3-7:1.0: Entity type for entity Extension 4 was not initialized!
 uvcvideo 3-7:1.0: Entity type for entity Extension 3 was not initialized!
@@ -697,6 +807,7 @@
 input: HP HD Webcam as /devices/pci0000:00/0000:00:14.0/usb3/3-7/3-7:1.0/input/input28
 usbcore: registered new interface driver uvcvideo
 USB Video Class driver (1.1.1)
+tpm_tis 00:01: 1.2 TPM (device-id 0xB, rev-id 16)
 tpm tpm0: TPM is disabled/deactivated (0x7)
 Adding 50331644k swap on /dev/mapper/vg0-Swap.  Priority:-1 extents:1 across:50331644k SS
 EXT4-fs (dm-15): re-mounted. Opts: acl,user_xattr
@@ -705,8 +816,7 @@
 FAT-fs (sda1): Volume was not properly unmounted. Some data may be corrupt. Please run fsck.
 EXT4-fs (dm-18): mounted filesystem with ordered data mode. Opts: acl,user_xattr
 XFS (dm-0): Mounting V4 Filesystem
-XFS (dm-0): Starting recovery (logdev: internal)
-XFS (dm-0): Ending recovery (logdev: internal)
+XFS (dm-0): Ending clean mount
 iwlwifi 0000:5c:00.0: L1 Enabled - LTR Enabled
 iwlwifi 0000:5c:00.0: L1 Enabled - LTR Enabled
 iwlwifi 0000:5c:00.0: L1 Enabled - LTR Enabled
@@ -717,6 +827,114 @@
 IPv6: ADDRCONF(NETDEV_CHANGE): lan1: link becomes ready
 device lan1.1 entered promiscuous mode
 device lan1 entered promiscuous mode
+nouveau 0000:01:00.0: disp: Base 2:
+nouveau 0000:01:00.0: disp: ^I0080: 00000000              
+nouveau 0000:01:00.0: disp: ^I0084: 00000000 -> 00000010
+nouveau 0000:01:00.0: disp: ^I0088: 00000200              
+nouveau 0000:01:00.0: disp: ^I008c: 00000000 -> 00000001
+nouveau 0000:01:00.0: disp: ^I0090: 00000001 -> 00000002
+nouveau 0000:01:00.0: disp: ^I0094: 00000000 -> f0000000
+nouveau 0000:01:00.0: disp: ^I00a0: 00000000              
+nouveau 0000:01:00.0: disp: ^I00a4: 00000000              
+nouveau 0000:01:00.0: disp: ^I00c0: 00000000 -> ffff00fe
+nouveau 0000:01:00.0: disp: ^I00c4: 00000000              
+nouveau 0000:01:00.0: disp: ^I00c8: 00000000              
+nouveau 0000:01:00.0: disp: ^I00cc: 00000000              
+nouveau 0000:01:00.0: disp: ^I00e0: 40000000              
+nouveau 0000:01:00.0: disp: ^I00e4: 00000000              
+nouveau 0000:01:00.0: disp: ^I00e8: 00000000              
+nouveau 0000:01:00.0: disp: ^I00ec: 00000000              
+nouveau 0000:01:00.0: disp: ^I00fc: 00000000              
+nouveau 0000:01:00.0: disp: ^I0100: fffe0000              
+nouveau 0000:01:00.0: disp: ^I0104: 00000000              
+nouveau 0000:01:00.0: disp: ^I0108: 18131813              
+nouveau 0000:01:00.0: disp: ^I010c: f0000000              
+nouveau 0000:01:00.0: disp: ^I0110: 00000000              
+nouveau 0000:01:00.0: disp: ^I0114: 00000000              
+nouveau 0000:01:00.0: disp: ^I0118: 00000000              
+nouveau 0000:01:00.0: disp: ^I011c: 00000000              
+nouveau 0000:01:00.0: disp: ^I0130: 00000000              
+nouveau 0000:01:00.0: disp: ^I0134: 00000000              
+nouveau 0000:01:00.0: disp: ^I0138: 00000000              
+nouveau 0000:01:00.0: disp: ^I013c: 00000000              
+nouveau 0000:01:00.0: disp: ^I0140: 00010000              
+nouveau 0000:01:00.0: disp: ^I0144: 00000000              
+nouveau 0000:01:00.0: disp: ^I0148: 00000000              
+nouveau 0000:01:00.0: disp: ^I014c: 00000000              
+nouveau 0000:01:00.0: disp: ^I0150: 00000000              
+nouveau 0000:01:00.0: disp: ^I0154: 00010000              
+nouveau 0000:01:00.0: disp: ^I0158: 00000000              
+nouveau 0000:01:00.0: disp: ^I015c: 00000000              
+nouveau 0000:01:00.0: disp: ^I0160: 00000000              
+nouveau 0000:01:00.0: disp: ^I0164: 00000000              
+nouveau 0000:01:00.0: disp: ^I0168: 00010000              
+nouveau 0000:01:00.0: disp: ^I016c: 00000000              
+nouveau 0000:01:00.0: disp: Base 2 - Image 0:
+nouveau 0000:01:00.0: disp: ^I0400: 00000600 -> 00008800
+nouveau 0000:01:00.0: disp: ^I0404: 00000000              
+nouveau 0000:01:00.0: disp: ^I0408: 04380780 -> 04381680
+nouveau 0000:01:00.0: disp: ^I040c: 01001e00 -> 00016804
+nouveau 0000:01:00.0: disp: ^I0410: 0000cf00              
+nouveau 0000:01:00.0: disp: Base 2 - Image 1:
+nouveau 0000:01:00.0: disp: ^I0420: 00000000              
+nouveau 0000:01:00.0: disp: ^I0424: 00000000              
+nouveau 0000:01:00.0: disp: ^I0428: 00000000              
+nouveau 0000:01:00.0: disp: ^I042c: 00000000              
+nouveau 0000:01:00.0: disp: ^I0430: 0000e900              
+nouveau 0000:01:00.0: disp: Base 3:
+nouveau 0000:01:00.0: disp: ^I0080: 00000000              
+nouveau 0000:01:00.0: disp: ^I0084: 00000000 -> 00000010
+nouveau 0000:01:00.0: disp: ^I0088: 00000300              
+nouveau 0000:01:00.0: disp: ^I008c: 00000000 -> 00000001
+nouveau 0000:01:00.0: disp: ^I0090: 00000001 -> 00000002
+nouveau 0000:01:00.0: disp: ^I0094: 00000000 -> f0000000
+nouveau 0000:01:00.0: disp: ^I00a0: 00000000              
+nouveau 0000:01:00.0: disp: ^I00a4: 00000000              
+nouveau 0000:01:00.0: disp: ^I00c0: 00000000 -> ffff00fe
+nouveau 0000:01:00.0: disp: ^I00c4: 00000000              
+nouveau 0000:01:00.0: disp: ^I00c8: 00000000              
+nouveau 0000:01:00.0: disp: ^I00cc: 00000000              
+nouveau 0000:01:00.0: disp: ^I00e0: 40000000              
+nouveau 0000:01:00.0: disp: ^I00e4: 00000000              
+nouveau 0000:01:00.0: disp: ^I00e8: 00000000              
+nouveau 0000:01:00.0: disp: ^I00ec: 00000000              
+nouveau 0000:01:00.0: disp: ^I00fc: 00000000              
+nouveau 0000:01:00.0: disp: ^I0100: fffe0000              
+nouveau 0000:01:00.0: disp: ^I0104: 00000000              
+nouveau 0000:01:00.0: disp: ^I0108: 18131813              
+nouveau 0000:01:00.0: disp: ^I010c: f0000000              
+nouveau 0000:01:00.0: disp: ^I0110: 00000000              
+nouveau 0000:01:00.0: disp: ^I0114: 00000000              
+nouveau 0000:01:00.0: disp: ^I0118: 00000000              
+nouveau 0000:01:00.0: disp: ^I011c: 00000000              
+nouveau 0000:01:00.0: disp: ^I0130: 00000000              
+nouveau 0000:01:00.0: disp: ^I0134: 00000000              
+nouveau 0000:01:00.0: disp: ^I0138: 00000000              
+nouveau 0000:01:00.0: disp: ^I013c: 00000000              
+nouveau 0000:01:00.0: disp: ^I0140: 00010000              
+nouveau 0000:01:00.0: disp: ^I0144: 00000000              
+nouveau 0000:01:00.0: disp: ^I0148: 00000000              
+nouveau 0000:01:00.0: disp: ^I014c: 00000000              
+nouveau 0000:01:00.0: disp: ^I0150: 00000000              
+nouveau 0000:01:00.0: disp: ^I0154: 00010000              
+nouveau 0000:01:00.0: disp: ^I0158: 00000000              
+nouveau 0000:01:00.0: disp: ^I015c: 00000000              
+nouveau 0000:01:00.0: disp: ^I0160: 00000000              
+nouveau 0000:01:00.0: disp: ^I0164: 00000000              
+nouveau 0000:01:00.0: disp: ^I0168: 00010000              
+nouveau 0000:01:00.0: disp: ^I016c: 00000000              
+nouveau 0000:01:00.0: disp: Base 3 - Image 0:
+nouveau 0000:01:00.0: disp: ^I0400: 00000600 -> 00008800
+nouveau 0000:01:00.0: disp: ^I0404: 00000000              
+nouveau 0000:01:00.0: disp: ^I0408: 04380780 -> 04381680
+nouveau 0000:01:00.0: disp: ^I040c: 01001e00 -> 00016804
+nouveau 0000:01:00.0: disp: ^I0410: 0000cf00              
+nouveau 0000:01:00.0: disp: Base 3 - Image 1:
+nouveau 0000:01:00.0: disp: ^I0420: 00000000              
+nouveau 0000:01:00.0: disp: ^I0424: 00000000              
+nouveau 0000:01:00.0: disp: ^I0428: 00000000              
+nouveau 0000:01:00.0: disp: ^I042c: 00000000              
+nouveau 0000:01:00.0: disp: ^I0430: 0000e900              
 device lan1.11 entered promiscuous mode
 device lan1.29 entered promiscuous mode
 device lan1.30 entered promiscuous mode

--------------7C34C448FF9CC38698F4EF74
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--------------7C34C448FF9CC38698F4EF74--
