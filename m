From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 63481] New: Nouveau driver - No monitor signal on
 chipset NV1A (family NV10) since bisected bad commit
 ebb945a94bba2ce8dff7b0942ff2b3f2a52a0a69 in kernel 3.7.9
Date: Fri, 12 Apr 2013 16:59:03 +0000
Message-ID: <bug-63481-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0694900830=="
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


--===============0694900830==
Content-Type: multipart/alternative; boundary="1365785943.c6031.19687"; charset="us-ascii"


--1365785943.c6031.19687
Date: Fri, 12 Apr 2013 16:59:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=63481

          Priority: medium
            Bug ID: 63481
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Nouveau driver - No  monitor signal on chipset NV1A
                    (family NV10) since bisected bad commit
                    ebb945a94bba2ce8dff7b0942ff2b3f2a52a0a69 in kernel
                    3.7.9
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: jfgodfrey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

I experienced this problem for the first time after upgrading my kernel to
3.7.9.  With that kernel, my monitor no longer functioned, but only has a
bouncing blue box that says, "PLEASE CHECK PC DISPLAY SETTINGS"
Here is a copy of the last 'git bisect visualize'

commit ebb945a94bba2ce8dff7b0942ff2b3f2a52a0a69
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Fri Jul 20 08:17:34 2012 +1000

    drm/nouveau: port all engines to new engine module format

    This is a HUGE commit, but it's not nearly as bad as it looks - any
problems
    can be isolated to a particular chipset and engine combination.  It was
    simply too difficult to port each one at a time, the compat layers are
    *already* ridiculous.

    Most of the changes here are simply to the glue, the process for each of
the
    engine modules was to start with a standard skeleton and copy+paste the old
    code into the appropriate places, fixing up variable names etc as needed.

    v2: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
    - fix find/replace bug in license header

    v3: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
    - bump indirect pushbuf size to 8KiB, 4KiB barely enough for userspace and
      left no space for kernel's requirements during GEM pushbuf submission.
    - fix duplicate assignments noticed by clang

    v4: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
    - add sparse annotations to nv04_fifo_pause/nv04_fifo_start
    - use ioread32_native/iowrite32_native for fifo control registers

    v5: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
    - rebase on v3.6-rc4, modified to keep copy engine fix intact
    - nv10/fence: unmap fence bo before destroying
    - fixed fermi regression when using nvidia gr fuc
    - fixed typo in supported dma_mask checking

    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Here's my bisect.log
Bisecting: a merge base must be tested
[28a33cbc24e4256c143dce96c7d93bf423229f92] Linux 3.5
Bisecting: 12468 revisions left to test after this (roughly 14 steps)
[06d2fe153b9b35e57221e35831a26918f462db68] Merge tag 'driver-core-3.6' of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core
Bisecting: 6387 revisions left to test after this (roughly 13 steps)
[7f60ba388f5b9dd8b0da463b394412dace3ab814] Merge tag 'for-v3.7' of
git://git.infradead.org/users/cbou/linux-pstore
Bisecting: 3161 revisions left to test after this (roughly 12 steps)
[a20acf99f75e49271381d65db097c9763060a1e8] Merge
git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc-next
Bisecting: 1579 revisions left to test after this (roughly 11 steps)
[ca41cc96b2813221b05af57d0355157924de5a07] Merge branch 'for-v3.7' of
git://git.linaro.org/people/mszyprowski/linux-dma-mapping
Bisecting: 767 revisions left to test after this (roughly 10 steps)
[d66e6737d454553e1e62109d8298ede5351178a4] Merge
git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6
Bisecting: 450 revisions left to test after this (roughly 9 steps)
[df86b5765a48d5f557489577652bd6df145b0e1b] drm/savage: re-add busmaster enable,
regression fix
Bisecting: 218 revisions left to test after this (roughly 8 steps)
[56d92aa5cf7c96c70f81d0350c94faf46a9fb76d] Merge tag
'stable/for-linus-3.7-x86-tag' of
git://git.kernel.org/pub/scm/linux/kernel/git/konrad/xen
Bisecting: 120 revisions left to test after this (roughly 7 steps)
[268d28371cd326be4dfcd7eba5917bf4b9d30c8f] Merge branch 'drm-nouveau-next' of
git://anongit.freedesktop.org/git/nouveau/linux-2.6 into drm-next
Bisecting: 48 revisions left to test after this (roughly 6 steps)
[c4837d27945b9b607b5a7274a33059e73d1a7831] drm/nouveau/core: remove some
left-over pieces from the porting process
Bisecting: 24 revisions left to test after this (roughly 5 steps)
[18c9b959fd8ea6f3602efbedad788f53e305e6f1] drm/nouveau/gpuobj: create wrapper
functions for mapping gpuobj into vm/bar
Bisecting: 12 revisions left to test after this (roughly 4 steps)
[c4afbe74cebf887d3d8e7a11aa93bebcb6a3e2e1] drm/nvc0-/gr: share headers between
fermi and kepler graphics code
Bisecting: 6 revisions left to test after this (roughly 3 steps)
[fce875d647171f9f740587a252fc026aaa421afe] drm/nouveau: move compat ioctl out
of nouveau_drv.h
Bisecting: 2 revisions left to test after this (roughly 2 steps)
[08c770969a45361277d556f9fd3e2d70da42be65] drm/nouveau: start culling unused
code
Bisecting: 0 revisions left to test after this (roughly 1 step)
[ebb945a94bba2ce8dff7b0942ff2b3f2a52a0a69] drm/nouveau: port all engines to new
engine module format
Bisecting: 0 revisions left to test after this (roughly 0 steps)
[ac1499d9573f4aadd1d2beac11fe23af8ce90c24] drm/nvc0-/gr: generate grctx
template at init time, not first context ctor
ebb945a94bba2ce8dff7b0942ff2b3f2a52a0a69 is the first bad commit
commit ebb945a94bba2ce8dff7b0942ff2b3f2a52a0a69
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Fri Jul 20 08:17:34 2012 +1000

    drm/nouveau: port all engines to new engine module format

    This is a HUGE commit, but it's not nearly as bad as it looks - any
problems
    can be isolated to a particular chipset and engine combination.  It was
    simply too difficult to port each one at a time, the compat layers are
    *already* ridiculous.

    Most of the changes here are simply to the glue, the process for each of
the
    engine modules was to start with a standard skeleton and copy+paste the old
    code into the appropriate places, fixing up variable names etc as needed.

    v2: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
    - fix find/replace bug in license header

    v3: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
    - bump indirect pushbuf size to 8KiB, 4KiB barely enough for userspace and
      left no space for kernel's requirements during GEM pushbuf submission.
    - fix duplicate assignments noticed by clang

    v4: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
    - add sparse annotations to nv04_fifo_pause/nv04_fifo_start
    - use ioread32_native/iowrite32_native for fifo control registers

    v5: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
    - rebase on v3.6-rc4, modified to keep copy engine fix intact
    - nv10/fence: unmap fence bo before destroying
    - fixed fermi regression when using nvidia gr fuc
    - fixed typo in supported dma_mask checking

    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

:040000 040000 09b924b6dbe320ada5907dc62230bbbc83137c41
acd1422de149497a4f445c7e0a656e392cc703b3 M    drivers

And lastly, here's the output of dmesg while running 3.9.0-rc3:

