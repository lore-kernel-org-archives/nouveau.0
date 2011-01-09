From: rogerx.oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: Re: Latest Git still freezes AGP [GeForce 7600 GS]
Date: Sat, 8 Jan 2011 16:37:00 -0900
Message-ID: <20110109013700.GB4523@localhost2.local>
References: <20110108234155.GC4575@localhost2.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="bg08WKrSYDhXBjb5"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110108234155.GC4575-bi+AKbBUZKbUbxaO3c2PGA@public.gmane.org>
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


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Attaching a dmesg displaying agp enabled and working for this card when nouveau
and drm are compiled as modules.  (Statically compiled drivers froze kernel
yesterday.)

(top is cut-off due to max mem limit for dmesg buffer)

-- 
Roger
http://rogerx.freeshell.org/

--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: attachment; filename="dmesg-20110108-works.log"
Content-Transfer-Encoding: quoted-printable


[    4.760589] usb usb2: Manufacturer: Linux 2.6.37-rc3-g036b465 ohci_hcd
[    4.767200] usb usb2: SerialNumber: 0000:02:08.0
[    4.772609] hub 2-0:1.0: USB hub found
[    4.776471] hub 2-0:1.0: 3 ports detected
[    4.779789] ata4.00: ATA-7: ST3500641AS, 3.AAJ, max UDMA/133
[    4.779801] ata4.00: 976773168 sectors, multi 16: LBA48 NCQ (depth 0/3=
2)
[    4.793586] ohci_hcd 0000:02:08.1: PCI INT B -> GSI 19 (level, low) ->=
 IRQ 19
[    4.800867] ohci_hcd 0000:02:08.1: OHCI Host Controller
[    4.806211] ohci_hcd 0000:02:08.1: new USB bus registered, assigned bu=
s number 3
[    4.817139] ohci_hcd 0000:02:08.1: irq 19, io mem 0xfe5fe000
[    4.863098] ata4.00: configured for UDMA/100
[    4.867861] scsi 3:0:0:0: Direct-Access     ATA      ST3500641AS      =
3.AA PQ: 0 ANSI: 5
[    4.877090] sd 3:0:0:0: [sdb] 976773168 512-byte logical blocks: (500 =
GB/465 GiB)
[    4.884920] sd 3:0:0:0: [sdb] Write Protect is off
[    4.888803] usb 1-4: New USB device found, idVendor=3D2040, idProduct=3D=
7501
[    4.888814] usb 1-4: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D3
[    4.888824] usb 1-4: Product: WinTV
[    4.888831] usb 1-4: Manufacturer: Hauppauge
[    4.888838] usb 1-4: SerialNumber: 7300-00-F05EA556
[    4.916927] sd 3:0:0:0: [sdb] Mode Sense: 00 3a 00 00
[    4.917041] sd 3:0:0:0: [sdb] Write cache: enabled, read cache: enable=
d, doesn't support DPO or FUA
[    4.926368] sd 3:0:0:0: Attached scsi generic sg2 type 0
[    4.953057]  sdb: sdb1 sdb2
[    4.957281] sd 3:0:0:0: [sdb] Attached SCSI disk
[    5.007314] usb 1-2.3: new low speed USB device using ehci_hcd and add=
ress 4
[    5.105160] usb 1-2.3: New USB device found, idVendor=3D045e, idProduc=
t=3D00d1
[    5.112142] usb 1-2.3: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D0
[    5.119548] usb 1-2.3: Product: Microsoft Optical Mouse with Tilt Whee=
l
[    5.126249] usb 1-2.3: Manufacturer: Microsoft
[    5.391858] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0001
[    5.398741] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
[    5.406062] usb usb3: Product: OHCI Host Controller
[    5.411025] usb usb3: Manufacturer: Linux 2.6.37-rc3-g036b465 ohci_hcd
[    5.417639] usb usb3: SerialNumber: 0000:02:08.1
[    5.422986] hub 3-0:1.0: USB hub found
[    5.426839] hub 3-0:1.0: 2 ports detected
[    5.431608] uhci_hcd: USB Universal Host Controller Interface driver
[    5.438248] uhci_hcd 0000:00:07.2: PCI INT D -> GSI 19 (level, low) ->=
 IRQ 19
[    5.445512] uhci_hcd 0000:00:07.2: UHCI Host Controller
[    5.450850] uhci_hcd 0000:00:07.2: new USB bus registered, assigned bu=
s number 4
[    5.463077] uhci_hcd 0000:00:07.2: irq 19, io base 0x0000ef40
[    5.469042] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0001
[    5.475918] usb usb4: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
[    5.483240] usb usb4: Product: UHCI Host Controller
[    5.488204] usb usb4: Manufacturer: Linux 2.6.37-rc3-g036b465 uhci_hcd
[    5.494818] usb usb4: SerialNumber: 0000:00:07.2
[    5.500188] hub 4-0:1.0: USB hub found
[    5.504040] hub 4-0:1.0: 2 ports detected
[    5.509219] PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq 1
[    5.515533] PNP: PS/2 appears to have AUX port disabled, if this is in=
correct please boot with i8042.nopnp
[    5.526285] serio: i8042 KBD port at 0x60,0x64 irq 1
[    5.536719] mice: PS/2 mouse device common for all mice
[    5.543216] input: PC Speaker as /devices/platform/pcspkr/input/input2
[    5.547978] gameport gameport0: EMU10K1 is pci0000:00:13.1/gameport0, =
io 0xeff0, speed 1217kHz
[    5.559003] I2O subsystem v1.325
[    5.562330] i2o: max drivers =3D 8
[    5.566307] I2O Configuration OSM v1.323
[    5.570471] I2O Bus Adapter OSM v1.317
[    5.574471] I2O Block Device OSM v1.325
[    5.579088] I2O SCSI Peripheral OSM v1.316
[    5.583439] I2O ProcFS OSM v1.316
[    5.587053] i2c /dev entries driver
[    5.591049] ACPI: resource piix4_smbus [io  0x0440-0x0447] conflicts w=
ith ACPI region SMRG [??? 0x00000440-0x0000044f flags 0x47]
[    5.602826] ACPI: If an ACPI driver is available for this device, you =
should use it instead of the native driver
[    5.613617] lirc_dev: IR Remote Control driver registered, major 253=20
[    5.620170] IR NEC protocol handler initialized
[    5.624803] IR RC5(x) protocol handler initialized
[    5.629686] IR RC6 protocol handler initialized
[    5.634303] IR JVC protocol handler initialized
[    5.638919] IR Sony protocol handler initialized
[    5.643618] IR RC5 (streamzap) protocol handler initialized
[    5.649276] IR LIRC bridge handler initialized
[    5.653798] Linux video capture interface: v2.00
[    5.659531] lm78: Found an LM79 chip at 0x290
[    5.666366] device-mapper: ioctl: 4.18.0-ioctl (2010-06-29) initialise=
d: dm-devel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
[    5.675440] cpuidle: using governor ladder
[    5.679663] ioatdma: Intel(R) QuickData Technology Driver 4.00
[    5.702456] input: Microsoft Microsoft Optical Mouse with Tilt Wheel a=
s /devices/pci0000:00/0000:00:12.0/0000:02:08.2/usb1/1-2/1-2.3/1-2.3:1.0/=
input/input3
[    5.717342] generic-usb 0003:045E:00D1.0001: input,hidraw0: USB HID v1=
.11 Mouse [Microsoft Microsoft Optical Mouse with Tilt Wheel] on usb-0000=
:02:08.2-2.3/input0
[    5.732224] usbcore: registered new interface driver usbhid
[    5.737917] usbhid: USB HID core driver
[    5.743425] EMU10K1_Audigy 0000:00:13.0: PCI INT A -> GSI 19 (level, l=
ow) -> IRQ 19
[    5.776471] ALSA device list:
[    5.779597]   #0: SB Live! Value [CT4832] (rev.6, serial:0x80271102) a=
t 0xef20, irq 19
[    5.787830] Netfilter messages via NETLINK v0.30.
[    5.792699] nf_conntrack version 0.5.0 (15075 buckets, 60300 max)
[    5.799727] ctnetlink v0.93: registering with nfnetlink.
[    5.805223] IPv4 over IPv4 tunneling driver
[    5.810595] ip_tables: (C) 2000-2006 Netfilter Core Team
[    5.816207] arp_tables: (C) 2002 David S. Miller
[    5.821052] TCP cubic registered
[    5.824367] NET: Registered protocol family 17
[    5.828959] Registering the dns_resolver key type
[    5.833877] Using IPI No-Shortcut mode
[    5.950461] EXT4-fs (sda2): mounted filesystem with ordered data mode.=
 Opts: (null)
[    5.958434] VFS: Mounted root (ext4 filesystem) readonly on device 8:2=
.
[    5.965214] Freeing unused kernel memory: 448k freed
[    5.972778] Write protecting the kernel text: 5460k
[    5.977977] Write protecting the kernel read-only data: 1560k
[    6.052215] usb 4-1: new full speed USB device using uhci_hcd and addr=
ess 2
[    6.284038] usb 4-1: New USB device found, idVendor=3D1046, idProduct=3D=
9967
[    6.290843] usb 4-1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[    6.298799] usb 4-1: Product: W9967CF
[    6.303095] usb 4-1: Manufacturer: WINBOND
[    6.412037] usb 4-2: new low speed USB device using uhci_hcd and addre=
ss 3
[    6.591063] usb 4-2: New USB device found, idVendor=3D045e, idProduct=3D=
00db
[    6.597875] usb 4-2: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[    6.605131] usb 4-2: Product: Natural=AE Ergonomic Keyboard 4000
[    6.611138] usb 4-2: Manufacturer: Microsoft
[    6.639687] input: Microsoft Natural=AE Ergonomic Keyboard 4000 as /de=
vices/pci0000:00/0000:00:07.2/usb4/4-2/4-2:1.0/input/input4
[    6.651990] microsoft 0003:045E:00DB.0002: input,hidraw1: USB HID v1.1=
1 Keyboard [Microsoft Natural=AE Ergonomic Keyboard 4000] on usb-0000:00:=
07.2-2/input0
[    6.691274] input: Microsoft Natural=AE Ergonomic Keyboard 4000 as /de=
vices/pci0000:00/0000:00:07.2/usb4/4-2/4-2:1.1/input/input5
[    6.703786] microsoft 0003:045E:00DB.0003: input,hidraw2: USB HID v1.1=
1 Device [Microsoft Natural=AE Ergonomic Keyboard 4000] on usb-0000:00:07=
.2-2/input1
[    7.924318] udev: starting version 151
[    7.924549] udevd (972): /proc/972/oom_adj is deprecated, please use /=
proc/972/oom_score_adj instead.
[    8.730590] rtc_cmos 00:02: rtc core: registered rtc_cmos as rtc0
[    8.730687] rtc0: alarms up to one month, 114 bytes nvram
[    8.763756] firewire_ohci 0000:02:0b.0: PCI INT A -> GSI 17 (level, lo=
w) -> IRQ 17
[    8.815309] firewire_ohci: Added fw-ohci device 0000:02:0b.0, OHCI v1.=
0, 4 IR + 8 IT contexts, quirks 0x2
[    8.933662] pvrusb2: Hardware description: WinTV HVR-1950 Model 751xx
[    8.936809] usbcore: registered new interface driver pvrusb2
[    8.936827] pvrusb2: V4L in-tree version:Hauppauge WinTV-PVR-USB2 MPEG=
2 Encoder/Tuner
[    8.936838] pvrusb2: Debug mask is 31 (0x1f)
[    8.977044] pvrusb2: Binding ir_video to i2c address 0x71.
[    9.031459] cx25840 0-0044: cx25843-24 found @ 0x88 (pvrusb2_a)
[    9.042092] pvrusb2: Attached sub-driver cx25840
[    9.243983] tuner 0-0042: chip found @ 0x84 (pvrusb2_a)
[    9.244018] pvrusb2: Attached sub-driver tuner
[    9.317564] firewire_core: created device fw0: GUID 005042b5000097c6, =
S400
[    9.651256] nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> =
IRQ 16
[    9.668176] [drm] nouveau 0000:01:00.0: nouveau_load:896 - vendor: 0x1=
0DE device: 0x2E1 class: 0x30000
[    9.671301] [drm] nouveau 0000:01:00.0: nouveau_load:919 - regs mapped=
 ok at 0xfd000000
[    9.671318] [drm] nouveau 0000:01:00.0: Detected an NV40 generation ca=
rd (0x04b200b1)
[    9.676979] [drm] nouveau 0000:01:00.0: Attempting to load BIOS image =
from PRAMIN
[    9.755724] [drm] nouveau 0000:01:00.0: ... appears to be valid
[    9.755745] [drm] nouveau 0000:01:00.0: BIT BIOS found
[    9.755758] [drm] nouveau 0000:01:00.0: Bios version 05.73.22.51
[    9.755772] [drm] nouveau 0000:01:00.0: TMDS table version 1.1
[    9.755780] [drm] nouveau 0000:01:00.0: TMDS table script pointers not=
 stubbed
[    9.755789] [drm] nouveau 0000:01:00.0: BIT table 'd' not found
[    9.755799] [drm] nouveau 0000:01:00.0: Found Display Configuration Bl=
ock version 3.0
[    9.755813] [drm] nouveau 0000:01:00.0: Raw DCB entry 0: 01000300 0000=
0028
[    9.755825] [drm] nouveau 0000:01:00.0: Raw DCB entry 1: 03000302 0000=
0000
[    9.755835] [drm] nouveau 0000:01:00.0: Raw DCB entry 2: 04011310 0000=
0028
[    9.755845] [drm] nouveau 0000:01:00.0: Raw DCB entry 3: 020223f1 00c0=
c080
[    9.755859] [drm] nouveau 0000:01:00.0: DCB connector table: VHER 0x30=
 5 10 2
[    9.755872] [drm] nouveau 0000:01:00.0:   0: 0x00002030: type 0x30 idx=
 0 tag 0x08
[    9.755884] [drm] nouveau 0000:01:00.0:   1: 0x00000100: type 0x00 idx=
 1 tag 0xff
[    9.755895] [drm] nouveau 0000:01:00.0:   2: 0x00000210: type 0x10 idx=
 2 tag 0xff
[    9.755905] [drm] nouveau 0000:01:00.0:   3: 0x00000211: type 0x11 idx=
 3 tag 0xff
[    9.755916] [drm] nouveau 0000:01:00.0:   4: 0x00000213: type 0x13 idx=
 4 tag 0xff
[    9.755937] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at =
offset 0xCDAD
[    9.755948] [drm] nouveau 0000:01:00.0: 0xCDAD: ------ Executing follo=
wing commands ------
[    9.755961] [drm] nouveau 0000:01:00.0: 0xCDAD: [ (0x53) - INIT_ZM_CR =
]
[    9.755974] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x44, Head: 0x00, Data: 0x03
[    9.755986] [drm] nouveau 0000:01:00.0: 0xCDB0: [ (0x78) - INIT_INDEX_=
IO ]
[    9.755998] [drm] nouveau 0000:01:00.0: 0xCDB0: Port: 0x03C4, Index: 0=
x01, Mask: 0xFF, Data: 0x20
[    9.756012] [drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03C=
4, Index: 0x01, Head: 0x01, Data: 0x20
[    9.756024] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03C=
4, Index: 0x01, Head: 0x01, Data: 0x20
[    9.756035] [drm] nouveau 0000:01:00.0: 0xCDB6: [ (0x53) - INIT_ZM_CR =
]
[    9.756045] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x44, Head: 0x00, Data: 0x00
[    9.756056] [drm] nouveau 0000:01:00.0: 0xCDB9: [ (0x78) - INIT_INDEX_=
IO ]
[    9.756067] [drm] nouveau 0000:01:00.0: 0xCDB9: Port: 0x03C4, Index: 0=
x01, Mask: 0xFF, Data: 0x20
[    9.756079] [drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03C=
4, Index: 0x01, Head: 0x00, Data: 0x00
[    9.756090] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03C=
4, Index: 0x01, Head: 0x00, Data: 0x20
[    9.756115] [drm] nouveau 0000:01:00.0: 0xCDBF: [ (0x65) - INIT_RESET =
]
[    9.756127] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x0000184C, Data:=
 0x00000000
[    9.756139] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0000184C, Data:=
 0x00000000
[    9.756148] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00000200, Data:=
 0x01100000
[    9.756169] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00000200, Data:=
 0x05110111
[    9.756178] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0000184C, Data:=
 0x00000000
[    9.756188] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00001850, Data:=
 0x00000001
[    9.756198] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001850, Data:=
 0x00000000
[    9.756207] [drm] nouveau 0000:01:00.0: 0xCDCC: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.756217] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0000C040, Data:=
 0x3C000400
[    9.756227] [drm] nouveau 0000:01:00.0: 0xCDD5: [ (0x6E) - INIT_NV_REG=
 ]
[    9.756239] [drm] nouveau 0000:01:00.0: 0xCDD5: Reg: 0x00101000, Mask:=
 0xFFFFFFFF, Data: 0x80000000
[    9.756250] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0xA340EE8B
[    9.756259] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00101000, Data:=
 0xA340EE8B
[    9.756269] [drm] nouveau 0000:01:00.0: 0xCDE2: [ (0x6E) - INIT_NV_REG=
 ]
[    9.756280] [drm] nouveau 0000:01:00.0: 0xCDE2: Reg: 0x0010100C, Mask:=
 0xFFFFFFFF, Data: 0x80000000
[    9.756291] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x0010100C, Data:=
 0x80010490
[    9.756300] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0010100C, Data:=
 0x80010490
[    9.756310] [drm] nouveau 0000:01:00.0: 0xCDEF: [ (0x6E) - INIT_NV_REG=
 ]
[    9.756320] [drm] nouveau 0000:01:00.0: 0xCDEF: Reg: 0x00600818, Mask:=
 0xFFFFFFFF, Data: 0x00000000
[    9.756331] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00600818, Data:=
 0x01100010
[    9.756341] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00600818, Data:=
 0x01100010
[    9.756350] [drm] nouveau 0000:01:00.0: 0xCDFC: [ (0x6E) - INIT_NV_REG=
 ]
[    9.756361] [drm] nouveau 0000:01:00.0: 0xCDFC: Reg: 0x0060081C, Mask:=
 0xFFFFFFFF, Data: 0x00000000
[    9.756372] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x0060081C, Data:=
 0x22222222
[    9.756381] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0060081C, Data:=
 0x22222222
[    9.756391] [drm] nouveau 0000:01:00.0: 0xCE09: [ (0x6E) - INIT_NV_REG=
 ]
[    9.756402] [drm] nouveau 0000:01:00.0: 0xCE09: Reg: 0x00600850, Mask:=
 0xFFFFFFFF, Data: 0x00000000
[    9.756413] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00600850, Data:=
 0x00002222
[    9.756422] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00600850, Data:=
 0x00002222
[    9.756432] [drm] nouveau 0000:01:00.0: 0xCE16: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.756441] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00600854, Data:=
 0x00000000
