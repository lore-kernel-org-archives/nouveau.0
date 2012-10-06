From: Zbigniew <zbigniew2011-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Problem with GFX 5500 Inno 3D
Date: Sat, 6 Oct 2012 10:27:27 +0000
Message-ID: <CALT7RM-qddkVCuKB2TH+zCE2fBzPBNrgz8SD0Psuz-b3=bqxcw@mail.gmail.com>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hallo,

while trying to use nouveau drivers with GFX 5500 I've got nothing but
hang-ups of my machine. The hangup occurs after I'm trying to start
Xwindow (not directly, when machine is booting up). After it occured,
keyboard isn't available anymore, and I can't switch machine off
gracefully with ATX power button. The test has been done with
recommended "4-line xorg.conf".

Slackware 14.0, kernel 3.6.0, processor: Pentium III/750. There is
some kind of kernel error reported in dmesg - but tested the driver
also under the kernel shipped by default with Slackware installation -
3.2.29 - still it was malfunctioning the same way.

Xorg.0.log

#v+
[    50.731]
X.Org X Server 1.12.3
Release Date: 2012-07-09
[    50.731] X Protocol Version 11, Revision 0
[    50.731] Build Operating System: Slackware 14.0 Slackware Linux Project
[    50.731] Current Operating System: Linux Vienna 3.6.0 #2 SMP Fri
Oct 5 15:58:30 CEST 2012 i686
[    50.732] Kernel command line:
[    50.732] Build Date: 23 August 2012  02:27:55PM
[    50.732]
[    50.732] Current version of pixman: 0.26.2
[    50.733]    Before reporting problems, check http://wiki.x.org
        to make sure that you have the latest version.
[    50.733] Markers: (--) probed, (**) from config file, (==) default
setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[    50.734] (==) Log file: "/var/log/Xorg.0.log", Time: Sat Oct  6
11:51:50 2012
[    50.782] (==) Using config file: "/etc/X11/xorg.conf"
[    50.782] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[    50.807] (==) No Layout section.  Using the first Screen section.
[    50.807] (==) No screen section available. Using defaults.
[    50.807] (**) |-->Screen "Default Screen Section" (0)
[    50.807] (**) |   |-->Monitor "<default monitor>"
[    50.809] (==) No device specified for screen "Default Screen Section".
        Using the first device section listed.
[    50.809] (**) |   |-->Device "n"
[    50.809] (==) No monitor specified for screen "Default Screen Section".
        Using a default monitor configuration.
[    50.809] (==) Automatically adding devices
[    50.809] (==) Automatically enabling devices
[    50.811] (WW) The directory "/usr/share/fonts/local" does not exist.
[    50.811]    Entry deleted from font path.
[    50.811] (WW) The directory "/usr/share/fonts/CID" does not exist.
[    50.811]    Entry deleted from font path.
[    50.836] (==) FontPath set to:
        /usr/share/fonts/TTF,
        /usr/share/fonts/OTF,
        /usr/share/fonts/Type1,
        /usr/share/fonts/misc,
        /usr/share/fonts/75dpi/:unscaled,
        /usr/share/fonts/100dpi/:unscaled,
        /usr/share/fonts/75dpi,
        /usr/share/fonts/100dpi,
        /usr/share/fonts/cyrillic
[    50.836] (==) ModulePath set to "/usr/lib/xorg/modules"
[    50.836] (II) The server relies on udev to provide the list of
input devices.
        If no devices become available, reconfigure udev or disable