[    0.150000] ... max period:             00007fffffffffff
[    0.150000] ... fixed-purpose events:   0
[    0.150000] ... event mask:             000000000000000f
[    0.150000] Brought up 1 CPUs
[    0.150000] smpboot: Total of 1 processors activated (3324.82 BogoMIPS)
[    0.150000] devtmpfs: initialized
[    0.150000] PM: Registering ACPI NVS region [mem 0x0dff0000-0x0dff2fff]
(12288 bytes)
[    0.150000] xor: measuring software checksum speed
[    0.240005]    pIII_sse  :  1613.200 MB/sec
[    0.340003]    prefetch64-sse:  1620.800 MB/sec
[    0.340057] xor: using function: prefetch64-sse (1620.800 MB/sec)
[    0.340206] NET: Registered protocol family 16
[    0.341131] ACPI: bus type PCI registered
[    0.341394] dca service started, version 1.12.1
[    0.368946] PCI: PCI BIOS revision 2.10 entry at 0xfba20, last bus=2
[    0.369003] PCI: Using configuration type 1 for base access
[    0.381642] bio: create slab <bio-0> at 0
[    0.550037] raid6: mmxx1     1335 MB/s
[    0.720013] raid6: mmxx2     2187 MB/s
[    0.890031] raid6: sse1x1    1284 MB/s
[    1.060021] raid6: sse1x2    2078 MB/s
[    1.230035] raid6: int32x1    459 MB/s
[    1.400078] raid6: int32x2    660 MB/s
[    1.570092] raid6: int32x4    472 MB/s
[    1.740036] raid6: int32x8    448 MB/s
[    1.740088] raid6: using algorithm mmxx2 (2187 MB/s)
[    1.740142] raid6: using intx1 recovery algorithm
[    1.740331] ACPI: Added _OSI(Module Device)
[    1.740386] ACPI: Added _OSI(Processor Device)
[    1.740440] ACPI: Added _OSI(3.0 _SCP Extensions)
[    1.740494] ACPI: Added _OSI(Processor Aggregator Device)
[    1.741385] ACPI: EC: Look up EC in DSDT
[    1.744418] ACPI: Interpreter enabled
[    1.744489] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State
[\_S2_] (20130117/hwxface-568)
[    1.744654] ACPI: (supports S0 S1 S3 S4 S5)
[    1.744708] ACPI: Using IOAPIC for interrupt routing
[    1.744898] PCI: Ignoring host bridge windows from ACPI; if necessary, use
"pci=use_crs" and report a bug
[    1.754865] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    1.754945] acpi PNP0A03:00: ACPI _OSC support notification failed,
disabling PCIe ASPM
[    1.755006] acpi PNP0A03:00: Unable to request _OSC control (_OSC support
mask: 0x08)
[    1.755174] acpi PNP0A03:00: host bridge window [io  0x0000-0x0cf7]
(ignored)
[    1.755178] acpi PNP0A03:00: host bridge window [io  0x0d00-0xffff]
(ignored)
[    1.755182] acpi PNP0A03:00: host bridge window [mem 0x000a0000-0x000bffff]
(ignored)
[    1.755185] acpi PNP0A03:00: host bridge window [mem 0x000c0000-0x000dffff]
(ignored)
[    1.755188] acpi PNP0A03:00: host bridge window [mem 0x0e000000-0xffefffff]
(ignored)
[    1.755192] PCI: root bus 00: using default resources
[    1.755199] acpi PNP0A03:00: fail to add MMCONFIG information, can't access
extended PCI configuration space under this bridge.
[    1.755356] PCI host bridge to bus 0000:00
[    1.755416] pci_bus 0000:00: root bus resource [bus 00-ff]
[    1.755473] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
[    1.755531] pci_bus 0000:00: root bus resource [mem 0x00000000-0xffffffff]
[    1.755606] pci 0000:00:00.0: [10de:01a4] type 00 class 0x060000
[    1.755620] pci 0000:00:00.0: reg 10: [mem 0xe8000000-0xebffffff pref]
[    1.755826] pci 0000:00:00.1: [10de:01ac] type 00 class 0x050000
[    1.756006] pci 0000:00:00.2: [10de:01ad] type 00 class 0x050000
[    1.756181] pci 0000:00:00.3: [10de:01aa] type 00 class 0x050000
[    1.756365] pci 0000:00:01.0: [10de:01b2] type 00 class 0x060100
[    1.756557] pci 0000:00:01.1: [10de:01b4] type 00 class 0x0c0500
[    1.756574] pci 0000:00:01.1: reg 10: [io  0x5000-0x500f]
[    1.756584] pci 0000:00:01.1: reg 14: [io  0x5020-0x502f]
[    1.756594] pci 0000:00:01.1: reg 18: [io  0x6000-0x601f]
[    1.756647] pci 0000:00:01.1: PME# supported from D3hot D3cold
[    1.756787] pci 0000:00:02.0: [10de:01c2] type 00 class 0x0c0310
[    1.756805] pci 0000:00:02.0: reg 10: [mem 0xee183000-0xee183fff]
[    1.756869] pci 0000:00:02.0: supports D1 D2
[    1.756872] pci 0000:00:02.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.756912] pci 0000:00:02.0: System wakeup disabled by ACPI
[    1.757071] pci 0000:00:03.0: [10de:01c2] type 00 class 0x0c0310
[    1.757089] pci 0000:00:03.0: reg 10: [mem 0xee181000-0xee181fff]
[    1.757153] pci 0000:00:03.0: supports D1 D2
[    1.757156] pci 0000:00:03.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.757194] pci 0000:00:03.0: System wakeup disabled by ACPI
[    1.757356] pci 0000:00:04.0: [10de:01c3] type 00 class 0x020000
[    1.757373] pci 0000:00:04.0: reg 10: [mem 0xee182000-0xee1823ff]
[    1.757383] pci 0000:00:04.0: reg 14: [io  0xd800-0xd807]
[    1.757441] pci 0000:00:04.0: supports D1 D2
[    1.757444] pci 0000:00:04.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.757488] pci 0000:00:04.0: System wakeup disabled by ACPI
[    1.757649] pci 0000:00:05.0: [10de:01b0] type 00 class 0x040100
[    1.757666] pci 0000:00:05.0: reg 10: [mem 0xee100000-0xee17ffff]
[    1.757730] pci 0000:00:05.0: supports D1 D2
[    1.757857] pci 0000:00:06.0: [10de:01b1] type 00 class 0x040100
[    1.757874] pci 0000:00:06.0: reg 10: [io  0xdc00-0xdcff]
[    1.757884] pci 0000:00:06.0: reg 14: [io  0xe000-0xe07f]
[    1.757894] pci 0000:00:06.0: reg 18: [mem 0xee180000-0xee180fff]
[    1.757945] pci 0000:00:06.0: supports D1 D2
[    1.758075] pci 0000:00:08.0: [10de:01b8] type 01 class 0x060400
[    1.758129] pci 0000:00:08.0: System wakeup disabled by ACPI
[    1.758289] pci 0000:00:09.0: [10de:01bc] type 00 class 0x01018a
[    1.758332] pci 0000:00:09.0: reg 20: [io  0xe800-0xe80f]
[    1.758504] pci 0000:00:1e.0: [10de:01b7] type 01 class 0x060400
[    1.758730] pci 0000:01:02.0: [11c1:044e] type 00 class 0x078000
[    1.758753] pci 0000:01:02.0: reg 10: [mem 0xee000000-0xee0000ff]
[    1.758766] pci 0000:01:02.0: reg 14: [io  0xc000-0xc007]
[    1.758779] pci 0000:01:02.0: reg 18: [io  0xc400-0xc4ff]
[    1.758850] pci 0000:01:02.0: supports D2
[    1.758853] pci 0000:01:02.0: PME# supported from D2 D3hot D3cold
[    1.758998] pci 0000:00:08.0: PCI bridge to [bus 01]
[    1.759058] pci 0000:00:08.0:   bridge window [io  0xc000-0xcfff]
[    1.759064] pci 0000:00:08.0:   bridge window [mem 0xee000000-0xee0fffff]
[    1.759157] pci 0000:02:00.0: [10de:01a0] type 00 class 0x030000
[    1.759175] pci 0000:02:00.0: reg 10: [mem 0xec000000-0xecffffff]
[    1.759185] pci 0000:02:00.0: reg 14: [mem 0xe0000000-0xe7ffffff pref]
[    1.759221] pci 0000:02:00.0: reg 30: [mem 0x00000000-0x0000ffff pref]
[    1.759382] pci 0000:00:1e.0: PCI bridge to [bus 02]
[    1.759442] pci 0000:00:1e.0:   bridge window [mem 0xec000000-0xedffffff]
[    1.759447] pci 0000:00:1e.0:   bridge window [mem 0xe0000000-0xe7ffffff
pref]
[    1.759460] pci_bus 0000:00: on NUMA node 0
[    1.759462] ACPI _OSC control for PCIe not granted, disabling ASPM
[    1.759747] ACPI: PCI Interrupt Link [LNK1] (IRQs *16), disabled.
[    1.760088] ACPI: PCI Interrupt Link [LNK2] (IRQs *18), disabled.
[    1.760392] ACPI: PCI Interrupt Link [LNK3] (IRQs *18)
[    1.760654] ACPI: PCI Interrupt Link [LNK4] (IRQs *19), disabled.
[    1.760956] ACPI: PCI Interrupt Link [LNK5] (IRQs *16)
[    1.761228] ACPI: PCI Interrupt Link [LUBA] (IRQs *20)
[    1.761488] ACPI: PCI Interrupt Link [LUBB] (IRQs *21)
[    1.761748] ACPI: PCI Interrupt Link [LMAC] (IRQs *22), disabled.
[    1.762049] ACPI: PCI Interrupt Link [LAPU] (IRQs *20)
[    1.762308] ACPI: PCI Interrupt Link [LACI] (IRQs *21)
[    1.762574] ACPI: PCI Interrupt Link [LMCI] (IRQs *22), disabled.
[    1.762874] ACPI: PCI Interrupt Link [LUSB] (IRQs 3 4 5 6 7 10 11 12 14 15)
*0
[    1.763557] ACPI: PCI Interrupt Link [LSMB] (IRQs *22)
[    1.764625] acpi root: \_SB_.PCI0 notify handler is installed
[    1.764661] Found 1 acpi root devices
[    1.765026] vgaarb: device added:
PCI:0000:02:00.0,decodes=io+mem,owns=io+mem,locks=none
[    1.765087] vgaarb: loaded
[    1.765138] vgaarb: bridge control possible 0000:02:00.0
[    1.765484] SCSI subsystem initialized
[    1.765541] ACPI: bus type ATA registered
[    1.765778] libata version 3.00 loaded.
[    1.765796] ACPI: bus type USB registered
[    1.765996] usbcore: registered new interface driver usbfs
[    1.766113] usbcore: registered new interface driver hub
[    1.766243] usbcore: registered new device driver usb
[    1.766600] EDAC MC: Ver: 3.0.0
[    1.766921] Advanced Linux Sound Architecture Driver Initialized.
[    1.767039] PCI: Using ACPI for IRQ routing
[    1.767100] PCI: pci_cache_line_size set to 32 bytes
[    1.767150] e820: reserve RAM buffer [mem 0x0dff0000-0x0fffffff]
[    1.767606] Switching to clocksource refined-jiffies
[    1.773267] pnp: PnP ACPI init
[    1.773355] ACPI: bus type PNP registered
[    1.773821] system 00:00: [mem 0x000f0000-0x000f3fff] could not be reserved
[    1.773882] system 00:00: [mem 0x000f4000-0x000f7fff] could not be reserved
[    1.773942] system 00:00: [mem 0x000f8000-0x000fbfff] could not be reserved
[    1.774001] system 00:00: [mem 0x000fc000-0x000fffff] could not be reserved
[    1.774060] system 00:00: [mem 0x0dff0000-0x0dffffff] could not be reserved
[    1.774120] system 00:00: [mem 0xffb00000-0xffffffff] has been reserved
[    1.774178] system 00:00: [mem 0x00000000-0x0009ffff] could not be reserved
[    1.774238] system 00:00: [mem 0x00100000-0x0dfeffff] could not be reserved
[    1.778505] system 00:00: [mem 0xfec00000-0xfec00fff] could not be reserved
[    1.778565] system 00:00: [mem 0xfee00000-0xfee00fff] has been reserved
[    1.778626] system 00:00: Plug and Play ACPI device, IDs PNP0c01 (active)
[    1.778814] system 00:01: [io  0x4000-0x40fe] has been reserved
[    1.778873] system 00:01: [io  0x40ff] has been reserved
[    1.778931] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
[    1.779320] system 00:02: [io  0x0b78-0x0b7b] has been reserved
[    1.779380] system 00:02: [io  0x0f78-0x0f7b] has been reserved
[    1.779438] system 00:02: [io  0x0a78-0x0a7b] has been reserved
[    1.779495] system 00:02: [io  0x0e78-0x0e7b] has been reserved
[    1.779553] system 00:02: [io  0x0bbc-0x0bbf] has been reserved
[    1.779610] system 00:02: [io  0x0fbc-0x0fbf] has been reserved
[    1.779668] system 00:02: [io  0x04d0-0x04d1] has been reserved
[    1.779725] system 00:02: [io  0x0294-0x0297] has been reserved
[    1.779784] system 00:02: Plug and Play ACPI device, IDs PNP0c02 (active)
[    1.779807] pnp 00:03: [dma 4]
[    1.779891] pnp 00:03: Plug and Play ACPI device, IDs PNP0200 (active)
[    1.780043] pnp 00:04: Plug and Play ACPI device, IDs PNP0b00 (active)
[    1.780135] pnp 00:05: Plug and Play ACPI device, IDs PNP0800 (active)
[    1.780237] pnp 00:06: Plug and Play ACPI device, IDs PNP0c04 (active)
[    1.780416] pnp 00:07: [dma 2]
[    1.780520] pnp 00:07: Plug and Play ACPI device, IDs PNP0700 (active)
[    1.780884] pnp 00:08: Plug and Play ACPI device, IDs PNP0501 (active)
[    1.781450] pnp 00:09: [dma 3]
[    1.781581] pnp 00:09: Plug and Play ACPI device, IDs PNP0401 (active)
[    1.781730] pnp 00:0a: Plug and Play ACPI device, IDs PNP0f13 (active)
[    1.781856] pnp 00:0b: Plug and Play ACPI device, IDs PNP0303 (active)
[    1.782161] pnp 00:0c: Plug and Play ACPI device, IDs PNPb02f (active)
[    1.782503] pnp 00:0d: Plug and Play ACPI device, IDs PNPb006 (active)
[    1.782517] pnp: PnP ACPI: found 14 devices
[    1.782573] ACPI: bus type PNP unregistered
[    1.823271] Switching to clocksource acpi_pm
[    1.823404] pci 0000:00:08.0: PCI bridge to [bus 01]
[    1.823463] pci 0000:00:08.0:   bridge window [io  0xc000-0xcfff]
[    1.823525] pci 0000:00:08.0:   bridge window [mem 0xee000000-0xee0fffff]
[    1.823599] pci 0000:02:00.0: BAR 6: assigned [mem 0xed000000-0xed00ffff
pref]
[    1.823660] pci 0000:00:1e.0: PCI bridge to [bus 02]
[    1.823719] pci 0000:00:1e.0:   bridge window [mem 0xec000000-0xedffffff]
[    1.823779] pci 0000:00:1e.0:   bridge window [mem 0xe0000000-0xe7ffffff
pref]
[    1.823858] pci 0000:00:08.0: setting latency timer to 64
[    1.823868] pci_bus 0000:00: resource 4 [io  0x0000-0xffff]
[    1.823872] pci_bus 0000:00: resource 5 [mem 0x00000000-0xffffffff]
[    1.823875] pci_bus 0000:01: resource 0 [io  0xc000-0xcfff]
[    1.823879] pci_bus 0000:01: resource 1 [mem 0xee000000-0xee0fffff]
[    1.823883] pci_bus 0000:02: resource 1 [mem 0xec000000-0xedffffff]
[    1.823886] pci_bus 0000:02: resource 2 [mem 0xe0000000-0xe7ffffff pref]
[    1.823968] NET: Registered protocol family 2
[    1.824348] TCP established hash table entries: 2048 (order: 2, 16384 bytes)
[    1.824446] TCP bind hash table entries: 2048 (order: 2, 16384 bytes)
[    1.824537] TCP: Hash tables configured (established 2048 bind 2048)
[    1.824685] TCP: reno registered
[    1.824741] UDP hash table entries: 256 (order: 1, 8192 bytes)
[    1.824810] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes)
[    1.824973] NET: Registered protocol family 1
[    1.825357] ACPI: PCI Interrupt Link [LUBA] enabled at IRQ 20
[    1.900358] ACPI: PCI Interrupt Link [LUBB] enabled at IRQ 21
[    1.900568] pci 0000:02:00.0: Boot video device
[    1.900573] PCI: CLS 0 bytes, default 32
[    1.900832] apm: BIOS version 1.2 Flags 0x07 (Driver version 1.16ac)
[    1.900890] apm: overridden by ACPI.
[    1.901567] audit: initializing netlink socket (disabled)
[    1.901650] type=2000 audit(1365740499.899:1): initialized
[    1.957794] HugeTLB registered 4 MB page size, pre-allocated 0 pages
[    1.957944] VFS: Disk quotas dquot_6.5.2
[    1.958038] Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
[    1.958401] msgmni has been set to 428
[    1.958745] async_tx: api initialized (async)
[    1.958896] Block layer SCSI generic (bsg) driver version 0.4 loaded (major
253)
[    1.958957] io scheduler noop registered
[    1.959010] io scheduler deadline registered
[    1.959070] io scheduler cfq registered (default)
[    1.960993] isapnp: Scanning for PnP cards...
[    2.317843] isapnp: No Plug & Play device found
[    2.317899] ioatdma: Intel(R) QuickData Technology Driver 4.00
[    2.318165] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    2.338919] 00:08: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
[    2.339997] Generic RTC Driver v1.07
[    2.340209] Linux agpgart interface v0.103
[    2.340284] agpgart: Detected NVIDIA nForce chipset
[    2.345379] agpgart-nvidia 0000:00:00.0: AGP aperture is 64M @ 0xe8000000
[    2.349184] brd: module loaded
[    2.351274] loop: module loaded
[    2.351335] Loading iSCSI transport class v2.0-870.
[    2.351813] iscsi: registered transport (tcp)
[    2.352167] pata_amd 0000:00:09.0: version 0.4.1
[    2.352303] pata_amd 0000:00:09.0: setting latency timer to 64
[    2.353067] scsi0 : pata_amd
[    2.353733] scsi1 : pata_amd
[    2.354219] ata1: PATA max UDMA/100 cmd 0x1f0 ctl 0x3f6 bmdma 0xe800 irq 14
[    2.354279] ata2: PATA max UDMA/100 cmd 0x170 ctl 0x376 bmdma 0xe808 irq 15
[    2.357417] Failed to ioremap_nocache
[    2.357510] forcedeth: Reverse Engineered nForce ethernet driver. Version
0.64.
[    2.357871] ACPI: PCI Interrupt Link [LMAC] enabled at IRQ 22
[    2.357967] forcedeth 0000:00:04.0: setting latency timer to 64
[    2.530682] ata1.00: ATA-6: Maxtor 4D060H3, DAH017K0, max UDMA/100
[    2.530750] ata1.00: 120069936 sectors, multi 16: LBA 
[    2.530816] ata1: nv_mode_filter: 0x3f39f&0x3f39f->0x3f39f, BIOS=0x3f000
(0xc600c0c0) ACPI=0x3f01f (20:600:0x13)
[    2.570589] ata1.00: configured for UDMA/100
[    2.570904] scsi 0:0:0:0: Direct-Access     ATA      Maxtor 4D060H3   DAH0
PQ: 0 ANSI: 5
[    2.571489] sd 0:0:0:0: [sda] 120069936 512-byte logical blocks: (61.4
GB/57.2 GiB)
[    2.571640] sd 0:0:0:0: [sda] Write Protect is off
[    2.571697] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    2.571738] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled,
doesn't support DPO or FUA
[    2.632223]  sda: sda1 sda2 sda3 sda4 < sda5 sda6 >
[    2.633357] sd 0:0:0:0: [sda] Attached SCSI disk
[    2.880642] forcedeth 0000:00:04.0: ifname eth0, PHY OUI 0x57d @ 1, addr
00:10:dc:3a:d6:d6
[    2.880706] forcedeth 0000:00:04.0: timirq lnktim desc-v1
[    2.881018] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    2.881322] ohci_hcd 0000:00:02.0: setting latency timer to 64
[    2.881327] ohci_hcd 0000:00:02.0: OHCI Host Controller
[    2.881398] ohci_hcd 0000:00:02.0: new USB bus registered, assigned bus
number 1
[    2.881519] ohci_hcd 0000:00:02.0: irq 20, io mem 0xee183000
[    2.900023] tsc: Refined TSC clocksource calibration: 1662.375 MHz
[    2.900086] Switching to clocksource tsc
[    2.930374] ata2.00: ATAPI: CR-48X9TE, 5.0E, max UDMA/33
[    2.930445] ata2.01: ATAPI: LITEON  DVD-ROM LTD163, GKS3, max UDMA/33
[    2.930511] ata2: nv_mode_filter: 0x739f&0x739f->0x739f, BIOS=0x7000
(0xc600c0c0) ACPI=0x701f (60:60:0x1f)
[    2.930517] ata2: nv_mode_filter: 0x739f&0x739f->0x739f, BIOS=0x7000
(0xc600c0c0) ACPI=0x701f (60:60:0x1f)
[    2.942051] usb usb1: New USB device found, idVendor=1d6b, idProduct=0001
[    2.942112] usb usb1: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    2.942171] usb usb1: Product: OHCI Host Controller
[    2.942226] usb usb1: Manufacturer: Linux 3.9.0-rc3 ohci_hcd
[    2.942282] usb usb1: SerialNumber: 0000:00:02.0
[    2.942666] hub 1-0:1.0: USB hub found
[    2.942729] hub 1-0:1.0: 4 ports detected
[    2.943030] ohci_hcd 0000:00:03.0: setting latency timer to 64
[    2.943035] ohci_hcd 0000:00:03.0: OHCI Host Controller
[    2.943100] ohci_hcd 0000:00:03.0: new USB bus registered, assigned bus
number 2
[    2.943213] ohci_hcd 0000:00:03.0: irq 21, io mem 0xee181000
[    2.970336] ata2.00: configured for UDMA/33
[    2.990295] ata2.01: configured for UDMA/33
[    2.995463] scsi 1:0:0:0: CD-ROM            MITSUMI  CR-48X9TE        5.0E
PQ: 0 ANSI: 5
[    2.999039] sr0: scsi3-mmc drive: 40x/40x writer cd/rw xa/form2 cdda tray
[    2.999100] cdrom: Uniform CD-ROM driver Revision: 3.20
[    2.999450] sr 1:0:0:0: Attached scsi CD-ROM sr0
[    3.002089] usb usb2: New USB device found, idVendor=1d6b, idProduct=0001
[    3.002154] usb usb2: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    3.002213] usb usb2: Product: OHCI Host Controller
[    3.002269] usb usb2: Manufacturer: Linux 3.9.0-rc3 ohci_hcd
[    3.002325] usb usb2: SerialNumber: 0000:00:03.0
[    3.002754] scsi 1:0:1:0: CD-ROM            LITEON   DVD-ROM LTD163   GKS3
PQ: 0 ANSI: 5
[    3.003121] hub 2-0:1.0: USB hub found
[    3.003189] hub 2-0:1.0: 2 ports detected
[    3.003580] uhci_hcd: USB Universal Host Controller Interface driver
[    3.004196] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at
0x60,0x64 irq 1,12
[    3.004356] sr1: scsi3-mmc drive: 0x/48x cd/rw xa/form2 cdda tray
[    3.006865] serio: i8042 KBD port at 0x60,0x64 irq 1
[    3.006927] serio: i8042 AUX port at 0x60,0x64 irq 12
[    3.007158] sr 1:0:1:0: Attached scsi CD-ROM sr1
[    3.007961] mousedev: PS/2 mouse device common for all mice
[    3.008498] md: raid0 personality registered for level 0
[    3.008554] md: raid1 personality registered for level 1
[    3.008609] md: raid6 personality registered for level 6
[    3.008664] md: raid5 personality registered for level 5
[    3.008718] md: raid4 personality registered for level 4
[    3.008843] cpuidle: using governor ladder
[    3.009007] hidraw: raw HID events driver (C) Jiri Kosina
[    3.009726] ACPI: PCI Interrupt Link [LACI] enabled at IRQ 21
[    3.009843] snd_intel8x0 0000:00:06.0: setting latency timer to 64
[    3.037022] input: AT Translated Set 2 keyboard as
/devices/platform/i8042/serio0/input/input0
[    3.690015] intel8x0_measure_ac97_clock: measured 50869 usecs (2472 samples)
[    3.690083] intel8x0: clocking to 47412
[    3.691438] TCP: cubic registered
[    3.691499] NET: Registered protocol family 17
[    3.691588] Key type dns_resolver registered
[    3.691968] Using IPI No-Shortcut mode
[    3.692303] registered taskstats version 1
[    3.692767] ALSA device list:
[    3.692820]   #0: NVidia nForce with AD1885 at irq 21
[    4.189980] input: ImPS/2 Logitech Wheel Mouse as
/devices/platform/i8042/serio1/input/input1
[    4.199122] md: Waiting for all devices to be available before autodetect
[    4.199180] md: If you don't use raid, use raid=noautodetect
[    4.199591] md: Autodetecting RAID arrays.
[    4.199645] md: Scanned 0 and added 0 devices.
[    4.199698] md: autorun ...
[    4.199748] md: ... autorun DONE.
[    4.209102] EXT3-fs (sda6): error: couldn't mount because of unsupported
optional features (240)
[    4.209559] EXT2-fs (sda6): error: couldn't mount because of unsupported
optional features (240)
[    4.238188] EXT4-fs (sda6): mounted filesystem with ordered data mode. Opts:
(null)
[    4.238277] VFS: Mounted root (ext4 filesystem) readonly on device 8:6.
[    4.238386] Freeing unused kernel memory: 448k freed
[    8.506418] systemd-udevd[851]: starting version 200
[    9.984687] input: Power Button as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input2
[    9.985175] ACPI: Power Button [PWRB]
[    9.985325] input: Power Button as
/devices/LNXSYSTM:00/LNXPWRBN:00/input/input3
[    9.985391] ACPI: Power Button [PWRF]
[   10.093119] thermal LNXTHERM:00: registered as thermal_zone0
[   10.093125] ACPI: Thermal Zone [THRM] (65 C)
[   10.110143] gameport gameport0: NS558 PnP Gameport is pnp00:0c/gameport0, io
0x201, speed 727kHz
[   10.220285] pci_hotplug: PCI Hot Plug PCI Core version: 0.5
[   10.279757] ACPI: Fan [FAN] (on)
[   10.357136] Floppy drive(s): fd0 is 1.44M
[   10.373804] FDC 0 is a post-1991 82077
[   10.477084] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[   10.598973] systemd-udevd[869]: renamed network interface eth0 to enp0s4
[   11.229567] [drm] Initialized drm 1.1.0 20060810
[   11.432424] wmi: Mapper loaded
[   11.958597] ACPI: PCI Interrupt Link [LNK5] enabled at IRQ 16
[   11.961851] nouveau  [  DEVICE][0000:02:00.0] BOOT0  : 0x01a000b1
[   11.961860] nouveau  [  DEVICE][0000:02:00.0] Chipset: nForce (NV1A)
[   11.961863] nouveau  [  DEVICE][0000:02:00.0] Family : NV10
[   11.963302] nouveau  [   VBIOS][0000:02:00.0] checking PRAMIN for image...
[   12.006595] nouveau  [   VBIOS][0000:02:00.0] ... checksum invalid
[   12.006599] nouveau  [   VBIOS][0000:02:00.0] checking PROM for image...
[   12.006616] nouveau  [   VBIOS][0000:02:00.0] ... signature not found
[   12.006619] nouveau  [   VBIOS][0000:02:00.0] checking ACPI for image...
[   12.006622] nouveau  [   VBIOS][0000:02:00.0] ... signature not found
[   12.006625] nouveau  [   VBIOS][0000:02:00.0] checking PCIROM for image...
[   12.009117] nouveau  [   VBIOS][0000:02:00.0] ... appears to be valid
[   12.009120] nouveau  [   VBIOS][0000:02:00.0] using image from PCIROM
[   12.009127] nouveau  [   VBIOS][0000:02:00.0] BMP version 5.14
[   12.010230] nouveau  [   VBIOS][0000:02:00.0] version 03.1a.01.03.00
[   12.010243] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[   12.010326] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[   12.010361] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[   12.010364] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[   12.010422] nouveau W[  PTIMER][0000:02:00.0] unknown input clock freq
[   12.010438] nouveau  [     PFB][0000:02:00.0] RAM type: stolen system memory
[   12.010442] nouveau  [     PFB][0000:02:00.0] RAM size: 32 MiB
[   12.010444] nouveau  [     PFB][0000:02:00.0]    ZCOMP: 0 tags
[   12.016149] agpgart-nvidia 0000:00:00.0: AGP 2.0 bridge
[   12.016169] agpgart-nvidia 0000:00:00.0: putting AGP V2 device into 4x mode
[   12.016223] nouveau 0000:02:00.0: putting AGP V2 device into 4x mode
[   12.026481] [TTM] Zone  kernel: Available graphics memory: 110016 kiB
[   12.026486] [TTM] Initializing pool allocator
[   12.026737] nouveau  [     DRM] VRAM: 31 MiB
[   12.026744] nouveau  [     DRM] GART: 64 MiB
[   12.026749] nouveau  [     DRM] BMP version 5.20
[   12.026754] nouveau W[     DRM] No useful DCB data in VBIOS
[   12.029405] nouveau  [     DRM] Saving VGA fonts
[   12.084820] nouveau W[     DRM] No useful DCB data in VBIOS
[   12.085707] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[   12.085710] [drm] No driver support for vblank timestamp query.
[   12.085834] nouveau  [     DRM] 0xAFD8: Parsing digital output script table
[   12.086071] nouveau  [     DRM] 0 available performance level(s)
[   12.086077] nouveau  [     DRM] c: core 305MHz memory 0MHz
[   12.088127] nouveau  [     DRM] MM: using M2MF for buffer copies
[   12.277591] nouveau  [     DRM] allocated 1024x768 fb: 0x5000, bo cdbd8000
[   12.278077] fbcon: nouveaufb (fb0) is primary device
[   12.292766] Console: switching to colour frame buffer device 128x48
[   12.293502] nouveau 0000:02:00.0: fb0: nouveaufb frame buffer device
[   12.293505] nouveau 0000:02:00.0: registered panic notifier
[   12.293513] [drm] Initialized nouveau 1.1.0 20120801 for 0000:02:00.0 on
minor 0
[   15.128777] EXT4-fs (sda6): re-mounted. Opts: (null)
[   15.444138] Adding 511996k swap on /dev/sda5.  Priority:-1 extents:1
across:511996k 
[   26.616135] RPC: Registered named UNIX socket transport module.
[   26.616141] RPC: Registered udp transport module.
[   26.616142] RPC: Registered tcp transport module.
[   26.616144] RPC: Registered tcp NFSv4.1 backchannel transport module.
[   26.655187] NFS: Registering the id_resolver key type
[   26.655218] Key type id_resolver registered
[   26.655220] Key type id_legacy registered
[   33.890249] tun: Universal TUN/TAP device driver, 1.6
[   33.890254] tun: (C) 1999-2004 Max Krasnyansky <maxk-zC7DfRvBq/JWk0Htik3J/w@public.gmane.org>
[  154.120983] NET: Registered protocol family 10
[  179.573879] Installing knfsd (copyright (C) 1996 okir-pn4DOG8n3UYbFoVRYvo4fw@public.gmane.org).
[  179.888986] NFSD: Using /var/lib/nfs/v4recovery as the NFSv4 state recovery
directory
[  179.903840] NFSD: starting 90-second grace period (net c070dec0)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1365785943.c6031.19687
Date: Fri, 12 Apr 2013 16:59:03 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau driver - No monitor signal on chipset NV1A (family NV10) since bisected bad commit ebb945a94bba2ce8dff7b0942ff2b3f2a52a0a69 in kernel 3.7.9"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63481">63481</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau driver - No  monitor signal on chipset NV1A (family NV10) since bisected bad commit  ebb945a94bba2ce8dff7b0942ff2b3f2a52a0a69 in kernel 3.7.9
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>jfgodfrey&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I experienced this problem for the first time after upgrading my kernel to
3.7.9.  With that kernel, my monitor no longer functioned, but only has a
bouncing blue box that says, &quot;PLEASE CHECK PC DISPLAY SETTINGS&quot;
Here is a copy of the last 'git bisect visualize'