[    9.756451] [drm] nouveau 0000:01:00.0: 0xCE1F: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.756460] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00600858, Data:=
 0x00001FFF
[    9.756470] [drm] nouveau 0000:01:00.0: 0xCE28: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.756480] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00602858, Data:=
 0x00001FFF
[    9.756489] [drm] nouveau 0000:01:00.0: 0xCE31: [ (0x6E) - INIT_NV_REG=
 ]
[    9.756500] [drm] nouveau 0000:01:00.0: 0xCE31: Reg: 0x00600818, Mask:=
 0xFFFFFFFF, Data: 0x00000000
[    9.756511] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00600818, Data:=
 0x01100010
[    9.756520] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00600818, Data:=
 0x01100010
[    9.756530] [drm] nouveau 0000:01:00.0: 0xCE3E: [ (0x6E) - INIT_NV_REG=
 ]
[    9.756540] [drm] nouveau 0000:01:00.0: 0xCE3E: Reg: 0x0060081C, Mask:=
 0xFFFFFFFF, Data: 0x00000000
[    9.756551] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x0060081C, Data:=
 0x22222222
[    9.756561] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0060081C, Data:=
 0x22222222
[    9.756570] [drm] nouveau 0000:01:00.0: 0xCE4B: [ (0x6E) - INIT_NV_REG=
 ]
[    9.756581] [drm] nouveau 0000:01:00.0: 0xCE4B: Reg: 0x00600850, Mask:=
 0xFFFFFFFF, Data: 0x00000000
[    9.756592] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00600850, Data:=
 0x00002222
[    9.756601] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00600850, Data:=
 0x00002222
[    9.756611] [drm] nouveau 0000:01:00.0: 0xCE58: [ (0x58) - INIT_ZM_REG=
_SEQUENCE ]
[    9.756622] [drm] nouveau 0000:01:00.0: 0xCE58: BaseReg: 0x00001540, C=
ount: 0x02
[    9.756632] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001540, Data:=
 0x73F31F0B
[    9.756641] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001544, Data:=
 0x00000FFF
[    9.756651] [drm] nouveau 0000:01:00.0: 0xCE66: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.756660] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100210, Data:=
 0x00000000
[    9.756670] [drm] nouveau 0000:01:00.0: 0xCE6F: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.756679] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004000, Data:=
 0x00010000
[    9.756689] [drm] nouveau 0000:01:00.0: 0xCE78: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.756699] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004008, Data:=
 0x03310000
[    9.756708] [drm] nouveau 0000:01:00.0: 0xCE81: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.756718] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00680580, Data:=
 0x03D0003D
[    9.756728] [drm] nouveau 0000:01:00.0: 0xCE8A: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.756737] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004600, Data:=
 0x80000001
[    9.756747] [drm] nouveau 0000:01:00.0: 0xCE93: [ (0x91) - INIT_ZM_REG=
_GROUP_ADDRESS_LATCHED ]
[    9.756758] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004020, Data:=
 0x34880000
[    9.756767] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004020, Data:=
 0x34800000
[    9.756776] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004020, Data:=
 0x24800000
[    9.756787] [drm] nouveau 0000:01:00.0: 0xCEA5: [ (0x8F) - INIT_RAM_RE=
STRICT_ZM_REG_GROUP ]
[    9.756798] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0xA340EE8B
[    9.756811] [drm] nouveau 0000:01:00.0: 0xCEA5: Reg: 0x00100A40, RegIn=
crement: 0x04, Count: 0x02, StrapRamCfg: 0x02, Index: 0x02
[    9.756822] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A40, Data:=
 0x8703280F
[    9.756831] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A44, Data:=
 0x8703280F
[    9.756842] [drm] nouveau 0000:01:00.0: 0xCEEC: [ (0x58) - INIT_ZM_REG=
_SEQUENCE ]
[    9.756852] [drm] nouveau 0000:01:00.0: 0xCEEC: BaseReg: 0x000015B4, C=
ount: 0x02
[    9.756861] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x000015B4, Data:=
 0x08000000
[    9.756870] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x000015B8, Data:=
 0x98800F08
[    9.756880] [drm] nouveau 0000:01:00.0: 0xCEFA: [ (0x75) - INIT_CONDIT=
ION ]
[    9.756891] [drm] nouveau 0000:01:00.0: 0xCEFA: Condition: 0x03
[    9.756902] [drm] nouveau 0000:01:00.0: 0xCEFA: Cond: 0x03, Reg: 0x000=
00000, Mask: 0x000000FF
[    9.756913] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00000000, Data:=
 0x04B200B1
[    9.756923] [drm] nouveau 0000:01:00.0: 0xCEFA: Checking if 0x000000B1=
 equals 0x000000A1
[    9.756932] [drm] nouveau 0000:01:00.0: 0xCEFA: Condition not fulfille=
d -- skipping following commands
[    9.756944] [drm] nouveau 0000:01:00.0: 0xCEFC: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.756954] [drm] nouveau 0000:01:00.0: 0xCF05: [ (0x38) - INIT_NOT ]
[    9.756963] [drm] nouveau 0000:01:00.0: 0xCF05: ------ Executing follo=
wing commands ------
[    9.756974] [drm] nouveau 0000:01:00.0: 0xCF06: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.756983] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100360, Data:=
 0x8B183A98
[    9.756993] [drm] nouveau 0000:01:00.0: 0xCF0F: [ (0x72) - INIT_RESUME=
 ]
[    9.757003] [drm] nouveau 0000:01:00.0: 0xCF10: [ (0x75) - INIT_CONDIT=
ION ]
[    9.757012] [drm] nouveau 0000:01:00.0: 0xCF10: Condition: 0x00
[    9.757022] [drm] nouveau 0000:01:00.0: 0xCF10: Cond: 0x00, Reg: 0x001=
01000, Mask: 0x00000040
[    9.757033] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0xA340EE8B
[    9.757043] [drm] nouveau 0000:01:00.0: 0xCF10: Checking if 0x00000000=
 equals 0x00000040
[    9.757052] [drm] nouveau 0000:01:00.0: 0xCF10: Condition not fulfille=
d -- skipping following commands
[    9.757063] [drm] nouveau 0000:01:00.0: 0xCF12: [ (0x62) - INIT_ZM_IND=
EX_IO ]
[    9.757073] [drm] nouveau 0000:01:00.0: 0xCF17: [ (0x38) - INIT_NOT ]
[    9.757081] [drm] nouveau 0000:01:00.0: 0xCF17: ------ Executing follo=
wing commands ------
[    9.757092] [drm] nouveau 0000:01:00.0: 0xCF18: [ (0x62) - INIT_ZM_IND=
EX_IO ]
[    9.757112] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x3C, Head: 0x00, Data: 0x00
[    9.757124] [drm] nouveau 0000:01:00.0: 0xCF1D: [ (0x72) - INIT_RESUME=
 ]
[    9.757133] [drm] nouveau 0000:01:00.0: 0xCF1E: [ (0x37) - INIT_COPY ]
[    9.757147] [drm] nouveau 0000:01:00.0: 0xCF1E: Reg: 0x00101000, Shift=
: 0xFE, SrcMask: 0xF0, Port: 0x03D4, Index: 0x3C, Mask: 0x0F
[    9.757159] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0xA340EE8B
[    9.757171] [drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D=
4, Index: 0x3C, Head: 0x00, Data: 0x20
[    9.757182] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x3C, Head: 0x00, Data: 0x20
[    9.757193] [drm] nouveau 0000:01:00.0: 0xCF29: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.757203] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00680510, Data:=
 0x00000000
[    9.757212] [drm] nouveau 0000:01:00.0: 0xCF32: [ (0x6E) - INIT_NV_REG=
 ]
[    9.757223] [drm] nouveau 0000:01:00.0: 0xCF32: Reg: 0x00001580, Mask:=
 0xCFFFFFFF, Data: 0x00000000
[    9.757234] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00001580, Data:=
 0x00000000
[    9.757243] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001580, Data:=
 0x00000000
[    9.757253] [drm] nouveau 0000:01:00.0: 0xCF3F: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.757262] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00000140, Data:=
 0x00000000
[    9.757272] [drm] nouveau 0000:01:00.0: 0xCF48: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.757281] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00000200, Data:=
 0x07110111
[    9.757291] [drm] nouveau 0000:01:00.0: 0xCF51: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.757301] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00680608, Data:=
 0x00100000
[    9.757311] [drm] nouveau 0000:01:00.0: 0xCF5A: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.757320] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00682608, Data:=
 0x00100000
[    9.757330] [drm] nouveau 0000:01:00.0: 0xCF63: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.757339] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00680670, Data:=
 0x00100000
[    9.757349] [drm] nouveau 0000:01:00.0: 0xCF6C: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.757358] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001084, Data:=
 0x00205649
[    9.757368] [drm] nouveau 0000:01:00.0: 0xCF75: [ (0x6B) - INIT_SUB ]
[    9.757378] [drm] nouveau 0000:01:00.0: 0xCF75: Calling script 6
[    9.757388] [drm] nouveau 0000:01:00.0: 0xDCB7: [ (0x4A) - INIT_IO_RES=
TRICT_PLL2 ]
[    9.757403] [drm] nouveau 0000:01:00.0: 0xDCB7: Port: 0x03D4, Index: 0=
x3C, Mask: 0x70, Shift: 0x04, Count: 0x08, Reg: 0x00004004
[    9.757416] [drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D=
4, Index: 0x3C, Head: 0x00, Data: 0x20
[    9.757428] [drm] nouveau 0000:01:00.0: 0xDCB7: Reg: 0x00004004, Confi=
g: 0x02, Freq: 400000kHz
[    9.757442] [drm] nouveau 0000:01:00.0: Loading PLL limits for reg 0x0=
0000000
[    9.757453] [drm] nouveau 0000:01:00.0: pll.vco1.minfreq: 100000
[    9.757461] [drm] nouveau 0000:01:00.0: pll.vco1.maxfreq: 300000
[    9.757470] [drm] nouveau 0000:01:00.0: pll.vco1.min_inputfreq: 2000
[    9.757478] [drm] nouveau 0000:01:00.0: pll.vco1.max_inputfreq: 27000
[    9.757486] [drm] nouveau 0000:01:00.0: pll.vco1.min_n: 8
[    9.757494] [drm] nouveau 0000:01:00.0: pll.vco1.max_n: 255
[    9.757502] [drm] nouveau 0000:01:00.0: pll.vco1.min_m: 1
[    9.757509] [drm] nouveau 0000:01:00.0: pll.vco1.max_m: 255
[    9.757517] [drm] nouveau 0000:01:00.0: pll.vco2.minfreq: 500000
[    9.757525] [drm] nouveau 0000:01:00.0: pll.vco2.maxfreq: 1000000
[    9.757533] [drm] nouveau 0000:01:00.0: pll.vco2.min_inputfreq: 25000
[    9.757541] [drm] nouveau 0000:01:00.0: pll.vco2.max_inputfreq: 75000
[    9.757549] [drm] nouveau 0000:01:00.0: pll.vco2.min_n: 8
[    9.757557] [drm] nouveau 0000:01:00.0: pll.vco2.max_n: 50
[    9.757564] [drm] nouveau 0000:01:00.0: pll.vco2.min_m: 1
[    9.757572] [drm] nouveau 0000:01:00.0: pll.vco2.max_m: 255
[    9.757580] [drm] nouveau 0000:01:00.0: pll.max_log2p: 7
[    9.757587] [drm] nouveau 0000:01:00.0: pll.log2p_bias: 0
[    9.757595] [drm] nouveau 0000:01:00.0: pll.refclk: 27000
[    9.757646] [drm] nouveau 0000:01:00.0: 0xDCE2: [ (0x71) - INIT_DONE ]
[    9.757656] [drm] nouveau 0000:01:00.0: 0xCF75: End of script 6
[    9.757665] [drm] nouveau 0000:01:00.0: 0xCF77: [ (0x5B) - INIT_SUB_DI=
RECT ]
[    9.757675] [drm] nouveau 0000:01:00.0: 0xCF77: Executing subroutine a=
t 0xDE82
[    9.757685] [drm] nouveau 0000:01:00.0: 0xDE82: [ (0x92) - INIT_RESERV=
ED ]
[    9.757694] [drm] nouveau 0000:01:00.0: 0xDE83: [ (0x71) - INIT_DONE ]
[    9.757704] [drm] nouveau 0000:01:00.0: 0xCF77: End of 0xDE82 subrouti=
ne
[    9.757714] [drm] nouveau 0000:01:00.0: 0xCF7A: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.757723] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004024, Data:=
 0x00005904
[    9.757733] [drm] nouveau 0000:01:00.0: 0xCF83: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.757742] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004020, Data:=
 0xACB12000
[    9.757752] [drm] nouveau 0000:01:00.0: 0xCF8C: [ (0x74) - INIT_TIME ]
[    9.757762] [drm] nouveau 0000:01:00.0: 0xCF8C: Sleeping for 0x00C8 mi=
croseconds
[    9.757972] [drm] nouveau 0000:01:00.0: 0xCF8F: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.757982] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004020, Data:=
 0xACB13000
[    9.757991] [drm] nouveau 0000:01:00.0: 0xCF98: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.758001] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004020, Data:=
 0xAC313000
[    9.758011] [drm] nouveau 0000:01:00.0: 0xCFA1: [ (0x90) - INIT_COPY_Z=
M_REG ]
[    9.758021] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00004024, Data:=
 0x00001401
[    9.758030] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0000403C, Data:=
 0x00001401
[    9.758040] [drm] nouveau 0000:01:00.0: 0xCFAA: [ (0x90) - INIT_COPY_Z=
M_REG ]
[    9.758050] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00004020, Data:=
 0xAC413000
[    9.758059] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004038, Data:=
 0xAC413000
[    9.758069] [drm] nouveau 0000:01:00.0: 0xCFB3: [ (0x8F) - INIT_RAM_RE=
STRICT_ZM_REG_GROUP ]
[    9.758080] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0xA340EE8B
[    9.758092] [drm] nouveau 0000:01:00.0: 0xCFB3: Reg: 0x00100440, RegIn=
crement: 0x10, Count: 0x06, StrapRamCfg: 0x02, Index: 0x02
[    9.758114] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100440, Data:=
 0x01F00111
[    9.758124] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100450, Data:=
 0x01F00111
[    9.758134] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100460, Data:=
 0x00001111
[    9.758143] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100470, Data:=
 0x00001111
[    9.758152] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100480, Data:=
 0x00000000
[    9.758161] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100490, Data:=
 0x00000000
[    9.758171] [drm] nouveau 0000:01:00.0: 0xD07A: [ (0x8F) - INIT_RAM_RE=
STRICT_ZM_REG_GROUP ]
[    9.758182] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0xA340EE8B
[    9.758194] [drm] nouveau 0000:01:00.0: 0xD07A: Reg: 0x00100444, RegIn=
crement: 0x10, Count: 0x06, StrapRamCfg: 0x02, Index: 0x02
[    9.758205] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100444, Data:=
 0x01022123
[    9.758215] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100454, Data:=
 0x01022123
[    9.758224] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100464, Data:=
 0x000D0010
[    9.758233] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100474, Data:=
 0x000D0010
[    9.758242] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100484, Data:=
 0x00000000
[    9.758251] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100494, Data:=
 0x00000000
[    9.758262] [drm] nouveau 0000:01:00.0: 0xD141: [ (0x8F) - INIT_RAM_RE=
STRICT_ZM_REG_GROUP ]
[    9.758273] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0xA340EE8B
[    9.758284] [drm] nouveau 0000:01:00.0: 0xD141: Reg: 0x001003E4, RegIn=
crement: 0x04, Count: 0x0E, StrapRamCfg: 0x02, Index: 0x02
[    9.758296] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001003E4, Data:=
 0x04040004
[    9.758305] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001003E8, Data:=
 0x00000404
[    9.758314] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001003EC, Data:=
 0x04040004
[    9.758324] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001003F0, Data:=
 0x00000404
[    9.758333] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001003F4, Data:=
 0x00000404
[    9.758342] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001003F8, Data:=
 0x04000004
[    9.758351] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001003FC, Data:=
 0x04000004
[    9.758361] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100400, Data:=
 0x0B00000B
[    9.758370] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100404, Data:=
 0x00000000
[    9.758379] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100408, Data:=
 0x0B00000B
[    9.758388] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0010040C, Data:=
 0x00000000
[    9.758397] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100410, Data:=
 0x00000000
[    9.758406] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100414, Data:=
 0x00000000
[    9.758415] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100418, Data:=
 0x00000000
[    9.758425] [drm] nouveau 0000:01:00.0: 0xD308: [ (0x6E) - INIT_NV_REG=
 ]
[    9.758436] [drm] nouveau 0000:01:00.0: 0xD308: Reg: 0x0000425C, Mask:=
 0xFFFFFFFF, Data: 0x00000000
[    9.758447] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x0000425C, Data:=
 0x0C221464
[    9.758456] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0000425C, Data:=
 0x0C221464
[    9.758466] [drm] nouveau 0000:01:00.0: 0xD315: [ (0x6E) - INIT_NV_REG=
 ]
[    9.758477] [drm] nouveau 0000:01:00.0: 0xD315: Reg: 0x00004410, Mask:=
 0xFFF003FF, Data: 0x00000400
[    9.758488] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00004410, Data:=
 0x161004E0
[    9.758497] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004410, Data:=
 0x161004E0
[    9.758507] [drm] nouveau 0000:01:00.0: 0xD322: [ (0x6E) - INIT_NV_REG=
 ]
[    9.758517] [drm] nouveau 0000:01:00.0: 0xD322: Reg: 0x0000C040, Mask:=
 0xFFFCFFFF, Data: 0x00030000