AutoAddDevices.
[    50.836] (II) Loader magic: 0x821ea00
[    50.836] (II) Module ABI versions:
[    50.837]    X.Org ANSI C Emulation: 0.4
[    50.837]    X.Org Video Driver: 12.0
[    50.837]    X.Org XInput driver : 16.0
[    50.837]    X.Org Server Extension : 6.0
[    50.839] (--) PCI: (0:0:8:0) 109e:036e:1461:0001 rev 2, Mem @
0xf0004000/4096
[    50.839] (--) PCI:*(0:1:0:0) 10de:0326:0000:0000 rev 161, Mem @
0xec000000/16777216, BIOS @ 0x????????/131072
[    50.840] (II) Open ACPI successful (/var/run/acpid.socket)
[    50.840] (II) LoadModule: "extmod"
[    50.865] (II) Loading /usr/lib/xorg/modules/extensions/libextmod.so
[    50.878] (II) Module extmod: vendor="X.Org Foundation"
[    50.878]    compiled for 1.12.3, module version = 1.0.0
[    50.878]    Module class: X.Org Server Extension
[    50.878]    ABI class: X.Org Server Extension, version 6.0
[    50.878] (II) Loading extension MIT-SCREEN-SAVER
[    50.878] (II) Loading extension XFree86-VidModeExtension
[    50.878] (II) Loading extension XFree86-DGA
[    50.878] (II) Loading extension DPMS
[    50.878] (II) Loading extension XVideo
[    50.878] (II) Loading extension XVideo-MotionCompensation
[    50.878] (II) Loading extension X-Resource
[    50.878] (II) LoadModule: "dbe"
[    50.881] (II) Loading /usr/lib/xorg/modules/extensions/libdbe.so
[    50.882] (II) Module dbe: vendor="X.Org Foundation"
[    50.882]    compiled for 1.12.3, module version = 1.0.0
[    50.882]    Module class: X.Org Server Extension
[    50.882]    ABI class: X.Org Server Extension, version 6.0
[    50.882] (II) Loading extension DOUBLE-BUFFER
[    50.882] (II) LoadModule: "glx"
[    50.884] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[    50.889] (II) Module glx: vendor="X.Org Foundation"
[    50.890]    compiled for 1.12.3, module version = 1.0.0
[    50.890]    ABI class: X.Org Server Extension, version 6.0
[    50.890] (==) AIGLX enabled
[    50.890] (II) Loading extension GLX
[    50.890] (II) LoadModule: "record"
[    50.892] (II) Loading /usr/lib/xorg/modules/extensions/librecord.so
[    50.894] (II) Module record: vendor="X.Org Foundation"
[    50.894]    compiled for 1.12.3, module version = 1.13.0
[    50.894]    Module class: X.Org Server Extension
[    50.894]    ABI class: X.Org Server Extension, version 6.0
[    50.894] (II) Loading extension RECORD
[    50.894] (II) LoadModule: "dri"
[    50.896] (II) Loading /usr/lib/xorg/modules/extensions/libdri.so
[    50.910] (II) Module dri: vendor="X.Org Foundation"
[    50.910]    compiled for 1.12.3, module version = 1.0.0
[    50.910]    ABI class: X.Org Server Extension, version 6.0
[    50.910] (II) Loading extension XFree86-DRI
[    50.910] (II) LoadModule: "dri2"
[    50.912] (II) Loading /usr/lib/xorg/modules/extensions/libdri2.so
[    50.914] (II) Module dri2: vendor="X.Org Foundation"
[    50.914]    compiled for 1.12.3, module version = 1.2.0
[    50.914]    ABI class: X.Org Server Extension, version 6.0
[    50.914] (II) Loading extension DRI2
[    50.914] (II) LoadModule: "nouveau"
[    50.915] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[    50.933] (II) Module nouveau: vendor="X.Org Foundation"
[    50.933]    compiled for 1.12.1, module version = 0.0.16
[    50.933]    Module class: X.Org Video Driver
[    50.933]    ABI class: X.Org Video Driver, version 12.0
[    50.934] (II) NOUVEAU driver
[    50.934] (II) NOUVEAU driver for NVIDIA chipset families :
[    50.934]    RIVA TNT        (NV04)
[    50.934]    RIVA TNT2       (NV05)
[    50.935]    GeForce 256     (NV10)
[    50.935]    GeForce 2       (NV11, NV15)
[    50.935]    GeForce 4MX     (NV17, NV18)
[    50.935]    GeForce 3       (NV20)
[    50.935]    GeForce 4Ti     (NV25, NV28)
[    50.935]    GeForce FX      (NV3x)
[    50.935]    GeForce 6       (NV4x)
[    50.936]    GeForce 7       (G7x)
[    50.936]    GeForce 8       (G8x)
[    50.936]    GeForce GTX 200 (NVA0)
[    50.936]    GeForce GTX 400 (NVC0)
[    50.936] (--) using VT number 7

[    50.946] drmOpenDevice: node name is /dev/dri/card0
#v-

dmesg