commit ebb945a94bba2ce8dff7b0942ff2b3f2a52a0a69
Author: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
Date:   Fri Jul 20 08:17:34 2012 +1000

    drm/nouveau: port all engines to new engine module format

    This is a HUGE commit, but it's not nearly as bad as it looks - any
problems
    can be isolated to a particular chipset and engine combination.  It was
    simply too difficult to port each one at a time, the compat layers are
    *already* ridiculous.

    Most of the changes here are simply to the glue, the process for each of
the
    engine modules was to start with a standard skeleton and copy+paste the old
    code into the appropriate places, fixing up variable names etc as needed.

    v2: Marcin Slusarz &lt;<a href="mailto:marcin.slusarz&#64;gmail.com">marcin.slusarz&#64;gmail.com</a>&gt;
    - fix find/replace bug in license header

    v3: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
    - bump indirect pushbuf size to 8KiB, 4KiB barely enough for userspace and
      left no space for kernel's requirements during GEM pushbuf submission.
    - fix duplicate assignments noticed by clang

    v4: Marcin Slusarz &lt;<a href="mailto:marcin.slusarz&#64;gmail.com">marcin.slusarz&#64;gmail.com</a>&gt;
    - add sparse annotations to nv04_fifo_pause/nv04_fifo_start
    - use ioread32_native/iowrite32_native for fifo control registers

    v5: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
    - rebase on v3.6-rc4, modified to keep copy engine fix intact
    - nv10/fence: unmap fence bo before destroying
    - fixed fermi regression when using nvidia gr fuc
    - fixed typo in supported dma_mask checking

    Signed-off-by: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;

