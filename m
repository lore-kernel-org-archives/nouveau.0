From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31644] Nouveau driver with "Gigabyte nVidia 9600GT"
 - black screen
Date: Tue, 16 Nov 2010 16:17:12 -0800 (PST)
Message-ID: <20101117001712.9849113000D@annarchy.freedesktop.org>
References: <bug-31644-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-31644-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=31644

--- Comment #2 from miko1992-UAhLvdtLeS4k+I/owrrOrA@public.gmane.org 2010-11-16 16:17:12 PST ---
Thank you for response, Ben!

So, I've tried with the git version, booting without drm:

Nov 17 02:25:34 localhost kernel: Initializing cgroup subsys cpuset
Nov 17 02:25:34 localhost kernel: Initializing cgroup subsys cpu
Nov 17 02:25:34 localhost kernel: Linux version
2.6.37-rc2-ARCH-01122-g657cfc3-dirty (user@linux) (gcc version 4.5.1 (GCC) ) #1
SMP PREEMPT Wed Nov 17 01:54:37 AMT 2010
Nov 17 02:25:34 localhost kernel: Command line:
cryptdevice=/dev/disk/by-uuid/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx:dmroot
root=/dev/mapper/dmroot ro
...
...
...
Nov 17 02:25:34 localhost init: Entering runlevel: 3
Nov 17 02:25:36 localhost kernel: w83627ehf: Found W83627DHG chip at 0x290
Nov 17 02:25:36 localhost kernel: ACPI: resource w83627ehf [io  0x0295-0x0296]
conflicts with ACPI region HWRE [??? 0x00000290-0x00000299 flags
0xffff88012fd56018]
Nov 17 02:25:36 localhost kernel: ACPI: If an ACPI driver is available for this
device, you should use it instead of the native driver
...
...
...
###########!!! Here I did "startx" with the driver "nv" in the screen section
of the X configuration file, strange bug with the new kernel:

Nov 17 02:25:47 localhost kernel: ------------[ cut here ]------------
Nov 17 02:25:47 localhost kernel: WARNING: at drivers/pci/pci-sysfs.c:758
pci_mmap_resource.clone.8+0x156/0x1a0()
Nov 17 02:25:47 localhost kernel: Hardware name: P5KC
Nov 17 02:25:47 localhost kernel: process "X" tried to map 0x01000000 bytes at
page 0x00000000 on 0000:01:00.0 BAR 0 (start 0x        fd000000, size 0x       
 1000000)