#v+
00:08: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
brd: module loaded
i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0x60,0x64 irq 1,12
serio: i8042 KBD port at 0x60,0x64 irq 1
serio: i8042 AUX port at 0x60,0x64 irq 12
mousedev: PS/2 mouse device common for all mice
cpuidle: using governor ladder
cpuidle: using governor menu
TCP: bic registered
NET: Registered protocol family 17
Key type dns_resolver registered
Using IPI No-Shortcut mode
registered taskstats version 1
drivers/rtc/hctosys.c: unable to open rtc device (rtc0)
Freeing unused kernel memory: 384k freed
Write protecting the kernel text: 2380k
Write protecting the kernel read-only data: 1212k
input: AT Translated Set 2 keyboard as
/devices/platform/i8042/serio0/input/input0
Uniform Multi-Platform E-IDE driver
SCSI subsystem initialized
ACPI: bus type scsi registered
libata version 3.00 loaded.
sata_sil 0000:00:0c.0: version 2.4
ACPI: PCI Interrupt Link [LNKA] enabled at IRQ 15
PCI: setting IRQ 15 as level-triggered
scsi0 : sata_sil
scsi1 : sata_sil
ata1: SATA max UDMA/100 mmio m512@0xf0005000 tf 0xf0005080 irq 15
ata2: SATA max UDMA/100 mmio m512@0xf0005000 tf 0xf00050c0 irq 15
ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 310)
ata1.00: ATA-7: Maxtor 6L080M0, BANC1G10, max UDMA/133
ata1.00: 160086528 sectors, multi 0: LBA NCQ (not used)
ata1.00: configured for UDMA/100
scsi 0:0:0:0: Direct-Access     ATA      Maxtor 6L080M0   BANC PQ: 0 ANSI: 5
scsi 0:0:0:0: Attached scsi generic sg0 type 0
ata2: SATA link down (SStatus 0 SControl 310)
sd 0:0:0:0: [sda] 160086528 512-byte logical blocks: (81.9 GB/76.3 GiB)
sd 0:0:0:0: [sda] Write Protect is off
sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't
support DPO or FUA
 sda: sda1 sda2 sda3 sda4
sd 0:0:0:0: [sda] Attached SCSI disk
tsc: Refined TSC clocksource calibration: 751.704 MHz
Switching to clocksource tsc
EXT4-fs (sda2): mounted filesystem with ordered data mode. Opts: (null)
loop: module loaded
udevd[1012]: starting version 182
input: Power Button as /devices/LNXSYSTM:00/device:00/PNP0C0C:00/input/input1
ACPI: Power Button [PWRB]
thermal LNXTHERM:00: registered as thermal_zone0
ACPI: Thermal Zone [THRM] (39 C)
input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input2
ACPI: Power Button [PWRF]
ACPI: Fan [FAN] (on)
tsc: Marking TSC unstable due to TSC halts in idle
ACPI: acpi_idle registered with cpuidle
Switching to clocksource acpi_pm
Floppy drive(s): fd0 is 1.44M
Linux agpgart interface v0.103
FDC 0 is a post-1991 82077
rtc_cmos 00:04: RTC can wake from S4
rtc_cmos 00:04: rtc core: registered rtc_cmos as rtc0
rtc0: alarms up to one month, 242 bytes nvram
parport_pc 00:09: reported by Plug and Play ACPI
parport0: PC-style at 0x378 (0x778), irq 7, dma 3
[PCSPP,TRISTATE,COMPAT,EPP,ECP,DMA]
agpgart-intel 0000:00:00.0: Intel 440BX Chipset
agpgart-intel 0000:00:00.0: AGP aperture is 64M @ 0xe8000000
piix 0000:00:07.1: IDE controller (0x8086:0x7111 rev 0x01)
piix 0000:00:07.1: IDE port disabled
piix 0000:00:07.1: not 100% native mode: will probe irqs later
    ide0: BM-DMA at 0xf000-0xf007