[    9.758528] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x0000C040, Data:=
 0x3C0B07FF
[    9.758538] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0000C040, Data:=
 0x3C0B07FF
[    9.758547] [drm] nouveau 0000:01:00.0: 0xD32F: [ (0x8F) - INIT_RAM_RE=
STRICT_ZM_REG_GROUP ]
[    9.758558] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0xA340EE8B
[    9.758570] [drm] nouveau 0000:01:00.0: 0xD32F: Reg: 0x00100220, RegIn=
crement: 0x04, Count: 0x09, StrapRamCfg: 0x02, Index: 0x02
[    9.758581] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100220, Data:=
 0x06121E18
[    9.758590] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100224, Data:=
 0x0A010805
[    9.758600] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100228, Data:=
 0x23230606
[    9.758609] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0010022C, Data:=
 0x5311F304
[    9.758618] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100230, Data:=
 0x00000C1F
[    9.758627] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100234, Data:=
 0x01E69677
[    9.758637] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100238, Data:=
 0x001E0211
[    9.758646] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0010023C, Data:=
 0x00000031
[    9.758655] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100240, Data:=
 0x00090000
[    9.758665] [drm] nouveau 0000:01:00.0: 0xD456: [ (0x71) - INIT_DONE ]
[    9.758675] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at =
offset 0xD457
[    9.758683] [drm] nouveau 0000:01:00.0: 0xD457: ------ Executing follo=
wing commands ------
[    9.758694] [drm] nouveau 0000:01:00.0: 0xD457: [ (0x58) - INIT_ZM_REG=
_SEQUENCE ]
[    9.758704] [drm] nouveau 0000:01:00.0: 0xD457: BaseReg: 0x00100328, C=
ount: 0x09
[    9.758714] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100328, Data:=
 0x08030114
[    9.758723] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0010032C, Data:=
 0xFFFF18FF
[    9.758732] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100330, Data:=
 0xCCCC5044
[    9.758742] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100334, Data:=
 0x33332022
[    9.758751] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100338, Data:=
 0x0000000A
[    9.758760] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0010033C, Data:=
 0x00041244
[    9.758769] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100340, Data:=
 0x000001FB
[    9.758778] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100344, Data:=
 0x00000000
[    9.758787] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100348, Data:=
 0x00000000
[    9.758797] [drm] nouveau 0000:01:00.0: 0xD481: [ (0x58) - INIT_ZM_REG=
_SEQUENCE ]
[    9.758808] [drm] nouveau 0000:01:00.0: 0xD481: BaseReg: 0x00100350, C=
ount: 0x02
[    9.758817] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100350, Data:=
 0x0000440A
[    9.758826] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100354, Data:=
 0x00000806
[    9.758836] [drm] nouveau 0000:01:00.0: 0xD48F: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.758845] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100210, Data:=
 0x00000000
[    9.758855] [drm] nouveau 0000:01:00.0: 0xD498: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.758865] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001220, Data:=
 0x00000000
[    9.758874] [drm] nouveau 0000:01:00.0: 0xD4A1: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.758884] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001228, Data:=
 0x00000000
[    9.758893] [drm] nouveau 0000:01:00.0: 0xD4AA: [ (0x58) - INIT_ZM_REG=
_SEQUENCE ]
[    9.758904] [drm] nouveau 0000:01:00.0: 0xD4AA: BaseReg: 0x00100A50, C=
ount: 0x02
[    9.758913] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A50, Data:=
 0x00100077
[    9.758922] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A54, Data:=
 0x00100077
[    9.758932] [drm] nouveau 0000:01:00.0: 0xD4B8: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.758942] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001218, Data:=
 0x00010000
[    9.758952] [drm] nouveau 0000:01:00.0: 0xD4C1: [ (0x58) - INIT_ZM_REG=
_SEQUENCE ]
[    9.758963] [drm] nouveau 0000:01:00.0: 0xD4C1: BaseReg: 0x00001230, C=
ount: 0x03
[    9.758972] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001230, Data:=
 0x8000DFDF
[    9.758981] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001234, Data:=
 0x0004000F
[    9.758991] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001238, Data:=
 0xF83E0000
[    9.759001] [drm] nouveau 0000:01:00.0: 0xD4D3: [ (0x58) - INIT_ZM_REG=
_SEQUENCE ]
[    9.759011] [drm] nouveau 0000:01:00.0: 0xD4D3: BaseReg: 0x00001240, C=
ount: 0x04
[    9.759020] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001240, Data:=
 0x80000A0A
[    9.759029] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001244, Data:=
 0x0001000F
[    9.759039] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001248, Data:=
 0xF83E0000
[    9.759048] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0000124C, Data:=
 0xAA11AA11
[    9.759058] [drm] nouveau 0000:01:00.0: 0xD4E9: [ (0x6E) - INIT_NV_REG=
 ]
[    9.759068] [drm] nouveau 0000:01:00.0: 0xD4E9: Reg: 0x00001280, Mask:=
 0xFFFFFFFF, Data: 0x00000000
[    9.759079] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00001280, Data:=
 0x2F192F19
[    9.759088] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001280, Data:=
 0x2F192F19
[    9.759108] [drm] nouveau 0000:01:00.0: 0xD4F6: [ (0x74) - INIT_TIME ]
[    9.759117] [drm] nouveau 0000:01:00.0: 0xD4F6: Sleeping for 0x07D0 mi=
croseconds
[    9.762117] [drm] nouveau 0000:01:00.0: 0xD4F9: [ (0x8F) - INIT_RAM_RE=
STRICT_ZM_REG_GROUP ]
[    9.762131] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0xA340EE8B
[    9.762144] [drm] nouveau 0000:01:00.0: 0xD4F9: Reg: 0x00100218, RegIn=
crement: 0x04, Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[    9.762156] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100218, Data:=
 0x00000100
[    9.762166] [drm] nouveau 0000:01:00.0: 0xD520: [ (0x74) - INIT_TIME ]
[    9.762176] [drm] nouveau 0000:01:00.0: 0xD520: Sleeping for 0x07D0 mi=
croseconds
[    9.765107] [drm] nouveau 0000:01:00.0: 0xD523: [ (0x6F) - INIT_MACRO =
]
[    9.765120] [drm] nouveau 0000:01:00.0: 0xD523: Macro: 0x01, MacroTabl=
eIndex: 0x01, Count: 0x01
[    9.765130] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0010021C, Data:=
 0x00000001
[    9.765141] [drm] nouveau 0000:01:00.0: 0xD525: [ (0x74) - INIT_TIME ]
[    9.765150] [drm] nouveau 0000:01:00.0: 0xD525: Sleeping for 0x07D0 mi=
croseconds
[    9.768108] [drm] nouveau 0000:01:00.0: 0xD528: [ (0x8F) - INIT_RAM_RE=
STRICT_ZM_REG_GROUP ]
[    9.768120] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0xA340EE8B
[    9.768132] [drm] nouveau 0000:01:00.0: 0xD528: Reg: 0x00100200, RegIn=
crement: 0x04, Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[    9.768144] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100200, Data:=
 0x43003071
[    9.768154] [drm] nouveau 0000:01:00.0: 0xD54F: [ (0x75) - INIT_CONDIT=
ION ]
[    9.768164] [drm] nouveau 0000:01:00.0: 0xD54F: Condition: 0x02
[    9.768175] [drm] nouveau 0000:01:00.0: 0xD54F: Cond: 0x02, Reg: 0x001=
01000, Mask: 0x00000020
[    9.768186] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0xA340EE8B
[    9.768196] [drm] nouveau 0000:01:00.0: 0xD54F: Checking if 0x00000000=
 equals 0x00000020
[    9.768205] [drm] nouveau 0000:01:00.0: 0xD54F: Condition not fulfille=
d -- skipping following commands
[    9.768216] [drm] nouveau 0000:01:00.0: 0xD551: [ (0x6E) - INIT_NV_REG=
 ]
[    9.768226] [drm] nouveau 0000:01:00.0: 0xD55E: [ (0x72) - INIT_RESUME=
 ]
[    9.768235] [drm] nouveau 0000:01:00.0: 0xD55E: ---- Executing followi=
ng commands ----
[    9.768246] [drm] nouveau 0000:01:00.0: 0xD55F: [ (0x75) - INIT_CONDIT=
ION ]
[    9.768255] [drm] nouveau 0000:01:00.0: 0xD55F: Condition: 0x04
[    9.768265] [drm] nouveau 0000:01:00.0: 0xD55F: Cond: 0x04, Reg: 0x000=
01540, Mask: 0x000F0000
[    9.768276] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00001540, Data:=
 0x73F31F0B
[    9.768287] [drm] nouveau 0000:01:00.0: 0xD55F: Checking if 0x00030000=
 equals 0x00030000
[    9.768296] [drm] nouveau 0000:01:00.0: 0xD55F: Condition fulfilled --=
 continuing to execute
[    9.768307] [drm] nouveau 0000:01:00.0: 0xD561: [ (0x38) - INIT_NOT ]
[    9.768316] [drm] nouveau 0000:01:00.0: 0xD561: ------ Skipping follow=
ing commands  ------
[    9.768326] [drm] nouveau 0000:01:00.0: 0xD562: [ (0x6E) - INIT_NV_REG=
 ]
[    9.768336] [drm] nouveau 0000:01:00.0: 0xD56F: [ (0x5F) - INIT_COPY_N=
V_REG ]
[    9.768347] [drm] nouveau 0000:01:00.0: 0xD585: [ (0x72) - INIT_RESUME=
 ]
[    9.768355] [drm] nouveau 0000:01:00.0: 0xD585: ---- Executing followi=
ng commands ----
[    9.768366] [drm] nouveau 0000:01:00.0: 0xD586: [ (0x74) - INIT_TIME ]
[    9.768375] [drm] nouveau 0000:01:00.0: 0xD586: Sleeping for 0x07D0 mi=
croseconds
[    9.771107] [drm] nouveau 0000:01:00.0: 0xD589: [ (0x8F) - INIT_RAM_RE=
STRICT_ZM_REG_GROUP ]
[    9.771120] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0xA340EE8B
[    9.771132] [drm] nouveau 0000:01:00.0: 0xD589: Reg: 0x00100204, RegIn=
crement: 0x04, Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[    9.771143] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100204, Data:=
 0x0055A220
[    9.771153] [drm] nouveau 0000:01:00.0: 0xD5B0: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.771163] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100210, Data:=
 0x00000000
[    9.771173] [drm] nouveau 0000:01:00.0: 0xD5B9: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.771182] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100214, Data:=
 0x000000B0
[    9.771192] [drm] nouveau 0000:01:00.0: 0xD5C2: [ (0x74) - INIT_TIME ]
[    9.771201] [drm] nouveau 0000:01:00.0: 0xD5C2: Sleeping for 0x00C8 mi=
croseconds
[    9.771412] [drm] nouveau 0000:01:00.0: 0xD5C5: [ (0x8F) - INIT_RAM_RE=
STRICT_ZM_REG_GROUP ]
[    9.771422] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0xA340EE8B
[    9.771434] [drm] nouveau 0000:01:00.0: 0xD5C5: Reg: 0x00100218, RegIn=
crement: 0x04, Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[    9.771446] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100218, Data:=
 0x00000100
[    9.771456] [drm] nouveau 0000:01:00.0: 0xD5EC: [ (0x74) - INIT_TIME ]
[    9.771465] [drm] nouveau 0000:01:00.0: 0xD5EC: Sleeping for 0x07D0 mi=
croseconds
[    9.774108] [drm] nouveau 0000:01:00.0: 0xD5EF: [ (0x8F) - INIT_RAM_RE=
STRICT_ZM_REG_GROUP ]
[    9.774120] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0xA340EE8B
[    9.774133] [drm] nouveau 0000:01:00.0: 0xD5EF: Reg: 0x00100218, RegIn=
crement: 0x04, Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[    9.774144] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100218, Data:=
 0x00000101
[    9.774154] [drm] nouveau 0000:01:00.0: 0xD616: [ (0x74) - INIT_TIME ]
[    9.774164] [drm] nouveau 0000:01:00.0: 0xD616: Sleeping for 0x07D0 mi=
croseconds
[    9.777107] [drm] nouveau 0000:01:00.0: 0xD619: [ (0x6F) - INIT_MACRO =
]
[    9.777118] [drm] nouveau 0000:01:00.0: 0xD619: Macro: 0x03, MacroTabl=
eIndex: 0x03, Count: 0x01
[    9.777129] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D8, Data:=
 0x00000001
[    9.777139] [drm] nouveau 0000:01:00.0: 0xD61B: [ (0x6F) - INIT_MACRO =
]
[    9.777149] [drm] nouveau 0000:01:00.0: 0xD61B: Macro: 0x00, MacroTabl=
eIndex: 0x00, Count: 0x01
[    9.777160] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D4, Data:=
 0x00000001
[    9.777170] [drm] nouveau 0000:01:00.0: 0xD61D: [ (0x8F) - INIT_RAM_RE=
STRICT_ZM_REG_GROUP ]
[    9.777181] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0xA340EE8B
[    9.777193] [drm] nouveau 0000:01:00.0: 0xD61D: Reg: 0x001002E0, RegIn=
crement: 0x04, Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[    9.777204] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002E0, Data:=
 0x00200000
[    9.777214] [drm] nouveau 0000:01:00.0: 0xD644: [ (0x90) - INIT_COPY_Z=
M_REG ]
[    9.777225] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002E0, Data:=
 0x00300000
[    9.777234] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002E8, Data:=
 0x00300000
[    9.777245] [drm] nouveau 0000:01:00.0: 0xD64D: [ (0x8F) - INIT_RAM_RE=
STRICT_ZM_REG_GROUP ]
[    9.777255] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0xA340EE8B
[    9.777267] [drm] nouveau 0000:01:00.0: 0xD64D: Reg: 0x001002E0, RegIn=
crement: 0x04, Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[    9.777278] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002E0, Data:=
 0x00300000
[    9.777289] [drm] nouveau 0000:01:00.0: 0xD674: [ (0x90) - INIT_COPY_Z=
M_REG ]
[    9.777299] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002E0, Data:=
 0x00300000
[    9.777308] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002E8, Data:=
 0x00300000
[    9.777318] [drm] nouveau 0000:01:00.0: 0xD67D: [ (0x8F) - INIT_RAM_RE=
STRICT_ZM_REG_GROUP ]
[    9.777329] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0xA340EE8B
[    9.777341] [drm] nouveau 0000:01:00.0: 0xD67D: Reg: 0x001002C4, RegIn=
crement: 0x04, Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[    9.777352] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C4, Data:=
 0x00100006
[    9.777362] [drm] nouveau 0000:01:00.0: 0xD6A4: [ (0x90) - INIT_COPY_Z=
M_REG ]
[    9.777373] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C4, Data:=
 0x00100006
[    9.777382] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002CC, Data:=
 0x00100006
[    9.777392] [drm] nouveau 0000:01:00.0: 0xD6AD: [ (0x8F) - INIT_RAM_RE=
STRICT_ZM_REG_GROUP ]
[    9.777403] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0xA340EE8B
[    9.777415] [drm] nouveau 0000:01:00.0: 0xD6AD: Reg: 0x00100900, RegIn=
crement: 0x04, Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[    9.777426] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100900, Data:=
 0x00000101