Here's my bisect.log
Bisecting: a merge base must be tested
[28a33cbc24e4256c143dce96c7d93bf423229f92] Linux 3.5
Bisecting: 12468 revisions left to test after this (roughly 14 steps)
[06d2fe153b9b35e57221e35831a26918f462db68] Merge tag 'driver-core-3.6' of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core
Bisecting: 6387 revisions left to test after this (roughly 13 steps)
[7f60ba388f5b9dd8b0da463b394412dace3ab814] Merge tag 'for-v3.7' of
git://git.infradead.org/users/cbou/linux-pstore
Bisecting: 3161 revisions left to test after this (roughly 12 steps)
[a20acf99f75e49271381d65db097c9763060a1e8] Merge
git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc-next
Bisecting: 1579 revisions left to test after this (roughly 11 steps)
[ca41cc96b2813221b05af57d0355157924de5a07] Merge branch 'for-v3.7' of
git://git.linaro.org/people/mszyprowski/linux-dma-mapping
Bisecting: 767 revisions left to test after this (roughly 10 steps)
[d66e6737d454553e1e62109d8298ede5351178a4] Merge
git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6
Bisecting: 450 revisions left to test after this (roughly 9 steps)
[df86b5765a48d5f557489577652bd6df145b0e1b] drm/savage: re-add busmaster enable,
regression fix
Bisecting: 218 revisions left to test after this (roughly 8 steps)
[56d92aa5cf7c96c70f81d0350c94faf46a9fb76d] Merge tag
'stable/for-linus-3.7-x86-tag' of
git://git.kernel.org/pub/scm/linux/kernel/git/konrad/xen
Bisecting: 120 revisions left to test after this (roughly 7 steps)
[268d28371cd326be4dfcd7eba5917bf4b9d30c8f] Merge branch 'drm-nouveau-next' of
git://anongit.freedesktop.org/git/nouveau/linux-2.6 into drm-next
Bisecting: 48 revisions left to test after this (roughly 6 steps)
[c4837d27945b9b607b5a7274a33059e73d1a7831] drm/nouveau/core: remove some
left-over pieces from the porting process
Bisecting: 24 revisions left to test after this (roughly 5 steps)
[18c9b959fd8ea6f3602efbedad788f53e305e6f1] drm/nouveau/gpuobj: create wrapper
functions for mapping gpuobj into vm/bar
Bisecting: 12 revisions left to test after this (roughly 4 steps)
[c4afbe74cebf887d3d8e7a11aa93bebcb6a3e2e1] drm/nvc0-/gr: share headers between
fermi and kepler graphics code
Bisecting: 6 revisions left to test after this (roughly 3 steps)
[fce875d647171f9f740587a252fc026aaa421afe] drm/nouveau: move compat ioctl out
of nouveau_drv.h
Bisecting: 2 revisions left to test after this (roughly 2 steps)
[08c770969a45361277d556f9fd3e2d70da42be65] drm/nouveau: start culling unused
code
Bisecting: 0 revisions left to test after this (roughly 1 step)
[ebb945a94bba2ce8dff7b0942ff2b3f2a52a0a69] drm/nouveau: port all engines to new
engine module format
Bisecting: 0 revisions left to test after this (roughly 0 steps)
[ac1499d9573f4aadd1d2beac11fe23af8ce90c24] drm/nvc0-/gr: generate grctx
template at init time, not first context ctor
ebb945a94bba2ce8dff7b0942ff2b3f2a52a0a69 is the first bad commit
commit ebb945a94bba2ce8dff7b0942ff2b3f2a52a0a69
Author: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
Date:   Fri Jul 20 08:17:34 2012 +1000

    drm/nouveau: port all engines to new engine module format

    This is a HUGE commit, but it's not nearly as bad as it looks - any
