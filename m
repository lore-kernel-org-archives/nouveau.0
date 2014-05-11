From: Thomas Glanzmann <thomas-U3NvvseaQwJn68oJJulU0Q@public.gmane.org>
Subject: irq 45: nobody cared (try booting with the "irqpoll"
	option)
Date: Sun, 11 May 2014 11:19:16 +0200
Message-ID: <20140511091915.GH4070@glanzmann.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hello,
[    4.762826] EXT4-fs (sda1): mounted filesystem with ordered data mode. Opts: (null)
[    5.025098] udevd[441]: starting version 175
[    5.134411] i2c i2c-0: nForce2 SMBus adapter at 0x2140
[    5.134585] i2c i2c-1: nForce2 SMBus adapter at 0x2100
[    5.137320] ACPI: bus type USB registered
[    5.137444] usbcore: registered new interface driver usbfs
[    5.137535] usbcore: registered new interface driver hub
[    5.148760] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
[    5.148853] ACPI: Power Button [PWRB]
[    5.149019] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input1
[    5.149097] ACPI: Sleep Button [SLPB]
[    5.149315] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input2
[    5.149392] ACPI: Power Button [PWRF]
[    5.149978] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    5.150361] tsc: Marking TSC unstable due to TSC halts in idle
[    5.153874] Switched to clocksource hpet
[    5.156950] usbcore: registered new device driver usb
[    5.158788] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    5.159806] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    5.160283] ohci-pci: OHCI PCI platform driver
[    5.160490] ehci-pci: EHCI PCI platform driver
[    5.160799] ehci-pci 0000:00:04.1: EHCI Host Controller
[    5.160873] ehci-pci 0000:00:04.1: new USB bus registered, assigned bus number 1
[    5.160955] ehci-pci 0000:00:04.1: debug port 1
[    5.161057] ehci-pci 0000:00:04.1: irq 22, io mem 0xd3489200
[    5.171083] input: PC Speaker as /devices/platform/pcspkr/input/input3
[    5.172030] ehci-pci 0000:00:04.1: USB 2.0 started, EHCI 1.00
[    5.172168] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
[    5.172245] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    5.172321] usb usb1: Product: EHCI Host Controller
[    5.172383] usb usb1: Manufacturer: Linux 3.15.0-rc4+ ehci_hcd
[    5.172448] usb usb1: SerialNumber: 0000:00:04.1
[    5.172710] hub 1-0:1.0: USB hub found
[    5.172779] hub 1-0:1.0: 7 ports detected
[    5.173355] ehci-pci 0000:00:06.1: EHCI Host Controller
[    5.173423] ehci-pci 0000:00:06.1: new USB bus registered, assigned bus number 2
[    5.173503] ehci-pci 0000:00:06.1: debug port 1
[    5.173603] ehci-pci 0000:00:06.1: irq 20, io mem 0xd3489100
[    5.180265] ssb: Found chip with id 0x4321, rev 0x05 and package 0x00
[    5.184062] ehci-pci 0000:00:06.1: USB 2.0 started, EHCI 1.00
[    5.184193] usb usb2: New USB device found, idVendor=1d6b, idProduct=0002
[    5.184258] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    5.184331] usb usb2: Product: EHCI Host Controller
[    5.184393] usb usb2: Manufacturer: Linux 3.15.0-rc4+ ehci_hcd
[    5.184455] usb usb2: SerialNumber: 0000:00:06.1
[    5.184711] hub 2-0:1.0: USB hub found
[    5.184779] hub 2-0:1.0: 5 ports detected
[    5.185357] ohci-pci 0000:00:04.0: OHCI PCI host controller
[    5.185432] ohci-pci 0000:00:04.0: new USB bus registered, assigned bus number 3
[    5.185551] ohci-pci 0000:00:04.0: irq 23, io mem 0xd3488000
[    5.229004] random: nonblocking pool is initialized
[    5.242161] usb usb3: New USB device found, idVendor=1d6b, idProduct=0001
[    5.242241] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    5.242312] usb usb3: Product: OHCI PCI host controller
[    5.242376] usb usb3: Manufacturer: Linux 3.15.0-rc4+ ohci_hcd
[    5.242437] usb usb3: SerialNumber: 0000:00:04.0
[    5.242702] hub 3-0:1.0: USB hub found
[    5.242774] hub 3-0:1.0: 7 ports detected
[    5.244398] ssb: Sonics Silicon Backplane found on PCI device 0000:03:00.0
[    5.245400] ohci-pci 0000:00:06.0: OHCI PCI host controller
[    5.245473] ohci-pci 0000:00:06.0: new USB bus registered, assigned bus number 4
[    5.245592] ohci-pci 0000:00:06.0: irq 21, io mem 0xd3487000
[    5.302167] usb usb4: New USB device found, idVendor=1d6b, idProduct=0001
[    5.302239] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    5.302311] usb usb4: Product: OHCI PCI host controller
[    5.302374] usb usb4: Manufacturer: Linux 3.15.0-rc4+ ohci_hcd
[    5.302438] usb usb4: SerialNumber: 0000:00:06.0
[    5.302659] hub 4-0:1.0: USB hub found
[    5.302727] hub 4-0:1.0: 5 ports detected
[    5.330116] cfg80211: Calling CRDA to update world regulatory domain
[    5.354105] b43-phy0: Broadcom 4321 WLAN found (core revision 12)
[    5.363036] ACPI: PCI Interrupt Link [LAZA] enabled at IRQ 23
[    5.363118] snd_hda_intel 0000:00:08.0: Disabling MSI
[    5.375746] cfg80211: World regulatory domain updated:
[    5.375815] cfg80211:  DFS Master region: unset
[    5.375869] cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp), (dfs_cac_time)
[    5.375999] cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (300 mBi, 2000 mBm), (N/A)
[    5.376095] cfg80211:   (2457000 KHz - 2482000 KHz @ 20000 KHz), (300 mBi, 2000 mBm), (N/A)
[    5.376169] cfg80211:   (2474000 KHz - 2494000 KHz @ 20000 KHz), (300 mBi, 2000 mBm), (N/A)
[    5.376245] cfg80211:   (5170000 KHz - 5250000 KHz @ 40000 KHz), (300 mBi, 2000 mBm), (N/A)
[    5.376318] cfg80211:   (5735000 KHz - 5835000 KHz @ 40000 KHz), (300 mBi, 2000 mBm), (N/A)
[    5.396232] b43-phy0: Found PHY: Analog 5, Type 4 (N), Revision 2
[    5.420326] Broadcom 43xx driver loaded [ Features: PMNLS ]
[    5.438549] applesmc: key=154 fan=1 temp=8 index=8 acc=0 lux=0 kbd=0
[    5.962194] sound hdaudioC0D0: ALC889A: SKU not ready 0x400000f0
[    5.997258] EXT4-fs (sda1): re-mounted. Opts: (null)
[    6.008077] sound hdaudioC0D0: autoconfig: line_outs=1 (0x18/0x0/0x0/0x0/0x0) type:speaker
[    6.008166] sound hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[    6.008236] sound hdaudioC0D0:    hp_outs=1 (0x14/0x0/0x0/0x0/0x0)
[    6.008306] sound hdaudioC0D0:    mono: mono_out=0x0
[    6.008374] sound hdaudioC0D0:    dig-out=0x1e/0x0
[    6.008442] sound hdaudioC0D0:    inputs:
[    6.008510] sound hdaudioC0D0:      Line=0x15
[    6.008583] sound hdaudioC0D0:    dig-in=0x1f
[    6.030329] EXT4-fs (sda1): re-mounted. Opts: (null)
[    6.076808] loop: module loaded
[    6.106128] [drm] Initialized drm 1.1.0 20060810
[    6.112062] wmi: Mapper loaded
[    6.124323] ACPI Warning: \_SB_.PCI0.IXVE.IGPU._DSM: Argument #4 type mismatch - Found [Buffer], ACPI requires [Package] (20140214/nsarguments-95)
[    6.124608] ACPI: \_SB_.PCI0.IXVE.IGPU: failed to evaluate _DSM
[    6.125052] ACPI: PCI Interrupt Link [LGPU] enabled at IRQ 22
[    6.126077] nouveau  [  DEVICE][0000:02:00.0] BOOT0  : 0x0ac080b1
[    6.126142] nouveau  [  DEVICE][0000:02:00.0] Chipset: MCP79/MCP7A (NVAC)
[    6.126205] nouveau  [  DEVICE][0000:02:00.0] Family : NV50
[    6.127441] nouveau  [   VBIOS][0000:02:00.0] checking PRAMIN for image...
[    6.189612] nouveau  [   VBIOS][0000:02:00.0] ... appears to be valid
[    6.189683] nouveau  [   VBIOS][0000:02:00.0] using image from PRAMIN
[    6.189959] nouveau  [   VBIOS][0000:02:00.0] BIT signature found
[    6.190022] nouveau  [   VBIOS][0000:02:00.0] version 62.79.4e.00.01
[    6.212040] nouveau  [     PMC][0000:02:00.0] MSI interrupts enabled
[    6.212138] nouveau  [     PFB][0000:02:00.0] RAM type: stolen system memory
[    6.212201] nouveau  [     PFB][0000:02:00.0] RAM size: 256 MiB
[    6.212262] nouveau  [     PFB][0000:02:00.0]    ZCOMP: 0 tags
[    6.252300] nouveau  [  PTHERM][0000:02:00.0] FAN control: none / external
[    6.252394] nouveau  [  PTHERM][0000:02:00.0] fan management: automatic
[    6.252459] nouveau  [  PTHERM][0000:02:00.0] internal sensor: yes
[    6.252545] nouveau  [     CLK][0000:02:00.0] 03: core 150 MHz shader 300 MHz vdec 150 MHz
[    6.252621] nouveau  [     CLK][0000:02:00.0] 05: core 150 MHz shader 300 MHz vdec 150 MHz
[    6.252701] nouveau  [     CLK][0000:02:00.0] 0e: core 350 MHz shader 800 MHz vdec 350 MHz
[    6.252777] nouveau  [     CLK][0000:02:00.0] 0f: core 450 MHz shader 1100 MHz vdec 450 MHz
[    6.252876] nouveau  [     CLK][0000:02:00.0] --: core 350 MHz shader 800 MHz vdec 350 MHz
[    6.253441] [TTM] Zone  kernel: Available graphics memory: 1887580 kiB
[    6.253507] [TTM] Initializing pool allocator
[    6.253580] [TTM] Initializing DMA pool allocator
[    6.253658] nouveau  [     DRM] VRAM: 256 MiB
[    6.253719] nouveau  [     DRM] GART: 1048576 MiB
[    6.253786] nouveau  [     DRM] TMDS table version 2.0
[    6.253847] nouveau  [     DRM] DCB version 4.0
[    6.253913] nouveau  [     DRM] DCB outp 00: 02021286 0f220010
[    6.253975] nouveau  [     DRM] DCB outp 01: 01000122 00000010
[    6.254040] nouveau  [     DRM] DCB outp 02: 01000120 0000001e
[    6.254102] nouveau  [     DRM] DCB outp 03: 02021232 00000010
[    6.254165] nouveau  [     DRM] DCB conn 00: 00001020
[    6.254276] nouveau  [     DRM] DCB conn 01: 0000a146
[    6.254384] nouveau  [     DRM] DCB conn 02: 00005246
[    6.264983] nouveau W[     DRM] unknown connector type 20
[    6.265118] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    6.265181] [drm] Driver supports precise vblank timestamp query.
[    6.276938] nouveau  [     DRM] MM: using M2MF for buffer copies
[    6.371029] nouveau  [     DRM] allocated 1920x1200 fb: 0x50000, bo ffff8800b7c09000
[    6.371247] fbcon: nouveaufb (fb0) is primary device
[    6.433651] Console: switching to colour frame buffer device 240x75
[    6.437702] nouveau 0000:02:00.0: fb0: nouveaufb frame buffer device
[    6.437715] nouveau 0000:02:00.0: registered panic notifier
[    6.437742] [drm] Initialized nouveau 1.1.1 20120801 for 0000:02:00.0 on minor 0
[    6.572048] usb 4-1: new full-speed USB device number 2 using ohci-pci
[    6.793074] usb 4-1: New USB device found, idVendor=0a5c, idProduct=4500
[    6.793101] usb 4-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    6.793126] usb 4-1: Product: BCM2045B2
[    6.793139] usb 4-1: Manufacturer: Broadcom
[    6.796135] hub 4-1:1.0: USB hub found
[    6.799077] hub 4-1:1.0: 3 ports detected
[    7.104056] usb 4-4: new full-speed USB device number 3 using ohci-pci
[    7.205050] input: HDA Digital PCBeep as /devices/pci0000:00/0000:00:08.0/sound/card0/hdaudioC0D0/input4
[    7.208282] input: HDA NVidia Line as /devices/pci0000:00/0000:00:08.0/sound/card0/input5
[    7.208445] input: HDA NVidia Headphone as /devices/pci0000:00/0000:00:08.0/sound/card0/input6
[    7.316083] usb 4-4: New USB device found, idVendor=17ef, idProduct=6047
[    7.316118] usb 4-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    7.316133] usb 4-4: Product: ThinkPad Compact USB Keyboard with TrackPoint
[    7.316148] usb 4-4: Manufacturer: Lenovo
[    7.496069] usb 3-3: new low-speed USB device number 2 using ohci-pci
[    7.623725] RPC: Registered named UNIX socket transport module.
[    7.623756] RPC: Registered udp transport module.
[    7.623768] RPC: Registered tcp transport module.
[    7.623779] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    7.627624] FS-Cache: Loaded
[    7.634278] FS-Cache: Netfs 'nfs' registered for caching
[    7.642937] Installing knfsd (copyright (C) 1996 okir-pn4DOG8n3UYbFoVRYvo4fw@public.gmane.org).
[    7.697034] usb 3-3: New USB device found, idVendor=046d, idProduct=c05b
[    7.697069] usb 3-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    7.697094] usb 3-3: Product: USB Optical Mouse
[    7.697107] usb 3-3: Manufacturer: Logitech
[    7.876066] usb 3-5: new low-speed USB device number 3 using ohci-pci
[    8.040029] NET: Registered protocol family 15
[    8.091023] usb 3-5: New USB device found, idVendor=05ac, idProduct=8242
[    8.091708] usb 3-5: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    8.092393] usb 3-5: Product: IR Receiver
[    8.093033] usb 3-5: Manufacturer: Apple Computer, Inc.
[    8.213039] hidraw: raw HID events driver (C) Jiri Kosina
[    8.242241] usbcore: registered new interface driver usbhid
[    8.242852] usbhid: USB HID core driver
[    8.247808] input: Lenovo ThinkPad Compact USB Keyboard with TrackPoint as /devices/pci0000:00/0000:00:06.0/usb4/4-4/4-4:1.0/0003:17EF:6047.0001/input/input7
[    8.251818] hid-generic 0003:17EF:6047.0001: input,hidraw0: USB HID v1.00 Keyboard [Lenovo ThinkPad Compact USB Keyboard with TrackPoint] on usb-0000:00:06.0-4/input0
[    8.253095] input: Lenovo ThinkPad Compact USB Keyboard with TrackPoint as /devices/pci0000:00/0000:00:06.0/usb4/4-4/4-4:1.1/0003:17EF:6047.0002/input/input8
[    8.259226] hid-generic 0003:17EF:6047.0002: input,hiddev0,hidraw1: USB HID v1.00 Mouse [Lenovo ThinkPad Compact USB Keyboard with TrackPoint] on usb-0000:00:06.0-4/input1
[    8.263742] input: Logitech USB Optical Mouse as /devices/pci0000:00/0000:00:04.0/usb3/3-3/3-3:1.0/0003:046D:C05B.0003/input/input9
[    8.264614] hid-generic 0003:046D:C05B.0003: input,hidraw2: USB HID v1.11 Mouse [Logitech USB Optical Mouse] on usb-0000:00:04.0-3/input0
[    8.434098] usb 4-1.1: new full-speed USB device number 4 using ohci-pci
[    8.557052] usb 4-1.1: New USB device found, idVendor=05ac, idProduct=8216
[    8.557599] usb 4-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    8.557602] usb 4-1.1: Product: Bluetooth USB Host Controller
[    8.557603] usb 4-1.1: Manufacturer: Apple, Inc.
[    8.557605] usb 4-1.1: SerialNumber: 002436EB7CF7
[    8.777031] Bluetooth: Core ver 2.19
[    8.777621] NET: Registered protocol family 31
[    8.778424] Bluetooth: HCI device and connection manager initialized
[    8.784070] Bluetooth: HCI socket layer initialized
[    8.784626] Bluetooth: L2CAP socket layer initialized
[    8.785607] Bluetooth: SCO socket layer initialized
[    8.796604] usbcore: registered new interface driver btusb
[    8.831315] lp: driver loaded but no devices found
[    8.835176] ppdev: user-space parallel port driver
[    9.109098] Ebtables v2.0 registered
[    9.126054] ip_tables: (C) 2000-2006 Netfilter Core Team
[    9.152190] ip6_tables: (C) 2000-2006 Netfilter Core Team
[    9.286038] input: ACPI Virtual Keyboard Device as /devices/virtual/input/input10
[   10.351014] postgres (3900): /proc/3900/oom_adj is deprecated, please use /proc/3900/oom_score_adj instead.
[21155.639953] perf interrupt took too long (2503 > 2500), lowering kernel.perf_event_max_sample_rate to 50000
[31883.976077] fuse init (API version 7.23)
[60917.269345] perf interrupt took too long (5006 > 5000), lowering kernel.perf_event_max_sample_rate to 25000
[128872.463114] usb 4-4: USB disconnect, device number 3
[128872.984140] usb 4-4: new full-speed USB device number 5 using ohci-pci
[128873.207939] usb 4-4: New USB device found, idVendor=17ef, idProduct=6047
[128873.207959] usb 4-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[128873.207966] usb 4-4: Product: ThinkPad Compact USB Keyboard with TrackPoint
[128873.207971] usb 4-4: Manufacturer: Lenovo
[128873.218753] input: Lenovo ThinkPad Compact USB Keyboard with TrackPoint as /devices/pci0000:00/0000:00:06.0/usb4/4-4/4-4:1.0/0003:17EF:6047.0005/input/input11
[128873.218961] hid-generic 0003:17EF:6047.0005: input,hidraw0: USB HID v1.00 Keyboard [Lenovo ThinkPad Compact USB Keyboard with TrackPoint] on usb-0000:00:06.0-4/input0
[128873.228617] input: Lenovo ThinkPad Compact USB Keyboard with TrackPoint as /devices/pci0000:00/0000:00:06.0/usb4/4-4/4-4:1.1/0003:17EF:6047.0006/input/input12
[128873.228940] hid-generic 0003:17EF:6047.0006: input,hiddev0,hidraw1: USB HID v1.00 Mouse [Lenovo ThinkPad Compact USB Keyboard with TrackPoint] on usb-0000:00:06.0-4/input1
[128874.898979] usb 4-4: USB disconnect, device number 5
[128875.424188] usb 4-4: new full-speed USB device number 6 using ohci-pci
[128875.647882] usb 4-4: New USB device found, idVendor=17ef, idProduct=6047
[128875.647901] usb 4-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[128875.647918] usb 4-4: Product: ThinkPad Compact USB Keyboard with TrackPoint
[128875.647923] usb 4-4: Manufacturer: Lenovo
[128875.658589] input: Lenovo ThinkPad Compact USB Keyboard with TrackPoint as /devices/pci0000:00/0000:00:06.0/usb4/4-4/4-4:1.0/0003:17EF:6047.0007/input/input13
[128875.658813] hid-generic 0003:17EF:6047.0007: input,hidraw0: USB HID v1.00 Keyboard [Lenovo ThinkPad Compact USB Keyboard with TrackPoint] on usb-0000:00:06.0-4/input0
[128875.668394] input: Lenovo ThinkPad Compact USB Keyboard with TrackPoint as /devices/pci0000:00/0000:00:06.0/usb4/4-4/4-4:1.1/0003:17EF:6047.0008/input/input14
[128875.668719] hid-generic 0003:17EF:6047.0008: input,hiddev0,hidraw1: USB HID v1.00 Mouse [Lenovo ThinkPad Compact USB Keyboard with TrackPoint] on usb-0000:00:06.0-4/input1
[137407.741678] usb 4-4: USB disconnect, device number 6
[137408.260204] usb 4-4: new full-speed USB device number 7 using ohci-pci
[137408.483600] usb 4-4: New USB device found, idVendor=17ef, idProduct=6047
[137408.483612] usb 4-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[137408.483625] usb 4-4: Product: ThinkPad Compact USB Keyboard with TrackPoint
[137408.483630] usb 4-4: Manufacturer: Lenovo
[137408.494299] input: Lenovo ThinkPad Compact USB Keyboard with TrackPoint as /devices/pci0000:00/0000:00:06.0/usb4/4-4/4-4:1.0/0003:17EF:6047.0009/input/input15
[137408.494479] hid-generic 0003:17EF:6047.0009: input,hidraw0: USB HID v1.00 Keyboard [Lenovo ThinkPad Compact USB Keyboard with TrackPoint] on usb-0000:00:06.0-4/input0
[137408.504295] input: Lenovo ThinkPad Compact USB Keyboard with TrackPoint as /devices/pci0000:00/0000:00:06.0/usb4/4-4/4-4:1.1/0003:17EF:6047.000A/input/input16
[137408.504605] hid-generic 0003:17EF:6047.000A: input,hiddev0,hidraw1: USB HID v1.00 Mouse [Lenovo ThinkPad Compact USB Keyboard with TrackPoint] on usb-0000:00:06.0-4/input1
[137415.663946] usb 4-4: USB disconnect, device number 7
[137416.184126] usb 4-4: new full-speed USB device number 8 using ohci-pci
[137416.407330] usb 4-4: New USB device found, idVendor=17ef, idProduct=6047
[137416.407347] usb 4-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[137416.407352] usb 4-4: Product: ThinkPad Compact USB Keyboard with TrackPoint
[137416.407358] usb 4-4: Manufacturer: Lenovo
[137416.417792] input: Lenovo ThinkPad Compact USB Keyboard with TrackPoint as /devices/pci0000:00/0000:00:06.0/usb4/4-4/4-4:1.0/0003:17EF:6047.000B/input/input17
[137416.417925] hid-generic 0003:17EF:6047.000B: input,hidraw0: USB HID v1.00 Keyboard [Lenovo ThinkPad Compact USB Keyboard with TrackPoint] on usb-0000:00:06.0-4/input0
[137416.427891] input: Lenovo ThinkPad Compact USB Keyboard with TrackPoint as /devices/pci0000:00/0000:00:06.0/usb4/4-4/4-4:1.1/0003:17EF:6047.000C/input/input18
[137416.428292] hid-generic 0003:17EF:6047.000C: input,hiddev0,hidraw1: USB HID v1.00 Mouse [Lenovo ThinkPad Compact USB Keyboard with TrackPoint] on usb-0000:00:06.0-4/input1
[137418.173182] usb 4-4: USB disconnect, device number 8
[137418.712169] usb 4-4: new full-speed USB device number 9 using ohci-pci
[137418.935346] usb 4-4: New USB device found, idVendor=17ef, idProduct=6047
[137418.935365] usb 4-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[137418.935371] usb 4-4: Product: ThinkPad Compact USB Keyboard with TrackPoint
[137418.935376] usb 4-4: Manufacturer: Lenovo
[137418.946236] input: Lenovo ThinkPad Compact USB Keyboard with TrackPoint as /devices/pci0000:00/0000:00:06.0/usb4/4-4/4-4:1.0/0003:17EF:6047.000D/input/input19
[137418.946610] hid-generic 0003:17EF:6047.000D: input,hidraw0: USB HID v1.00 Keyboard [Lenovo ThinkPad Compact USB Keyboard with TrackPoint] on usb-0000:00:06.0-4/input0
[137418.955795] input: Lenovo ThinkPad Compact USB Keyboard with TrackPoint as /devices/pci0000:00/0000:00:06.0/usb4/4-4/4-4:1.1/0003:17EF:6047.000E/input/input20
[137418.956323] hid-generic 0003:17EF:6047.000E: input,hiddev0,hidraw1: USB HID v1.00 Mouse [Lenovo ThinkPad Compact USB Keyboard with TrackPoint] on usb-0000:00:06.0-4/input1
[389936.600256] irq 45: nobody cared (try booting with the "irqpoll" option)
[389936.600267] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 3.15.0-rc4+ #135
[389936.600271] Hardware name: Apple Inc. Macmini3,1/Mac-F22C86C8, BIOS     MM31.88Z.0081.B06.0904271717 04/27/09
[389936.600274]  0000000000000000 ffff8800374624bc ffffffff8137e8ee ffff880037462400
[389936.600284]  ffffffff810763c7 ffff880037462400 0000000000000000 0000000000000000
[389936.600293]  ffffffff810767b3 000000000000002d 0000000000000000 000000000000002d
[389936.600302] Call Trace:
[389936.600305]  <IRQ>  [<ffffffff8137e8ee>] ? dump_stack+0x41/0x51
[389936.600320]  [<ffffffff810763c7>] ? __report_bad_irq+0x21/0xc1
[389936.600324]  [<ffffffff810767b3>] ? note_interrupt+0x17b/0x20c
[389936.600329]  [<ffffffff8107497c>] ? handle_irq_event_percpu+0x135/0x179
[389936.600334]  [<ffffffff8107cab9>] ? ktime_get+0x5f/0x6b
[389936.600398]  [<ffffffff810749f5>] ? handle_irq_event+0x35/0x54
[389936.600402]  [<ffffffff81076f44>] ? handle_edge_irq+0xa2/0xcc
[389936.600407]  [<ffffffff81003cc8>] ? handle_irq+0x18/0x20
[389936.600411]  [<ffffffff810037a4>] ? do_IRQ+0x43/0xb5
[389936.600415]  [<ffffffff81382aea>] ? common_interrupt+0x6a/0x6a
[389936.600418]  <EOI>  [<ffffffff8129f51f>] ? cpuidle_enter_state+0x43/0xa6
[389936.600446]  [<ffffffff8129f518>] ? cpuidle_enter_state+0x3c/0xa6
[389936.600456]  [<ffffffff81067197>] ? cpu_startup_entry+0x131/0x1de
[389936.600462]  [<ffffffff816b5cd6>] ? start_kernel+0x3b2/0x3bd
[389936.600465]  [<ffffffff816b573b>] ? repair_env_string+0x58/0x58
[389936.600468] handlers:
[389936.600494] [<ffffffffa0541a58>] nouveau_mc_intr [nouveau]
[389936.600498] Disabling IRQ #45

This happened after 5 times of uptime. I had rotated display with
1200x1920 I'll update you if it happens again.

This was with:

Linux mini 3.15.0-rc4+ #135 SMP Tue May 6 21:55:52 CEST 2014 x86_64 GNU/Linux
v3.15-rc4-234-g256cf4c

From Linus tree.

Symptoms: Screen redraw becomes very slow, especially if you have
fullscreen xterms, like I do.

Cheers,
        Thomas