[    9.777436] [drm] nouveau 0000:01:00.0: 0xD6D4: [ (0x39) - INIT_IO_FLA=
G_CONDITION ]
[    9.777452] [drm] nouveau 0000:01:00.0: 0xD6D4: Port: 0x03D4, Index: 0=
x3C, Mask: 0x70, Shift: 0x04, FlagArray: 0x58DC, FAMask: 0x08, Cmpval: 0x=
00
[    9.777467] [drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D=
4, Index: 0x3C, Head: 0x00, Data: 0x20
[    9.777478] [drm] nouveau 0000:01:00.0: 0xD6D4: Checking if 0x00 equal=
s 0x00
[    9.777487] [drm] nouveau 0000:01:00.0: 0xD6D4: Condition fulfilled --=
 continuing to execute
[    9.777498] [drm] nouveau 0000:01:00.0: 0xD6D6: [ (0x5B) - INIT_SUB_DI=
RECT ]
[    9.777508] [drm] nouveau 0000:01:00.0: 0xD6D6: Executing subroutine a=
t 0xD79D
[    9.777518] [drm] nouveau 0000:01:00.0: 0xD79D: [ (0x8F) - INIT_RAM_RE=
STRICT_ZM_REG_GROUP ]
[    9.777529] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0xA340EE8B
[    9.777541] [drm] nouveau 0000:01:00.0: 0xD79D: Reg: 0x00100940, RegIn=
crement: 0x10, Count: 0x06, StrapRamCfg: 0x02, Index: 0x02
[    9.777552] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100940, Data:=
 0x00000000
[    9.777562] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100950, Data:=
 0xACABAA89
[    9.777571] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100960, Data:=
 0x00000000
[    9.777581] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100970, Data:=
 0xACABAA89
[    9.777590] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100980, Data:=
 0x00000000
[    9.777599] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100990, Data:=
 0x21411411
[    9.777609] [drm] nouveau 0000:01:00.0: 0xD864: [ (0x8F) - INIT_RAM_RE=
STRICT_ZM_REG_GROUP ]
[    9.777620] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0xA340EE8B
[    9.777632] [drm] nouveau 0000:01:00.0: 0xD864: Reg: 0x00100944, RegIn=
crement: 0x10, Count: 0x06, StrapRamCfg: 0x02, Index: 0x02
[    9.777644] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100944, Data:=
 0x00000000
[    9.777653] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100954, Data:=
 0xBDA8A9AA
[    9.777663] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100964, Data:=
 0x00000000
[    9.777672] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100974, Data:=
 0xBDA8A9AA
[    9.777681] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100984, Data:=
 0x00000000
[    9.777690] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100994, Data:=
 0x11131221
[    9.777700] [drm] nouveau 0000:01:00.0: 0xD92B: [ (0x71) - INIT_DONE ]
[    9.777710] [drm] nouveau 0000:01:00.0: 0xD6D6: End of 0xD79D subrouti=
ne
[    9.777720] [drm] nouveau 0000:01:00.0: 0xD6D9: [ (0x38) - INIT_NOT ]
[    9.777728] [drm] nouveau 0000:01:00.0: 0xD6D9: ------ Skipping follow=
ing commands  ------
[    9.777739] [drm] nouveau 0000:01:00.0: 0xD6DA: [ (0x5B) - INIT_SUB_DI=
RECT ]
[    9.777749] [drm] nouveau 0000:01:00.0: 0xD6DD: [ (0x72) - INIT_RESUME=
 ]
[    9.777757] [drm] nouveau 0000:01:00.0: 0xD6DD: ---- Executing followi=
ng commands ----
[    9.777767] [drm] nouveau 0000:01:00.0: 0xD6DE: [ (0x39) - INIT_IO_FLA=
G_CONDITION ]
[    9.777781] [drm] nouveau 0000:01:00.0: 0xD6DE: Port: 0x03D4, Index: 0=
x3C, Mask: 0x70, Shift: 0x04, FlagArray: 0x58DC, FAMask: 0x10, Cmpval: 0x=
00
[    9.777795] [drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D=
4, Index: 0x3C, Head: 0x00, Data: 0x20
[    9.777806] [drm] nouveau 0000:01:00.0: 0xD6DE: Checking if 0x00 equal=
s 0x00
[    9.777815] [drm] nouveau 0000:01:00.0: 0xD6DE: Condition fulfilled --=
 continuing to execute
[    9.777825] [drm] nouveau 0000:01:00.0: 0xD6E0: [ (0x5B) - INIT_SUB_DI=
RECT ]
[    9.777834] [drm] nouveau 0000:01:00.0: 0xD6E0: Executing subroutine a=
t 0xDA6D
[    9.777844] [drm] nouveau 0000:01:00.0: 0xDA6D: [ (0x8F) - INIT_RAM_RE=
STRICT_ZM_REG_GROUP ]
[    9.777855] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0xA340EE8B
[    9.777867] [drm] nouveau 0000:01:00.0: 0xDA6D: Reg: 0x00100A00, RegIn=
crement: 0x04, Count: 0x02, StrapRamCfg: 0x02, Index: 0x02
[    9.777879] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A00, Data:=
 0x11111111
[    9.777888] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A04, Data:=
 0x11111111
[    9.777898] [drm] nouveau 0000:01:00.0: 0xDAB4: [ (0x8F) - INIT_RAM_RE=
STRICT_ZM_REG_GROUP ]
[    9.777909] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0xA340EE8B
[    9.777921] [drm] nouveau 0000:01:00.0: 0xDAB4: Reg: 0x00100A10, RegIn=
crement: 0x04, Count: 0x02, StrapRamCfg: 0x02, Index: 0x02
[    9.777933] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A10, Data:=
 0x45332202
[    9.777943] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A14, Data:=
 0x23103103
[    9.777953] [drm] nouveau 0000:01:00.0: 0xDAFB: [ (0x71) - INIT_DONE ]
[    9.777962] [drm] nouveau 0000:01:00.0: 0xD6E0: End of 0xDA6D subrouti=
ne
[    9.777972] [drm] nouveau 0000:01:00.0: 0xD6E3: [ (0x72) - INIT_RESUME=
 ]
[    9.777982] [drm] nouveau 0000:01:00.0: 0xD6E4: [ (0x39) - INIT_IO_FLA=
G_CONDITION ]
[    9.777995] [drm] nouveau 0000:01:00.0: 0xD6E4: Port: 0x03D4, Index: 0=
x3C, Mask: 0x70, Shift: 0x04, FlagArray: 0x58DC, FAMask: 0x80, Cmpval: 0x=
00
[    9.778009] [drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D=
4, Index: 0x3C, Head: 0x00, Data: 0x20
[    9.778020] [drm] nouveau 0000:01:00.0: 0xD6E4: Checking if 0x00 equal=
s 0x00
[    9.778029] [drm] nouveau 0000:01:00.0: 0xD6E4: Condition fulfilled --=
 continuing to execute
[    9.778040] [drm] nouveau 0000:01:00.0: 0xD6E6: [ (0x5B) - INIT_SUB_DI=
RECT ]
[    9.778049] [drm] nouveau 0000:01:00.0: 0xD6E6: Executing subroutine a=
t 0xDAFC
[    9.778059] [drm] nouveau 0000:01:00.0: 0xDAFC: [ (0x8F) - INIT_RAM_RE=
STRICT_ZM_REG_GROUP ]
[    9.778070] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0xA340EE8B
[    9.778082] [drm] nouveau 0000:01:00.0: 0xDAFC: Reg: 0x00100A20, RegIn=
crement: 0x04, Count: 0x02, StrapRamCfg: 0x02, Index: 0x02
[    9.778114] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A20, Data:=
 0x11011101
[    9.778125] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A24, Data:=
 0x11111111
[    9.778141] [drm] nouveau 0000:01:00.0: 0xDB43: [ (0x8F) - INIT_RAM_RE=
STRICT_ZM_REG_GROUP ]
[    9.778153] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0xA340EE8B
[    9.778164] [drm] nouveau 0000:01:00.0: 0xDB43: Reg: 0x00100A30, RegIn=
crement: 0x04, Count: 0x02, StrapRamCfg: 0x02, Index: 0x02
[    9.778176] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A30, Data:=
 0x20F000E2
[    9.778185] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A34, Data:=
 0x20005010
[    9.778195] [drm] nouveau 0000:01:00.0: 0xDB8A: [ (0x71) - INIT_DONE ]
[    9.778205] [drm] nouveau 0000:01:00.0: 0xD6E6: End of 0xDAFC subrouti=
ne
[    9.778214] [drm] nouveau 0000:01:00.0: 0xD6E9: [ (0x72) - INIT_RESUME=
 ]
[    9.778224] [drm] nouveau 0000:01:00.0: 0xD6EA: [ (0x58) - INIT_ZM_REG=
_SEQUENCE ]
[    9.778235] [drm] nouveau 0000:01:00.0: 0xD6EA: BaseReg: 0x00100920, C=
ount: 0x02
[    9.778245] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100920, Data:=
 0xCCCCCCCC
[    9.778254] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100924, Data:=
 0xCCCDCCCC
[    9.778264] [drm] nouveau 0000:01:00.0: 0xD6F8: [ (0x5B) - INIT_SUB_DI=
RECT ]
[    9.778273] [drm] nouveau 0000:01:00.0: 0xD6F8: Executing subroutine a=
t 0xD755
[    9.778283] [drm] nouveau 0000:01:00.0: 0xD755: [ (0x8F) - INIT_RAM_RE=
STRICT_ZM_REG_GROUP ]
[    9.778294] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0xA340EE8B
[    9.778306] [drm] nouveau 0000:01:00.0: 0xD755: Reg: 0x00100930, RegIn=
crement: 0x04, Count: 0x02, StrapRamCfg: 0x02, Index: 0x02
[    9.778318] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100930, Data:=
 0x00000000
[    9.778327] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100934, Data:=
 0x00000000
[    9.778337] [drm] nouveau 0000:01:00.0: 0xD79C: [ (0x71) - INIT_DONE ]
[    9.778346] [drm] nouveau 0000:01:00.0: 0xD6F8: End of 0xD755 subrouti=
ne
[    9.778356] [drm] nouveau 0000:01:00.0: 0xD6FB: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.778365] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100910, Data:=
 0x00000000
[    9.778375] [drm] nouveau 0000:01:00.0: 0xD704: [ (0x8F) - INIT_RAM_RE=
STRICT_ZM_REG_GROUP ]
[    9.778386] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0xA340EE8B
[    9.778398] [drm] nouveau 0000:01:00.0: 0xD704: Reg: 0x00100914, RegIn=
crement: 0x04, Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[    9.778409] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100914, Data:=
 0x10000111
[    9.778420] [drm] nouveau 0000:01:00.0: 0xD72B: [ (0x58) - INIT_ZM_REG=
_SEQUENCE ]
[    9.778430] [drm] nouveau 0000:01:00.0: 0xD72B: BaseReg: 0x00100080, C=
ount: 0x02
[    9.778439] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100080, Data:=
 0xF0000020
[    9.778449] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100084, Data:=
 0x0000001D
[    9.778459] [drm] nouveau 0000:01:00.0: 0xD739: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.778468] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100090, Data:=
 0x00000000
[    9.778478] [drm] nouveau 0000:01:00.0: 0xD742: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.778488] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001000A0, Data:=
 0x00000000
[    9.778497] [drm] nouveau 0000:01:00.0: 0xD74B: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.778507] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001000F0, Data:=
 0x00000000
[    9.778518] [drm] nouveau 0000:01:00.0: 0xD754: [ (0x71) - INIT_DONE ]
[    9.778529] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at =
offset 0xDB8B
[    9.778538] [drm] nouveau 0000:01:00.0: 0xDB8B: ------ Executing follo=
wing commands ------
[    9.778550] [drm] nouveau 0000:01:00.0: 0xDB8B: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.778560] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00680D38, Data:=
 0x80000000
[    9.778570] [drm] nouveau 0000:01:00.0: 0xDB94: [ (0x4B) - INIT_PLL2 ]
[    9.778580] [drm] nouveau 0000:01:00.0: 0xDB94: Reg: 0x680508, Freq: 3=
6000kHz
[    9.778592] [drm] nouveau 0000:01:00.0: Loading PLL limits for reg 0x0=
0000000
[    9.778602] [drm] nouveau 0000:01:00.0: pll.vco1.minfreq: 100000
[    9.778610] [drm] nouveau 0000:01:00.0: pll.vco1.maxfreq: 300000
[    9.778618] [drm] nouveau 0000:01:00.0: pll.vco1.min_inputfreq: 2000
[    9.778626] [drm] nouveau 0000:01:00.0: pll.vco1.max_inputfreq: 27000
[    9.778649] [drm] nouveau 0000:01:00.0: pll.vco1.min_n: 8
[    9.778657] [drm] nouveau 0000:01:00.0: pll.vco1.max_n: 255
[    9.778665] [drm] nouveau 0000:01:00.0: pll.vco1.min_m: 1
[    9.778672] [drm] nouveau 0000:01:00.0: pll.vco1.max_m: 255
[    9.778680] [drm] nouveau 0000:01:00.0: pll.vco2.minfreq: 500000
[    9.778688] [drm] nouveau 0000:01:00.0: pll.vco2.maxfreq: 1000000
[    9.778696] [drm] nouveau 0000:01:00.0: pll.vco2.min_inputfreq: 25000
[    9.778704] [drm] nouveau 0000:01:00.0: pll.vco2.max_inputfreq: 75000
[    9.778712] [drm] nouveau 0000:01:00.0: pll.vco2.min_n: 8
[    9.778719] [drm] nouveau 0000:01:00.0: pll.vco2.max_n: 50
[    9.778727] [drm] nouveau 0000:01:00.0: pll.vco2.min_m: 1
[    9.778734] [drm] nouveau 0000:01:00.0: pll.vco2.max_m: 255
[    9.778742] [drm] nouveau 0000:01:00.0: pll.max_log2p: 7
[    9.778749] [drm] nouveau 0000:01:00.0: pll.log2p_bias: 0
[    9.778757] [drm] nouveau 0000:01:00.0: pll.refclk: 27000
[    9.778770] [drm] nouveau 0000:01:00.0: 0xDB9D: [ (0x58) - INIT_ZM_REG=
_SEQUENCE ]
[    9.778780] [drm] nouveau 0000:01:00.0: 0xDB9D: BaseReg: 0x00001088, C=
ount: 0x02
[    9.778790] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001088, Data:=
 0x000011F0
[    9.778800] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0000108C, Data:=
 0x000000D0
[    9.778810] [drm] nouveau 0000:01:00.0: 0xDBAB: [ (0x6E) - INIT_NV_REG=
 ]
[    9.778820] [drm] nouveau 0000:01:00.0: 0xDBAB: Reg: 0x00001518, Mask:=
 0xFFFFFFFF, Data: 0x00000000
[    9.778832] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00001518, Data:=
 0x00000000
[    9.778841] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001518, Data:=
 0x00000000
[    9.778851] [drm] nouveau 0000:01:00.0: 0xDBB8: [ (0x6E) - INIT_NV_REG=
 ]
[    9.778861] [drm] nouveau 0000:01:00.0: 0xDBB8: Reg: 0x00001530, Mask:=
 0xFFFFFFFF, Data: 0x00000000
[    9.778872] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00001530, Data:=
 0x800503FF
[    9.778882] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001530, Data:=
 0x800503FF