problems
    can be isolated to a particular chipset and engine combination.  It was
    simply too difficult to port each one at a time, the compat layers are
    *already* ridiculous.

    Most of the changes here are simply to the glue, the process for each of
the
    engine modules was to start with a standard skeleton and copy+paste the old
    code into the appropriate places, fixing up variable names etc as needed.

    v2: Marcin Slusarz &lt;<a href="mailto:marcin.slusarz&#64;gmail.com">marcin.slusarz&#64;gmail.com</a>&gt;
    - fix find/replace bug in license header

    v3: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
    - bump indirect pushbuf size to 8KiB, 4KiB barely enough for userspace and
      left no space for kernel's requirements during GEM pushbuf submission.
    - fix duplicate assignments noticed by clang

    v4: Marcin Slusarz &lt;<a href="mailto:marcin.slusarz&#64;gmail.com">marcin.slusarz&#64;gmail.com</a>&gt;
    - add sparse annotations to nv04_fifo_pause/nv04_fifo_start
    - use ioread32_native/iowrite32_native for fifo control registers

    v5: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
    - rebase on v3.6-rc4, modified to keep copy engine fix intact
    - nv10/fence: unmap fence bo before destroying
    - fixed fermi regression when using nvidia gr fuc
    - fixed typo in supported dma_mask checking

    Signed-off-by: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;

:040000 040000 09b924b6dbe320ada5907dc62230bbbc83137c41
acd1422de149497a4f445c7e0a656e392cc703b3 M    drivers

And lastly, here's the output of dmesg while running 3.9.0-rc3:

[    0.150000] ... max period:             00007fffffffffff
[    0.150000] ... fixed-purpose events:   0
[    0.150000] ... event mask:             000000000000000f
[    0.150000] Brought up 1 CPUs
[    0.150000] smpboot: Total of 1 processors activated (3324.82 BogoMIPS)
[    0.150000] devtmpfs: initialized
[    0.150000] PM: Registering ACPI NVS region [mem 0x0dff0000-0x0dff2fff]
(12288 bytes)
[    0.150000] xor: measuring software checksum speed
[    0.240005]    pIII_sse  :  1613.200 MB/sec
[    0.340003]    prefetch64-sse:  1620.800 MB/sec
[    0.340057] xor: using function: prefetch64-sse (1620.800 MB/sec)
[    0.340206] NET: Registered protocol family 16
[    0.341131] ACPI: bus type PCI registered
[    0.341394] dca service started, version 1.12.1
[    0.368946] PCI: PCI BIOS revision 2.10 entry at 0xfba20, last bus=2
[    0.369003] PCI: Using configuration type 1 for base access
[    0.381642] bio: create slab &lt;bio-0&gt; at 0
[    0.550037] raid6: mmxx1     1335 MB/s
[    0.720013] raid6: mmxx2     2187 MB/s
[    0.890031] raid6: sse1x1    1284 MB/s
[    1.060021] raid6: sse1x2    2078 MB/s
[    1.230035] raid6: int32x1    459 MB/s
[    1.400078] raid6: int32x2    660 MB/s
[    1.570092] raid6: int32x4    472 MB/s
[    1.740036] raid6: int32x8    448 MB/s
[    1.740088] raid6: using algorithm mmxx2 (2187 MB/s)
[    1.740142] raid6: using intx1 recovery algorithm
[    1.740331] ACPI: Added _OSI(Module Device)
[    1.740386] ACPI: Added _OSI(Processor Device)
[    1.740440] ACPI: Added _OSI(3.0 _SCP Extensions)
[    1.740494] ACPI: Added _OSI(Processor Aggregator Device)
[    1.741385] ACPI: EC: Look up EC in DSDT
[    1.744418] ACPI: Interpreter enabled
[    1.744489] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State
[\_S2_] (20130117/hwxface-568)
[    1.744654] ACPI: (supports S0 S1 S3 S4 S5)
[    1.744708] ACPI: Using IOAPIC for interrupt routing
[    1.744898] PCI: Ignoring host bridge windows from ACPI; if necessary, use
&quot;pci=use_crs&quot; and report a bug
[    1.754865] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    1.754945] acpi PNP0A03:00: ACPI _OSC support notification failed,
disabling PCIe ASPM
[    1.755006] acpi PNP0A03:00: Unable to request _OSC control (_OSC support
mask: 0x08)
[    1.755174] acpi PNP0A03:00: host bridge window [io  0x0000-0x0cf7]
(ignored)
[    1.755178] acpi PNP0A03:00: host bridge window [io  0x0d00-0xffff]
(ignored)
[    1.755182] acpi PNP0A03:00: host bridge window [mem 0x000a0000-0x000bffff]
(ignored)
[    1.755185] acpi PNP0A03:00: host bridge window [mem 0x000c0000-0x000dffff]
(ignored)
[    1.755188] acpi PNP0A03:00: host bridge window [mem 0x0e000000-0xffefffff]
(ignored)
[    1.755192] PCI: root bus 00: using default resources
[    1.755199] acpi PNP0A03:00: fail to add MMCONFIG information, can't access
extended PCI configuration space under this bridge.
[    1.755356] PCI host bridge to bus 0000:00
[    1.755416] pci_bus 0000:00: root bus resource [bus 00-ff]
[    1.755473] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
[    1.755531] pci_bus 0000:00: root bus resource [mem 0x00000000-0xffffffff]
[    1.755606] pci 0000:00:00.0: [10de:01a4] type 00 class 0x060000
[    1.755620] pci 0000:00:00.0: reg 10: [mem 0xe8000000-0xebffffff pref]
[    1.755826] pci 0000:00:00.1: [10de:01ac] type 00 class 0x050000
[    1.756006] pci 0000:00:00.2: [10de:01ad] type 00 class 0x050000
[    1.756181] pci 0000:00:00.3: [10de:01aa] type 00 class 0x050000
[    1.756365] pci 0000:00:01.0: [10de:01b2] type 00 class 0x060100
[    1.756557] pci 0000:00:01.1: [10de:01b4] type 00 class 0x0c0500
[    1.756574] pci 0000:00:01.1: reg 10: [io  0x5000-0x500f]
[    1.756584] pci 0000:00:01.1: reg 14: [io  0x5020-0x502f]
[    1.756594] pci 0000:00:01.1: reg 18: [io  0x6000-0x601f]
[    1.756647] pci 0000:00:01.1: PME# supported from D3hot D3cold
[    1.756787] pci 0000:00:02.0: [10de:01c2] type 00 class 0x0c0310
[    1.756805] pci 0000:00:02.0: reg 10: [mem 0xee183000-0xee183fff]
[    1.756869] pci 0000:00:02.0: supports D1 D2
[    1.756872] pci 0000:00:02.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.756912] pci 0000:00:02.0: System wakeup disabled by ACPI
[    1.757071] pci 0000:00:03.0: [10de:01c2] type 00 class 0x0c0310
[    1.757089] pci 0000:00:03.0: reg 10: [mem 0xee181000-0xee181fff]
[    1.757153] pci 0000:00:03.0: supports D1 D2
[    1.757156] pci 0000:00:03.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.757194] pci 0000:00:03.0: System wakeup disabled by ACPI
[    1.757356] pci 0000:00:04.0: [10de:01c3] type 00 class 0x020000
[    1.757373] pci 0000:00:04.0: reg 10: [mem 0xee182000-0xee1823ff]
[    1.757383] pci 0000:00:04.0: reg 14: [io  0xd800-0xd807]
[    1.757441] pci 0000:00:04.0: supports D1 D2
[    1.757444] pci 0000:00:04.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.757488] pci 0000:00:04.0: System wakeup disabled by ACPI
[    1.757649] pci 0000:00:05.0: [10de:01b0] type 00 class 0x040100
[    1.757666] pci 0000:00:05.0: reg 10: [mem 0xee100000-0xee17ffff]
[    1.757730] pci 0000:00:05.0: supports D1 D2
[    1.757857] pci 0000:00:06.0: [10de:01b1] type 00 class 0x040100
[    1.757874] pci 0000:00:06.0: reg 10: [io  0xdc00-0xdcff]
[    1.757884] pci 0000:00:06.0: reg 14: [io  0xe000-0xe07f]
[    1.757894] pci 0000:00:06.0: reg 18: [mem 0xee180000-0xee180fff]
[    1.757945] pci 0000:00:06.0: supports D1 D2
[    1.758075] pci 0000:00:08.0: [10de:01b8] type 01 class 0x060400
[    1.758129] pci 0000:00:08.0: System wakeup disabled by ACPI
[    1.758289] pci 0000:00:09.0: [10de:01bc] type 00 class 0x01018a
[    1.758332] pci 0000:00:09.0: reg 20: [io  0xe800-0xe80f]
[    1.758504] pci 0000:00:1e.0: [10de:01b7] type 01 class 0x060400
[    1.758730] pci 0000:01:02.0: [11c1:044e] type 00 class 0x078000
[    1.758753] pci 0000:01:02.0: reg 10: [mem 0xee000000-0xee0000ff]
[    1.758766] pci 0000:01:02.0: reg 14: [io  0xc000-0xc007]
[    1.758779] pci 0000:01:02.0: reg 18: [io  0xc400-0xc4ff]
[    1.758850] pci 0000:01:02.0: supports D2
[    1.758853] pci 0000:01:02.0: PME# supported from D2 D3hot D3cold
[    1.758998] pci 0000:00:08.0: PCI bridge to [bus 01]
[    1.759058] pci 0000:00:08.0:   bridge window [io  0xc000-0xcfff]
[    1.759064] pci 0000:00:08.0:   bridge window [mem 0xee000000-0xee0fffff]
[    1.759157] pci 0000:02:00.0: [10de:01a0] type 00 class 0x030000
[    1.759175] pci 0000:02:00.0: reg 10: [mem 0xec000000-0xecffffff]
[    1.759185] pci 0000:02:00.0: reg 14: [mem 0xe0000000-0xe7ffffff pref]
[    1.759221] pci 0000:02:00.0: reg 30: [mem 0x00000000-0x0000ffff pref]
[    1.759382] pci 0000:00:1e.0: PCI bridge to [bus 02]
[    1.759442] pci 0000:00:1e.0:   bridge window [mem 0xec000000-0xedffffff]
[    1.759447] pci 0000:00:1e.0:   bridge window [mem 0xe0000000-0xe7ffffff
pref]
[    1.759460] pci_bus 0000:00: on NUMA node 0
[    1.759462] ACPI _OSC control for PCIe not granted, disabling ASPM
[    1.759747] ACPI: PCI Interrupt Link [LNK1] (IRQs *16), disabled.
[    1.760088] ACPI: PCI Interrupt Link [LNK2] (IRQs *18), disabled.
[    1.760392] ACPI: PCI Interrupt Link [LNK3] (IRQs *18)
[    1.760654] ACPI: PCI Interrupt Link [LNK4] (IRQs *19), disabled.
[    1.760956] ACPI: PCI Interrupt Link [LNK5] (IRQs *16)
[    1.761228] ACPI: PCI Interrupt Link [LUBA] (IRQs *20)
[    1.761488] ACPI: PCI Interrupt Link [LUBB] (IRQs *21)
[    1.761748] ACPI: PCI Interrupt Link [LMAC] (IRQs *22), disabled.
[    1.762049] ACPI: PCI Interrupt Link [LAPU] (IRQs *20)
[    1.762308] ACPI: PCI Interrupt Link [LACI] (IRQs *21)
[    1.762574] ACPI: PCI Interrupt Link [LMCI] (IRQs *22), disabled.
[    1.762874] ACPI: PCI Interrupt Link [LUSB] (IRQs 3 4 5 6 7 10 11 12 14 15)
*0
[    1.763557] ACPI: PCI Interrupt Link [LSMB] (IRQs *22)
[    1.764625] acpi root: \_SB_.PCI0 notify handler is installed
[    1.764661] Found 1 acpi root devices
[    1.765026] vgaarb: device added:
PCI:0000:02:00.0,decodes=io+mem,owns=io+mem,locks=none
[    1.765087] vgaarb: loaded
[    1.765138] vgaarb: bridge control possible 0000:02:00.0
[    1.765484] SCSI subsystem initialized
[    1.765541] ACPI: bus type ATA registered
[    1.765778] libata version 3.00 loaded.
[    1.765796] ACPI: bus type USB registered
[    1.765996] usbcore: registered new interface driver usbfs
[    1.766113] usbcore: registered new interface driver hub
[    1.766243] usbcore: registered new device driver usb
[    1.766600] EDAC MC: Ver: 3.0.0
[    1.766921] Advanced Linux Sound Architecture Driver Initialized.
[    1.767039] PCI: Using ACPI for IRQ routing
[    1.767100] PCI: pci_cache_line_size set to 32 bytes
[    1.767150] e820: reserve RAM buffer [mem 0x0dff0000-0x0fffffff]
[    1.767606] Switching to clocksource refined-jiffies
[    1.773267] pnp: PnP ACPI init
[    1.773355] ACPI: bus type PNP registered
[    1.773821] system 00:00: [mem 0x000f0000-0x000f3fff] could not be reserved
[    1.773882] system 00:00: [mem 0x000f4000-0x000f7fff] could not be reserved
[    1.773942] system 00:00: [mem 0x000f8000-0x000fbfff] could not be reserved
[    1.774001] system 00:00: [mem 0x000fc000-0x000fffff] could not be reserved
[    1.774060] system 00:00: [mem 0x0dff0000-0x0dffffff] could not be reserved
[    1.774120] system 00:00: [mem 0xffb00000-0xffffffff] has been reserved
[    1.774178] system 00:00: [mem 0x00000000-0x0009ffff] could not be reserved
[    1.774238] system 00:00: [mem 0x00100000-0x0dfeffff] could not be reserved
[    1.778505] system 00:00: [mem 0xfec00000-0xfec00fff] could not be reserved
[    1.778565] system 00:00: [mem 0xfee00000-0xfee00fff] has been reserved
[    1.778626] system 00:00: Plug and Play ACPI device, IDs PNP0c01 (active)
[    1.778814] system 00:01: [io  0x4000-0x40fe] has been reserved
[    1.778873] system 00:01: [io  0x40ff] has been reserved
[    1.778931] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
[    1.779320] system 00:02: [io  0x0b78-0x0b7b] has been reserved
[    1.779380] system 00:02: [io  0x0f78-0x0f7b] has been reserved
[    1.779438] system 00:02: [io  0x0a78-0x0a7b] has been reserved
[    1.779495] system 00:02: [io  0x0e78-0x0e7b] has been reserved
[    1.779553] system 00:02: [io  0x0bbc-0x0bbf] has been reserved
[    1.779610] system 00:02: [io  0x0fbc-0x0fbf] has been reserved
[    1.779668] system 00:02: [io  0x04d0-0x04d1] has been reserved
[    1.779725] system 00:02: [io  0x0294-0x0297] has been reserved
[    1.779784] system 00:02: Plug and Play ACPI device, IDs PNP0c02 (active)
[    1.779807] pnp 00:03: [dma 4]
[    1.779891] pnp 00:03: Plug and Play ACPI device, IDs PNP0200 (active)
[    1.780043] pnp 00:04: Plug and Play ACPI device, IDs PNP0b00 (active)
[    1.780135] pnp 00:05: Plug and Play ACPI device, IDs PNP0800 (active)
[    1.780237] pnp 00:06: Plug and Play ACPI device, IDs PNP0c04 (active)
[    1.780416] pnp 00:07: [dma 2]
[    1.780520] pnp 00:07: Plug and Play ACPI device, IDs PNP0700 (active)
[    1.780884] pnp 00:08: Plug and Play ACPI device, IDs PNP0501 (active)
[    1.781450] pnp 00:09: [dma 3]
[    1.781581] pnp 00:09: Plug and Play ACPI device, IDs PNP0401 (active)
[    1.781730] pnp 00:0a: Plug and Play ACPI device, IDs PNP0f13 (active)
[    1.781856] pnp 00:0b: Plug and Play ACPI device, IDs PNP0303 (active)
[    1.782161] pnp 00:0c: Plug and Play ACPI device, IDs PNPb02f (active)
[    1.782503] pnp 00:0d: Plug and Play ACPI device, IDs PNPb006 (active)
[    1.782517] pnp: PnP ACPI: found 14 devices
[    1.782573] ACPI: bus type PNP unregistered
[    1.823271] Switching to clocksource acpi_pm
[    1.823404] pci 0000:00:08.0: PCI bridge to [bus 01]
[    1.823463] pci 0000:00:08.0:   bridge window [io  0xc000-0xcfff]
[    1.823525] pci 0000:00:08.0:   bridge window [mem 0xee000000-0xee0fffff]
[    1.823599] pci 0000:02:00.0: BAR 6: assigned [mem 0xed000000-0xed00ffff
pref]
[    1.823660] pci 0000:00:1e.0: PCI bridge to [bus 02]
[    1.823719] pci 0000:00:1e.0:   bridge window [mem 0xec000000-0xedffffff]
[    1.823779] pci 0000:00:1e.0:   bridge window [mem 0xe0000000-0xe7ffffff
pref]
[    1.823858] pci 0000:00:08.0: setting latency timer to 64
[    1.823868] pci_bus 0000:00: resource 4 [io  0x0000-0xffff]
[    1.823872] pci_bus 0000:00: resource 5 [mem 0x00000000-0xffffffff]
[    1.823875] pci_bus 0000:01: resource 0 [io  0xc000-0xcfff]
[    1.823879] pci_bus 0000:01: resource 1 [mem 0xee000000-0xee0fffff]
[    1.823883] pci_bus 0000:02: resource 1 [mem 0xec000000-0xedffffff]
[    1.823886] pci_bus 0000:02: resource 2 [mem 0xe0000000-0xe7ffffff pref]
[    1.823968] NET: Registered protocol family 2
[    1.824348] TCP established hash table entries: 2048 (order: 2, 16384 bytes)
[    1.824446] TCP bind hash table entries: 2048 (order: 2, 16384 bytes)
[    1.824537] TCP: Hash tables configured (established 2048 bind 2048)
[    1.824685] TCP: reno registered
[    1.824741] UDP hash table entries: 256 (order: 1, 8192 bytes)
[    1.824810] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes)
[    1.824973] NET: Registered protocol family 1
[    1.825357] ACPI: PCI Interrupt Link [LUBA] enabled at IRQ 20
[    1.900358] ACPI: PCI Interrupt Link [LUBB] enabled at IRQ 21
[    1.900568] pci 0000:02:00.0: Boot video device
[    1.900573] PCI: CLS 0 bytes, default 32
[    1.900832] apm: BIOS version 1.2 Flags 0x07 (Driver version 1.16ac)
[    1.900890] apm: overridden by ACPI.
[    1.901567] audit: initializing netlink socket (disabled)
[    1.901650] type=2000 audit(1365740499.899:1): initialized
[    1.957794] HugeTLB registered 4 MB page size, pre-allocated 0 pages
[    1.957944] VFS: Disk quotas dquot_6.5.2
[    1.958038] Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
[    1.958401] msgmni has been set to 428
[    1.958745] async_tx: api initialized (async)
[    1.958896] Block layer SCSI generic (bsg) driver version 0.4 loaded (major
253)
[    1.958957] io scheduler noop registered
[    1.959010] io scheduler deadline registered
[    1.959070] io scheduler cfq registered (default)
[    1.960993] isapnp: Scanning for PnP cards...
[    2.317843] isapnp: No Plug &amp; Play device found
[    2.317899] ioatdma: Intel(R) QuickData Technology Driver 4.00
[    2.318165] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    2.338919] 00:08: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
[    2.339997] Generic RTC Driver v1.07
[    2.340209] Linux agpgart interface v0.103
[    2.340284] agpgart: Detected NVIDIA nForce chipset
[    2.345379] agpgart-nvidia 0000:00:00.0: AGP aperture is 64M &#64; 0xe8000000
[    2.349184] brd: module loaded
[    2.351274] loop: module loaded
[    2.351335] Loading iSCSI transport class v2.0-870.
[    2.351813] iscsi: registered transport (tcp)
[    2.352167] pata_amd 0000:00:09.0: version 0.4.1
[    2.352303] pata_amd 0000:00:09.0: setting latency timer to 64
[    2.353067] scsi0 : pata_amd
[    2.353733] scsi1 : pata_amd
[    2.354219] ata1: PATA max UDMA/100 cmd 0x1f0 ctl 0x3f6 bmdma 0xe800 irq 14
[    2.354279] ata2: PATA max UDMA/100 cmd 0x170 ctl 0x376 bmdma 0xe808 irq 15
[    2.357417] Failed to ioremap_nocache
[    2.357510] forcedeth: Reverse Engineered nForce ethernet driver. Version
0.64.
[    2.357871] ACPI: PCI Interrupt Link [LMAC] enabled at IRQ 22
[    2.357967] forcedeth 0000:00:04.0: setting latency timer to 64
[    2.530682] ata1.00: ATA-6: Maxtor 4D060H3, DAH017K0, max UDMA/100
[    2.530750] ata1.00: 120069936 sectors, multi 16: LBA 
[    2.530816] ata1: nv_mode_filter: 0x3f39f&amp;0x3f39f-&gt;0x3f39f, BIOS=0x3f000
(0xc600c0c0) ACPI=0x3f01f (20:600:0x13)
[    2.570589] ata1.00: configured for UDMA/100
[    2.570904] scsi 0:0:0:0: Direct-Access     ATA      Maxtor 4D060H3   DAH0
PQ: 0 ANSI: 5
[    2.571489] sd 0:0:0:0: [sda] 120069936 512-byte logical blocks: (61.4
GB/57.2 GiB)
[    2.571640] sd 0:0:0:0: [sda] Write Protect is off
[    2.571697] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    2.571738] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled,
doesn't support DPO or FUA
[    2.632223]  sda: sda1 sda2 sda3 sda4 &lt; sda5 sda6 &gt;
[    2.633357] sd 0:0:0:0: [sda] Attached SCSI disk
[    2.880642] forcedeth 0000:00:04.0: ifname eth0, PHY OUI 0x57d &#64; 1, addr
00:10:dc:3a:d6:d6
[    2.880706] forcedeth 0000:00:04.0: timirq lnktim desc-v1
[    2.881018] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    2.881322] ohci_hcd 0000:00:02.0: setting latency timer to 64
[    2.881327] ohci_hcd 0000:00:02.0: OHCI Host Controller
[    2.881398] ohci_hcd 0000:00:02.0: new USB bus registered, assigned bus
number 1
[    2.881519] ohci_hcd 0000:00:02.0: irq 20, io mem 0xee183000
[    2.900023] tsc: Refined TSC clocksource calibration: 1662.375 MHz
[    2.900086] Switching to clocksource tsc
[    2.930374] ata2.00: ATAPI: CR-48X9TE, 5.0E, max UDMA/33
[    2.930445] ata2.01: ATAPI: LITEON  DVD-ROM LTD163, GKS3, max UDMA/33
[    2.930511] ata2: nv_mode_filter: 0x739f&amp;0x739f-&gt;0x739f, BIOS=0x7000
(0xc600c0c0) ACPI=0x701f (60:60:0x1f)
[    2.930517] ata2: nv_mode_filter: 0x739f&amp;0x739f-&gt;0x739f, BIOS=0x7000
(0xc600c0c0) ACPI=0x701f (60:60:0x1f)
[    2.942051] usb usb1: New USB device found, idVendor=1d6b, idProduct=0001
[    2.942112] usb usb1: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    2.942171] usb usb1: Product: OHCI Host Controller
[    2.942226] usb usb1: Manufacturer: Linux 3.9.0-rc3 ohci_hcd
[    2.942282] usb usb1: SerialNumber: 0000:00:02.0
[    2.942666] hub 1-0:1.0: USB hub found
[    2.942729] hub 1-0:1.0: 4 ports detected
[    2.943030] ohci_hcd 0000:00:03.0: setting latency timer to 64
[    2.943035] ohci_hcd 0000:00:03.0: OHCI Host Controller
[    2.943100] ohci_hcd 0000:00:03.0: new USB bus registered, assigned bus
number 2
[    2.943213] ohci_hcd 0000:00:03.0: irq 21, io mem 0xee181000
[    2.970336] ata2.00: configured for UDMA/33
[    2.990295] ata2.01: configured for UDMA/33
[    2.995463] scsi 1:0:0:0: CD-ROM            MITSUMI  CR-48X9TE        5.0E
PQ: 0 ANSI: 5
[    2.999039] sr0: scsi3-mmc drive: 40x/40x writer cd/rw xa/form2 cdda tray
[    2.999100] cdrom: Uniform CD-ROM driver Revision: 3.20
[    2.999450] sr 1:0:0:0: Attached scsi CD-ROM sr0
[    3.002089] usb usb2: New USB device found, idVendor=1d6b, idProduct=0001
[    3.002154] usb usb2: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    3.002213] usb usb2: Product: OHCI Host Controller
[    3.002269] usb usb2: Manufacturer: Linux 3.9.0-rc3 ohci_hcd
[    3.002325] usb usb2: SerialNumber: 0000:00:03.0
[    3.002754] scsi 1:0:1:0: CD-ROM            LITEON   DVD-ROM LTD163   GKS3
PQ: 0 ANSI: 5
[    3.003121] hub 2-0:1.0: USB hub found
[    3.003189] hub 2-0:1.0: 2 ports detected
[    3.003580] uhci_hcd: USB Universal Host Controller Interface driver
[    3.004196] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at
0x60,0x64 irq 1,12
[    3.004356] sr1: scsi3-mmc drive: 0x/48x cd/rw xa/form2 cdda tray
[    3.006865] serio: i8042 KBD port at 0x60,0x64 irq 1
[    3.006927] serio: i8042 AUX port at 0x60,0x64 irq 12
[    3.007158] sr 1:0:1:0: Attached scsi CD-ROM sr1
[    3.007961] mousedev: PS/2 mouse device common for all mice
[    3.008498] md: raid0 personality registered for level 0
[    3.008554] md: raid1 personality registered for level 1
[    3.008609] md: raid6 personality registered for level 6
[    3.008664] md: raid5 personality registered for level 5
[    3.008718] md: raid4 personality registered for level 4
[    3.008843] cpuidle: using governor ladder
[    3.009007] hidraw: raw HID events driver (C) Jiri Kosina
[    3.009726] ACPI: PCI Interrupt Link [LACI] enabled at IRQ 21
[    3.009843] snd_intel8x0 0000:00:06.0: setting latency timer to 64
[    3.037022] input: AT Translated Set 2 keyboard as
/devices/platform/i8042/serio0/input/input0
[    3.690015] intel8x0_measure_ac97_clock: measured 50869 usecs (2472 samples)
[    3.690083] intel8x0: clocking to 47412
[    3.691438] TCP: cubic registered
[    3.691499] NET: Registered protocol family 17
[    3.691588] Key type dns_resolver registered
[    3.691968] Using IPI No-Shortcut mode
[    3.692303] registered taskstats version 1
[    3.692767] ALSA device list:
[    3.692820]   #0: NVidia nForce with AD1885 at irq 21
[    4.189980] input: ImPS/2 Logitech Wheel Mouse as
/devices/platform/i8042/serio1/input/input1
[    4.199122] md: Waiting for all devices to be available before autodetect
[    4.199180] md: If you don't use raid, use raid=noautodetect
[    4.199591] md: Autodetecting RAID arrays.
[    4.199645] md: Scanned 0 and added 0 devices.
[    4.199698] md: autorun ...
[    4.199748] md: ... autorun DONE.
[    4.209102] EXT3-fs (sda6): error: couldn't mount because of unsupported
optional features (240)
[    4.209559] EXT2-fs (sda6): error: couldn't mount because of unsupported
optional features (240)
[    4.238188] EXT4-fs (sda6): mounted filesystem with ordered data mode. Opts:
(null)
[    4.238277] VFS: Mounted root (ext4 filesystem) readonly on device 8:6.
[    4.238386] Freeing unused kernel memory: 448k freed
[    8.506418] systemd-udevd[851]: starting version 200
[    9.984687] input: Power Button as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input2
[    9.985175] ACPI: Power Button [PWRB]
[    9.985325] input: Power Button as
/devices/LNXSYSTM:00/LNXPWRBN:00/input/input3
[    9.985391] ACPI: Power Button [PWRF]
[   10.093119] thermal LNXTHERM:00: registered as thermal_zone0
[   10.093125] ACPI: Thermal Zone [THRM] (65 C)
[   10.110143] gameport gameport0: NS558 PnP Gameport is pnp00:0c/gameport0, io
0x201, speed 727kHz
[   10.220285] pci_hotplug: PCI Hot Plug PCI Core version: 0.5
[   10.279757] ACPI: Fan [FAN] (on)
[   10.357136] Floppy drive(s): fd0 is 1.44M
[   10.373804] FDC 0 is a post-1991 82077
[   10.477084] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[   10.598973] systemd-udevd[869]: renamed network interface eth0 to enp0s4
[   11.229567] [drm] Initialized drm 1.1.0 20060810
[   11.432424] wmi: Mapper loaded
[   11.958597] ACPI: PCI Interrupt Link [LNK5] enabled at IRQ 16
[   11.961851] nouveau  [  DEVICE][0000:02:00.0] BOOT0  : 0x01a000b1
[   11.961860] nouveau  [  DEVICE][0000:02:00.0] Chipset: nForce (NV1A)
[   11.961863] nouveau  [  DEVICE][0000:02:00.0] Family : NV10
[   11.963302] nouveau  [   VBIOS][0000:02:00.0] checking PRAMIN for image...
[   12.006595] nouveau  [   VBIOS][0000:02:00.0] ... checksum invalid
[   12.006599] nouveau  [   VBIOS][0000:02:00.0] checking PROM for image...
[   12.006616] nouveau  [   VBIOS][0000:02:00.0] ... signature not found
[   12.006619] nouveau  [   VBIOS][0000:02:00.0] checking ACPI for image...
[   12.006622] nouveau  [   VBIOS][0000:02:00.0] ... signature not found
[   12.006625] nouveau  [   VBIOS][0000:02:00.0] checking PCIROM for image...
[   12.009117] nouveau  [   VBIOS][0000:02:00.0] ... appears to be valid
[   12.009120] nouveau  [   VBIOS][0000:02:00.0] using image from PCIROM
[   12.009127] nouveau  [   VBIOS][0000:02:00.0] BMP version 5.14
[   12.010230] nouveau  [   VBIOS][0000:02:00.0] version 03.1a.01.03.00
[   12.010243] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[   12.010326] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[   12.010361] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[   12.010364] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[   12.010422] nouveau W[  PTIMER][0000:02:00.0] unknown input clock freq
[   12.010438] nouveau  [     PFB][0000:02:00.0] RAM type: stolen system memory
[   12.010442] nouveau  [     PFB][0000:02:00.0] RAM size: 32 MiB
[   12.010444] nouveau  [     PFB][0000:02:00.0]    ZCOMP: 0 tags
[   12.016149] agpgart-nvidia 0000:00:00.0: AGP 2.0 bridge
[   12.016169] agpgart-nvidia 0000:00:00.0: putting AGP V2 device into 4x mode
[   12.016223] nouveau 0000:02:00.0: putting AGP V2 device into 4x mode
[   12.026481] [TTM] Zone  kernel: Available graphics memory: 110016 kiB
[   12.026486] [TTM] Initializing pool allocator
[   12.026737] nouveau  [     DRM] VRAM: 31 MiB
[   12.026744] nouveau  [     DRM] GART: 64 MiB
[   12.026749] nouveau  [     DRM] BMP version 5.20
[   12.026754] nouveau W[     DRM] No useful DCB data in VBIOS
[   12.029405] nouveau  [     DRM] Saving VGA fonts
[   12.084820] nouveau W[     DRM] No useful DCB data in VBIOS
[   12.085707] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[   12.085710] [drm] No driver support for vblank timestamp query.
[   12.085834] nouveau  [     DRM] 0xAFD8: Parsing digital output script table
[   12.086071] nouveau  [     DRM] 0 available performance level(s)
[   12.086077] nouveau  [     DRM] c: core 305MHz memory 0MHz
[   12.088127] nouveau  [     DRM] MM: using M2MF for buffer copies
[   12.277591] nouveau  [     DRM] allocated 1024x768 fb: 0x5000, bo cdbd8000
[   12.278077] fbcon: nouveaufb (fb0) is primary device
[   12.292766] Console: switching to colour frame buffer device 128x48
[   12.293502] nouveau 0000:02:00.0: fb0: nouveaufb frame buffer device
[   12.293505] nouveau 0000:02:00.0: registered panic notifier
[   12.293513] [drm] Initialized nouveau 1.1.0 20120801 for 0000:02:00.0 on
minor 0
[   15.128777] EXT4-fs (sda6): re-mounted. Opts: (null)
[   15.444138] Adding 511996k swap on /dev/sda5.  Priority:-1 extents:1
across:511996k 
[   26.616135] RPC: Registered named UNIX socket transport module.
[   26.616141] RPC: Registered udp transport module.
[   26.616142] RPC: Registered tcp transport module.
[   26.616144] RPC: Registered tcp NFSv4.1 backchannel transport module.
[   26.655187] NFS: Registering the id_resolver key type
[   26.655218] Key type id_resolver registered
[   26.655220] Key type id_legacy registered
[   33.890249] tun: Universal TUN/TAP device driver, 1.6
[   33.890254] tun: (C) 1999-2004 Max Krasnyansky &lt;<a href="mailto:maxk&#64;qualcomm.com">maxk&#64;qualcomm.com</a>&gt;
[  154.120983] NET: Registered protocol family 10
[  179.573879] Installing knfsd (copyright (C) 1996 <a href="mailto:okir&#64;monad.swb.de">okir&#64;monad.swb.de</a>).
[  179.888986] NFSD: Using /var/lib/nfs/v4recovery as the NFSv4 state recovery
directory
[  179.903840] NFSD: starting 90-second grace period (net c070dec0)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1365785943.c6031.19687--

--===============0694900830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0694900830==--