Probing IDE interface ide0...
microcode: CPU0 sig=0x683, pf=0x10, revision=0x14
ACPI: bus type usb registered
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
[drm] Initialized drm 1.1.0 20060810
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
uhci_hcd: USB Universal Host Controller Interface driver
wmi: Mapper loaded
hda: HL-DT-STDVD-RAM GSA-H20L, ATAPI CD/DVD-ROM drive
input: PS/2 Generic Mouse as /devices/platform/i8042/serio1/input/input3
hda: host max PIO4 wanted PIO255(auto-tune) selected PIO4
hda: UDMA/33 mode selected
ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
piix4_smbus 0000:00:07.3: SMBus Host Controller at 0x5000, revision 0
3c59x: Donald Becker and others.
0000:00:0b.0: 3Com PCI 3c905B Cyclone 100baseTx at f0efe000.
[drm] nouveau 0000:01:00.0: Detected an NV30 generation card (0x034600b1)
[drm] nouveau 0000:01:00.0: Checking PRAMIN for VBIOS
[drm] nouveau 0000:01:00.0: ... appears to be valid
[drm] nouveau 0000:01:00.0: Using VBIOS from PRAMIN
[drm] nouveau 0000:01:00.0: BMP BIOS found
[drm] nouveau 0000:01:00.0: BMP version 5.40
[drm] nouveau 0000:01:00.0: Bios version 04.34.20.69
ehci_hcd 0000:00:09.2: EHCI Host Controller
ehci_hcd 0000:00:09.2: new USB bus registered, assigned bus number 1
ehci_hcd 0000:00:09.2: irq 11, io mem 0xf0002000
ehci_hcd 0000:00:09.2: USB 2.0 started, EHCI 1.00
usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb1: Product: EHCI Host Controller
usb usb1: Manufacturer: Linux 3.6.0 ehci_hcd
usb usb1: SerialNumber: 0000:00:09.2
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 5 ports detected
ohci_hcd 0000:00:09.0: OHCI Host Controller
ohci_hcd 0000:00:09.0: new USB bus registered, assigned bus number 2
ohci_hcd 0000:00:09.0: irq 10, io mem 0xf0000000
usb usb2: New USB device found, idVendor=1d6b, idProduct=0001
usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb2: Product: OHCI Host Controller
usb usb2: Manufacturer: Linux 3.6.0 ohci_hcd
usb usb2: SerialNumber: 0000:00:09.0
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 3 ports detected
uhci_hcd 0000:00:07.2: UHCI Host Controller
uhci_hcd 0000:00:07.2: new USB bus registered, assigned bus number 3
uhci_hcd 0000:00:07.2: irq 11, io base 0x0000d000
usb usb3: New USB device found, idVendor=1d6b, idProduct=0001
usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb3: Product: UHCI Host Controller
usb usb3: Manufacturer: Linux 3.6.0 uhci_hcd
usb usb3: SerialNumber: 0000:00:07.2
hub 3-0:1.0: USB hub found
hub 3-0:1.0: 2 ports detected
ohci_hcd 0000:00:09.1: OHCI Host Controller
ohci_hcd 0000:00:09.1: new USB bus registered, assigned bus number 4
ohci_hcd 0000:00:09.1: irq 3, io mem 0xf0001000
[drm] nouveau 0000:01:00.0: MXM: no VBIOS data, nothing to do
[drm] nouveau 0000:01:00.0: DCB version 2.2
[drm] nouveau 0000:01:00.0: DCB outp 00: 01000300 000088b8
[drm] nouveau 0000:01:00.0: DCB outp 01: 02010310 000088b8
[drm] nouveau 0000:01:00.0: DCB outp 02: 01010312 00000000
[drm] nouveau 0000:01:00.0: DCB outp 03: 02020321 00000303
[drm] nouveau 0000:01:00.0: Loading NV17 power sequencing microcode
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset 0xEC5F
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset 0xEEFA
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset 0xF040
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset 0xF1C9
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset 0xF1E6
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 5 at offset 0xF203
------------[ cut here ]------------
kernel BUG at arch/x86/mm/pat.c:279!
invalid opcode: 0000 [#1] SMP
Modules linked in: pata_acpi(+) nouveau(+) ide_pci_generic mxm_wmi wmi
video ttm uhci_hcd ohci_hcd(+) drm_kms_helper ehci_hcd drm 3c59x
microcode(+) usbcore psmouse i2c_piix4 hwmon i2c_algo_bit evdev mii
i2c_
Pid: 1019, comm: udevd Not tainted 3.6.0 #2 EVERCOM NETWORK  /i440BX-W977
EIP: 0060:[<c1021b95>] EFLAGS: 00010246 CPU: 0
EIP is at reserve_memtype+0x20/0x355
EAX: 00000000 EBX: ef13bc9c ECX: ef13bc50 EDX: 00000000
ESI: 00000000 EDI: 00000000 EBP: ef13bc54 ESP: ef13bc34
 DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
CR0: 8005003b CR2: b7762000 CR3: 2ea92000 CR4: 000007d0
DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
DR6: ffff0ff0 DR7: 00000400
Process udevd (pid: 1019, ti=ef13a000 task=ef06cbc0 task.ti=ef13a000)
Stack:
 c1192fd0 ef13bc64 00000000 00000000 00000000 ef13bc9c 00000000 00000000
 ef13bc94 c1022380 00000000 00000000 00000008 ef13bc84 00000000 00000000
 00000000 00000008 00000000 c1041bed ef13bc8c ef13bcbc 00000000 eea547a0
Call Trace:
 [<c1192fd0>] ? notify_update+0x22/0x24
 [<c1022380>] io_reserve_memtype+0x6a/0xf2
 [<c1041bed>] ? __cond_resched+0x16/0x26
 [<c1023493>] iomap_create_wc+0x18/0x2b
 [<f0e5452b>] init_compute_mem+0x1e5/0x9c4 [nouveau]
 [<f0e52d70>] parse_init_table+0xcd/0x189 [nouveau]
 [<f0e57cc3>] nouveau_run_vbios_init+0x1fb/0x2a9 [nouveau]
 [<f0e58a6b>] nouveau_bios_init+0xcfa/0x102c [nouveau]
 [<c101fed6>] ? vmalloc_sync_all+0x116/0x116
 [<c125152a>] ? error_code+0x5a/0x60
 [<f0e3f630>] ? nouveau_stub_init+0x7/0x7 [nouveau]
 [<f0e4a501>] ? NVSetOwner+0x150/0x228 [nouveau]
 [<f0e3f630>] ? nouveau_stub_init+0x7/0x7 [nouveau]
 [<f0e404ba>] nouveau_card_init+0xe51/0x146c [nouveau]
 [<f0e4116e>] nouveau_load+0x5c8/0x607 [nouveau]
 [<f0c31809>] drm_get_pci_dev+0x12e/0x20e [drm]
 [<f0ec02bd>] nouveau_pci_probe+0xd/0xf [nouveau]
 [<c113d46b>] pci_device_probe+0x76/0xee
 [<c11a44aa>] driver_probe_device+0x7c/0x16c
 [<c11a45e1>] __driver_attach+0x47/0x63
 [<c11a318f>] bus_for_each_dev+0x38/0x62
 [<c11a4155>] driver_attach+0x14/0x16
 [<c11a459a>] ? driver_probe_device+0x16c/0x16c
 [<c11a3e16>] bus_add_driver+0xb3/0x1b2
 [<c11a4a68>] driver_register+0x74/0xec
 [<c113d689>] __pci_register_driver+0x34/0x80
 [<f0c31954>] drm_pci_init+0x6b/0xc3 [drm]
 [<f0ee7000>] ? 0xf0ee6fff
 [<f0ee7047>] nouveau_init+0x47/0x49 [nouveau]
 [<c1001153>] do_one_initcall+0x6b/0x110
 [<c105fbea>] sys_init_module+0x1269/0x143a
 [<c1250fe5>] syscall_call+0x7/0xb
Code: 00 83 c4 18 8d 65 f8 5b 5e 5d c3 55 89 e5 57 56 53 83 ec 14 89
45 e8 8b 45 0c 89 55 ec 39 c2 72 0c 77 08 8b 55 08 39 55 e8 72 02 <0f>
0b 83 3d f0 d9 3a c1 00 75 2e 83 7d 14 00 0f 84 cc 02 00 00
EIP: [<c1021b95>] reserve_memtype+0x20/0x355 SS:ESP 0068:ef13bc34
---[ end trace de277affb6da9666 ]---
usb usb4: New USB device found, idVendor=1d6b, idProduct=0001
usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb4: Product: OHCI Host Controller
usb usb4: Manufacturer: Linux 3.6.0 ohci_hcd
usb usb4: SerialNumber: 0000:00:09.1
hub 4-0:1.0: USB hub found
hub 4-0:1.0: 2 ports detected
ppdev: user-space parallel port driver
microcode: Microcode Update Driver: v2.00
<tigran-ppwZ4lME3+KI6QP4U9MhSdBc4/FLrbF6@public.gmane.org>, Peter Oruba
ide-cd driver 5.00
ide-cd: hda: ATAPI 48X DVD-ROM DVD-R/RAM CD-R/RW drive, 2048kB Cache
cdrom: Uniform CD-ROM driver Revision: 3.20
device-mapper: uevent: version 1.0.3
device-mapper: ioctl: 4.23.0-ioctl (2012-07-25) initialised: dm-devel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
fuse init (API version 7.20)
EXT4-fs (sda2): re-mounted. Opts: (null)
lp0: using parport0 (interrupt-driven).
lp0: console ready
NET: Registered protocol family 10
#v-