Nov 17 02:25:47 localhost kernel: Modules linked in: hwmon_vid coretemp
iptable_mangle iptable_nat nf_nat ipt_REJECT ipt_LOG xt_tcpudp
nf_conntrack_ipv4 nf_defrag_ipv4 xt_state nf_conntrack xt_limit iptable_filter
ip_tables x_tables snd_seq_dummy snd_seq_oss snd_seq_midi_event snd_seq
snd_seq_device snd_hda_codec_realtek snd_pcm_oss snd_mixer_oss snd_hda_intel
snd_hda_codec snd_hwdep snd_pcm snd_timer snd soundcore snd_page_alloc i2c_i801
i2c_core intel_agp intel_gtt atl1 mii asus_atk0110 ne2k_pci 8390 pcspkr sg
processor button iTCO_wdt iTCO_vendor_support shpchp pci_hotplug serio_raw
evdev joydev rtc_cmos rtc_core rtc_lib xfs exportfs cryptd aes_x86_64
aes_generic xts gf128mul dm_crypt dm_mod usbhid hid sr_mod cdrom sd_mod
pata_acpi ahci ata_piix pata_jmicron libahci uhci_hcd libata scsi_mod ehci_hcd
usbcore
Nov 17 02:25:47 localhost kernel: Pid: 2897, comm: X Not tainted
2.6.37-rc2-ARCH-01122-g657cfc3-dirty #1
Nov 17 02:25:47 localhost kernel: Call Trace:
Nov 17 02:25:47 localhost kernel: [<ffffffff8105500a>]
warn_slowpath_common+0x7a/0xb0
Nov 17 02:25:47 localhost kernel: [<ffffffff810550e1>]
warn_slowpath_fmt+0x41/0x50
Nov 17 02:25:47 localhost kernel: [<ffffffff811962c1>] ?
sysfs_permission+0x51/0x60
Nov 17 02:25:47 localhost kernel: [<ffffffff811fafc6>]
pci_mmap_resource.clone.8+0x156/0x1a0
Nov 17 02:25:47 localhost kernel: [<ffffffff811fb028>]
pci_mmap_resource_uc+0x18/0x20
Nov 17 02:25:47 localhost kernel: [<ffffffff811997ac>] mmap+0x7c/0x120
Nov 17 02:25:47 localhost kernel: [<ffffffff8110b582>] mmap_region+0x322/0x460
Nov 17 02:25:47 localhost kernel: [<ffffffff8110ba04>]
do_mmap_pgoff+0x344/0x380
Nov 17 02:25:47 localhost kernel: [<ffffffff8110bb10>]
sys_mmap_pgoff+0xd0/0x180
Nov 17 02:25:47 localhost kernel: [<ffffffff8112ddc5>] ? do_sys_open+0xe5/0x110
Nov 17 02:25:47 localhost kernel: [<ffffffff81010479>] sys_mmap+0x29/0x30
Nov 17 02:25:47 localhost kernel: [<ffffffff8100af82>]
system_call_fastpath+0x16/0x1b
Nov 17 02:25:47 localhost kernel: ---[ end trace 17542391edae274f ]---
...
...
...
############## And here I've changed the "nv" to "nouveau" and did startx
again, the same black screen :(
Nov 17 02:27:10 localhost kernel: [drm] Initialized drm 1.1.0 20060810
Nov 17 02:27:10 localhost kernel: nouveau 0000:01:00.0: PCI INT A -> GSI 16
(level, low) -> IRQ 16
Nov 17 02:27:10 localhost kernel: nouveau 0000:01:00.0: setting latency timer
to 64
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0: Detected an NV50
generation card (0x094100a1)
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0: Attempting to
load BIOS image from PRAMIN
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0: ... appears to be
valid
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0: BIT BIOS found
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0: Bios version
62.94.11.00
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0: TMDS table
version 2.0
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0: Found Display
Configuration Block version 4.0
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0: Raw DCB entry 0:
02000300 00000028
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0: Raw DCB entry 1:
01000302 00020030
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0: Raw DCB entry 2:
04011310 00000028
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0: Raw DCB entry 3:
02011312 00000030
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0: Raw DCB entry 4:
010223f1 00c0c080
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0: DCB connector
table: VHER 0x40 5 16 4
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0:   0: 0x00001030:
type 0x30 idx 0 tag 0x07
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0:   1: 0x00002130:
type 0x30 idx 1 tag 0x08
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0:   2: 0x00000210:
type 0x10 idx 2 tag 0xff
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0:   3: 0x00000211:
type 0x11 idx 3 tag 0xff
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0:   4: 0x00000213:
type 0x13 idx 4 tag 0xff
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS
init table 0 at offset 0xCE32
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS
init table 1 at offset 0xD21B
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS
init table 2 at offset 0xE176
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS
init table 3 at offset 0xE2A5
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS
init table 4 at offset 0xE4B5
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS
init table at offset 0xE51A
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0: 0xE51A: Condition
still not met after 20ms, skipping following opcodes
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0: 2 available
performance level(s)
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0: 2: memory 750MHz
core 450MHz shader 1200MHz fanspeed 100%
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0: 3: memory 900MHz
core 650MHz shader 1625MHz fanspeed 100%
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0: c: memory 499MHz
core 500MHz shader 1250MHz voltage 1050mV
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0: Detected 512MiB
VRAM
Nov 17 02:27:10 localhost kernel: [TTM] Zone  kernel: Available graphics
memory: 2027304 kiB.
Nov 17 02:27:10 localhost kernel: [TTM] Initializing pool allocator.
Nov 17 02:27:10 localhost kernel: mtrr: type mismatch for d0000000,10000000
old: write-back new: write-combining
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0: 512 MiB GART
(aperture)
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0: DCB encoder 1
unknown
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0: TV-1 has no
encoders, removing
Nov 17 02:27:10 localhost kernel: [drm] nouveau 0000:01:00.0: allocated
1440x900 fb: 0x40280000, bo ffff8801262d1000
Nov 17 02:27:10 localhost kernel: Console: switching to colour frame buffer
device 180x56
Nov 17 02:27:10 localhost kernel: fb0: nouveaufb frame buffer device
Nov 17 02:27:10 localhost kernel: drm: registered panic notifier
Nov 17 02:27:10 localhost kernel: [drm] Initialized nouveau 0.0.16 20090420 for
0000:01:00.0 on minor 0




And please don't tell me this is outdated Nouveau because of this "20090420"
string, here it is in the latest sources at line 33 atm:
http://cgit.freedesktop.org/nouveau/linux-2.6/tree/drivers/gpu/drm/nouveau/nouveau_drv.h


----
Miko

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