[    9.778892] [drm] nouveau 0000:01:00.0: 0xDBC5: [ (0x52) - INIT_CR ]
[    9.778903] [drm] nouveau 0000:01:00.0: 0xDBC5: Index: 0x2B, Mask: 0x2=
0, Data: 0x00
[    9.778915] [drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D=
4, Index: 0x2B, Head: 0x00, Data: 0x20
[    9.778927] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x2B, Head: 0x00, Data: 0x20
[    9.778939] [drm] nouveau 0000:01:00.0: 0xDBC9: [ (0x54) - INIT_ZM_CR_=
GROUP ]
[    9.778951] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x38, Head: 0x00, Data: 0x00
[    9.778962] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x1A, Head: 0x00, Data: 0x3F
[    9.778974] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x28, Head: 0x00, Data: 0x00
[    9.778985] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x33, Head: 0x00, Data: 0x00
[    9.778996] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x21, Head: 0x00, Data: 0xFA
[    9.779008] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x43, Head: 0x00, Data: 0x01
[    9.779019] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x52, Head: 0x00, Data: 0x04
[    9.779031] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x53, Head: 0x00, Data: 0x40
[    9.779042] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x2C, Head: 0x00, Data: 0x00
[    9.779053] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x3A, Head: 0x00, Data: 0x00
[    9.779065] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x3B, Head: 0x00, Data: 0x00
[    9.779076] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x4A, Head: 0x00, Data: 0x00
[    9.779087] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x4B, Head: 0x00, Data: 0x00
[    9.779110] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x4C, Head: 0x00, Data: 0x00
[    9.779122] [drm] nouveau 0000:01:00.0: 0xDBE7: [ (0x51) - INIT_CR_IND=
EX_ADDRESS_LATCHED ]
[    9.779135] [drm] nouveau 0000:01:00.0: 0xDBE7: Index1: 0x57, Index2: =
0x58, BaseAddr: 0x00, Count: 0x10
[    9.779148] [drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D=
4, Index: 0x57, Head: 0x00, Data: 0x04
[    9.779159] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x00, Data: 0x00
[    9.779170] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x00, Data: 0x7F
[    9.779182] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x00, Data: 0x01
[    9.779193] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x00, Data: 0x00
[    9.779204] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x00, Data: 0x02
[    9.779216] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x00, Data: 0x00
[    9.779227] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x00, Data: 0x03
[    9.779238] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x00, Data: 0x00
[    9.779249] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x00, Data: 0x04
[    9.779261] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x00, Data: 0x00
[    9.779272] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x00, Data: 0x05
[    9.779283] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x00, Data: 0x00
[    9.779295] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x00, Data: 0x06
[    9.779306] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x00, Data: 0x00
[    9.779317] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x00, Data: 0x07
[    9.779328] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x00, Data: 0x00
[    9.779340] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x00, Data: 0x08
[    9.779351] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x00, Data: 0x00
[    9.779362] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x00, Data: 0x09
[    9.779374] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x00, Data: 0x00
[    9.779385] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x00, Data: 0x0A
[    9.779396] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x00, Data: 0x00
[    9.779407] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x00, Data: 0x0B
[    9.779419] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x00, Data: 0x00
[    9.779430] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x00, Data: 0x0C
[    9.779441] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x00, Data: 0x00
[    9.779453] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x00, Data: 0x0D
[    9.779464] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x00, Data: 0x00
[    9.779475] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x00, Data: 0x0E
[    9.779487] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x00, Data: 0x00
[    9.779498] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x00, Data: 0x0F
[    9.779509] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x00, Data: 0x00
[    9.779520] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x00, Data: 0x04
[    9.779531] [drm] nouveau 0000:01:00.0: 0xDBFC: [ (0x78) - INIT_INDEX_=
IO ]
[    9.779543] [drm] nouveau 0000:01:00.0: 0xDBFC: Port: 0x03D4, Index: 0=
x85, Mask: 0x00, Data: 0xFF
[    9.779555] [drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D=
4, Index: 0x85, Head: 0x00, Data: 0xFF
[    9.779566] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x85, Head: 0x00, Data: 0xFF
[    9.779577] [drm] nouveau 0000:01:00.0: 0xDC02: [ (0x78) - INIT_INDEX_=
IO ]
[    9.779589] [drm] nouveau 0000:01:00.0: 0xDC02: Port: 0x03D4, Index: 0=
x86, Mask: 0x00, Data: 0x01
[    9.779600] [drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D=
4, Index: 0x86, Head: 0x00, Data: 0x01
[    9.779612] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x86, Head: 0x00, Data: 0x01
[    9.779623] [drm] nouveau 0000:01:00.0: 0xDC08: [ (0x53) - INIT_ZM_CR =
]
[    9.779633] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x44, Head: 0x00, Data: 0x03
[    9.779643] [drm] nouveau 0000:01:00.0: 0xDC0B: [ (0x52) - INIT_CR ]
[    9.779653] [drm] nouveau 0000:01:00.0: 0xDC0B: Index: 0x2B, Mask: 0x1=
0, Data: 0x00
[    9.779665] [drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D=
4, Index: 0x2B, Head: 0x01, Data: 0x10
[    9.779676] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x2B, Head: 0x01, Data: 0x10
[    9.779687] [drm] nouveau 0000:01:00.0: 0xDC0F: [ (0x54) - INIT_ZM_CR_=
GROUP ]
[    9.779698] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x33, Head: 0x01, Data: 0x00
[    9.779710] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x21, Head: 0x01, Data: 0xFA
[    9.779721] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x43, Head: 0x01, Data: 0x01
[    9.779733] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x2C, Head: 0x01, Data: 0x00
[    9.779744] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x3A, Head: 0x01, Data: 0x00
[    9.779755] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x3B, Head: 0x01, Data: 0x00
[    9.779767] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x3C, Head: 0x01, Data: 0x00
[    9.779778] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x4A, Head: 0x01, Data: 0x00
[    9.779790] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x4B, Head: 0x01, Data: 0x00
[    9.779801] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x4C, Head: 0x01, Data: 0x00
[    9.779812] [drm] nouveau 0000:01:00.0: 0xDC25: [ (0x51) - INIT_CR_IND=
EX_ADDRESS_LATCHED ]
[    9.779824] [drm] nouveau 0000:01:00.0: 0xDC25: Index1: 0x57, Index2: =
0x58, BaseAddr: 0x00, Count: 0x10
[    9.779836] [drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D=
4, Index: 0x57, Head: 0x01, Data: 0x00
[    9.779848] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x01, Data: 0x00
[    9.779859] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x01, Data: 0x7F
[    9.779870] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x01, Data: 0x01
[    9.779882] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x01, Data: 0x00
[    9.779893] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x01, Data: 0x02
[    9.779904] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x01, Data: 0x00
[    9.779916] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x01, Data: 0x03
[    9.779927] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x01, Data: 0x00
[    9.779939] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x01, Data: 0x04
[    9.779951] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x01, Data: 0x00
[    9.779962] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x01, Data: 0x05
[    9.779973] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x01, Data: 0x00
[    9.779985] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x01, Data: 0x06
[    9.779996] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x01, Data: 0x00
[    9.780007] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x01, Data: 0x07
[    9.780019] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x01, Data: 0x00
[    9.780030] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x01, Data: 0x08
[    9.780041] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x01, Data: 0x00
[    9.780053] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x01, Data: 0x09
[    9.780064] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x01, Data: 0x00
[    9.780075] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x01, Data: 0x0A
[    9.780086] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x01, Data: 0x00
[    9.780108] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x01, Data: 0x0B
[    9.780119] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x01, Data: 0x00
[    9.780131] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x01, Data: 0x0C
[    9.780142] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x01, Data: 0x00
[    9.780153] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x01, Data: 0x0D
[    9.780164] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x01, Data: 0x00
[    9.780176] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x01, Data: 0x0E
[    9.780187] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x01, Data: 0x00
[    9.780198] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x01, Data: 0x0F
[    9.780210] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x58, Head: 0x01, Data: 0x00
[    9.780221] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x57, Head: 0x01, Data: 0x00
[    9.780232] [drm] nouveau 0000:01:00.0: 0xDC3A: [ (0x78) - INIT_INDEX_=
IO ]
[    9.780243] [drm] nouveau 0000:01:00.0: 0xDC3A: Port: 0x03D4, Index: 0=
x85, Mask: 0x00, Data: 0xFF
[    9.780256] [drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D=
4, Index: 0x85, Head: 0x01, Data: 0xFF
[    9.780267] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x85, Head: 0x01, Data: 0xFF
[    9.780278] [drm] nouveau 0000:01:00.0: 0xDC40: [ (0x78) - INIT_INDEX_=
IO ]
[    9.780289] [drm] nouveau 0000:01:00.0: 0xDC40: Port: 0x03D4, Index: 0=
x86, Mask: 0x00, Data: 0x01
[    9.780301] [drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D=
4, Index: 0x86, Head: 0x01, Data: 0x01
[    9.780313] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x86, Head: 0x01, Data: 0x01
[    9.780324] [drm] nouveau 0000:01:00.0: 0xDC46: [ (0x53) - INIT_ZM_CR =
]
[    9.780334] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x44, Head: 0x00, Data: 0x00
[    9.780345] [drm] nouveau 0000:01:00.0: 0xDC49: [ (0x6E) - INIT_NV_REG=
 ]
[    9.780356] [drm] nouveau 0000:01:00.0: 0xDC49: Reg: 0x00001584, Mask:=
 0xFFF00000, Data: 0x00000000
[    9.780367] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00001584, Data:=
 0x00000000
[    9.780377] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001584, Data:=
 0x00000000
[    9.780387] [drm] nouveau 0000:01:00.0: 0xDC56: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.780396] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100210, Data:=
 0x80000000
[    9.780406] [drm] nouveau 0000:01:00.0: 0xDC5F: [ (0x6E) - INIT_NV_REG=
 ]
[    9.780417] [drm] nouveau 0000:01:00.0: 0xDC5F: Reg: 0x0068052C, Mask:=
 0xFFFFFEFF, Data: 0x00000001
[    9.780428] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x0068052C, Data:=
 0x00000001
[    9.780438] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0068052C, Data:=
 0x00000001
[    9.780447] [drm] nouveau 0000:01:00.0: 0xDC6C: [ (0x6E) - INIT_NV_REG=
 ]
[    9.780458] [drm] nouveau 0000:01:00.0: 0xDC6C: Reg: 0x0068252C, Mask:=
 0xFFFFFFFF, Data: 0x00000101
[    9.780469] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x0068252C, Data:=
 0x00000100
[    9.780479] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0068252C, Data:=
 0x00000101
[    9.780488] [drm] nouveau 0000:01:00.0: 0xDC79: [ (0x6E) - INIT_NV_REG=
 ]
[    9.780499] [drm] nouveau 0000:01:00.0: 0xDC79: Reg: 0x00680848, Mask:=
 0xFFFFFFFF, Data: 0x00100000
[    9.780510] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00680848, Data:=
 0x15100011
[    9.780520] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00680848, Data:=
 0x15100011
[    9.780529] [drm] nouveau 0000:01:00.0: 0xDC86: [ (0x6E) - INIT_NV_REG=
 ]
[    9.780540] [drm] nouveau 0000:01:00.0: 0xDC86: Reg: 0x00682848, Mask:=
 0xFFFFFFFF, Data: 0x00100000
[    9.780551] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00682848, Data:=
 0x15100011
[    9.780561] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00682848, Data:=
 0x15100011
[    9.780571] [drm] nouveau 0000:01:00.0: 0xDC93: [ (0x6E) - INIT_NV_REG=
 ]
[    9.780581] [drm] nouveau 0000:01:00.0: 0xDC93: Reg: 0x00680880, Mask:=
 0xFFFBFFFF, Data: 0x00000000
[    9.780593] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00680880, Data:=
 0x01101191
[    9.780602] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00680880, Data:=
 0x01101191
[    9.780612] [drm] nouveau 0000:01:00.0: 0xDCA0: [ (0x6E) - INIT_NV_REG=
 ]
[    9.780622] [drm] nouveau 0000:01:00.0: 0xDCA0: Reg: 0x00682880, Mask:=
 0xDFFBFFFF, Data: 0x00000000
[    9.780634] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00682880, Data:=
 0x01101111
[    9.780643] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00682880, Data:=
 0x01101111
[    9.780653] [drm] nouveau 0000:01:00.0: 0xDCAD: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.780662] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001200, Data:=
 0x0003103C
[    9.780672] [drm] nouveau 0000:01:00.0: 0xDCB6: [ (0x71) - INIT_DONE ]
[    9.780682] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at =
offset 0xDD0F
[    9.780691] [drm] nouveau 0000:01:00.0: 0xDD0F: ------ Executing follo=
wing commands ------
[    9.780701] [drm] nouveau 0000:01:00.0: 0xDD0F: [ (0x5B) - INIT_SUB_DI=
RECT ]
[    9.780710] [drm] nouveau 0000:01:00.0: 0xDD0F: Executing subroutine a=
t 0x28B2
[    9.780720] [drm] nouveau 0000:01:00.0: 0x28B2: [ (0x71) - INIT_DONE ]
[    9.780729] [drm] nouveau 0000:01:00.0: 0xDD0F: End of 0x28B2 subrouti=
ne
[    9.780739] [drm] nouveau 0000:01:00.0: 0xDD12: [ (0x8F) - INIT_RAM_RE=
STRICT_ZM_REG_GROUP ]
[    9.780750] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0xA340EE8B
[    9.780763] [drm] nouveau 0000:01:00.0: 0xDD12: Reg: 0x001002C0, RegIn=
crement: 0x04, Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[    9.780774] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C0, Data:=
 0x00000B52
[    9.780784] [drm] nouveau 0000:01:00.0: 0xDD39: [ (0x90) - INIT_COPY_Z=
M_REG ]
[    9.780795] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C0, Data:=
 0x00000A52
[    9.780804] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C8, Data:=
 0x00000A52
[    9.780814] [drm] nouveau 0000:01:00.0: 0xDD42: [ (0x74) - INIT_TIME ]
[    9.780823] [drm] nouveau 0000:01:00.0: 0xDD42: Sleeping for 0x03E8 mi=
croseconds
[    9.782107] [drm] nouveau 0000:01:00.0: 0xDD45: [ (0x6F) - INIT_MACRO =
]
[    9.782119] [drm] nouveau 0000:01:00.0: 0xDD45: Macro: 0x00, MacroTabl=
eIndex: 0x00, Count: 0x01
[    9.782129] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D4, Data:=
 0x00000001
[    9.782140] [drm] nouveau 0000:01:00.0: 0xDD47: [ (0x33) - INIT_REPEAT=
 ]
[    9.782149] [drm] nouveau 0000:01:00.0: 0xDD47: Repeating following se=
gment 10 times
[    9.782160] [drm] nouveau 0000:01:00.0: 0xDD49: [ (0x6F) - INIT_MACRO =
]
[    9.782170] [drm] nouveau 0000:01:00.0: 0xDD49: Macro: 0x02, MacroTabl=
eIndex: 0x02, Count: 0x01
[    9.782181] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D0, Data:=
 0x00000001
[    9.782190] [drm] nouveau 0000:01:00.0: 0xDD4B: [ (0x36) - INIT_END_RE=
PEAT ]
[    9.782200] [drm] nouveau 0000:01:00.0: 0xDD49: [ (0x6F) - INIT_MACRO =
]
[    9.782211] [drm] nouveau 0000:01:00.0: 0xDD49: Macro: 0x02, MacroTabl=
eIndex: 0x02, Count: 0x01
[    9.782221] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D0, Data:=
 0x00000001
[    9.782231] [drm] nouveau 0000:01:00.0: 0xDD4B: [ (0x36) - INIT_END_RE=
PEAT ]
[    9.782240] [drm] nouveau 0000:01:00.0: 0xDD49: [ (0x6F) - INIT_MACRO =
]
[    9.782251] [drm] nouveau 0000:01:00.0: 0xDD49: Macro: 0x02, MacroTabl=
eIndex: 0x02, Count: 0x01
[    9.782261] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D0, Data:=
 0x00000001
[    9.782271] [drm] nouveau 0000:01:00.0: 0xDD4B: [ (0x36) - INIT_END_RE=
PEAT ]
[    9.782281] [drm] nouveau 0000:01:00.0: 0xDD49: [ (0x6F) - INIT_MACRO =
]
[    9.782291] [drm] nouveau 0000:01:00.0: 0xDD49: Macro: 0x02, MacroTabl=
eIndex: 0x02, Count: 0x01
[    9.782301] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D0, Data:=
 0x00000001
[    9.782311] [drm] nouveau 0000:01:00.0: 0xDD4B: [ (0x36) - INIT_END_RE=
PEAT ]
[    9.782321] [drm] nouveau 0000:01:00.0: 0xDD49: [ (0x6F) - INIT_MACRO =
]
[    9.782331] [drm] nouveau 0000:01:00.0: 0xDD49: Macro: 0x02, MacroTabl=
eIndex: 0x02, Count: 0x01
[    9.782342] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D0, Data:=
 0x00000001
[    9.782352] [drm] nouveau 0000:01:00.0: 0xDD4B: [ (0x36) - INIT_END_RE=
PEAT ]
[    9.782361] [drm] nouveau 0000:01:00.0: 0xDD49: [ (0x6F) - INIT_MACRO =
]
[    9.782372] [drm] nouveau 0000:01:00.0: 0xDD49: Macro: 0x02, MacroTabl=
eIndex: 0x02, Count: 0x01
[    9.782382] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D0, Data:=
 0x00000001
[    9.782392] [drm] nouveau 0000:01:00.0: 0xDD4B: [ (0x36) - INIT_END_RE=
PEAT ]
[    9.782402] [drm] nouveau 0000:01:00.0: 0xDD49: [ (0x6F) - INIT_MACRO =
]
[    9.782412] [drm] nouveau 0000:01:00.0: 0xDD49: Macro: 0x02, MacroTabl=
eIndex: 0x02, Count: 0x01
[    9.782422] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D0, Data:=
 0x00000001
[    9.782432] [drm] nouveau 0000:01:00.0: 0xDD4B: [ (0x36) - INIT_END_RE=
PEAT ]
[    9.782442] [drm] nouveau 0000:01:00.0: 0xDD49: [ (0x6F) - INIT_MACRO =
]
[    9.782453] [drm] nouveau 0000:01:00.0: 0xDD49: Macro: 0x02, MacroTabl=
eIndex: 0x02, Count: 0x01
[    9.782463] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D0, Data:=
 0x00000001
[    9.782473] [drm] nouveau 0000:01:00.0: 0xDD4B: [ (0x36) - INIT_END_RE=
PEAT ]
[    9.782483] [drm] nouveau 0000:01:00.0: 0xDD49: [ (0x6F) - INIT_MACRO =
]
[    9.782493] [drm] nouveau 0000:01:00.0: 0xDD49: Macro: 0x02, MacroTabl=
eIndex: 0x02, Count: 0x01
[    9.782503] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D0, Data:=
 0x00000001
[    9.782513] [drm] nouveau 0000:01:00.0: 0xDD4B: [ (0x36) - INIT_END_RE=
PEAT ]
[    9.782523] [drm] nouveau 0000:01:00.0: 0xDD49: [ (0x6F) - INIT_MACRO =
]
[    9.782533] [drm] nouveau 0000:01:00.0: 0xDD49: Macro: 0x02, MacroTabl=
eIndex: 0x02, Count: 0x01
[    9.782544] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D0, Data:=
 0x00000001
[    9.782554] [drm] nouveau 0000:01:00.0: 0xDD4B: [ (0x36) - INIT_END_RE=
PEAT ]
[    9.782563] [drm] nouveau 0000:01:00.0: 0xDD4C: [ (0x6E) - INIT_NV_REG=
 ]
[    9.782574] [drm] nouveau 0000:01:00.0: 0xDD4C: Reg: 0x001002C0, Mask:=
 0xFFFFFEFF, Data: 0x00000000
[    9.782585] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C0, Data:=
 0x00000A52
[    9.782595] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C0, Data:=
 0x00000A52
[    9.782605] [drm] nouveau 0000:01:00.0: 0xDD59: [ (0x90) - INIT_COPY_Z=
M_REG ]
[    9.782615] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C0, Data:=
 0x00000A52
[    9.782625] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C8, Data:=
 0x00000A52
[    9.782634] [drm] nouveau 0000:01:00.0: 0xDD62: [ (0x74) - INIT_TIME ]
[    9.782644] [drm] nouveau 0000:01:00.0: 0xDD62: Sleeping for 0x0064 mi=
croseconds
[    9.782754] [drm] nouveau 0000:01:00.0: 0xDD65: [ (0x6F) - INIT_MACRO =
]
[    9.782764] [drm] nouveau 0000:01:00.0: 0xDD65: Macro: 0x04, MacroTabl=
eIndex: 0x04, Count: 0x01
[    9.782775] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002DC, Data:=
 0x00000001
[    9.782785] [drm] nouveau 0000:01:00.0: 0xDD67: [ (0x6B) - INIT_SUB ]
[    9.782794] [drm] nouveau 0000:01:00.0: 0xDD67: Calling script 7
[    9.782804] [drm] nouveau 0000:01:00.0: 0xDCE3: [ (0x4A) - INIT_IO_RES=
TRICT_PLL2 ]
[    9.782818] [drm] nouveau 0000:01:00.0: 0xDCE3: Port: 0x03D4, Index: 0=
x3C, Mask: 0x70, Shift: 0x04, Count: 0x08, Reg: 0x00004024
[    9.782832] [drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D=
4, Index: 0x3C, Head: 0x00, Data: 0x20
[    9.782844] [drm] nouveau 0000:01:00.0: 0xDCE3: Reg: 0x00004024, Confi=
g: 0x02, Freq: 270000kHz
[    9.782855] [drm] nouveau 0000:01:00.0: Loading PLL limits for reg 0x0=
0004020
[    9.782864] [drm] nouveau 0000:01:00.0: pll.vco1.minfreq: 400000
[    9.782872] [drm] nouveau 0000:01:00.0: pll.vco1.maxfreq: 800000
[    9.782880] [drm] nouveau 0000:01:00.0: pll.vco1.min_inputfreq: 5000
[    9.782888] [drm] nouveau 0000:01:00.0: pll.vco1.max_inputfreq: 75000
[    9.782896] [drm] nouveau 0000:01:00.0: pll.vco1.min_n: 8
[    9.782903] [drm] nouveau 0000:01:00.0: pll.vco1.max_n: 255
[    9.782911] [drm] nouveau 0000:01:00.0: pll.vco1.min_m: 1
[    9.782918] [drm] nouveau 0000:01:00.0: pll.vco1.max_m: 255
[    9.782926] [drm] nouveau 0000:01:00.0: pll.vco2.minfreq: 400000
[    9.782934] [drm] nouveau 0000:01:00.0: pll.vco2.maxfreq: 800000
[    9.782942] [drm] nouveau 0000:01:00.0: pll.vco2.min_inputfreq: 0
[    9.782950] [drm] nouveau 0000:01:00.0: pll.vco2.max_inputfreq: 800000
[    9.782958] [drm] nouveau 0000:01:00.0: pll.vco2.min_n: 1
[    9.782965] [drm] nouveau 0000:01:00.0: pll.vco2.max_n: 1
[    9.782973] [drm] nouveau 0000:01:00.0: pll.vco2.min_m: 1
[    9.782980] [drm] nouveau 0000:01:00.0: pll.vco2.max_m: 1
[    9.782987] [drm] nouveau 0000:01:00.0: pll.max_log2p: 7
[    9.782995] [drm] nouveau 0000:01:00.0: pll.log2p_bias: 3
[    9.783002] [drm] nouveau 0000:01:00.0: pll.refclk: 27000
[    9.783013] [drm] nouveau 0000:01:00.0: 0xDD0E: [ (0x71) - INIT_DONE ]
[    9.783023] [drm] nouveau 0000:01:00.0: 0xDD67: End of script 7
[    9.783032] [drm] nouveau 0000:01:00.0: 0xDD69: [ (0x74) - INIT_TIME ]
[    9.783041] [drm] nouveau 0000:01:00.0: 0xDD69: Sleeping for 0x03E8 mi=
croseconds
[    9.785111] [drm] nouveau 0000:01:00.0: 0xDD6C: [ (0x6F) - INIT_MACRO =
]
[    9.785123] [drm] nouveau 0000:01:00.0: 0xDD6C: Macro: 0x05, MacroTabl=
eIndex: 0x05, Count: 0x01
[    9.785133] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002DC, Data:=
 0x00000000
[    9.785144] [drm] nouveau 0000:01:00.0: 0xDD6E: [ (0x6B) - INIT_SUB ]
[    9.785153] [drm] nouveau 0000:01:00.0: 0xDD6E: Calling script 8
[    9.785163] [drm] nouveau 0000:01:00.0: 0x5BE8: [ (0x78) - INIT_INDEX_=
IO ]
[    9.785174] [drm] nouveau 0000:01:00.0: 0x5BE8: Port: 0x03D4, Index: 0=
x44, Mask: 0x00, Data: 0x00
[    9.785187] [drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D=
4, Index: 0x44, Head: 0x00, Data: 0x00
[    9.785198] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x44, Head: 0x00, Data: 0x00
[    9.785209] [drm] nouveau 0000:01:00.0: 0x5BEE: [ (0x39) - INIT_IO_FLA=
G_CONDITION ]
[    9.785223] [drm] nouveau 0000:01:00.0: 0x5BEE: Port: 0x03D4, Index: 0=
x3C, Mask: 0x70, Shift: 0x04, FlagArray: 0x58DC, FAMask: 0x20, Cmpval: 0x=
00
[    9.785237] [drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D=
4, Index: 0x3C, Head: 0x00, Data: 0x20
[    9.785248] [drm] nouveau 0000:01:00.0: 0x5BEE: Checking if 0x00 equal=
s 0x00
[    9.785257] [drm] nouveau 0000:01:00.0: 0x5BEE: Condition fulfilled --=
 continuing to execute
[    9.785267] [drm] nouveau 0000:01:00.0: 0x5BF0: [ (0x6E) - INIT_NV_REG=
 ]
[    9.785278] [drm] nouveau 0000:01:00.0: 0x5BF0: Reg: 0x001002C8, Mask:=
 0xFFFFFEFF, Data: 0x00000000
[    9.785289] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C8, Data:=
 0x00000A52
[    9.785299] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C8, Data:=
 0x00000A52
[    9.785309] [drm] nouveau 0000:01:00.0: 0x5BFD: [ (0x90) - INIT_COPY_Z=
M_REG ]
[    9.785320] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C8, Data:=
 0x00000A52
[    9.785329] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C0, Data:=
 0x00000A52
[    9.785339] [drm] nouveau 0000:01:00.0: 0x5C06: [ (0x6E) - INIT_NV_REG=
 ]
[    9.785349] [drm] nouveau 0000:01:00.0: 0x5C06: Reg: 0x001002C8, Mask:=
 0xFFFFFFFF, Data: 0x00000100
[    9.785361] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C8, Data:=
 0x00000A52
[    9.785370] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C8, Data:=
 0x00000B52
[    9.785380] [drm] nouveau 0000:01:00.0: 0x5C13: [ (0x90) - INIT_COPY_Z=
M_REG ]
[    9.785391] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C8, Data:=
 0x00000A52
[    9.785400] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C0, Data:=
 0x00000A52
[    9.785410] [drm] nouveau 0000:01:00.0: 0x5C1C: [ (0x6E) - INIT_NV_REG=
 ]
[    9.785420] [drm] nouveau 0000:01:00.0: 0x5C1C: Reg: 0x001002C8, Mask:=
 0xFFFFFEFF, Data: 0x00000000
[    9.785432] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C8, Data:=
 0x00000A52
[    9.785441] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C8, Data:=
 0x00000A52
[    9.785451] [drm] nouveau 0000:01:00.0: 0x5C29: [ (0x90) - INIT_COPY_Z=
M_REG ]
[    9.785462] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C8, Data:=
 0x00000A52
[    9.785471] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C0, Data:=
 0x00000A52
[    9.785481] [drm] nouveau 0000:01:00.0: 0x5C32: [ (0x72) - INIT_RESUME=
 ]
[    9.785491] [drm] nouveau 0000:01:00.0: 0x5C33: [ (0x39) - INIT_IO_FLA=
G_CONDITION ]
[    9.785504] [drm] nouveau 0000:01:00.0: 0x5C33: Port: 0x03D4, Index: 0=
x3C, Mask: 0x70, Shift: 0x04, FlagArray: 0x58DC, FAMask: 0x2F, Cmpval: 0x=
03
[    9.785518] [drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D=
4, Index: 0x3C, Head: 0x00, Data: 0x20
[    9.785529] [drm] nouveau 0000:01:00.0: 0x5C33: Checking if 0x02 equal=
s 0x03
[    9.785538] [drm] nouveau 0000:01:00.0: 0x5C33: Condition not fulfille=
d -- skipping following commands
[    9.785549] [drm] nouveau 0000:01:00.0: 0x5C35: [ (0x74) - INIT_TIME ]
[    9.785559] [drm] nouveau 0000:01:00.0: 0x5C38: [ (0x72) - INIT_RESUME=
 ]
[    9.785567] [drm] nouveau 0000:01:00.0: 0x5C38: ---- Executing followi=
ng commands ----
[    9.785578] [drm] nouveau 0000:01:00.0: 0x5C39: [ (0x71) - INIT_DONE ]
[    9.785587] [drm] nouveau 0000:01:00.0: 0xDD6E: End of script 8
[    9.785596] [drm] nouveau 0000:01:00.0: 0xDD70: [ (0x74) - INIT_TIME ]
[    9.785605] [drm] nouveau 0000:01:00.0: 0xDD70: Sleeping for 0x03E8 mi=
croseconds
[    9.787107] [drm] nouveau 0000:01:00.0: 0xDD73: [ (0x8F) - INIT_RAM_RE=
STRICT_ZM_REG_GROUP ]
[    9.787119] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0xA340EE8B
[    9.787131] [drm] nouveau 0000:01:00.0: 0xDD73: Reg: 0x001004E0, RegIn=
crement: 0x04, Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[    9.787143] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001004E0, Data:=
 0x8030010B
[    9.787153] [drm] nouveau 0000:01:00.0: 0xDD9A: [ (0x6E) - INIT_NV_REG=
 ]
[    9.787164] [drm] nouveau 0000:01:00.0: 0xDD9A: Reg: 0x00100200, Mask:=
 0xFFFFFFFF, Data: 0x10000000
[    9.787175] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00100200, Data:=
 0x53003071
[    9.787185] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100200, Data:=
 0x53003071
[    9.787195] [drm] nouveau 0000:01:00.0: 0xDDA7: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.787204] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100210, Data:=
 0x80000001
[    9.787214] [drm] nouveau 0000:01:00.0: 0xDDB0: [ (0x8F) - INIT_RAM_RE=
STRICT_ZM_REG_GROUP ]
[    9.787225] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0xA340EE8B
[    9.787237] [drm] nouveau 0000:01:00.0: 0xDDB0: Reg: 0x001002C4, RegIn=
crement: 0x04, Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[    9.787248] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C4, Data:=
 0x00100386
[    9.787259] [drm] nouveau 0000:01:00.0: 0xDDD7: [ (0x90) - INIT_COPY_Z=
M_REG ]
[    9.787269] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C4, Data:=
 0x00100006
[    9.787279] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002CC, Data:=
 0x00100006
[    9.787289] [drm] nouveau 0000:01:00.0: 0xDDE0: [ (0x8F) - INIT_RAM_RE=
STRICT_ZM_REG_GROUP ]
[    9.787300] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data:=
 0xA340EE8B
[    9.787311] [drm] nouveau 0000:01:00.0: 0xDDE0: Reg: 0x001002C4, RegIn=
crement: 0x04, Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[    9.787323] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C4, Data:=
 0x00100006
[    9.787333] [drm] nouveau 0000:01:00.0: 0xDE07: [ (0x90) - INIT_COPY_Z=
M_REG ]
[    9.787343] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C4, Data:=
 0x00100006
[    9.787353] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002CC, Data:=
 0x00100006
[    9.787363] [drm] nouveau 0000:01:00.0: 0xDE10: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.787372] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0070FFF0, Data:=
 0x00000000
[    9.787382] [drm] nouveau 0000:01:00.0: 0xDE19: [ (0x63) - INIT_COMPUT=
E_MEM ]
[    9.787392] [drm] nouveau 0000:01:00.0: 0xDE1A: [ (0x6E) - INIT_NV_REG=
 ]
[    9.787403] [drm] nouveau 0000:01:00.0: 0xDE1A: Reg: 0x00100200, Mask:=
 0xFFFFFFFF, Data: 0x00000000
[    9.787414] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00100200, Data:=
 0x53003071
[    9.787424] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100200, Data:=
 0x53003071
[    9.787434] [drm] nouveau 0000:01:00.0: 0xDE27: [ (0x78) - INIT_INDEX_=
IO ]
[    9.787445] [drm] nouveau 0000:01:00.0: 0xDE27: Port: 0x03C4, Index: 0=
x01, Mask: 0xDF, Data: 0x00
[    9.787458] [drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03C=
4, Index: 0x01, Head: 0x00, Data: 0x00
[    9.787469] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03C=
4, Index: 0x01, Head: 0x00, Data: 0x00
[    9.787481] [drm] nouveau 0000:01:00.0: 0xDE2D: [ (0x6E) - INIT_NV_REG=
 ]
[    9.787491] [drm] nouveau 0000:01:00.0: 0xDE2D: Reg: 0x0000C040, Mask:=
 0xFFF3FC00, Data: 0x000803FF
[    9.787502] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x0000C040, Data:=
 0x3C0B07FF
[    9.787512] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0000C040, Data:=
 0x3C0B07FF
[    9.787522] [drm] nouveau 0000:01:00.0: 0xDE3A: [ (0x6E) - INIT_NV_REG=
 ]
[    9.787533] [drm] nouveau 0000:01:00.0: 0xDE3A: Reg: 0x00088138, Mask:=
 0xBFFFFC01, Data: 0x00000100
[    9.787544] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00088138, Data:=
 0x00000100
[    9.787553] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00088138, Data:=
 0x00000100
[    9.787563] [drm] nouveau 0000:01:00.0: 0xDE47: [ (0x6E) - INIT_NV_REG=
 ]
[    9.787574] [drm] nouveau 0000:01:00.0: 0xDE47: Reg: 0x0008813C, Mask:=
 0xF0FFFFFF, Data: 0x07000000
[    9.787585] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x0008813C, Data:=
 0x07000000
[    9.787595] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0008813C, Data:=
 0x07000000
[    9.787604] [drm] nouveau 0000:01:00.0: 0xDE54: [ (0x6E) - INIT_NV_REG=
 ]
[    9.787615] [drm] nouveau 0000:01:00.0: 0xDE54: Reg: 0x00011014, Mask:=
 0xFFFF7FFF, Data: 0x00008000
[    9.787626] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00011014, Data:=
 0x0000B6C8
[    9.787636] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00011014, Data:=
 0x0000B6C8
[    9.787645] [drm] nouveau 0000:01:00.0: 0xDE61: [ (0x7A) - INIT_ZM_REG=
 ]
[    9.787655] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00680524, Data:=
 0x00000000
[    9.787665] [drm] nouveau 0000:01:00.0: 0xDE6A: [ (0x5B) - INIT_SUB_DI=
RECT ]
[    9.787674] [drm] nouveau 0000:01:00.0: 0xDE6A: Executing subroutine a=
t 0xC28A
[    9.787684] [drm] nouveau 0000:01:00.0: 0xC28A: [ (0x50) - INIT_ZM_TMD=
S_GROUP ]
[    9.787695] [drm] nouveau 0000:01:00.0: 0xC28A: MagicLookupValue: 0x00=
, Count: 0x03
[    9.787705] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data:=
 0x00000000
[    9.787715] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data:=
 0x00000043
[    9.787724] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data:=
 0x000000FE
[    9.787734] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data:=
 0x00000033
[    9.787743] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data:=
 0x000000FB
[    9.787752] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data:=
 0x0000002F
[    9.787762] [drm] nouveau 0000:01:00.0: 0xC293: [ (0x71) - INIT_DONE ]
[    9.787771] [drm] nouveau 0000:01:00.0: 0xDE6A: End of 0xC28A subrouti=
ne
[    9.787781] [drm] nouveau 0000:01:00.0: 0xDE6D: [ (0x5B) - INIT_SUB_DI=
RECT ]
[    9.787790] [drm] nouveau 0000:01:00.0: 0xDE6D: Executing subroutine a=
t 0xC294
[    9.787800] [drm] nouveau 0000:01:00.0: 0xC294: [ (0x50) - INIT_ZM_TMD=
S_GROUP ]
[    9.787810] [drm] nouveau 0000:01:00.0: 0xC294: MagicLookupValue: 0x02=
, Count: 0x03
[    9.787820] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006828B4, Data:=
 0x00000000
[    9.787829] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006828B0, Data:=
 0x00000043
[    9.787838] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006828B4, Data:=
 0x000000FE
[    9.787848] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006828B0, Data:=
 0x00000033
[    9.787857] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006828B4, Data:=
 0x000000FB
[    9.787866] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006828B0, Data:=
 0x0000002F
[    9.787876] [drm] nouveau 0000:01:00.0: 0xC29D: [ (0x71) - INIT_DONE ]
[    9.787885] [drm] nouveau 0000:01:00.0: 0xDE6D: End of 0xC294 subrouti=
ne
[    9.787895] [drm] nouveau 0000:01:00.0: 0xDE70: [ (0x75) - INIT_CONDIT=
ION ]
[    9.787904] [drm] nouveau 0000:01:00.0: 0xDE70: Condition: 0x03
[    9.787915] [drm] nouveau 0000:01:00.0: 0xDE70: Cond: 0x03, Reg: 0x000=
00000, Mask: 0x000000FF
[    9.787926] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00000000, Data:=
 0x04B200B1
[    9.787936] [drm] nouveau 0000:01:00.0: 0xDE70: Checking if 0x000000B1=
 equals 0x000000A1
[    9.787946] [drm] nouveau 0000:01:00.0: 0xDE70: Condition not fulfille=
d -- skipping following commands
[    9.787956] [drm] nouveau 0000:01:00.0: 0xDE72: [ (0x38) - INIT_NOT ]
[    9.787965] [drm] nouveau 0000:01:00.0: 0xDE72: ------ Executing follo=
wing commands ------
[    9.787975] [drm] nouveau 0000:01:00.0: 0xDE73: [ (0x6E) - INIT_NV_REG=
 ]
[    9.787986] [drm] nouveau 0000:01:00.0: 0xDE73: Reg: 0x00100360, Mask:=
 0xFF00FFFF, Data: 0x00300000
[    9.787998] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00100360, Data:=
 0x8B303A98
[    9.788007] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100360, Data:=
 0x8B303A98
[    9.788017] [drm] nouveau 0000:01:00.0: 0xDE80: [ (0x72) - INIT_RESUME=
 ]
[    9.788027] [drm] nouveau 0000:01:00.0: 0xDE81: [ (0x71) - INIT_DONE ]
[    9.788036] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at =
offset 0xDF1B
[    9.788045] [drm] nouveau 0000:01:00.0: 0xDF1B: ------ Executing follo=
wing commands ------
[    9.788056] [drm] nouveau 0000:01:00.0: 0xDF1B: [ (0x71) - INIT_DONE ]
[    9.788921] [drm] nouveau 0000:01:00.0: nouveau_i2c_identify:310 - Pro=
bing monitoring devices on I2C bus: 2
[    9.808578] [drm] nouveau 0000:01:00.0: nouveau_i2c_identify:320 - No =
devices found.
[    9.808594] [drm] nouveau 0000:01:00.0: 1 available performance level(=
s)
[    9.808611] [drm] nouveau 0000:01:00.0: 0: memory 270MHz core 400MHz v=
oltage 1100mV fanspeed 100%
[    9.808629] [drm] nouveau 0000:01:00.0: Loading PLL limits for reg 0x0=
0000000
[    9.808640] [drm] nouveau 0000:01:00.0: pll.vco1.minfreq: 100000
[    9.808648] [drm] nouveau 0000:01:00.0: pll.vco1.maxfreq: 300000
[    9.808656] [drm] nouveau 0000:01:00.0: pll.vco1.min_inputfreq: 2000
[    9.808664] [drm] nouveau 0000:01:00.0: pll.vco1.max_inputfreq: 27000
[    9.808672] [drm] nouveau 0000:01:00.0: pll.vco1.min_n: 8
[    9.808680] [drm] nouveau 0000:01:00.0: pll.vco1.max_n: 255
[    9.808687] [drm] nouveau 0000:01:00.0: pll.vco1.min_m: 1
[    9.808694] [drm] nouveau 0000:01:00.0: pll.vco1.max_m: 255
[    9.808702] [drm] nouveau 0000:01:00.0: pll.vco2.minfreq: 500000
[    9.808710] [drm] nouveau 0000:01:00.0: pll.vco2.maxfreq: 1000000
[    9.808718] [drm] nouveau 0000:01:00.0: pll.vco2.min_inputfreq: 25000
[    9.808726] [drm] nouveau 0000:01:00.0: pll.vco2.max_inputfreq: 75000
[    9.808734] [drm] nouveau 0000:01:00.0: pll.vco2.min_n: 8
[    9.808741] [drm] nouveau 0000:01:00.0: pll.vco2.max_n: 50
[    9.808749] [drm] nouveau 0000:01:00.0: pll.vco2.min_m: 1
[    9.808756] [drm] nouveau 0000:01:00.0: pll.vco2.max_m: 255
[    9.808764] [drm] nouveau 0000:01:00.0: pll.max_log2p: 7
[    9.808771] [drm] nouveau 0000:01:00.0: pll.log2p_bias: 0
[    9.808779] [drm] nouveau 0000:01:00.0: pll.refclk: 27000
[    9.808790] [drm] nouveau 0000:01:00.0: Loading PLL limits for reg 0x0=
0004020
[    9.808799] [drm] nouveau 0000:01:00.0: pll.vco1.minfreq: 400000
[    9.808806] [drm] nouveau 0000:01:00.0: pll.vco1.maxfreq: 800000
[    9.808814] [drm] nouveau 0000:01:00.0: pll.vco1.min_inputfreq: 5000
[    9.808822] [drm] nouveau 0000:01:00.0: pll.vco1.max_inputfreq: 75000
[    9.808829] [drm] nouveau 0000:01:00.0: pll.vco1.min_n: 8
[    9.808837] [drm] nouveau 0000:01:00.0: pll.vco1.max_n: 255
[    9.808844] [drm] nouveau 0000:01:00.0: pll.vco1.min_m: 1
[    9.808851] [drm] nouveau 0000:01:00.0: pll.vco1.max_m: 255
[    9.808858] [drm] nouveau 0000:01:00.0: pll.vco2.minfreq: 400000
[    9.808866] [drm] nouveau 0000:01:00.0: pll.vco2.maxfreq: 800000
[    9.808874] [drm] nouveau 0000:01:00.0: pll.vco2.min_inputfreq: 0
[    9.808881] [drm] nouveau 0000:01:00.0: pll.vco2.max_inputfreq: 800000
[    9.808889] [drm] nouveau 0000:01:00.0: pll.vco2.min_n: 1
[    9.808896] [drm] nouveau 0000:01:00.0: pll.vco2.max_n: 1
[    9.808904] [drm] nouveau 0000:01:00.0: pll.vco2.min_m: 1
[    9.808911] [drm] nouveau 0000:01:00.0: pll.vco2.max_m: 1
[    9.808918] [drm] nouveau 0000:01:00.0: pll.max_log2p: 7
[    9.808925] [drm] nouveau 0000:01:00.0: pll.log2p_bias: 3
[    9.808932] [drm] nouveau 0000:01:00.0: pll.refclk: 27000
[    9.808945] [drm] nouveau 0000:01:00.0: c: memory 270MHz core 400MHz
[    9.809189] [drm] nouveau 0000:01:00.0: Detected 512MiB VRAM
[    9.809330] [TTM] Zone  kernel: Available graphics memory: 413056 kiB.
[    9.809340] [TTM] Zone highmem: Available graphics memory: 482628 kiB.
[    9.809347] [TTM] Initializing pool allocator.
[    9.809915] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_init:240 -=20
[    9.809943] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new_fake:334 - =
pinst=3D0x00010000 vinst=3D0xffffffffffffffff size=3D0x00001000 flags=3D0=
x00000002
[    9.809962] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new_fake:339 - =
gpuobj f1ee9b80
[    9.810151] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new_fake:334 - =
pinst=3D0x00011200 vinst=3D0xffffffffffffffff size=3D0x00000200 flags=3D0=
x00000002
[    9.810166] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new_fake:339 - =
gpuobj f1ee9800
[    9.810195] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new_fake:334 - =
pinst=3D0x00020000 vinst=3D0xffffffffffffffff size=3D0x00001000 flags=3D0=
x00000002
[    9.810209] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new_fake:339 - =
gpuobj f1ee9080
[    9.810364] agpgart-intel 0000:00:00.0: AGP 1.0 bridge
[    9.810408] agpgart-intel 0000:00:00.0: putting AGP V2 device into 1x =
mode
[    9.810498] nouveau 0000:01:00.0: putting AGP V2 device into 1x mode
[    9.810553] [drm] nouveau 0000:01:00.0: 64 MiB GART (aperture)
[    9.810698] [drm] nouveau 0000:01:00.0: nv04_display_create:125 -=20
[    9.810715] [drm] nouveau 0000:01:00.0: Saving VGA fonts
[    9.888138] [drm] nouveau 0000:01:00.0: nouveau_connector_create:779 -=
=20
[    9.888820] [drm] nouveau 0000:01:00.0: nouveau_connector_create:779 -=
=20
[    9.888835] [drm] nouveau 0000:01:00.0: nouveau_connector_create:779 -=
=20
[    9.889202] [drm] nouveau 0000:01:00.0: nouveau_connector_create:779 -=
=20
[    9.889615] [drm] nouveau 0000:01:00.0: Loading PLL limits for reg 0x0=
0000000
[    9.889628] [drm] nouveau 0000:01:00.0: pll.vco1.minfreq: 100000
[    9.889636] [drm] nouveau 0000:01:00.0: pll.vco1.maxfreq: 300000
[    9.889645] [drm] nouveau 0000:01:00.0: pll.vco1.min_inputfreq: 2000
[    9.889653] [drm] nouveau 0000:01:00.0: pll.vco1.max_inputfreq: 27000
[    9.889661] [drm] nouveau 0000:01:00.0: pll.vco1.min_n: 8
[    9.889669] [drm] nouveau 0000:01:00.0: pll.vco1.max_n: 255
[    9.889677] [drm] nouveau 0000:01:00.0: pll.vco1.min_m: 1
[    9.889685] [drm] nouveau 0000:01:00.0: pll.vco1.max_m: 255
[    9.889693] [drm] nouveau 0000:01:00.0: pll.vco2.minfreq: 500000
[    9.889701] [drm] nouveau 0000:01:00.0: pll.vco2.maxfreq: 1000000
[    9.889708] [drm] nouveau 0000:01:00.0: pll.vco2.min_inputfreq: 25000
[    9.889716] [drm] nouveau 0000:01:00.0: pll.vco2.max_inputfreq: 75000
[    9.889724] [drm] nouveau 0000:01:00.0: pll.vco2.min_n: 8
[    9.889732] [drm] nouveau 0000:01:00.0: pll.vco2.max_n: 50
[    9.889740] [drm] nouveau 0000:01:00.0: pll.vco2.min_m: 1
[    9.889747] [drm] nouveau 0000:01:00.0: pll.vco2.max_m: 255
[    9.889755] [drm] nouveau 0000:01:00.0: pll.max_log2p: 7
[    9.889762] [drm] nouveau 0000:01:00.0: pll.log2p_bias: 0
[    9.889770] [drm] nouveau 0000:01:00.0: pll.refclk: 27000
[    9.890877] [drm] nouveau 0000:01:00.0: Loading PLL limits for reg 0x0=
0000000
[    9.890887] [drm] nouveau 0000:01:00.0: pll.vco1.minfreq: 100000
[    9.890894] [drm] nouveau 0000:01:00.0: pll.vco1.maxfreq: 300000
[    9.890902] [drm] nouveau 0000:01:00.0: pll.vco1.min_inputfreq: 2000
[    9.890910] [drm] nouveau 0000:01:00.0: pll.vco1.max_inputfreq: 27000
[    9.890918] [drm] nouveau 0000:01:00.0: pll.vco1.min_n: 8
[    9.890925] [drm] nouveau 0000:01:00.0: pll.vco1.max_n: 255
[    9.890932] [drm] nouveau 0000:01:00.0: pll.vco1.min_m: 1
[    9.890940] [drm] nouveau 0000:01:00.0: pll.vco1.max_m: 255
[    9.890947] [drm] nouveau 0000:01:00.0: pll.vco2.minfreq: 500000
[    9.890955] [drm] nouveau 0000:01:00.0: pll.vco2.maxfreq: 1000000
[    9.890963] [drm] nouveau 0000:01:00.0: pll.vco2.min_inputfreq: 25000
[    9.890971] [drm] nouveau 0000:01:00.0: pll.vco2.max_inputfreq: 75000
[    9.890978] [drm] nouveau 0000:01:00.0: pll.vco2.min_n: 8
[    9.890986] [drm] nouveau 0000:01:00.0: pll.vco2.max_n: 50
[    9.890993] [drm] nouveau 0000:01:00.0: pll.vco2.min_m: 1
[    9.891000] [drm] nouveau 0000:01:00.0: pll.vco2.max_m: 255
[    9.891007] [drm] nouveau 0000:01:00.0: pll.max_log2p: 7
[    9.891014] [drm] nouveau 0000:01:00.0: pll.log2p_bias: 0
[    9.891021] [drm] nouveau 0000:01:00.0: pll.refclk: 27000
[    9.892433] [drm] nouveau 0000:01:00.0: nouveau_channel_alloc:148 - in=
itialising channel 0
[    9.895802] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_channel_init:77=
2 - ch0 vram=3D0x80000002 tt=3D0x80000003
[    9.895819] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_channel_init_pr=
amin:726 - ch0
[    9.895833] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:177 - ch-1 =
size=3D170828 align=3D4096 flags=3D0x00000000
[    9.895846] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:182 - gpuob=
j f1f56480
[    9.895865] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:177 - ch0 s=
ize=3D16 align=3D16 flags=3D0x00000004
[    9.895876] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:182 - gpuob=
j f1f564c0
[    9.895893] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:39 -=
 ch0 handle=3D0x80000002
[    9.895903] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:50 -=
 hash=3D0x00000090
[    9.895918] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:133 - ins=
ert ch0 0x00000090: h=3D0x80000002, c=3D0x00004000
[    9.895932] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:177 - ch0 s=
ize=3D16 align=3D16 flags=3D0x00000004
[    9.895944] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:182 - gpuob=
j f1f56500
[    9.895958] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:39 -=
 ch0 handle=3D0x80000003
[    9.895968] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:50 -=
 hash=3D0x00000098
[    9.895982] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:133 - ins=
ert ch0 0x00000098: h=3D0x80000003, c=3D0x00004001
[    9.895996] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:177 - ch0 s=
ize=3D16 align=3D16 flags=3D0x00000004
[    9.896007] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:182 - gpuob=
j f1f56540
[    9.896023] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:177 - ch0 s=
ize=3D162636 align=3D16 flags=3D0x00000002
[    9.896034] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:182 - gpuob=
j f1f56580
[    9.901236] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new_fake:334 - =
pinst=3D0x00020000 vinst=3D0xffffffffffffffff size=3D0x00000080 flags=3D0=
x00000006
[    9.901250] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new_fake:339 - =
gpuobj f1f565c0
[    9.901277] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:631 - ch=
0 class=3D0x0039
[    9.901291] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:177 - ch0 s=
ize=3D32 align=3D16 flags=3D0x00000006
[    9.901302] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:182 - gpuob=
j f1f56640
[    9.901317] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:39 -=
 ch0 handle=3D0x80000001
[    9.901328] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:50 -=
 hash=3D0x00000088
[    9.901341] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:133 - ins=
ert ch0 0x00000088: h=3D0x80000001, c=3D0x001067b8
[    9.901355] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:177 - ch0 s=
ize=3D16 align=3D16 flags=3D0x00000004
[    9.901366] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:182 - gpuob=
j f1f56680
[    9.901379] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:39 -=
 ch0 handle=3D0x80000006
[    9.901389] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:50 -=
 hash=3D0x000000b0
[    9.901402] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:133 - ins=
ert ch0 0x000000b0: h=3D0x80000006, c=3D0x000067ba
[    9.901447] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:631 - ch=
0 class=3D0x506e
[    9.901460] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:39 -=
 ch0 handle=3D0x8000000e
[    9.901470] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:50 -=
 hash=3D0x000000f0
[    9.901482] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:133 - ins=
ert ch0 0x000000f0: h=3D0x8000000e, c=3D0x00000000
[    9.901498] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:177 - ch0 s=
ize=3D16 align=3D16 flags=3D0x00000004
[    9.901509] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:182 - gpuob=
j f1f56740
[    9.901522] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:39 -=
 ch0 handle=3D0x8000000f
[    9.901533] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:50 -=
 hash=3D0x000000f8
[    9.901549] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:133 - ins=
ert ch0 0x000000f8: h=3D0x8000000f, c=3D0x000067bb
[    9.901609] [drm] nouveau 0000:01:00.0: nouveau_channel_alloc:221 - ch=
annel 0 initialised
[    9.901623] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:177 - ch0 s=
ize=3D16 align=3D16 flags=3D0x00000004
[    9.901655] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:182 - gpuob=
j f1f56780
[    9.901670] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:39 -=
 ch0 handle=3D0x80000004
[    9.901680] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:50 -=
 hash=3D0x000000a0
[    9.901693] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:133 - ins=
ert ch0 0x000000a0: h=3D0x80000004, c=3D0x000067bc
[    9.901707] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:177 - ch0 s=
ize=3D16 align=3D16 flags=3D0x00000004
[    9.901717] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:182 - gpuob=
j f1f567c0
[    9.901730] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:39 -=
 ch0 handle=3D0x80000005
[    9.901740] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:50 -=
 hash=3D0x000000a8
[    9.901753] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:133 - ins=
ert ch0 0x000000a8: h=3D0x80000005, c=3D0x000067bd
[    9.901895] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga enc=
oder (output 0)
[    9.901909] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds en=
coder (output 1)
[    9.901920] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga enc=
oder (output 2)
[    9.901932] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on TV enco=
der (output 3)
[    9.901948] [drm] nouveau 0000:01:00.0: nv_crtc_dpms:165 - Setting dpm=
s mode 3 on CRTC 0
[    9.911973] [drm] nouveau 0000:01:00.0: nv_crtc_dpms:165 - Setting dpm=
s mode 3 on CRTC 1
[    9.922006] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:=
7:DVI-I-1]
[   10.032537] [drm] nouveau 0000:01:00.0: nouveau_connector_native_mode:=
516 - native mode from preferred
[   10.032578] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:=
7:DVI-I-1] probed modes :
[   10.032592] [drm:drm_mode_debug_printmodeline], Modeline 30:"1280x1024=
" 60 108000 1280 1328 1440 1688 1024 1025 1028 1066 0x48 0x5
[   10.032613] [drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864"=
 75 108000 1152 1216 1344 1600 864 865 868 900 0x40 0x5
[   10.032631] [drm:drm_mode_debug_printmodeline], Modeline 38:"1024x768"=
 75 78800 1024 1040 1136 1312 768 769 772 800 0x40 0x5
[   10.032650] [drm:drm_mode_debug_printmodeline], Modeline 33:"1024x768"=
 75 78750 1024 1040 1136 1312 768 769 772 800 0x40 0x5
[   10.032668] [drm:drm_mode_debug_printmodeline], Modeline 39:"1024x768"=
 60 65000 1024 1048 1184 1344 768 771 777 806 0x40 0xa
[   10.032686] [drm:drm_mode_debug_printmodeline], Modeline 40:"832x624" =
75 57284 832 864 928 1152 624 625 628 667 0x40 0xa
[   10.032704] [drm:drm_mode_debug_printmodeline], Modeline 41:"800x600" =
75 49500 800 816 896 1056 600 601 604 625 0x40 0x5
[   10.032722] [drm:drm_mode_debug_printmodeline], Modeline 34:"800x600" =
60 40000 800 840 968 1056 600 601 605 628 0x40 0x5
[   10.032740] [drm:drm_mode_debug_printmodeline], Modeline 35:"640x480" =
75 31500 640 656 720 840 480 481 484 500 0x40 0xa
[   10.032757] [drm:drm_mode_debug_printmodeline], Modeline 36:"640x480" =
60 25200 640 656 752 800 480 490 492 525 0x40 0xa
[   10.032775] [drm:drm_mode_debug_printmodeline], Modeline 37:"720x400" =
70 28320 720 738 846 900 400 412 414 449 0x40 0x6
[   10.032796] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:=
12:VGA-1]
[   10.050112] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:=
12:VGA-1] disconnected
[   10.050130] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:=
14:TV-1]
[   10.063106] [drm:drm_helper_probe_single_connector_modes], [CONNECTOR:=
14:TV-1] disconnected
[   10.063119] [drm:drm_setup_crtcs],=20
[   10.063130] [drm:drm_enable_connectors], connector 7 enabled? yes
[   10.063140] [drm:drm_enable_connectors], connector 12 enabled? no
[   10.063150] [drm:drm_enable_connectors], connector 14 enabled? no
[   10.063160] [drm:drm_target_preferred], looking for cmdline mode on co=
nnector 7
[   10.063171] [drm:drm_target_preferred], looking for preferred mode on =
connector 7
[   10.063182] [drm:drm_target_preferred], found mode 1280x1024
[   10.063191] [drm:drm_setup_crtcs], picking CRTCs for 4096x4096 config
[   10.063205] [drm:drm_setup_crtcs], desired mode 1280x1024 set on crtc =
5
[   10.064996] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:631 - ch=
0 class=3D0x0062
[   10.065012] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:177 - ch0 s=
ize=3D32 align=3D16 flags=3D0x00000006
[   10.065025] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:182 - gpuob=
j f1f568c0
[   10.065044] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:39 -=
 ch0 handle=3D0x80000008
[   10.065054] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:50 -=
 hash=3D0x000000c0
[   10.065069] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:133 - ins=
ert ch0 0x000000c0: h=3D0x80000008, c=3D0x001067be
[   10.065081] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:631 - ch=
0 class=3D0x0019
[   10.065104] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:177 - ch0 s=
ize=3D32 align=3D16 flags=3D0x00000006
[   10.065115] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:182 - gpuob=
j f1f56900
[   10.065129] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:39 -=
 ch0 handle=3D0x8000000b
[   10.065139] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:50 -=
 hash=3D0x000000d8
[   10.065152] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:133 - ins=
ert ch0 0x000000d8: h=3D0x8000000b, c=3D0x001067c0
[   10.065164] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:631 - ch=
0 class=3D0x0043
[   10.065176] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:177 - ch0 s=
ize=3D32 align=3D16 flags=3D0x00000006
[   10.065186] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:182 - gpuob=
j f1f56940
[   10.065200] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:39 -=
 ch0 handle=3D0x80000009
[   10.065210] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:50 -=
 hash=3D0x000000c8
[   10.065222] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:133 - ins=
ert ch0 0x000000c8: h=3D0x80000009, c=3D0x001067c2
[   10.065234] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:631 - ch=
0 class=3D0x0044
[   10.065245] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:177 - ch0 s=
ize=3D32 align=3D16 flags=3D0x00000006
[   10.065256] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:182 - gpuob=
j f1f56980
[   10.065269] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:39 -=
 ch0 handle=3D0x8000000a
[   10.065279] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:50 -=
 hash=3D0x000000d0
[   10.065292] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:133 - ins=
ert ch0 0x000000d0: h=3D0x8000000a, c=3D0x001067c4
[   10.065304] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:631 - ch=
0 class=3D0x004a
[   10.065315] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:177 - ch0 s=
ize=3D32 align=3D16 flags=3D0x00000006
[   10.065326] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:182 - gpuob=
j f1f569c0
[   10.065339] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:39 -=
 ch0 handle=3D0x8000000c
[   10.065349] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:50 -=
 hash=3D0x000000e0
[   10.065362] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:133 - ins=
ert ch0 0x000000e0: h=3D0x8000000c, c=3D0x001067c6
[   10.065373] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:631 - ch=
0 class=3D0x009f
[   10.065385] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:177 - ch0 s=
ize=3D32 align=3D16 flags=3D0x00000006
[   10.065395] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:182 - gpuob=
j f1f56a00
[   10.065408] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:39 -=
 ch0 handle=3D0x8000000d
[   10.065418] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:50 -=
 hash=3D0x000000e8
[   10.065431] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:133 - ins=
ert ch0 0x000000e8: h=3D0x8000000d, c=3D0x001067c8
[   10.065456] [drm] nouveau 0000:01:00.0: allocated 1280x1024 fb: 0x4900=
0, bo f1eafe00
[   10.067938] [drm:drm_crtc_helper_set_config],=20
[   10.067949] [drm:drm_crtc_helper_set_config], [CRTC:5] [FB:32] #connec=
tors=3D1 (x y) (0 0)
[   10.067980] [drm:drm_crtc_helper_set_config], crtc has no fb, full mod=
e set
[   10.067989] [drm:drm_crtc_helper_set_config], modes are different, ful=
l mode set
[   10.067998] [drm:drm_mode_debug_printmodeline], Modeline 0:"" 0 0 0 0 =
0 0 0 0 0 0 0x0 0x0
[   10.068013] [drm:drm_mode_debug_printmodeline], Modeline 31:"1280x1024=
" 60 108000 1280 1328 1440 1688 1024 1025 1028 1066 0x48 0x5
[   10.068031] [drm:drm_crtc_helper_set_config], encoder changed, full mo=
de switch
[   10.068040] [drm:drm_crtc_helper_set_config], crtc changed, full mode =
switch
[   10.068049] [drm:drm_crtc_helper_set_config], [CONNECTOR:7:DVI-I-1] to=
 [CRTC:5]
[   10.068060] [drm:drm_crtc_helper_set_config], attempting to set mode f=
rom userspace
[   10.068068] [drm:drm_mode_debug_printmodeline], Modeline 31:"1280x1024=
" 60 108000 1280 1328 1440 1688 1024 1025 1028 1066 0x48 0x5
[   10.068106] [drm:drm_crtc_helper_set_mode], [CRTC:5]
[   10.068129] [drm] nouveau 0000:01:00.0: nv_crtc_dpms:165 - Setting dpm=
s mode 3 on CRTC 0
[   10.068157] [drm] nouveau 0000:01:00.0: nv_crtc_mode_set:613 - CTRC mo=
de on CRTC 0:
[   10.068164] [drm:drm_mode_debug_printmodeline], Modeline 44:"1280x1024=
" 60 108000 1280 1328 1440 1688 1024 1025 1028 1066 0x48 0x5
[   10.068203] [drm] nouveau 0000:01:00.0: Loading PLL limits for reg 0x0=
0000000
[   10.068213] [drm] nouveau 0000:01:00.0: pll.vco1.minfreq: 100000
[   10.068220] [drm] nouveau 0000:01:00.0: pll.vco1.maxfreq: 300000
[   10.068227] [drm] nouveau 0000:01:00.0: pll.vco1.min_inputfreq: 2000
[   10.068233] [drm] nouveau 0000:01:00.0: pll.vco1.max_inputfreq: 27000
[   10.068240] [drm] nouveau 0000:01:00.0: pll.vco1.min_n: 8
[   10.068247] [drm] nouveau 0000:01:00.0: pll.vco1.max_n: 255
[   10.068253] [drm] nouveau 0000:01:00.0: pll.vco1.min_m: 1
[   10.068259] [drm] nouveau 0000:01:00.0: pll.vco1.max_m: 255
[   10.068266] [drm] nouveau 0000:01:00.0: pll.vco2.minfreq: 500000
[   10.068272] [drm] nouveau 0000:01:00.0: pll.vco2.maxfreq: 1000000
[   10.068279] [drm] nouveau 0000:01:00.0: pll.vco2.min_inputfreq: 25000
[   10.068285] [drm] nouveau 0000:01:00.0: pll.vco2.max_inputfreq: 75000
[   10.068292] [drm] nouveau 0000:01:00.0: pll.vco2.min_n: 8
[   10.068298] [drm] nouveau 0000:01:00.0: pll.vco2.max_n: 50
[   10.068304] [drm] nouveau 0000:01:00.0: pll.vco2.min_m: 1
[   10.068310] [drm] nouveau 0000:01:00.0: pll.vco2.max_m: 255
[   10.068317] [drm] nouveau 0000:01:00.0: pll.max_log2p: 7
[   10.068323] [drm] nouveau 0000:01:00.0: pll.log2p_bias: 0
[   10.068329] [drm] nouveau 0000:01:00.0: pll.refclk: 27000
[   10.068341] [drm] nouveau 0000:01:00.0: nv_crtc_calc_state_ext:151 - v=
pll: n 8 m 2 log2p 0
[   10.068354] [drm:drm_crtc_helper_set_mode], [ENCODER:11:TMDS-11] set [=
MODE:31:1280x1024]
[   10.068367] [drm] nouveau 0000:01:00.0: nv04_dfp_mode_set:294 - Output=
 mode on CRTC 0:
[   10.068374] [drm:drm_mode_debug_printmodeline], Modeline 43:"1280x1024=
" 0 108000 1280 1328 1440 1688 1024 1025 1028 1066 0x48 0x5
[   10.068713] [drm] nouveau 0000:01:00.0: nv_crtc_dpms:165 - Setting dpm=
s mode 0 on CRTC 0
[   10.078744] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00680524, Data:=
 0x00000000
[   10.078753] [drm] nouveau 0000:01:00.0: 0xC210: Parsing digital output=
 script table
[   10.078765] [drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D=
4, Index: 0x44, Head: 0x00, Data: 0x00
[   10.078778] [drm] nouveau 0000:01:00.0: 0xC210: [ (0x5B) - INIT_SUB_DI=
RECT ]
[   10.078787] [drm] nouveau 0000:01:00.0: 0xC210: Executing subroutine a=
t 0xC22C
[   10.078797] [drm] nouveau 0000:01:00.0: 0xC22C: [ (0x6E) - INIT_NV_REG=
 ]
[   10.078807] [drm] nouveau 0000:01:00.0: 0xC22C: Reg: 0x00680880, Mask:=
 0xDFFFFFFF, Data: 0x00000000
[   10.078816] [drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00680880, Data:=
 0x01101191
[   10.078826] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00680880, Data:=
 0x01101191
[   10.078835] [drm] nouveau 0000:01:00.0: 0xC239: [ (0x71) - INIT_DONE ]
[   10.078843] [drm] nouveau 0000:01:00.0: 0xC210: End of 0xC22C subrouti=
ne
[   10.078851] [drm] nouveau 0000:01:00.0: 0xC213: [ (0x5B) - INIT_SUB_DI=
RECT ]
[   10.078859] [drm] nouveau 0000:01:00.0: 0xC213: Executing subroutine a=
t 0x8CF1
[   10.078868] [drm] nouveau 0000:01:00.0: 0x8CF1: [ (0x5B) - INIT_SUB_DI=
RECT ]
[   10.078876] [drm] nouveau 0000:01:00.0: 0x8CF1: Executing subroutine a=
t 0x8D1A
[   10.078885] [drm] nouveau 0000:01:00.0: 0x8D1A: [ (0x50) - INIT_ZM_TMD=
S_GROUP ]
[   10.078894] [drm] nouveau 0000:01:00.0: 0x8D1A: MagicLookupValue: 0x80=
, Count: 0x0F
[   10.078905] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data:=
 0x000000F1
[   10.078913] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data:=
 0x00000000
[   10.078921] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data:=
 0x00000000
[   10.078929] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data:=
 0x00000001
[   10.078937] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data:=
 0x00000090
[   10.078946] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data:=
 0x00000002
[   10.078954] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data:=
 0x00000000
[   10.078962] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data:=
 0x00000029
[   10.078971] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data:=
 0x00000005
[   10.078978] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data:=
 0x0000002E
[   10.078986] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data:=
 0x00000030
[   10.078994] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data:=
 0x00000040
[   10.079002] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data:=
 0x00000008
[   10.079010] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data:=
 0x00000041
[   10.079018] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data:=
 0x00000000
[   10.079025] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data:=
 0x00000043
[   10.079033] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data:=
 0x00000080
[   10.079041] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data:=
 0x00000004
[   10.079049] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data:=
 0x00000068
[   10.079056] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data:=
 0x00000005
[   10.079064] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data:=
 0x00000000
[   10.079071] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data:=
 0x0000002F
[   10.079079] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data:=
 0x00000000
[   10.079098] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data:=
 0x00000030
[   10.079106] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data:=
 0x00000000
[   10.079132] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data:=
 0x00000031
[   10.079140] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data:=
 0x00000000
[   10.079148] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data:=
 0x00000032
[   10.079155] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data:=
 0x00000000
[   10.079163] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data:=
 0x00000033
[   10.079172] [drm] nouveau 0000:01:00.0: 0x8D3B: [ (0x50) - INIT_ZM_TMD=
S_GROUP ]
[   10.079180] [drm] nouveau 0000:01:00.0: 0x8D3B: MagicLookupValue: 0x81=
, Count: 0x01
[   10.079190] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808BC, Data:=
 0x00000000
[   10.079198] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B8, Data:=
 0x00000004
[   10.079207] [drm] nouveau 0000:01:00.0: 0x8D40: [ (0x71) - INIT_DONE ]
[   10.079214] [drm] nouveau 0000:01:00.0: 0x8CF1: End of 0x8D1A subrouti=
ne
[   10.079223] [drm] nouveau 0000:01:00.0: 0x8CF4: [ (0x5B) - INIT_SUB_DI=
RECT ]
[   10.079231] [drm] nouveau 0000:01:00.0: 0x8CF4: Executing subroutine a=
t 0x8D61
[   10.079239] [drm] nouveau 0000:01:00.0: 0x8D61: [ (0x50) - INIT_ZM_TMD=
S_GROUP ]
[   10.079248] [drm] nouveau 0000:01:00.0: 0x8D61: MagicLookupValue: 0x80=
, Count: 0x01
[   10.079258] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data:=
 0x00000008
[   10.079266] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data:=
 0x0000002F
[   10.079274] [drm] nouveau 0000:01:00.0: 0x8D66: [ (0x74) - INIT_TIME ]
[   10.079282] [drm] nouveau 0000:01:00.0: 0x8D66: Sleeping for 0xC350 mi=
croseconds
[   10.130109] [drm] nouveau 0000:01:00.0: 0x8D69: [ (0x50) - INIT_ZM_TMD=
S_GROUP ]
[   10.130119] [drm] nouveau 0000:01:00.0: 0x8D69: MagicLookupValue: 0x80=
, Count: 0x02
[   10.130129] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data:=
 0x00000021
[   10.130138] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data:=
 0x0000002F
[   10.130146] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data:=
 0x00000000
[   10.130154] [drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data:=
 0x0000002C
[   10.130163] [drm] nouveau 0000:01:00.0: 0x8D70: [ (0x71) - INIT_DONE ]
[   10.130171] [drm] nouveau 0000:01:00.0: 0x8CF4: End of 0x8D61 subrouti=
ne
[   10.130179] [drm] nouveau 0000:01:00.0: 0x8CF7: [ (0x71) - INIT_DONE ]
[   10.130187] [drm] nouveau 0000:01:00.0: 0xC213: End of 0x8CF1 subrouti=
ne
[   10.130195] [drm] nouveau 0000:01:00.0: 0xC216: [ (0x71) - INIT_DONE ]
[   10.130207] [drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds en=
coder (output 1)
[   10.130219] [drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on C=
RTC 0 using output A
[   10.130235] [drm] nouveau 0000:01:00.0: nv_crtc_dpms:165 - Setting dpm=
s mode 3 on CRTC 1
[   10.130244] [drm:drm_crtc_helper_set_config],=20
[   10.130251] [drm:drm_crtc_helper_set_config], [CRTC:6] [FB:32] #connec=
tors=3D0 (x y) (0 0)
[   10.130267] [drm:drm_crtc_helper_set_config], crtc has no fb, full mod=
e set
[   10.130276] [drm:drm_crtc_helper_set_config], [CONNECTOR:7:DVI-I-1] to=
 [CRTC:5]
[   10.130289] [drm] nouveau 0000:01:00.0: nv_crtc_dpms:165 - Setting dpm=
s mode 3 on CRTC 1
[   10.130462] [drm:drm_crtc_helper_set_config],=20
[   10.130471] [drm:drm_crtc_helper_set_config], [CRTC:5] [FB:32] #connec=
tors=3D1 (x y) (0 0)
[   10.130490] [drm:drm_crtc_helper_set_config], [CONNECTOR:7:DVI-I-1] to=
 [CRTC:5]
[   10.135011] Console: switching to colour frame buffer device 160x64
[   10.135032] [drm:drm_crtc_helper_set_config],=20
[   10.135039] [drm:drm_crtc_helper_set_config], [CRTC:5] [FB:32] #connec=
tors=3D1 (x y) (0 0)
[   10.135056] [drm:drm_crtc_helper_set_config], [CONNECTOR:7:DVI-I-1] to=
 [CRTC:5]
[   10.139609] fb0: nouveaufb frame buffer device
[   10.139617] drm: registered panic notifier
[   10.139642] [drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0=
 on minor 0
[   10.933712] EXT4-fs (sda2): re-mounted. Opts: (null)
[   11.583344] cx25840 0-0044: loaded v4l-cx25840.fw firmware (16382 byte=
s)
[   11.686093] tveeprom 0-00a2: Hauppauge model 75111, rev C3E9, serial# =
6202710
[   11.686112] tveeprom 0-00a2: MAC address is 00:0d:fe:5e:a5:56
[   11.686123] tveeprom 0-00a2: tuner model is Philips 18271_8295 (idx 14=
9, type 54)
[   11.686136] tveeprom 0-00a2: TV standards NTSC(M) ATSC/DVB Digital (ee=
prom 0x88)
[   11.686148] tveeprom 0-00a2: audio processor is CX25843 (idx 37)
[   11.686159] tveeprom 0-00a2: decoder processor is CX25843 (idx 30)
[   11.686170] tveeprom 0-00a2: has radio, has IR receiver, has IR transm=
itter
[   11.686200] pvrusb2: Supported video standard(s) reported available in=
 hardware: PAL-M/N/Nc;NTSC-M/Mj/Mk;ATSC-8VSB/16VSB
[   11.686219] pvrusb2: Mapping standards mask=3D0x300b700 (PAL-M/N/Nc;NT=
SC-M/Mj/Mk;ATSC-8VSB/16VSB)
[   11.686233] pvrusb2: Setting up 6 unique standard(s)
[   11.686250] pvrusb2: Set up standard idx=3D0 name=3DPAL-M
[   11.686260] pvrusb2: Set up standard idx=3D1 name=3DPAL-N
[   11.686269] pvrusb2: Set up standard idx=3D2 name=3DPAL-Nc
[   11.686279] pvrusb2: Set up standard idx=3D3 name=3DNTSC-M
[   11.686288] pvrusb2: Set up standard idx=3D4 name=3DNTSC-Mj
[   11.686297] pvrusb2: Set up standard idx=3D5 name=3DNTSC-Mk
[   11.686313] pvrusb2: Initial video standard (determined by device type=
): NTSC-M
[   11.686381] pvrusb2: Device initialization completed successfully.
[   11.692515] pvrusb2: registered device video0 [mpeg]
[   11.692556] DVB: registering new adapter (pvrusb2-dvb)
[   12.192521] EXT3-fs: barriers not enabled
[   12.194082] kjournald starting.  Commit interval 5 seconds
[   12.194215] EXT3-fs (sdb2): using internal journal
[   12.194234] EXT3-fs (sdb2): mounted filesystem with ordered data mode
[   12.326850] Adding 2136028k swap on /dev/sda1.  Priority:-1 extents:1 =
across:2136028k=20
[   13.909197] cx25840 0-0044: loaded v4l-cx25840.fw firmware (16382 byte=
s)
[   14.022603] tda829x 0-0042: setting tuner address to 60
[   14.102448] tda18271 0-0060: creating new instance
[   14.134629] TDA18271HD/C1 detected @ 0-0060
[   15.065393] tda829x 0-0042: type set to tda8295+18271
[   19.200260] pvrusb2: firmware2 upload transfer failure
[   19.200539] pvrusb2: Clearing driver error statuss
[   19.657646] [drm:drm_crtc_helper_set_config],=20
[   19.657657] [drm:drm_crtc_helper_set_config], [CRTC:5] [FB:32] #connec=
tors=3D1 (x y) (0 0)
[   19.657695] [drm:drm_crtc_helper_set_config], [CONNECTOR:7:DVI-I-1] to=
 [CRTC:5]
[   21.066586] cx25840 0-0044: 0x0000 is not a valid video input!
[   21.188800] DVB: registering adapter 0 frontend 0 (Samsung S5H1411 QAM=
/8VSB Frontend)...
[   21.193546] tda829x 0-0042: type set to tda8295
[   21.229974] tda18271 0-0060: attaching existing instance
[   29.201893] e100 0000:00:14.0: eth0: NIC Link is Up 100 Mbps Full Dupl=
ex
[   34.176327] NET: Registered protocol family 10
[   34.177207] lo: Disabled Privacy Extensions
[   34.177793] tunl0: Disabled Privacy Extensions
[   39.392698] firewire_core: giving up on config rom for node id ffc1
[   39.392720] firewire_core: phy config: card 0, new root=3Dffc0, gap_co=
unt=3D5
[   45.074495] eth0: no IPv6 routers present
[   49.982352] svc: failed to register lockdv1 RPC service (errno 97).
[   49.982653] NFSD: Using /var/lib/nfs/v4recovery as the NFSv4 state rec=
overy directory
[   49.997828] NFSD: starting 90-second grace period
[   57.705778] [drm:drm_crtc_helper_set_config],=20
[   57.705788] [drm:drm_crtc_helper_set_config], [CRTC:5] [FB:32] #connec=
tors=3D1 (x y) (0 0)
[   57.705823] [drm:drm_crtc_helper_set_config], [CONNECTOR:7:DVI-I-1] to=
 [CRTC:5]
[  600.694797] [drm] nouveau 0000:01:00.0: Setting dpms mode 1 on tmds en=
coder (output 1)
[  600.694814] [drm] nouveau 0000:01:00.0: nv_crtc_dpms:165 - Setting dpm=
s mode 3 on CRTC 0

--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--bg08WKrSYDhXBjb5--
