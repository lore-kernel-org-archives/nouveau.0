From: Roger <rogerx.oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Display goes off when framebuffer enabled and Kernel
 Panic with fbset
Date: Fri, 10 Dec 2010 01:43:52 -0900
Message-ID: <20101210104352.GA4505@localhost2.local>
References: <20101204072803.GA4170@localhost2.local>
	<20101204075925.GB4170@localhost2.local>
	<20101205070234.GB4102@localhost2.local>
	<20101205133804.5430594f@daedalus.pq.iki.fi>
	<20101206011231.GC4122@localhost2.local>
	<20101208093458.GA11429@localhost2.local>
	<20101208122300.GA4480@localhost2.local>
	<20101209004202.GA4477@localhost2.local>
	<8762v3ards.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="/04w6evG8XlLl3ft"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8762v3ards.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 09, 2010 at 04:38:07PM +0100, Francisco Jerez wrote:
>Roger <rogerx.oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>
>> I think I've found the problem.
>>
>> # echo "option nouveau noagp=1" >> /etc/modprobe.d/nouveau.conf
>>
>> So far, it looks like things have stopped freezing.
>
>Do you get the same kind of AGP problems with the other nvidia cards you
>said you had access to? Have you tried to set a saner AGP aperture size
>(e.g. 64MB) in your BIOS settings? Does it make any difference?
No real difference between AGP memory reservations.  Aside from the anomoly I
saw on the first freeze with 64MB AGP, saw my last framebuffer screen on a good
halt of the system -- done sometime last night?

Again, I got one working with noagp=0 and then one frozen.  Attaching both
complete logs using debug settings for the drm/nouveau modules.


>The output from "lspci -vvv" (executed as root before having loaded the
>nouveau kernel module) and *full* kernel logs are likely to be useful
>too.
Attaching lscpi -vvv as well.

(Hopefully the mailing list doesn't strip them.)

-- 
Roger
http://rogerx.freeshell.org/

--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: attachment; filename="dmesg-nouveau-worked.log"
Content-Transfer-Encoding: quoted-printable

: 2, 16384 bytes)
NET: Registered protocol family 1
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
pci 0000:00:00.0: Limiting direct PCI/PCI transfers
pci 0000:00:14.0: Firmware left e100 interrupts enabled; disabling
pci 0000:01:00.0: Boot video device
PCI: CLS 32 bytes, default 32
Scanning for low memory corruption every 60 seconds
highmem bounce pool size: 64 pages
squashfs: version 4.0 (2009/01/31) Phillip Lougher
Installing knfsd (copyright (C) 1996 okir-pn4DOG8n3UYbFoVRYvo4fw@public.gmane.org).
Slow work thread pool: Starting up
Slow work thread pool: Ready
fuse init (API version 7.14)
msgmni has been set to 1743
alg: No test for stdrng (krng)
alg: No test for fips(ansi_cprng) (fips_ansi_cprng)
io scheduler noop registered
io scheduler cfq registered (default)
Hangcheck: starting hangcheck timer 0.9.1 (tick is 180 seconds, margin is=
 60 seconds).
Hangcheck: Using getrawmonotonic().
input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/=
input0
ACPI: Sleep Button [SLPB]
input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
ACPI: Power Button [PWRF]
ACPI: acpi_idle registered with cpuidle
ERST: Table is not found!
GHES: HEST is not enabled!
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
serial8250: ttyS0 at I/O 0x3f8 (irq =3D 4) is a 16550A
serial8250: ttyS1 at I/O 0x2f8 (irq =3D 3) is a NS16550A
00:06: ttyS0 at I/O 0x3f8 (irq =3D 4) is a 16550A
00:07: ttyS1 at I/O 0x2f8 (irq =3D 3) is a NS16550A
floppy0: no floppy controllers found
loop: module loaded
ata_piix 0000:00:07.1: version 2.13
scsi0 : ata_piix
scsi1 : ata_piix
ata1: PATA max UDMA/33 cmd 0x1f0 ctl 0x3f6 bmdma 0xffa0 irq 14
ata2: PATA max UDMA/33 cmd 0x170 ctl 0x376 bmdma 0xffa8 irq 15
sata_sil 0000:00:11.0: version 2.4
ata1: port disabled. ignoring.
sata_sil 0000:00:11.0: PCI INT A -> GSI 17 (level, low) -> IRQ 17
scsi2 : sata_sil
scsi3 : sata_sil
ata3: SATA max UDMA/100 mmio m512@0xfebffe00 tf 0xfebffe80 irq 17
ata4: SATA max UDMA/100 mmio m512@0xfebffe00 tf 0xfebffec0 irq 17
e100: Intel(R) PRO/100 Network Driver, 3.5.24-k2-NAPI
e100: Copyright(c) 1999-2006 Intel Corporation
e100 0000:00:14.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
e100 0000:00:14.0: PME# disabled
e100 0000:00:14.0: eth0: addr 0xfebfe000, irq 16, MAC addr 00:90:27:c6:b1=
:08
PPP generic driver version 2.4.2
PPP Deflate Compression module registered
PPP BSD Compression module registered
tun: Universal TUN/TAP device driver, 1.6
tun: (C) 1999-2004 Max Krasnyansky <maxk-zC7DfRvBq/JWk0Htik3J/w@public.gmane.org>
PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq 1
PNP: PS/2 appears to have AUX port disabled, if this is incorrect please =
boot with i8042.nopnp
serio: i8042 KBD port at 0x60,0x64 irq 1
mice: PS/2 mouse device common for all mice
gameport gameport0: EMU10K1 is pci0000:00:13.1/gameport0, io 0xeff0, spee=
d 1269kHz
input: PC Speaker as /devices/platform/pcspkr/input/input2
I2O subsystem v1.325
i2o: max drivers =3D 8
I2O Configuration OSM v1.323
I2O Bus Adapter OSM v1.317
I2O Block Device OSM v1.325
I2O SCSI Peripheral OSM v1.316
I2O ProcFS OSM v1.316
i2c /dev entries driver
ACPI: resource piix4_smbus [io  0x0440-0x0447] conflicts with ACPI region=
 SMRG [??? 0x00000440-0x0000044f flags 0x47]
ACPI: If an ACPI driver is available for this device, you should use it i=
nstead of the native driver
ata2.00: ATAPI: TSSTcorp CDDVDW SH-S222L, SB02, max UDMA/66
ata2.00: configured for UDMA/33
scsi 1:0:0:0: CD-ROM            TSSTcorp CDDVDW SH-S222L  SB02 PQ: 0 ANSI=
: 5
sr0: scsi3-mmc drive: 125x/125x writer dvd-ram cd/rw xa/form2 cdda tray
Uniform CD-ROM driver Revision: 3.20
sr 1:0:0:0: Attached scsi CD-ROM sr0
sr 1:0:0:0: Attached scsi generic sg0 type 5
IR NEC protocol handler initialized
IR RC5(x) protocol handler initialized
IR RC6 protocol handler initialized
IR JVC protocol handler initialized
IR Sony protocol handler initialized
Linux video capture interface: v2.00
lm78: Found an LM79 chip at 0x290
device-mapper: ioctl: 4.17.0-ioctl (2010-03-05) initialised: dm-devel@red=
hat.com
cpuidle: using governor ladder
EMU10K1_Audigy 0000:00:13.0: PCI INT A -> GSI 19 (level, low) -> IRQ 19
ALSA device list:
  #0: SB Live! Value [CT4832] (rev.6, serial:0x80271102) at 0xef20, irq 1=
9
Netfilter messages via NETLINK v0.30.
nf_conntrack version 0.5.0 (16120 buckets, 64480 max)
CONFIG_NF_CT_ACCT is deprecated and will be removed soon. Please use
nf_conntrack.acct=3D1 kernel parameter, acct=3D1 nf_conntrack module opti=
on or
sysctl net.netfilter.nf_conntrack_acct=3D1 to enable it.
ctnetlink v0.93: registering with nfnetlink.
IPv4 over IPv4 tunneling driver
ip_tables: (C) 2000-2006 Netfilter Core Team
arp_tables: (C) 2002 David S. Miller
TCP cubic registered
NET: Registered protocol family 17
Using IPI No-Shortcut mode
ata3: SATA link up 1.5 Gbps (SStatus 113 SControl 310)
ata3.00: ATA-7: ST3320620AS, 3.AAE, max UDMA/133
ata3.00: 625142448 sectors, multi 16: LBA48 NCQ (depth 0/32)
ata3.00: configured for UDMA/100
scsi 2:0:0:0: Direct-Access     ATA      ST3320620AS      3.AA PQ: 0 ANSI=
: 5
sd 2:0:0:0: [sda] 625142448 512-byte logical blocks: (320 GB/298 GiB)
sd 2:0:0:0: Attached scsi generic sg1 type 0
sd 2:0:0:0: [sda] Write Protect is off
sd 2:0:0:0: [sda] Mode Sense: 00 3a 00 00
sd 2:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't supp=
ort DPO or FUA
 sda: sda1 sda2 sda3 < sda5 >
sd 2:0:0:0: [sda] Attached SCSI disk
ata4: SATA link up 1.5 Gbps (SStatus 113 SControl 310)
ata4.00: ATA-7: ST3500641AS, 3.AAJ, max UDMA/133
ata4.00: 976773168 sectors, multi 16: LBA48 NCQ (depth 0/32)
ata4.00: configured for UDMA/100
scsi 3:0:0:0: Direct-Access     ATA      ST3500641AS      3.AA PQ: 0 ANSI=
: 5
sd 3:0:0:0: [sdb] 976773168 512-byte logical blocks: (500 GB/465 GiB)
sd 3:0:0:0: Attached scsi generic sg2 type 0
sd 3:0:0:0: [sdb] Write Protect is off
sd 3:0:0:0: [sdb] Mode Sense: 00 3a 00 00
sd 3:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't supp=
ort DPO or FUA
 sdb: sdb1 sdb2
sd 3:0:0:0: [sdb] Attached SCSI disk
EXT3-fs (sda2): error: couldn't mount because of unsupported optional fea=
tures (240)
EXT2-fs (sda2): error: couldn't mount because of unsupported optional fea=
tures (240)
EXT4-fs (sda2): mounted filesystem with ordered data mode. Opts: (null)
VFS: Mounted root (ext4 filesystem) readonly on device 8:2.
Freeing unused kernel memory: 416k freed
Write protecting the kernel text: 4420k
Write protecting the kernel read-only data: 1532k
udev: starting version 151
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
ohci_hcd 0000:02:08.0: PCI INT A -> GSI 18 (level, low) -> IRQ 18
ohci_hcd 0000:02:08.0: OHCI Host Controller
ohci_hcd 0000:02:08.0: new USB bus registered, assigned bus number 1
ohci_hcd 0000:02:08.0: irq 18, io mem 0xfe5fd000
uhci_hcd: USB Universal Host Controller Interface driver
uhci_hcd 0000:00:07.2: PCI INT D -> GSI 19 (level, low) -> IRQ 19
uhci_hcd 0000:00:07.2: UHCI Host Controller
uhci_hcd 0000:00:07.2: new USB bus registered, assigned bus number 2
uhci_hcd 0000:00:07.2: irq 19, io base 0x0000ef40
usb usb2: New USB device found, idVendor=3D1d6b, idProduct=3D0001
usb usb2: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb2: Product: UHCI Host Controller
usb usb2: Manufacturer: Linux 2.6.35-gentoo-r12 uhci_hcd
usb usb2: SerialNumber: 0000:00:07.2
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 2 ports detected
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
Warning! ehci_hcd should always be loaded before uhci_hcd and ohci_hcd, n=
ot after
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
Buffer I/O error on device sr0, logical block 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
Buffer I/O error on device sr0, logical block 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
Buffer I/O error on device sr0, logical block 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
Buffer I/O error on device sr0, logical block 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
Buffer I/O error on device sr0, logical block 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
Buffer I/O error on device sr0, logical block 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
Buffer I/O error on device sr0, logical block 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
Buffer I/O error on device sr0, logical block 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
Buffer I/O error on device sr0, logical block 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
Buffer I/O error on device sr0, logical block 0
Linux agpgart interface v0.103
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
usb 2-1: new full speed USB device using uhci_hcd and address 2
agpgart-intel 0000:00:00.0: Intel 440BX Chipset
agpgart-intel 0000:00:00.0: AGP aperture is 64M @ 0xf4000000
rtc_cmos 00:02: rtc core: registered rtc_cmos as rtc0
rtc0: alarms up to one month, 114 bytes nvram
usb 2-1: New USB device found, idVendor=3D1046, idProduct=3D9967
usb 2-1: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D0
usb 2-1: Product: W9967CF
usb 2-1: Manufacturer: WINBOND
usb 2-2: new low speed USB device using uhci_hcd and address 3
usb usb1: New USB device found, idVendor=3D1d6b, idProduct=3D0001
usb usb1: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb1: Product: OHCI Host Controller
usb usb1: Manufacturer: Linux 2.6.35-gentoo-r12 ohci_hcd
usb usb1: SerialNumber: 0000:02:08.0
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 3 ports detected
ehci_hcd 0000:02:08.2: PCI INT C -> GSI 16 (level, low) -> IRQ 16
ehci_hcd 0000:02:08.2: EHCI Host Controller
ehci_hcd 0000:02:08.2: new USB bus registered, assigned bus number 3
ehci_hcd 0000:02:08.2: irq 16, io mem 0xfe5fff00
ehci_hcd 0000:02:08.2: USB 2.0 started, EHCI 0.95
usb usb3: New USB device found, idVendor=3D1d6b, idProduct=3D0002
usb usb3: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb3: Product: EHCI Host Controller
usb usb3: Manufacturer: Linux 2.6.35-gentoo-r12 ehci_hcd
usb usb3: SerialNumber: 0000:02:08.2
hub 3-0:1.0: USB hub found
hub 3-0:1.0: 5 ports detected
ohci1394 0000:02:0b.0: PCI INT A -> GSI 17 (level, low) -> IRQ 17
ohci1394: fw-host0: OHCI-1394 1.0 (PCI): IRQ=3D[17]  MMIO=3D[fe5ff000-fe5=
ff7ff]  Max Packet=3D[2048]  IR/IT contexts=3D[4/8]
usb 2-2: New USB device found, idVendor=3D045e, idProduct=3D00db
usb 2-2: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D0
usb 2-2: Product: Natural=AE Ergonomic Keyboard 4000
usb 2-2: Manufacturer: Microsoft
ohci_hcd 0000:02:08.1: PCI INT B -> GSI 19 (level, low) -> IRQ 19
ohci_hcd 0000:02:08.1: OHCI Host Controller
ohci_hcd 0000:02:08.1: new USB bus registered, assigned bus number 4
ohci_hcd 0000:02:08.1: irq 19, io mem 0xfe5fe000
usbcore: registered new interface driver hiddev
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
input: Microsoft Natural=AE Ergonomic Keyboard 4000 as /devices/pci0000:0=
0/0000:00:07.2/usb2/2-2/2-2:1.0/input/input3
microsoft 0003:045E:00DB.0001: input,hidraw0: USB HID v1.11 Keyboard [Mic=
rosoft Natural=AE Ergonomic Keyboard 4000] on usb-0000:00:07.2-2/input0
input: Microsoft Natural=AE Ergonomic Keyboard 4000 as /devices/pci0000:0=
0/0000:00:07.2/usb2/2-2/2-2:1.1/input/input4
microsoft 0003:045E:00DB.0002: input,hidraw1: USB HID v1.11 Device [Micro=
soft Natural=AE Ergonomic Keyboard 4000] on usb-0000:00:07.2-2/input1
usb 3-2: new high speed USB device using ehci_hcd and address 2
usb 3-2: New USB device found, idVendor=3D050d, idProduct=3D0237
usb 3-2: New USB device strings: Mfr=3D0, Product=3D0, SerialNumber=3D0
hub 3-2:1.0: USB hub found
hub 3-2:1.0: 7 ports detected
usb usb4: New USB device found, idVendor=3D1d6b, idProduct=3D0001
usb usb4: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb4: Product: OHCI Host Controller
usb usb4: Manufacturer: Linux 2.6.35-gentoo-r12 ohci_hcd
usb usb4: SerialNumber: 0000:02:08.1
hub 4-0:1.0: USB hub found
hub 4-0:1.0: 2 ports detected
usb 3-2.3: new low speed USB device using ehci_hcd and address 3
usb 3-2.3: New USB device found, idVendor=3D045e, idProduct=3D00d1
usb 3-2.3: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D0
usb 3-2.3: Product: Microsoft Optical Mouse with Tilt Wheel
usb 3-2.3: Manufacturer: Microsoft
input: Microsoft Microsoft Optical Mouse with Tilt Wheel as /devices/pci0=
000:00/0000:00:12.0/0000:02:08.2/usb3/3-2/3-2.3/3-2.3:1.0/input/input5
generic-usb 0003:045E:00D1.0003: input,hidraw2: USB HID v1.11 Mouse [Micr=
osoft Microsoft Optical Mouse with Tilt Wheel] on usb-0000:02:08.2-2.3/in=
put0
ieee1394: The root node is not cycle master capable; selecting a new root=
 node and resetting...
EXT4-fs (sda2): re-mounted. Opts: (null)
ieee1394: Error parsing configrom for node 0-00:1023
ieee1394: Host added: ID:BUS[0-01:1023]  GUID[005042b5000097c6]
usb 3-4: new high speed USB device using ehci_hcd and address 4
usb 3-4: New USB device found, idVendor=3D2040, idProduct=3D7501
usb 3-4: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D3
usb 3-4: Product: WinTV
usb 3-4: Manufacturer: Hauppauge
usb 3-4: SerialNumber: 7300-00-F05EA556
pvrusb2: Hardware description: WinTV HVR-1950 Model 751xx
usbcore: registered new interface driver pvrusb2
pvrusb2: V4L in-tree version:Hauppauge WinTV-PVR-USB2 MPEG2 Encoder/Tuner
pvrusb2: Debug mask is 31 (0x1f)
EXT3-fs: barriers not enabled
kjournald starting.  Commit interval 5 seconds
EXT3-fs (sdb2): using internal journal
EXT3-fs (sdb2): mounted filesystem with ordered data mode
Adding 2136028k swap on /dev/sda1.  Priority:-1 extents:1 across:2136028k=
=20
pvrusb2: Device microcontroller firmware (re)loaded; it should now reset =
and reconnect.
usb 3-4: USB disconnect, address 4
pvrusb2: Device being rendered inoperable
usb 3-4: new high speed USB device using ehci_hcd and address 5
usb 3-4: New USB device found, idVendor=3D2040, idProduct=3D7501
usb 3-4: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D3
usb 3-4: Product: WinTV
usb 3-4: Manufacturer: Hauppauge
usb 3-4: SerialNumber: 7300-00-F05EA556
pvrusb2: Hardware description: WinTV HVR-1950 Model 751xx
pvrusb2: Binding ir_video to i2c address 0x71.
cx25840 0-0044: cx25843-24 found @ 0x88 (pvrusb2_a)
pvrusb2: Attached sub-driver cx25840
tuner 0-0042: chip found @ 0x84 (pvrusb2_a)
pvrusb2: Attached sub-driver tuner
cx25840 0-0044: loaded v4l-cx25840.fw firmware (16382 bytes)
tveeprom 0-00a2: Hauppauge model 75111, rev C3E9, serial# 6202710
tveeprom 0-00a2: MAC address is 00:0d:fe:5e:a5:56
tveeprom 0-00a2: tuner model is Philips 18271_8295 (idx 149, type 54)
tveeprom 0-00a2: TV standards NTSC(M) ATSC/DVB Digital (eeprom 0x88)
tveeprom 0-00a2: audio processor is CX25843 (idx 37)
tveeprom 0-00a2: decoder processor is CX25843 (idx 30)
tveeprom 0-00a2: has radio, has IR receiver, has IR transmitter
pvrusb2: Supported video standard(s) reported available in hardware: PAL-=
M/N/Nc;NTSC-M/Mj/Mk;ATSC-8VSB/16VSB
pvrusb2: Mapping standards mask=3D0x300b700 (PAL-M/N/Nc;NTSC-M/Mj/Mk;ATSC=
-8VSB/16VSB)
pvrusb2: Setting up 6 unique standard(s)
pvrusb2: Set up standard idx=3D0 name=3DPAL-M
pvrusb2: Set up standard idx=3D1 name=3DPAL-N
pvrusb2: Set up standard idx=3D2 name=3DPAL-Nc
pvrusb2: Set up standard idx=3D3 name=3DNTSC-M
pvrusb2: Set up standard idx=3D4 name=3DNTSC-Mj
pvrusb2: Set up standard idx=3D5 name=3DNTSC-Mk
pvrusb2: Initial video standard (determined by device type): NTSC-M
pvrusb2: Device initialization completed successfully.
pvrusb2: registered device video0 [mpeg]
DVB: registering new adapter (pvrusb2-dvb)
cx25840 0-0044: loaded v4l-cx25840.fw firmware (16382 bytes)
tda829x 0-0042: setting tuner address to 60
tda18271 0-0060: creating new instance
TDA18271HD/C1 detected @ 0-0060
tda829x 0-0042: type set to tda8295+18271
cx25840 0-0044: 0x0000 is not a valid video input!
DVB: registering adapter 0 frontend 0 (Samsung S5H1411 QAM/8VSB Frontend)=
...
tda829x 0-0042: type set to tda8295
tda18271 0-0060: attaching existing instance
e100 0000:00:14.0: eth0: NIC Link is Up 100 Mbps Half Duplex
NET: Registered protocol family 10
lo: Disabled Privacy Extensions
tunl0: Disabled Privacy Extensions
svc: failed to register lockdv1 RPC service (errno 97).
NFSD: Using /var/lib/nfs/v4recovery as the NFSv4 state recovery directory
NFSD: starting 90-second grace period
eth0: no IPv6 routers present
[drm] Initialized drm 1.1.0 20060810
nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
[drm] nouveau 0000:01:00.0: nouveau_load:800 - vendor: 0x10DE device: 0x2=
E1 class: 0x30000
[drm] nouveau 0000:01:00.0: nouveau_load:823 - regs mapped ok at 0xfd0000=
00
[drm] nouveau 0000:01:00.0: Detected an NV40 generation card (0x04b200b1)
[drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PRAMIN
[drm] nouveau 0000:01:00.0: ... appears to be valid
[drm] nouveau 0000:01:00.0: BIT BIOS found
[drm] nouveau 0000:01:00.0: Bios version 05.73.22.51
[drm] nouveau 0000:01:00.0: TMDS table script pointers not stubbed
[drm] nouveau 0000:01:00.0: BIT table 'd' not found
[drm] nouveau 0000:01:00.0: Found Display Configuration Block version 3.0
[drm] nouveau 0000:01:00.0: Raw DCB entry 0: 01000300 00000028
[drm] nouveau 0000:01:00.0: Raw DCB entry 1: 03000302 00000000
[drm] nouveau 0000:01:00.0: Raw DCB entry 2: 04011310 00000028
[drm] nouveau 0000:01:00.0: Raw DCB entry 3: 020223f1 00c0c080
[drm] nouveau 0000:01:00.0: DCB connector table: VHER 0x30 5 10 2
[drm] nouveau 0000:01:00.0:   0: 0x00002030: type 0x30 idx 0 tag 0x08
[drm] nouveau 0000:01:00.0:   1: 0x00000100: type 0x00 idx 1 tag 0xff
[drm] nouveau 0000:01:00.0:   2: 0x00000210: type 0x10 idx 2 tag 0xff
[drm] nouveau 0000:01:00.0:   3: 0x00000211: type 0x11 idx 3 tag 0xff
[drm] nouveau 0000:01:00.0:   4: 0x00000213: type 0x13 idx 4 tag 0xff
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset 0xCDAD
[drm] nouveau 0000:01:00.0: 0xCDAD: ------ Executing following commands -=
-----
[drm] nouveau 0000:01:00.0: 0xCDAD: [ (0x53) - INIT_ZM_CR ]
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x44,=
 Head: 0x00, Data: 0x03
[drm] nouveau 0000:01:00.0: 0xCDB0: [ (0x78) - INIT_INDEX_IO ]
[drm] nouveau 0000:01:00.0: 0xCDB0: Port: 0x03C4, Index: 0x01, Mask: 0xFF=
, Data: 0x20
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03C4, Index: 0x01,=
 Head: 0x01, Data: 0x20
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03C4, Index: 0x01,=
 Head: 0x01, Data: 0x20
[drm] nouveau 0000:01:00.0: 0xCDB6: [ (0x53) - INIT_ZM_CR ]
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x44,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 0xCDB9: [ (0x78) - INIT_INDEX_IO ]
[drm] nouveau 0000:01:00.0: 0xCDB9: Port: 0x03C4, Index: 0x01, Mask: 0xFF=
, Data: 0x20
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03C4, Index: 0x01,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03C4, Index: 0x01,=
 Head: 0x00, Data: 0x20
[drm] nouveau 0000:01:00.0: 0xCDBF: [ (0x65) - INIT_RESET ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x0000184C, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0000184C, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00000200, Data: 0x01100000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00000200, Data: 0x05110111
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0000184C, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00001850, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001850, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xCDCC: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0000C040, Data: 0x3C000400
[drm] nouveau 0000:01:00.0: 0xCDD5: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xCDD5: Reg: 0x00101000, Mask: 0xFFFFFFFF, Da=
ta: 0x80000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xCDE2: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xCDE2: Reg: 0x0010100C, Mask: 0xFFFFFFFF, Da=
ta: 0x80000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x0010100C, Data: 0x80010490
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0010100C, Data: 0x80010490
[drm] nouveau 0000:01:00.0: 0xCDEF: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xCDEF: Reg: 0x00600818, Mask: 0xFFFFFFFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00600818, Data: 0x01100010
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00600818, Data: 0x01100010
[drm] nouveau 0000:01:00.0: 0xCDFC: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xCDFC: Reg: 0x0060081C, Mask: 0xFFFFFFFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x0060081C, Data: 0x22222222
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0060081C, Data: 0x22222222
[drm] nouveau 0000:01:00.0: 0xCE09: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xCE09: Reg: 0x00600850, Mask: 0xFFFFFFFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00600850, Data: 0x00002222
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00600850, Data: 0x00002222
[drm] nouveau 0000:01:00.0: 0xCE16: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00600854, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xCE1F: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00600858, Data: 0x00001FFF
[drm] nouveau 0000:01:00.0: 0xCE28: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00602858, Data: 0x00001FFF
[drm] nouveau 0000:01:00.0: 0xCE31: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xCE31: Reg: 0x00600818, Mask: 0xFFFFFFFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00600818, Data: 0x01100010
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00600818, Data: 0x01100010
[drm] nouveau 0000:01:00.0: 0xCE3E: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xCE3E: Reg: 0x0060081C, Mask: 0xFFFFFFFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x0060081C, Data: 0x22222222
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0060081C, Data: 0x22222222
[drm] nouveau 0000:01:00.0: 0xCE4B: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xCE4B: Reg: 0x00600850, Mask: 0xFFFFFFFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00600850, Data: 0x00002222
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00600850, Data: 0x00002222
[drm] nouveau 0000:01:00.0: 0xCE58: [ (0x58) - INIT_ZM_REG_SEQUENCE ]
[drm] nouveau 0000:01:00.0: 0xCE58: BaseReg: 0x00001540, Count: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001540, Data: 0x73F31F0B
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001544, Data: 0x00000FFF
[drm] nouveau 0000:01:00.0: 0xCE66: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100210, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xCE6F: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004000, Data: 0x00010000
[drm] nouveau 0000:01:00.0: 0xCE78: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004008, Data: 0x03310000
[drm] nouveau 0000:01:00.0: 0xCE81: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00680580, Data: 0x03D0003D
[drm] nouveau 0000:01:00.0: 0xCE8A: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004600, Data: 0x80000001
[drm] nouveau 0000:01:00.0: 0xCE93: [ (0x91) - INIT_ZM_REG_GROUP_ADDRESS_=
LATCHED ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004020, Data: 0x34880000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004020, Data: 0x34800000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004020, Data: 0x24800000
[drm] nouveau 0000:01:00.0: 0xCEA5: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xCEA5: Reg: 0x00100A40, RegIncrement: 0x04, =
Count: 0x02, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A40, Data: 0x8703280F
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A44, Data: 0x8703280F
[drm] nouveau 0000:01:00.0: 0xCEEC: [ (0x58) - INIT_ZM_REG_SEQUENCE ]
[drm] nouveau 0000:01:00.0: 0xCEEC: BaseReg: 0x000015B4, Count: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x000015B4, Data: 0x08000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x000015B8, Data: 0x98800F08
[drm] nouveau 0000:01:00.0: 0xCEFA: [ (0x75) - INIT_CONDITION ]
[drm] nouveau 0000:01:00.0: 0xCEFA: Condition: 0x03
[drm] nouveau 0000:01:00.0: 0xCEFA: Cond: 0x03, Reg: 0x00000000, Mask: 0x=
000000FF
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00000000, Data: 0x04B200B1
[drm] nouveau 0000:01:00.0: 0xCEFA: Checking if 0x000000B1 equals 0x00000=
0A1
[drm] nouveau 0000:01:00.0: 0xCEFA: Condition not fulfilled -- skipping f=
ollowing commands
[drm] nouveau 0000:01:00.0: 0xCEFC: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 0xCF05: [ (0x38) - INIT_NOT ]
[drm] nouveau 0000:01:00.0: 0xCF05: ------ Executing following commands -=
-----
[drm] nouveau 0000:01:00.0: 0xCF06: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100360, Data: 0x8B183A98
[drm] nouveau 0000:01:00.0: 0xCF0F: [ (0x72) - INIT_RESUME ]
[drm] nouveau 0000:01:00.0: 0xCF10: [ (0x75) - INIT_CONDITION ]
[drm] nouveau 0000:01:00.0: 0xCF10: Condition: 0x00
[drm] nouveau 0000:01:00.0: 0xCF10: Cond: 0x00, Reg: 0x00101000, Mask: 0x=
00000040
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xCF10: Checking if 0x00000000 equals 0x00000=
040
[drm] nouveau 0000:01:00.0: 0xCF10: Condition not fulfilled -- skipping f=
ollowing commands
[drm] nouveau 0000:01:00.0: 0xCF12: [ (0x62) - INIT_ZM_INDEX_IO ]
[drm] nouveau 0000:01:00.0: 0xCF17: [ (0x38) - INIT_NOT ]
[drm] nouveau 0000:01:00.0: 0xCF17: ------ Executing following commands -=
-----
[drm] nouveau 0000:01:00.0: 0xCF18: [ (0x62) - INIT_ZM_INDEX_IO ]
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x3C,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 0xCF1D: [ (0x72) - INIT_RESUME ]
[drm] nouveau 0000:01:00.0: 0xCF1E: [ (0x37) - INIT_COPY ]
[drm] nouveau 0000:01:00.0: 0xCF1E: Reg: 0x00101000, Shift: 0xFE, SrcMask=
: 0xF0, Port: 0x03D4, Index: 0x3C, Mask: 0x0F
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x3C,=
 Head: 0x00, Data: 0x20
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x3C,=
 Head: 0x00, Data: 0x20
[drm] nouveau 0000:01:00.0: 0xCF29: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00680510, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xCF32: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xCF32: Reg: 0x00001580, Mask: 0xCFFFFFFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00001580, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001580, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xCF3F: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00000140, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xCF48: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00000200, Data: 0x07110111
[drm] nouveau 0000:01:00.0: 0xCF51: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00680608, Data: 0x00100000
[drm] nouveau 0000:01:00.0: 0xCF5A: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00682608, Data: 0x00100000
[drm] nouveau 0000:01:00.0: 0xCF63: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00680670, Data: 0x00100000
[drm] nouveau 0000:01:00.0: 0xCF6C: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001084, Data: 0x00205649
[drm] nouveau 0000:01:00.0: 0xCF75: [ (0x6B) - INIT_SUB ]
[drm] nouveau 0000:01:00.0: 0xCF75: Calling script 6
[drm] nouveau 0000:01:00.0: 0xDCB7: [ (0x4A) - INIT_IO_RESTRICT_PLL2 ]
[drm] nouveau 0000:01:00.0: 0xDCB7: Port: 0x03D4, Index: 0x3C, Mask: 0x70=
, Shift: 0x04, Count: 0x08, Reg: 0x00004004
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x3C,=
 Head: 0x00, Data: 0x20
[drm] nouveau 0000:01:00.0: 0xDCB7: Reg: 0x00004004, Config: 0x02, Freq: =
400000kHz
[drm] nouveau 0000:01:00.0: Loading PLL limits for reg 0x00000000
[drm] nouveau 0000:01:00.0: pll.vco1.minfreq: 100000
[drm] nouveau 0000:01:00.0: pll.vco1.maxfreq: 300000
[drm] nouveau 0000:01:00.0: pll.vco1.min_inputfreq: 2000
[drm] nouveau 0000:01:00.0: pll.vco1.max_inputfreq: 27000
[drm] nouveau 0000:01:00.0: pll.vco1.min_n: 8
[drm] nouveau 0000:01:00.0: pll.vco1.max_n: 255
[drm] nouveau 0000:01:00.0: pll.vco1.min_m: 1
[drm] nouveau 0000:01:00.0: pll.vco1.max_m: 255
[drm] nouveau 0000:01:00.0: pll.vco2.minfreq: 500000
[drm] nouveau 0000:01:00.0: pll.vco2.maxfreq: 1000000
[drm] nouveau 0000:01:00.0: pll.vco2.min_inputfreq: 25000
[drm] nouveau 0000:01:00.0: pll.vco2.max_inputfreq: 75000
[drm] nouveau 0000:01:00.0: pll.vco2.min_n: 8
[drm] nouveau 0000:01:00.0: pll.vco2.max_n: 50
[drm] nouveau 0000:01:00.0: pll.vco2.min_m: 1
[drm] nouveau 0000:01:00.0: pll.vco2.max_m: 255
[drm] nouveau 0000:01:00.0: pll.max_log2p: 7
[drm] nouveau 0000:01:00.0: pll.log2p_bias: 0
[drm] nouveau 0000:01:00.0: pll.refclk: 27000
[drm] nouveau 0000:01:00.0: 0xDCE2: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: 0xCF75: End of script 6
[drm] nouveau 0000:01:00.0: 0xCF77: [ (0x5B) - INIT_SUB_DIRECT ]
[drm] nouveau 0000:01:00.0: 0xCF77: Executing subroutine at 0xDE82
[drm] nouveau 0000:01:00.0: 0xDE82: [ (0x92) - INIT_RESERVED ]
[drm] nouveau 0000:01:00.0: 0xDE83: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: 0xCF77: End of 0xDE82 subroutine
[drm] nouveau 0000:01:00.0: 0xCF7A: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004024, Data: 0x00005904
[drm] nouveau 0000:01:00.0: 0xCF83: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004020, Data: 0xACB12000
[drm] nouveau 0000:01:00.0: 0xCF8C: [ (0x74) - INIT_TIME ]
[drm] nouveau 0000:01:00.0: 0xCF8C: Sleeping for 0x00C8 microseconds
[drm] nouveau 0000:01:00.0: 0xCF8F: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004020, Data: 0xACB13000
[drm] nouveau 0000:01:00.0: 0xCF98: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004020, Data: 0xAC313000
[drm] nouveau 0000:01:00.0: 0xCFA1: [ (0x90) - INIT_COPY_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00004024, Data: 0x00001401
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0000403C, Data: 0x00001401
[drm] nouveau 0000:01:00.0: 0xCFAA: [ (0x90) - INIT_COPY_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00004020, Data: 0xAC413000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004038, Data: 0xAC413000
[drm] nouveau 0000:01:00.0: 0xCFB3: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xCFB3: Reg: 0x00100440, RegIncrement: 0x10, =
Count: 0x06, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100440, Data: 0x01F00111
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100450, Data: 0x01F00111
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100460, Data: 0x00001111
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100470, Data: 0x00001111
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100480, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100490, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xD07A: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD07A: Reg: 0x00100444, RegIncrement: 0x10, =
Count: 0x06, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100444, Data: 0x01022123
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100454, Data: 0x01022123
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100464, Data: 0x000D0010
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100474, Data: 0x000D0010
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100484, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100494, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xD141: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD141: Reg: 0x001003E4, RegIncrement: 0x04, =
Count: 0x0E, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001003E4, Data: 0x04040004
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001003E8, Data: 0x00000404
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001003EC, Data: 0x04040004
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001003F0, Data: 0x00000404
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001003F4, Data: 0x00000404
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001003F8, Data: 0x04000004
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001003FC, Data: 0x04000004
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100400, Data: 0x0B00000B
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100404, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100408, Data: 0x0B00000B
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0010040C, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100410, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100414, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100418, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xD308: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xD308: Reg: 0x0000425C, Mask: 0xFFFFFFFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x0000425C, Data: 0x0C221464
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0000425C, Data: 0x0C221464
[drm] nouveau 0000:01:00.0: 0xD315: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xD315: Reg: 0x00004410, Mask: 0xFFF003FF, Da=
ta: 0x00000400
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00004410, Data: 0x161004E0
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004410, Data: 0x161004E0
[drm] nouveau 0000:01:00.0: 0xD322: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xD322: Reg: 0x0000C040, Mask: 0xFFFCFFFF, Da=
ta: 0x00030000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x0000C040, Data: 0x3C0B07FF
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0000C040, Data: 0x3C0B07FF
[drm] nouveau 0000:01:00.0: 0xD32F: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD32F: Reg: 0x00100220, RegIncrement: 0x04, =
Count: 0x09, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100220, Data: 0x06121E18
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100224, Data: 0x0A010805
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100228, Data: 0x23230606
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0010022C, Data: 0x5311F304
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100230, Data: 0x00000C1F
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100234, Data: 0x01E69677
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100238, Data: 0x001E0211
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0010023C, Data: 0x00000031
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100240, Data: 0x00090000
[drm] nouveau 0000:01:00.0: 0xD456: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset 0xD457
[drm] nouveau 0000:01:00.0: 0xD457: ------ Executing following commands -=
-----
[drm] nouveau 0000:01:00.0: 0xD457: [ (0x58) - INIT_ZM_REG_SEQUENCE ]
[drm] nouveau 0000:01:00.0: 0xD457: BaseReg: 0x00100328, Count: 0x09
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100328, Data: 0x08030114
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0010032C, Data: 0xFFFF18FF
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100330, Data: 0xCCCC5044
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100334, Data: 0x33332022
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100338, Data: 0x0000000A
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0010033C, Data: 0x00041244
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100340, Data: 0x000001FB
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100344, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100348, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xD481: [ (0x58) - INIT_ZM_REG_SEQUENCE ]
[drm] nouveau 0000:01:00.0: 0xD481: BaseReg: 0x00100350, Count: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100350, Data: 0x0000440A
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100354, Data: 0x00000806
[drm] nouveau 0000:01:00.0: 0xD48F: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100210, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xD498: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001220, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xD4A1: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001228, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xD4AA: [ (0x58) - INIT_ZM_REG_SEQUENCE ]
[drm] nouveau 0000:01:00.0: 0xD4AA: BaseReg: 0x00100A50, Count: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A50, Data: 0x00100077
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A54, Data: 0x00100077
[drm] nouveau 0000:01:00.0: 0xD4B8: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001218, Data: 0x00010000
[drm] nouveau 0000:01:00.0: 0xD4C1: [ (0x58) - INIT_ZM_REG_SEQUENCE ]
[drm] nouveau 0000:01:00.0: 0xD4C1: BaseReg: 0x00001230, Count: 0x03
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001230, Data: 0x8000DFDF
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001234, Data: 0x0004000F
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001238, Data: 0xF83E0000
[drm] nouveau 0000:01:00.0: 0xD4D3: [ (0x58) - INIT_ZM_REG_SEQUENCE ]
[drm] nouveau 0000:01:00.0: 0xD4D3: BaseReg: 0x00001240, Count: 0x04
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001240, Data: 0x80000A0A
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001244, Data: 0x0001000F
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001248, Data: 0xF83E0000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0000124C, Data: 0xAA11AA11
[drm] nouveau 0000:01:00.0: 0xD4E9: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xD4E9: Reg: 0x00001280, Mask: 0xFFFFFFFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00001280, Data: 0x2F192F19
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001280, Data: 0x2F192F19
[drm] nouveau 0000:01:00.0: 0xD4F6: [ (0x74) - INIT_TIME ]
[drm] nouveau 0000:01:00.0: 0xD4F6: Sleeping for 0x07D0 microseconds
[drm] nouveau 0000:01:00.0: 0xD4F9: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD4F9: Reg: 0x00100218, RegIncrement: 0x04, =
Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100218, Data: 0x00000100
[drm] nouveau 0000:01:00.0: 0xD520: [ (0x74) - INIT_TIME ]
[drm] nouveau 0000:01:00.0: 0xD520: Sleeping for 0x07D0 microseconds
[drm] nouveau 0000:01:00.0: 0xD523: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xD523: Macro: 0x01, MacroTableIndex: 0x01, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0010021C, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xD525: [ (0x74) - INIT_TIME ]
[drm] nouveau 0000:01:00.0: 0xD525: Sleeping for 0x07D0 microseconds
[drm] nouveau 0000:01:00.0: 0xD528: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD528: Reg: 0x00100200, RegIncrement: 0x04, =
Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100200, Data: 0x43003071
[drm] nouveau 0000:01:00.0: 0xD54F: [ (0x75) - INIT_CONDITION ]
[drm] nouveau 0000:01:00.0: 0xD54F: Condition: 0x02
[drm] nouveau 0000:01:00.0: 0xD54F: Cond: 0x02, Reg: 0x00101000, Mask: 0x=
00000020
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD54F: Checking if 0x00000000 equals 0x00000=
020
[drm] nouveau 0000:01:00.0: 0xD54F: Condition not fulfilled -- skipping f=
ollowing commands
[drm] nouveau 0000:01:00.0: 0xD551: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xD55E: [ (0x72) - INIT_RESUME ]
[drm] nouveau 0000:01:00.0: 0xD55E: ---- Executing following commands ---=
-
[drm] nouveau 0000:01:00.0: 0xD55F: [ (0x75) - INIT_CONDITION ]
[drm] nouveau 0000:01:00.0: 0xD55F: Condition: 0x04
[drm] nouveau 0000:01:00.0: 0xD55F: Cond: 0x04, Reg: 0x00001540, Mask: 0x=
000F0000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00001540, Data: 0x73F31F0B
[drm] nouveau 0000:01:00.0: 0xD55F: Checking if 0x00030000 equals 0x00030=
000
[drm] nouveau 0000:01:00.0: 0xD55F: Condition fulfilled -- continuing to =
execute
[drm] nouveau 0000:01:00.0: 0xD561: [ (0x38) - INIT_NOT ]
[drm] nouveau 0000:01:00.0: 0xD561: ------ Skipping following commands  -=
-----
[drm] nouveau 0000:01:00.0: 0xD562: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xD56F: [ (0x5F) - INIT_COPY_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xD585: [ (0x72) - INIT_RESUME ]
[drm] nouveau 0000:01:00.0: 0xD585: ---- Executing following commands ---=
-
[drm] nouveau 0000:01:00.0: 0xD586: [ (0x74) - INIT_TIME ]
[drm] nouveau 0000:01:00.0: 0xD586: Sleeping for 0x07D0 microseconds
[drm] nouveau 0000:01:00.0: 0xD589: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD589: Reg: 0x00100204, RegIncrement: 0x04, =
Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100204, Data: 0x0055A220
[drm] nouveau 0000:01:00.0: 0xD5B0: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100210, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xD5B9: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100214, Data: 0x000000B0
[drm] nouveau 0000:01:00.0: 0xD5C2: [ (0x74) - INIT_TIME ]
[drm] nouveau 0000:01:00.0: 0xD5C2: Sleeping for 0x00C8 microseconds
[drm] nouveau 0000:01:00.0: 0xD5C5: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD5C5: Reg: 0x00100218, RegIncrement: 0x04, =
Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100218, Data: 0x00000100
[drm] nouveau 0000:01:00.0: 0xD5EC: [ (0x74) - INIT_TIME ]
[drm] nouveau 0000:01:00.0: 0xD5EC: Sleeping for 0x07D0 microseconds
[drm] nouveau 0000:01:00.0: 0xD5EF: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD5EF: Reg: 0x00100218, RegIncrement: 0x04, =
Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100218, Data: 0x00000101
[drm] nouveau 0000:01:00.0: 0xD616: [ (0x74) - INIT_TIME ]
[drm] nouveau 0000:01:00.0: 0xD616: Sleeping for 0x07D0 microseconds
[drm] nouveau 0000:01:00.0: 0xD619: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xD619: Macro: 0x03, MacroTableIndex: 0x03, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D8, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xD61B: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xD61B: Macro: 0x00, MacroTableIndex: 0x00, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D4, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xD61D: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD61D: Reg: 0x001002E0, RegIncrement: 0x04, =
Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002E0, Data: 0x00200000
[drm] nouveau 0000:01:00.0: 0xD644: [ (0x90) - INIT_COPY_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002E0, Data: 0x00300000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002E8, Data: 0x00300000
[drm] nouveau 0000:01:00.0: 0xD64D: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD64D: Reg: 0x001002E0, RegIncrement: 0x04, =
Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002E0, Data: 0x00300000
[drm] nouveau 0000:01:00.0: 0xD674: [ (0x90) - INIT_COPY_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002E0, Data: 0x00300000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002E8, Data: 0x00300000
[drm] nouveau 0000:01:00.0: 0xD67D: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD67D: Reg: 0x001002C4, RegIncrement: 0x04, =
Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C4, Data: 0x00100006
[drm] nouveau 0000:01:00.0: 0xD6A4: [ (0x90) - INIT_COPY_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C4, Data: 0x00100006
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002CC, Data: 0x00100006
[drm] nouveau 0000:01:00.0: 0xD6AD: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD6AD: Reg: 0x00100900, RegIncrement: 0x04, =
Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100900, Data: 0x00000101
[drm] nouveau 0000:01:00.0: 0xD6D4: [ (0x39) - INIT_IO_FLAG_CONDITION ]
[drm] nouveau 0000:01:00.0: 0xD6D4: Port: 0x03D4, Index: 0x3C, Mask: 0x70=
, Shift: 0x04, FlagArray: 0x58DC, FAMask: 0x08, Cmpval: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x3C,=
 Head: 0x00, Data: 0x20
[drm] nouveau 0000:01:00.0: 0xD6D4: Checking if 0x00 equals 0x00
[drm] nouveau 0000:01:00.0: 0xD6D4: Condition fulfilled -- continuing to =
execute
[drm] nouveau 0000:01:00.0: 0xD6D6: [ (0x5B) - INIT_SUB_DIRECT ]
[drm] nouveau 0000:01:00.0: 0xD6D6: Executing subroutine at 0xD79D
[drm] nouveau 0000:01:00.0: 0xD79D: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD79D: Reg: 0x00100940, RegIncrement: 0x10, =
Count: 0x06, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100940, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100950, Data: 0xACABAA89
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100960, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100970, Data: 0xACABAA89
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100980, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100990, Data: 0x21411411
[drm] nouveau 0000:01:00.0: 0xD864: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD864: Reg: 0x00100944, RegIncrement: 0x10, =
Count: 0x06, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100944, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100954, Data: 0xBDA8A9AA
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100964, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100974, Data: 0xBDA8A9AA
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100984, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100994, Data: 0x11131221
[drm] nouveau 0000:01:00.0: 0xD92B: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: 0xD6D6: End of 0xD79D subroutine
[drm] nouveau 0000:01:00.0: 0xD6D9: [ (0x38) - INIT_NOT ]
[drm] nouveau 0000:01:00.0: 0xD6D9: ------ Skipping following commands  -=
-----
[drm] nouveau 0000:01:00.0: 0xD6DA: [ (0x5B) - INIT_SUB_DIRECT ]
[drm] nouveau 0000:01:00.0: 0xD6DD: [ (0x72) - INIT_RESUME ]
[drm] nouveau 0000:01:00.0: 0xD6DD: ---- Executing following commands ---=
-
[drm] nouveau 0000:01:00.0: 0xD6DE: [ (0x39) - INIT_IO_FLAG_CONDITION ]
[drm] nouveau 0000:01:00.0: 0xD6DE: Port: 0x03D4, Index: 0x3C, Mask: 0x70=
, Shift: 0x04, FlagArray: 0x58DC, FAMask: 0x10, Cmpval: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x3C,=
 Head: 0x00, Data: 0x20
[drm] nouveau 0000:01:00.0: 0xD6DE: Checking if 0x00 equals 0x00
[drm] nouveau 0000:01:00.0: 0xD6DE: Condition fulfilled -- continuing to =
execute
[drm] nouveau 0000:01:00.0: 0xD6E0: [ (0x5B) - INIT_SUB_DIRECT ]
[drm] nouveau 0000:01:00.0: 0xD6E0: Executing subroutine at 0xDA6D
[drm] nouveau 0000:01:00.0: 0xDA6D: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xDA6D: Reg: 0x00100A00, RegIncrement: 0x04, =
Count: 0x02, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A00, Data: 0x11111111
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A04, Data: 0x11111111
[drm] nouveau 0000:01:00.0: 0xDAB4: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xDAB4: Reg: 0x00100A10, RegIncrement: 0x04, =
Count: 0x02, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A10, Data: 0x45332202
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A14, Data: 0x23103103
[drm] nouveau 0000:01:00.0: 0xDAFB: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: 0xD6E0: End of 0xDA6D subroutine
[drm] nouveau 0000:01:00.0: 0xD6E3: [ (0x72) - INIT_RESUME ]
[drm] nouveau 0000:01:00.0: 0xD6E4: [ (0x39) - INIT_IO_FLAG_CONDITION ]
[drm] nouveau 0000:01:00.0: 0xD6E4: Port: 0x03D4, Index: 0x3C, Mask: 0x70=
, Shift: 0x04, FlagArray: 0x58DC, FAMask: 0x80, Cmpval: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x3C,=
 Head: 0x00, Data: 0x20
[drm] nouveau 0000:01:00.0: 0xD6E4: Checking if 0x00 equals 0x00
[drm] nouveau 0000:01:00.0: 0xD6E4: Condition fulfilled -- continuing to =
execute
[drm] nouveau 0000:01:00.0: 0xD6E6: [ (0x5B) - INIT_SUB_DIRECT ]
[drm] nouveau 0000:01:00.0: 0xD6E6: Executing subroutine at 0xDAFC
[drm] nouveau 0000:01:00.0: 0xDAFC: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xDAFC: Reg: 0x00100A20, RegIncrement: 0x04, =
Count: 0x02, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A20, Data: 0x11011101
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A24, Data: 0x11111111
[drm] nouveau 0000:01:00.0: 0xDB43: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xDB43: Reg: 0x00100A30, RegIncrement: 0x04, =
Count: 0x02, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A30, Data: 0x20F000E2
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A34, Data: 0x20005010
[drm] nouveau 0000:01:00.0: 0xDB8A: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: 0xD6E6: End of 0xDAFC subroutine
[drm] nouveau 0000:01:00.0: 0xD6E9: [ (0x72) - INIT_RESUME ]
[drm] nouveau 0000:01:00.0: 0xD6EA: [ (0x58) - INIT_ZM_REG_SEQUENCE ]
[drm] nouveau 0000:01:00.0: 0xD6EA: BaseReg: 0x00100920, Count: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100920, Data: 0xCCCCCCCC
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100924, Data: 0xCCCDCCCC
[drm] nouveau 0000:01:00.0: 0xD6F8: [ (0x5B) - INIT_SUB_DIRECT ]
[drm] nouveau 0000:01:00.0: 0xD6F8: Executing subroutine at 0xD755
[drm] nouveau 0000:01:00.0: 0xD755: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD755: Reg: 0x00100930, RegIncrement: 0x04, =
Count: 0x02, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100930, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100934, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xD79C: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: 0xD6F8: End of 0xD755 subroutine
[drm] nouveau 0000:01:00.0: 0xD6FB: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100910, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xD704: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD704: Reg: 0x00100914, RegIncrement: 0x04, =
Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100914, Data: 0x10000111
[drm] nouveau 0000:01:00.0: 0xD72B: [ (0x58) - INIT_ZM_REG_SEQUENCE ]
[drm] nouveau 0000:01:00.0: 0xD72B: BaseReg: 0x00100080, Count: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100080, Data: 0xF0000020
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100084, Data: 0x0000001D
[drm] nouveau 0000:01:00.0: 0xD739: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100090, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xD742: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001000A0, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xD74B: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001000F0, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xD754: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset 0xDB8B
[drm] nouveau 0000:01:00.0: 0xDB8B: ------ Executing following commands -=
-----
[drm] nouveau 0000:01:00.0: 0xDB8B: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00680D38, Data: 0x80000000
[drm] nouveau 0000:01:00.0: 0xDB94: [ (0x4B) - INIT_PLL2 ]
[drm] nouveau 0000:01:00.0: 0xDB94: Reg: 0x680508, Freq: 36000kHz
[drm] nouveau 0000:01:00.0: Loading PLL limits for reg 0x00000000
[drm] nouveau 0000:01:00.0: pll.vco1.minfreq: 100000
[drm] nouveau 0000:01:00.0: pll.vco1.maxfreq: 300000
[drm] nouveau 0000:01:00.0: pll.vco1.min_inputfreq: 2000
[drm] nouveau 0000:01:00.0: pll.vco1.max_inputfreq: 27000
[drm] nouveau 0000:01:00.0: pll.vco1.min_n: 8
[drm] nouveau 0000:01:00.0: pll.vco1.max_n: 255
[drm] nouveau 0000:01:00.0: pll.vco1.min_m: 1
[drm] nouveau 0000:01:00.0: pll.vco1.max_m: 255
[drm] nouveau 0000:01:00.0: pll.vco2.minfreq: 500000
[drm] nouveau 0000:01:00.0: pll.vco2.maxfreq: 1000000
[drm] nouveau 0000:01:00.0: pll.vco2.min_inputfreq: 25000
[drm] nouveau 0000:01:00.0: pll.vco2.max_inputfreq: 75000
[drm] nouveau 0000:01:00.0: pll.vco2.min_n: 8
[drm] nouveau 0000:01:00.0: pll.vco2.max_n: 50
[drm] nouveau 0000:01:00.0: pll.vco2.min_m: 1
[drm] nouveau 0000:01:00.0: pll.vco2.max_m: 255
[drm] nouveau 0000:01:00.0: pll.max_log2p: 7
[drm] nouveau 0000:01:00.0: pll.log2p_bias: 0
[drm] nouveau 0000:01:00.0: pll.refclk: 27000
[drm] nouveau 0000:01:00.0: 0xDB9D: [ (0x58) - INIT_ZM_REG_SEQUENCE ]
[drm] nouveau 0000:01:00.0: 0xDB9D: BaseReg: 0x00001088, Count: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001088, Data: 0x000011F0
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0000108C, Data: 0x000000D0
[drm] nouveau 0000:01:00.0: 0xDBAB: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDBAB: Reg: 0x00001518, Mask: 0xFFFFFFFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00001518, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001518, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xDBB8: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDBB8: Reg: 0x00001530, Mask: 0xFFFFFFFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00001530, Data: 0x800503FF
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001530, Data: 0x800503FF
[drm] nouveau 0000:01:00.0: 0xDBC5: [ (0x52) - INIT_CR ]
[drm] nouveau 0000:01:00.0: 0xDBC5: Index: 0x2B, Mask: 0x20, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x2B,=
 Head: 0x00, Data: 0x20
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x2B,=
 Head: 0x00, Data: 0x20
[drm] nouveau 0000:01:00.0: 0xDBC9: [ (0x54) - INIT_ZM_CR_GROUP ]
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x38,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x1A,=
 Head: 0x00, Data: 0x3F
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x28,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x33,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x21,=
 Head: 0x00, Data: 0xFA
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x43,=
 Head: 0x00, Data: 0x01
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x52,=
 Head: 0x00, Data: 0x04
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x53,=
 Head: 0x00, Data: 0x40
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x2C,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x3A,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x3B,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x4A,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x4B,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x4C,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 0xDBE7: [ (0x51) - INIT_CR_INDEX_ADDRESS_LATC=
HED ]
[drm] nouveau 0000:01:00.0: 0xDBE7: Index1: 0x57, Index2: 0x58, BaseAddr:=
 0x00, Count: 0x10
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x04
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x7F
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x01
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x02
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x03
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x04
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x05
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x06
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x07
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x08
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x09
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x0A
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x0B
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x0C
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x0D
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x0E
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x0F
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x04
[drm] nouveau 0000:01:00.0: 0xDBFC: [ (0x78) - INIT_INDEX_IO ]
[drm] nouveau 0000:01:00.0: 0xDBFC: Port: 0x03D4, Index: 0x85, Mask: 0x00=
, Data: 0xFF
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x85,=
 Head: 0x00, Data: 0xFF
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x85,=
 Head: 0x00, Data: 0xFF
[drm] nouveau 0000:01:00.0: 0xDC02: [ (0x78) - INIT_INDEX_IO ]
[drm] nouveau 0000:01:00.0: 0xDC02: Port: 0x03D4, Index: 0x86, Mask: 0x00=
, Data: 0x01
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x86,=
 Head: 0x00, Data: 0x01
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x86,=
 Head: 0x00, Data: 0x01
[drm] nouveau 0000:01:00.0: 0xDC08: [ (0x53) - INIT_ZM_CR ]
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x44,=
 Head: 0x00, Data: 0x03
[drm] nouveau 0000:01:00.0: 0xDC0B: [ (0x52) - INIT_CR ]
[drm] nouveau 0000:01:00.0: 0xDC0B: Index: 0x2B, Mask: 0x10, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x2B,=
 Head: 0x01, Data: 0x10
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x2B,=
 Head: 0x01, Data: 0x10
[drm] nouveau 0000:01:00.0: 0xDC0F: [ (0x54) - INIT_ZM_CR_GROUP ]
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x33,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x21,=
 Head: 0x01, Data: 0xFA
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x43,=
 Head: 0x01, Data: 0x01
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x2C,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x3A,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x3B,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x3C,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x4A,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x4B,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x4C,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 0xDC25: [ (0x51) - INIT_CR_INDEX_ADDRESS_LATC=
HED ]
[drm] nouveau 0000:01:00.0: 0xDC25: Index1: 0x57, Index2: 0x58, BaseAddr:=
 0x00, Count: 0x10
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x7F
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x01
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x02
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x03
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x04
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x05
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x06
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x07
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x08
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x09
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x0A
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x0B
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x0C
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x0D
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x0E
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x0F
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 0xDC3A: [ (0x78) - INIT_INDEX_IO ]
[drm] nouveau 0000:01:00.0: 0xDC3A: Port: 0x03D4, Index: 0x85, Mask: 0x00=
, Data: 0xFF
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x85,=
 Head: 0x01, Data: 0xFF
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x85,=
 Head: 0x01, Data: 0xFF
[drm] nouveau 0000:01:00.0: 0xDC40: [ (0x78) - INIT_INDEX_IO ]
[drm] nouveau 0000:01:00.0: 0xDC40: Port: 0x03D4, Index: 0x86, Mask: 0x00=
, Data: 0x01
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x86,=
 Head: 0x01, Data: 0x01
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x86,=
 Head: 0x01, Data: 0x01
[drm] nouveau 0000:01:00.0: 0xDC46: [ (0x53) - INIT_ZM_CR ]
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x44,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 0xDC49: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDC49: Reg: 0x00001584, Mask: 0xFFF00000, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00001584, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001584, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xDC56: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100210, Data: 0x80000000
[drm] nouveau 0000:01:00.0: 0xDC5F: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDC5F: Reg: 0x0068052C, Mask: 0xFFFFFEFF, Da=
ta: 0x00000001
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x0068052C, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0068052C, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xDC6C: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDC6C: Reg: 0x0068252C, Mask: 0xFFFFFFFF, Da=
ta: 0x00000101
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x0068252C, Data: 0x00000100
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0068252C, Data: 0x00000101
[drm] nouveau 0000:01:00.0: 0xDC79: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDC79: Reg: 0x00680848, Mask: 0xFFFFFFFF, Da=
ta: 0x00100000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00680848, Data: 0x15100011
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00680848, Data: 0x15100011
[drm] nouveau 0000:01:00.0: 0xDC86: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDC86: Reg: 0x00682848, Mask: 0xFFFFFFFF, Da=
ta: 0x00100000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00682848, Data: 0x15100011
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00682848, Data: 0x15100011
[drm] nouveau 0000:01:00.0: 0xDC93: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDC93: Reg: 0x00680880, Mask: 0xFFFBFFFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00680880, Data: 0x01101191
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00680880, Data: 0x01101191
[drm] nouveau 0000:01:00.0: 0xDCA0: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDCA0: Reg: 0x00682880, Mask: 0xDFFBFFFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00682880, Data: 0x01101111
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00682880, Data: 0x01101111
[drm] nouveau 0000:01:00.0: 0xDCAD: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001200, Data: 0x0003103C
[drm] nouveau 0000:01:00.0: 0xDCB6: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset 0xDD0F
[drm] nouveau 0000:01:00.0: 0xDD0F: ------ Executing following commands -=
-----
[drm] nouveau 0000:01:00.0: 0xDD0F: [ (0x5B) - INIT_SUB_DIRECT ]
[drm] nouveau 0000:01:00.0: 0xDD0F: Executing subroutine at 0x28B2
[drm] nouveau 0000:01:00.0: 0x28B2: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: 0xDD0F: End of 0x28B2 subroutine
[drm] nouveau 0000:01:00.0: 0xDD12: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xDD12: Reg: 0x001002C0, RegIncrement: 0x04, =
Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C0, Data: 0x00000B52
[drm] nouveau 0000:01:00.0: 0xDD39: [ (0x90) - INIT_COPY_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C0, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C8, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 0xDD42: [ (0x74) - INIT_TIME ]
[drm] nouveau 0000:01:00.0: 0xDD42: Sleeping for 0x03E8 microseconds
[drm] nouveau 0000:01:00.0: 0xDD45: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xDD45: Macro: 0x00, MacroTableIndex: 0x00, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D4, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xDD47: [ (0x33) - INIT_REPEAT ]
[drm] nouveau 0000:01:00.0: 0xDD47: Repeating following segment 10 times
[drm] nouveau 0000:01:00.0: 0xDD49: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xDD49: Macro: 0x02, MacroTableIndex: 0x02, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D0, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xDD4B: [ (0x36) - INIT_END_REPEAT ]
[drm] nouveau 0000:01:00.0: 0xDD49: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xDD49: Macro: 0x02, MacroTableIndex: 0x02, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D0, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xDD4B: [ (0x36) - INIT_END_REPEAT ]
[drm] nouveau 0000:01:00.0: 0xDD49: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xDD49: Macro: 0x02, MacroTableIndex: 0x02, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D0, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xDD4B: [ (0x36) - INIT_END_REPEAT ]
[drm] nouveau 0000:01:00.0: 0xDD49: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xDD49: Macro: 0x02, MacroTableIndex: 0x02, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D0, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xDD4B: [ (0x36) - INIT_END_REPEAT ]
[drm] nouveau 0000:01:00.0: 0xDD49: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xDD49: Macro: 0x02, MacroTableIndex: 0x02, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D0, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xDD4B: [ (0x36) - INIT_END_REPEAT ]
[drm] nouveau 0000:01:00.0: 0xDD49: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xDD49: Macro: 0x02, MacroTableIndex: 0x02, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D0, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xDD4B: [ (0x36) - INIT_END_REPEAT ]
[drm] nouveau 0000:01:00.0: 0xDD49: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xDD49: Macro: 0x02, MacroTableIndex: 0x02, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D0, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xDD4B: [ (0x36) - INIT_END_REPEAT ]
[drm] nouveau 0000:01:00.0: 0xDD49: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xDD49: Macro: 0x02, MacroTableIndex: 0x02, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D0, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xDD4B: [ (0x36) - INIT_END_REPEAT ]
[drm] nouveau 0000:01:00.0: 0xDD49: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xDD49: Macro: 0x02, MacroTableIndex: 0x02, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D0, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xDD4B: [ (0x36) - INIT_END_REPEAT ]
[drm] nouveau 0000:01:00.0: 0xDD49: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xDD49: Macro: 0x02, MacroTableIndex: 0x02, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D0, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xDD4B: [ (0x36) - INIT_END_REPEAT ]
[drm] nouveau 0000:01:00.0: 0xDD4C: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDD4C: Reg: 0x001002C0, Mask: 0xFFFFFEFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C0, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C0, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 0xDD59: [ (0x90) - INIT_COPY_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C0, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C8, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 0xDD62: [ (0x74) - INIT_TIME ]
[drm] nouveau 0000:01:00.0: 0xDD62: Sleeping for 0x0064 microseconds
[drm] nouveau 0000:01:00.0: 0xDD65: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xDD65: Macro: 0x04, MacroTableIndex: 0x04, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002DC, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xDD67: [ (0x6B) - INIT_SUB ]
[drm] nouveau 0000:01:00.0: 0xDD67: Calling script 7
[drm] nouveau 0000:01:00.0: 0xDCE3: [ (0x4A) - INIT_IO_RESTRICT_PLL2 ]
[drm] nouveau 0000:01:00.0: 0xDCE3: Port: 0x03D4, Index: 0x3C, Mask: 0x70=
, Shift: 0x04, Count: 0x08, Reg: 0x00004024
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x3C,=
 Head: 0x00, Data: 0x20
[drm] nouveau 0000:01:00.0: 0xDCE3: Reg: 0x00004024, Config: 0x02, Freq: =
270000kHz
[drm] nouveau 0000:01:00.0: Loading PLL limits for reg 0x00004020
[drm] nouveau 0000:01:00.0: pll.vco1.minfreq: 400000
[drm] nouveau 0000:01:00.0: pll.vco1.maxfreq: 800000
[drm] nouveau 0000:01:00.0: pll.vco1.min_inputfreq: 5000
[drm] nouveau 0000:01:00.0: pll.vco1.max_inputfreq: 75000
[drm] nouveau 0000:01:00.0: pll.vco1.min_n: 8
[drm] nouveau 0000:01:00.0: pll.vco1.max_n: 255
[drm] nouveau 0000:01:00.0: pll.vco1.min_m: 1
[drm] nouveau 0000:01:00.0: pll.vco1.max_m: 255
[drm] nouveau 0000:01:00.0: pll.vco2.minfreq: 400000
[drm] nouveau 0000:01:00.0: pll.vco2.maxfreq: 800000
[drm] nouveau 0000:01:00.0: pll.vco2.min_inputfreq: 0
[drm] nouveau 0000:01:00.0: pll.vco2.max_inputfreq: 800000
[drm] nouveau 0000:01:00.0: pll.vco2.min_n: 1
[drm] nouveau 0000:01:00.0: pll.vco2.max_n: 1
[drm] nouveau 0000:01:00.0: pll.vco2.min_m: 1
[drm] nouveau 0000:01:00.0: pll.vco2.max_m: 1
[drm] nouveau 0000:01:00.0: pll.max_log2p: 7
[drm] nouveau 0000:01:00.0: pll.log2p_bias: 3
[drm] nouveau 0000:01:00.0: pll.refclk: 27000
[drm] nouveau 0000:01:00.0: 0xDD0E: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: 0xDD67: End of script 7
[drm] nouveau 0000:01:00.0: 0xDD69: [ (0x74) - INIT_TIME ]
[drm] nouveau 0000:01:00.0: 0xDD69: Sleeping for 0x03E8 microseconds
[drm] nouveau 0000:01:00.0: 0xDD6C: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xDD6C: Macro: 0x05, MacroTableIndex: 0x05, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002DC, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xDD6E: [ (0x6B) - INIT_SUB ]
[drm] nouveau 0000:01:00.0: 0xDD6E: Calling script 8
[drm] nouveau 0000:01:00.0: 0x5BE8: [ (0x78) - INIT_INDEX_IO ]
[drm] nouveau 0000:01:00.0: 0x5BE8: Port: 0x03D4, Index: 0x44, Mask: 0x00=
, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x44,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x44,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 0x5BEE: [ (0x39) - INIT_IO_FLAG_CONDITION ]
[drm] nouveau 0000:01:00.0: 0x5BEE: Port: 0x03D4, Index: 0x3C, Mask: 0x70=
, Shift: 0x04, FlagArray: 0x58DC, FAMask: 0x20, Cmpval: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x3C,=
 Head: 0x00, Data: 0x20
[drm] nouveau 0000:01:00.0: 0x5BEE: Checking if 0x00 equals 0x00
[drm] nouveau 0000:01:00.0: 0x5BEE: Condition fulfilled -- continuing to =
execute
[drm] nouveau 0000:01:00.0: 0x5BF0: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0x5BF0: Reg: 0x001002C8, Mask: 0xFFFFFEFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C8, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C8, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 0x5BFD: [ (0x90) - INIT_COPY_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C8, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C0, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 0x5C06: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0x5C06: Reg: 0x001002C8, Mask: 0xFFFFFFFF, Da=
ta: 0x00000100
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C8, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C8, Data: 0x00000B52
[drm] nouveau 0000:01:00.0: 0x5C13: [ (0x90) - INIT_COPY_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C8, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C0, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 0x5C1C: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0x5C1C: Reg: 0x001002C8, Mask: 0xFFFFFEFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C8, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C8, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 0x5C29: [ (0x90) - INIT_COPY_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C8, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C0, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 0x5C32: [ (0x72) - INIT_RESUME ]
[drm] nouveau 0000:01:00.0: 0x5C33: [ (0x39) - INIT_IO_FLAG_CONDITION ]
[drm] nouveau 0000:01:00.0: 0x5C33: Port: 0x03D4, Index: 0x3C, Mask: 0x70=
, Shift: 0x04, FlagArray: 0x58DC, FAMask: 0x2F, Cmpval: 0x03
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x3C,=
 Head: 0x00, Data: 0x20
[drm] nouveau 0000:01:00.0: 0x5C33: Checking if 0x02 equals 0x03
[drm] nouveau 0000:01:00.0: 0x5C33: Condition not fulfilled -- skipping f=
ollowing commands
[drm] nouveau 0000:01:00.0: 0x5C35: [ (0x74) - INIT_TIME ]
[drm] nouveau 0000:01:00.0: 0x5C38: [ (0x72) - INIT_RESUME ]
[drm] nouveau 0000:01:00.0: 0x5C38: ---- Executing following commands ---=
-
[drm] nouveau 0000:01:00.0: 0x5C39: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: 0xDD6E: End of script 8
[drm] nouveau 0000:01:00.0: 0xDD70: [ (0x74) - INIT_TIME ]
[drm] nouveau 0000:01:00.0: 0xDD70: Sleeping for 0x03E8 microseconds
[drm] nouveau 0000:01:00.0: 0xDD73: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xDD73: Reg: 0x001004E0, RegIncrement: 0x04, =
Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001004E0, Data: 0x8030010B
[drm] nouveau 0000:01:00.0: 0xDD9A: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDD9A: Reg: 0x00100200, Mask: 0xFFFFFFFF, Da=
ta: 0x10000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00100200, Data: 0x53003071
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100200, Data: 0x53003071
[drm] nouveau 0000:01:00.0: 0xDDA7: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100210, Data: 0x80000001
[drm] nouveau 0000:01:00.0: 0xDDB0: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xDDB0: Reg: 0x001002C4, RegIncrement: 0x04, =
Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C4, Data: 0x00100386
[drm] nouveau 0000:01:00.0: 0xDDD7: [ (0x90) - INIT_COPY_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C4, Data: 0x00100006
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002CC, Data: 0x00100006
[drm] nouveau 0000:01:00.0: 0xDDE0: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xDDE0: Reg: 0x001002C4, RegIncrement: 0x04, =
Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C4, Data: 0x00100006
[drm] nouveau 0000:01:00.0: 0xDE07: [ (0x90) - INIT_COPY_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C4, Data: 0x00100006
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002CC, Data: 0x00100006
[drm] nouveau 0000:01:00.0: 0xDE10: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0070FFF0, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xDE19: [ (0x63) - INIT_COMPUTE_MEM ]
[drm] nouveau 0000:01:00.0: 0xDE1A: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDE1A: Reg: 0x00100200, Mask: 0xFFFFFFFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00100200, Data: 0x53003071
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100200, Data: 0x53003071
[drm] nouveau 0000:01:00.0: 0xDE27: [ (0x78) - INIT_INDEX_IO ]
[drm] nouveau 0000:01:00.0: 0xDE27: Port: 0x03C4, Index: 0x01, Mask: 0xDF=
, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03C4, Index: 0x01,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03C4, Index: 0x01,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 0xDE2D: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDE2D: Reg: 0x0000C040, Mask: 0xFFF3FC00, Da=
ta: 0x000803FF
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x0000C040, Data: 0x3C0B07FF
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0000C040, Data: 0x3C0B07FF
[drm] nouveau 0000:01:00.0: 0xDE3A: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDE3A: Reg: 0x00088138, Mask: 0xBFFFFC01, Da=
ta: 0x00000100
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00088138, Data: 0x00000100
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00088138, Data: 0x00000100
[drm] nouveau 0000:01:00.0: 0xDE47: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDE47: Reg: 0x0008813C, Mask: 0xF0FFFFFF, Da=
ta: 0x07000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x0008813C, Data: 0x07000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0008813C, Data: 0x07000000
[drm] nouveau 0000:01:00.0: 0xDE54: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDE54: Reg: 0x00011014, Mask: 0xFFFF7FFF, Da=
ta: 0x00008000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00011014, Data: 0x0000B6C8
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00011014, Data: 0x0000B6C8
[drm] nouveau 0000:01:00.0: 0xDE61: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00680524, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xDE6A: [ (0x5B) - INIT_SUB_DIRECT ]
[drm] nouveau 0000:01:00.0: 0xDE6A: Executing subroutine at 0xC28A
[drm] nouveau 0000:01:00.0: 0xC28A: [ (0x50) - INIT_ZM_TMDS_GROUP ]
[drm] nouveau 0000:01:00.0: 0xC28A: MagicLookupValue: 0x00, Count: 0x03
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x00000043
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x000000FE
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x00000033
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x000000FB
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x0000002F
[drm] nouveau 0000:01:00.0: 0xC293: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: 0xDE6A: End of 0xC28A subroutine
[drm] nouveau 0000:01:00.0: 0xDE6D: [ (0x5B) - INIT_SUB_DIRECT ]
[drm] nouveau 0000:01:00.0: 0xDE6D: Executing subroutine at 0xC294
[drm] nouveau 0000:01:00.0: 0xC294: [ (0x50) - INIT_ZM_TMDS_GROUP ]
[drm] nouveau 0000:01:00.0: 0xC294: MagicLookupValue: 0x02, Count: 0x03
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006828B4, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006828B0, Data: 0x00000043
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006828B4, Data: 0x000000FE
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006828B0, Data: 0x00000033
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006828B4, Data: 0x000000FB
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006828B0, Data: 0x0000002F
[drm] nouveau 0000:01:00.0: 0xC29D: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: 0xDE6D: End of 0xC294 subroutine
[drm] nouveau 0000:01:00.0: 0xDE70: [ (0x75) - INIT_CONDITION ]
[drm] nouveau 0000:01:00.0: 0xDE70: Condition: 0x03
[drm] nouveau 0000:01:00.0: 0xDE70: Cond: 0x03, Reg: 0x00000000, Mask: 0x=
000000FF
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00000000, Data: 0x04B200B1
[drm] nouveau 0000:01:00.0: 0xDE70: Checking if 0x000000B1 equals 0x00000=
0A1
[drm] nouveau 0000:01:00.0: 0xDE70: Condition not fulfilled -- skipping f=
ollowing commands
[drm] nouveau 0000:01:00.0: 0xDE72: [ (0x38) - INIT_NOT ]
[drm] nouveau 0000:01:00.0: 0xDE72: ------ Executing following commands -=
-----
[drm] nouveau 0000:01:00.0: 0xDE73: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDE73: Reg: 0x00100360, Mask: 0xFF00FFFF, Da=
ta: 0x00300000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00100360, Data: 0x8B303A98
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100360, Data: 0x8B303A98
[drm] nouveau 0000:01:00.0: 0xDE80: [ (0x72) - INIT_RESUME ]
[drm] nouveau 0000:01:00.0: 0xDE81: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset 0xDF1B
[drm] nouveau 0000:01:00.0: 0xDF1B: ------ Executing following commands -=
-----
[drm] nouveau 0000:01:00.0: 0xDF1B: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: Detected 512MiB VRAM
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_early_init:280 -=20
[drm] nouveau 0000:01:00.0: nv04_instmem_determine_amount:49 - RAMIN size=
: 2048KiB
[drm] nouveau 0000:01:00.0: nv04_instmem_configure_fixed_tables:71 - RAMH=
T offset=3D0x10000, size=3D4096
[drm] nouveau 0000:01:00.0: nv04_instmem_configure_fixed_tables:77 - RAMR=
O offset=3D0x11200, size=3D512
[drm] nouveau 0000:01:00.0: nv04_instmem_configure_fixed_tables:100 - RAM=
FC offset=3D0x20000, size=3D4096
[TTM] Zone  kernel: Available graphics memory: 446486 kiB.
[TTM] Zone highmem: Available graphics memory: 516058 kiB.
[TTM] Initializing pool allocator.
agpgart-intel 0000:00:00.0: AGP 1.0 bridge
agpgart-intel 0000:00:00.0: putting AGP V2 device into 2x mode
nouveau 0000:01:00.0: putting AGP V2 device into 2x mode
[drm] nouveau 0000:01:00.0: 64 MiB GART (aperture)
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_init:293 -=20
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new_fake:562 - p_offset=3D0x00=
010000 b_offset=3D0xffffffff size=3D0x00001000 flags=3D0x00000003
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new_fake:567 - gpuobj f675c600
[drm] nouveau 0000:01:00.0: nv04_display_create:122 -=20
[drm] nouveau 0000:01:00.0: Saving VGA fonts
[drm] nouveau 0000:01:00.0: nouveau_connector_create:737 -=20
[drm] nouveau 0000:01:00.0: nouveau_connector_create:737 -=20
[drm] nouveau 0000:01:00.0: nouveau_connector_create:737 -=20
[drm] nouveau 0000:01:00.0: nouveau_connector_create:737 -=20
[drm] nouveau 0000:01:00.0: Loading PLL limits for reg 0x00000000
[drm] nouveau 0000:01:00.0: pll.vco1.minfreq: 100000
[drm] nouveau 0000:01:00.0: pll.vco1.maxfreq: 300000
[drm] nouveau 0000:01:00.0: pll.vco1.min_inputfreq: 2000
[drm] nouveau 0000:01:00.0: pll.vco1.max_inputfreq: 27000
[drm] nouveau 0000:01:00.0: pll.vco1.min_n: 8
[drm] nouveau 0000:01:00.0: pll.vco1.max_n: 255
[drm] nouveau 0000:01:00.0: pll.vco1.min_m: 1
[drm] nouveau 0000:01:00.0: pll.vco1.max_m: 255
[drm] nouveau 0000:01:00.0: pll.vco2.minfreq: 500000
[drm] nouveau 0000:01:00.0: pll.vco2.maxfreq: 1000000
[drm] nouveau 0000:01:00.0: pll.vco2.min_inputfreq: 25000
[drm] nouveau 0000:01:00.0: pll.vco2.max_inputfreq: 75000
[drm] nouveau 0000:01:00.0: pll.vco2.min_n: 8
[drm] nouveau 0000:01:00.0: pll.vco2.max_n: 50
[drm] nouveau 0000:01:00.0: pll.vco2.min_m: 1
[drm] nouveau 0000:01:00.0: pll.vco2.max_m: 255
[drm] nouveau 0000:01:00.0: pll.max_log2p: 7
[drm] nouveau 0000:01:00.0: pll.log2p_bias: 0
[drm] nouveau 0000:01:00.0: pll.refclk: 27000
[drm] nouveau 0000:01:00.0: Loading PLL limits for reg 0x00000000
[drm] nouveau 0000:01:00.0: pll.vco1.minfreq: 100000
[drm] nouveau 0000:01:00.0: pll.vco1.maxfreq: 300000
[drm] nouveau 0000:01:00.0: pll.vco1.min_inputfreq: 2000
[drm] nouveau 0000:01:00.0: pll.vco1.max_inputfreq: 27000
[drm] nouveau 0000:01:00.0: pll.vco1.min_n: 8
[drm] nouveau 0000:01:00.0: pll.vco1.max_n: 255
[drm] nouveau 0000:01:00.0: pll.vco1.min_m: 1
[drm] nouveau 0000:01:00.0: pll.vco1.max_m: 255
[drm] nouveau 0000:01:00.0: pll.vco2.minfreq: 500000
[drm] nouveau 0000:01:00.0: pll.vco2.maxfreq: 1000000
[drm] nouveau 0000:01:00.0: pll.vco2.min_inputfreq: 25000
[drm] nouveau 0000:01:00.0: pll.vco2.max_inputfreq: 75000
[drm] nouveau 0000:01:00.0: pll.vco2.min_n: 8
[drm] nouveau 0000:01:00.0: pll.vco2.max_n: 50
[drm] nouveau 0000:01:00.0: pll.vco2.min_m: 1
[drm] nouveau 0000:01:00.0: pll.vco2.max_m: 255
[drm] nouveau 0000:01:00.0: pll.max_log2p: 7
[drm] nouveau 0000:01:00.0: pll.log2p_bias: 0
[drm] nouveau 0000:01:00.0: pll.refclk: 27000
[drm] nouveau 0000:01:00.0: Allocating FIFO number 0
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_channel_init:944 - ch0 vram=3D=
0x80000002 tt=3D0x80000003
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_channel_init_pramin:894 - ch0
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:212 - ch-1 size=3D166732 a=
lign=3D4096 flags=3D0x00000000
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:220 - gpuobj f67d83c0
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:235 - global heap
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch-1 h=3D0x00000=
000 gpuobj=3Df67d83c0
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch-1 h=3D0x00000=
000 gpuobj=3Df675c600
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:660 - ch0 class=3D0x00=
3d offset=3D0x0 size=3D0x1fe00000
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:661 - access=3D0 targe=
t=3D0
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:212 - ch0 size=3D32 align=3D=
16 flags=3D0x00000006
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:220 - gpuobj f67d8480
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:232 - channel heap
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch0 h=3D0x800000=
02 gpuobj=3Df67d8480
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 - ch0 handle=3D0=
x80000002
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 - hash=3D0x00000=
090
[drm] nouveau 0000:01:00.0: nouveau_ramht_insert:140 - insert ch0 0x00000=
090: h=3D0x80000002, c=3D0x00004000
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:660 - ch0 class=3D0x00=
3d offset=3D0x0 size=3D0x4000000
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:661 - access=3D0 targe=
t=3D3
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:212 - ch0 size=3D32 align=3D=
16 flags=3D0x00000006
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:220 - gpuobj f67d8500
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:232 - channel heap
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch0 h=3D0x800000=
03 gpuobj=3Df67d8500
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 - ch0 handle=3D0=
x80000003
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 - hash=3D0x00000=
098
[drm] nouveau 0000:01:00.0: nouveau_ramht_insert:140 - insert ch0 0x00000=
098: h=3D0x80000003, c=3D0x00004002
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:660 - ch0 class=3D0x00=
3d offset=3D0x0 size=3D0x4000000
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:661 - access=3D1 targe=
t=3D3
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:212 - ch0 size=3D32 align=3D=
16 flags=3D0x00000006
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:220 - gpuobj f67d8580
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:232 - channel heap
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch0 h=3D0x000000=
00 gpuobj=3Df67d8580
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:212 - ch0 size=3D162636 al=
ign=3D16 flags=3D0x00000002
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:220 - gpuobj f67d8600
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:232 - channel heap
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch-1 h=3D0x00000=
000 gpuobj=3Df67d8600
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new_fake:562 - p_offset=3D0x00=
020000 b_offset=3D0xffffffff size=3D0x00000080 flags=3D0x00000006
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new_fake:567 - gpuobj f67d8680
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch-1 h=3D0x00000=
000 gpuobj=3Df67d8680
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:819 - ch0 class=3D0x003=
9
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:212 - ch0 size=3D32 align=3D=
16 flags=3D0x00000006
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:220 - gpuobj f67d8700
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:232 - channel heap
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch0 h=3D0x800000=
01 gpuobj=3Df67d8700
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 - ch0 handle=3D0=
x80000001
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 - hash=3D0x00000=
088
[drm] nouveau 0000:01:00.0: nouveau_ramht_insert:140 - insert ch0 0x00000=
088: h=3D0x80000001, c=3D0x001067bb
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch0 h=3D0x800000=
0e gpuobj=3Df67d87c0
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 - ch0 handle=3D0=
x8000000e
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 - hash=3D0x00000=
0f0
[drm] nouveau 0000:01:00.0: nouveau_ramht_insert:140 - insert ch0 0x00000=
0f0: h=3D0x8000000e, c=3D0x00000004
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:660 - ch0 class=3D0x00=
3d offset=3D0x10000 size=3D0x20
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:661 - access=3D0 targe=
t=3D3
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:212 - ch0 size=3D32 align=3D=
16 flags=3D0x00000006
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:220 - gpuobj f67d8840
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:232 - channel heap
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch0 h=3D0x800000=
06 gpuobj=3Df67d8840
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 - ch0 handle=3D0=
x80000006
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 - hash=3D0x00000=
0b0
[drm] nouveau 0000:01:00.0: nouveau_ramht_insert:140 - insert ch0 0x00000=
0b0: h=3D0x80000006, c=3D0x000067bd
[drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 0
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:660 - ch0 class=3D0x00=
3d offset=3D0x0 size=3D0x20000000
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:661 - access=3D0 targe=
t=3D0
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:212 - ch0 size=3D32 align=3D=
16 flags=3D0x00000006
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:220 - gpuobj f67d8940
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:232 - channel heap
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch0 h=3D0x800000=
04 gpuobj=3Df67d8940
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 - ch0 handle=3D0=
x80000004
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 - hash=3D0x00000=
0a0
[drm] nouveau 0000:01:00.0: nouveau_ramht_insert:140 - insert ch0 0x00000=
0a0: h=3D0x80000004, c=3D0x000067bf
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:660 - ch0 class=3D0x00=
3d offset=3D0x0 size=3D0x4000000
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:661 - access=3D0 targe=
t=3D3
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:212 - ch0 size=3D32 align=3D=
16 flags=3D0x00000006
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:220 - gpuobj f67d89c0
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:232 - channel heap
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch0 h=3D0x800000=
05 gpuobj=3Df67d89c0
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 - ch0 handle=3D0=
x80000005
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 - hash=3D0x00000=
0a8
[drm] nouveau 0000:01:00.0: nouveau_ramht_insert:140 - insert ch0 0x00000=
0a8: h=3D0x80000005, c=3D0x000067c1
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 1=
)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 2)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on TV encoder (output 3)
[drm] nouveau 0000:01:00.0: nv_crtc_dpms:165 - Setting dpms mode 3 on CRT=
C 0
[drm] nouveau 0000:01:00.0: nv_crtc_dpms:165 - Setting dpms mode 3 on CRT=
C 1
[drm:drm_helper_probe_single_connector_modes], DVI-I-1
[drm] nouveau 0000:01:00.0: nouveau_connector_native_mode:454 - native mo=
de from preferred
[drm:drm_helper_probe_single_connector_modes], Probed modes for DVI-I-1
[drm:drm_mode_debug_printmodeline], Modeline 30:"1280x1024" 60 108000 128=
0 1328 1440 1688 1024 1025 1028 1066 0x48 0x5
[drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 75 108000 1152=
 1216 1344 1600 864 865 868 900 0x40 0x5
[drm:drm_mode_debug_printmodeline], Modeline 38:"1024x768" 75 78800 1024 =
1040 1136 1312 768 769 772 800 0x40 0x5
[drm:drm_mode_debug_printmodeline], Modeline 33:"1024x768" 75 78750 1024 =
1040 1136 1312 768 769 772 800 0x40 0x5
[drm:drm_mode_debug_printmodeline], Modeline 39:"1024x768" 60 65000 1024 =
1048 1184 1344 768 771 777 806 0x40 0xa
[drm:drm_mode_debug_printmodeline], Modeline 40:"832x624" 75 57284 832 86=
4 928 1152 624 625 628 667 0x40 0xa
[drm:drm_mode_debug_printmodeline], Modeline 41:"800x600" 75 49500 800 81=
6 896 1056 600 601 604 625 0x40 0x5
[drm:drm_mode_debug_printmodeline], Modeline 34:"800x600" 60 40000 800 84=
0 968 1056 600 601 605 628 0x40 0x5
[drm:drm_mode_debug_printmodeline], Modeline 35:"640x480" 75 31500 640 65=
6 720 840 480 481 484 500 0x40 0xa
[drm:drm_mode_debug_printmodeline], Modeline 36:"640x480" 60 25200 640 65=
6 752 800 480 490 492 525 0x40 0xa
[drm:drm_mode_debug_printmodeline], Modeline 37:"720x400" 70 28320 720 73=
8 846 900 400 412 414 449 0x40 0x6
[drm:drm_helper_probe_single_connector_modes], VGA-1
[drm:drm_helper_probe_single_connector_modes], VGA-1 is disconnected
[drm:drm_helper_probe_single_connector_modes], TV-1
[drm:drm_helper_probe_single_connector_modes], TV-1 is disconnected
[drm:drm_setup_crtcs],=20
[drm:drm_enable_connectors], connector 7 enabled? yes
[drm:drm_enable_connectors], connector 12 enabled? no
[drm:drm_enable_connectors], connector 14 enabled? no
[drm:drm_target_preferred], looking for cmdline mode on connector 7
[drm:drm_target_preferred], looking for preferred mode on connector 7
[drm:drm_target_preferred], found mode 1280x1024
[drm:drm_setup_crtcs], picking CRTCs for 4096x4096 config
[drm:drm_setup_crtcs], desired mode 1280x1024 set on crtc 5
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:819 - ch0 class=3D0x006=
2
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:212 - ch0 size=3D32 align=3D=
16 flags=3D0x00000006
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:220 - gpuobj f66ec1c0
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:232 - channel heap
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch0 h=3D0x800000=
08 gpuobj=3Df66ec1c0
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 - ch0 handle=3D0=
x80000008
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 - hash=3D0x00000=
0c0
[drm] nouveau 0000:01:00.0: nouveau_ramht_insert:140 - insert ch0 0x00000=
0c0: h=3D0x80000008, c=3D0x001067c3
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:819 - ch0 class=3D0x001=
9
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:212 - ch0 size=3D32 align=3D=
16 flags=3D0x00000006
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:220 - gpuobj f66ec000
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:232 - channel heap
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch0 h=3D0x800000=
0b gpuobj=3Df66ec000
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 - ch0 handle=3D0=
x8000000b
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 - hash=3D0x00000=
0d8
[drm] nouveau 0000:01:00.0: nouveau_ramht_insert:140 - insert ch0 0x00000=
0d8: h=3D0x8000000b, c=3D0x001067c5
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:819 - ch0 class=3D0x004=
3
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:212 - ch0 size=3D32 align=3D=
16 flags=3D0x00000006
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:220 - gpuobj f66ec880
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:232 - channel heap
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch0 h=3D0x800000=
09 gpuobj=3Df66ec880
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 - ch0 handle=3D0=
x80000009
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 - hash=3D0x00000=
0c8
[drm] nouveau 0000:01:00.0: nouveau_ramht_insert:140 - insert ch0 0x00000=
0c8: h=3D0x80000009, c=3D0x001067c7
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:819 - ch0 class=3D0x004=
4
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:212 - ch0 size=3D32 align=3D=
16 flags=3D0x00000006
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:220 - gpuobj f66ec680
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:232 - channel heap
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch0 h=3D0x800000=
0a gpuobj=3Df66ec680
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 - ch0 handle=3D0=
x8000000a
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 - hash=3D0x00000=
0d0
[drm] nouveau 0000:01:00.0: nouveau_ramht_insert:140 - insert ch0 0x00000=
0d0: h=3D0x8000000a, c=3D0x001067c9
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:819 - ch0 class=3D0x004=
a
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:212 - ch0 size=3D32 align=3D=
16 flags=3D0x00000006
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:220 - gpuobj f66ec940
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:232 - channel heap
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch0 h=3D0x800000=
0c gpuobj=3Df66ec940
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 - ch0 handle=3D0=
x8000000c
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 - hash=3D0x00000=
0e0
[drm] nouveau 0000:01:00.0: nouveau_ramht_insert:140 - insert ch0 0x00000=
0e0: h=3D0x8000000c, c=3D0x001067cb
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:819 - ch0 class=3D0x009=
f
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:212 - ch0 size=3D32 align=3D=
16 flags=3D0x00000006
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:220 - gpuobj f66ecf40
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:232 - channel heap
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch0 h=3D0x800000=
0d gpuobj=3Df66ecf40
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 - ch0 handle=3D0=
x8000000d
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 - hash=3D0x00000=
0e8
[drm] nouveau 0000:01:00.0: nouveau_ramht_insert:140 - insert ch0 0x00000=
0e8: h=3D0x8000000d, c=3D0x001067cd
[drm] nouveau 0000:01:00.0: allocated 1280x1024 fb: 0x48000, bo f66ca000
[drm:drm_crtc_helper_set_config],=20
[drm:drm_crtc_helper_set_config], crtc: f64ab000 5 fb: f658bb78 connector=
s: f6ad0d30 num_connectors: 1 (x, y) (0, 0)
[drm:drm_crtc_helper_set_config], crtc has no fb, full mode set
[drm:drm_crtc_helper_set_config], modes are different, full mode set
[drm:drm_mode_debug_printmodeline], Modeline 0:"" 0 0 0 0 0 0 0 0 0 0 0x0=
 0x0
[drm:drm_mode_debug_printmodeline], Modeline 31:"1280x1024" 60 108000 128=
0 1328 1440 1688 1024 1025 1028 1066 0x48 0x5
[drm:drm_crtc_helper_set_config], encoder changed, full mode switch
[drm:drm_crtc_helper_set_config], crtc changed, full mode switch
[drm:drm_crtc_helper_set_config], setting connector 7 crtc to f64ab000
[drm:drm_crtc_helper_set_config], attempting to set mode from userspace
[drm:drm_mode_debug_printmodeline], Modeline 31:"1280x1024" 60 108000 128=
0 1328 1440 1688 1024 1025 1028 1066 0x48 0x5
[drm] nouveau 0000:01:00.0: nv_crtc_dpms:165 - Setting dpms mode 3 on CRT=
C 0
[drm] nouveau 0000:01:00.0: nv_crtc_mode_set:614 - CTRC mode on CRTC 0:
[drm:drm_mode_debug_printmodeline], Modeline 44:"1280x1024" 60 108000 128=
0 1328 1440 1688 1024 1025 1028 1066 0x48 0x5
[drm] nouveau 0000:01:00.0: Loading PLL limits for reg 0x00000000
[drm] nouveau 0000:01:00.0: pll.vco1.minfreq: 100000
[drm] nouveau 0000:01:00.0: pll.vco1.maxfreq: 300000
[drm] nouveau 0000:01:00.0: pll.vco1.min_inputfreq: 2000
[drm] nouveau 0000:01:00.0: pll.vco1.max_inputfreq: 27000
[drm] nouveau 0000:01:00.0: pll.vco1.min_n: 8
[drm] nouveau 0000:01:00.0: pll.vco1.max_n: 255
[drm] nouveau 0000:01:00.0: pll.vco1.min_m: 1
[drm] nouveau 0000:01:00.0: pll.vco1.max_m: 255
[drm] nouveau 0000:01:00.0: pll.vco2.minfreq: 500000
[drm] nouveau 0000:01:00.0: pll.vco2.maxfreq: 1000000
[drm] nouveau 0000:01:00.0: pll.vco2.min_inputfreq: 25000
[drm] nouveau 0000:01:00.0: pll.vco2.max_inputfreq: 75000
[drm] nouveau 0000:01:00.0: pll.vco2.min_n: 8
[drm] nouveau 0000:01:00.0: pll.vco2.max_n: 50
[drm] nouveau 0000:01:00.0: pll.vco2.min_m: 1
[drm] nouveau 0000:01:00.0: pll.vco2.max_m: 255
[drm] nouveau 0000:01:00.0: pll.max_log2p: 7
[drm] nouveau 0000:01:00.0: pll.log2p_bias: 0
[drm] nouveau 0000:01:00.0: pll.refclk: 27000
[drm] nouveau 0000:01:00.0: nv_crtc_calc_state_ext:150 - vpll: n 8 m 2 lo=
g2p 0
[drm] nouveau 0000:01:00.0: nv04_dfp_mode_set:296 - Output mode on CRTC 0=
:
[drm:drm_mode_debug_printmodeline], Modeline 43:"1280x1024" 0 108000 1280=
 1328 1440 1688 1024 1025 1028 1066 0x48 0x5
[drm] nouveau 0000:01:00.0: nv_crtc_dpms:165 - Setting dpms mode 0 on CRT=
C 0
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00680524, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xC210: Parsing digital output script table
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x44,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 0xC210: [ (0x5B) - INIT_SUB_DIRECT ]
[drm] nouveau 0000:01:00.0: 0xC210: Executing subroutine at 0xC22C
[drm] nouveau 0000:01:00.0: 0xC22C: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xC22C: Reg: 0x00680880, Mask: 0xDFFFFFFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00680880, Data: 0x01101191
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00680880, Data: 0x01101191
[drm] nouveau 0000:01:00.0: 0xC239: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: 0xC210: End of 0xC22C subroutine
[drm] nouveau 0000:01:00.0: 0xC213: [ (0x5B) - INIT_SUB_DIRECT ]
[drm] nouveau 0000:01:00.0: 0xC213: Executing subroutine at 0x8CF1
[drm] nouveau 0000:01:00.0: 0x8CF1: [ (0x5B) - INIT_SUB_DIRECT ]
[drm] nouveau 0000:01:00.0: 0x8CF1: Executing subroutine at 0x8D1A
[drm] nouveau 0000:01:00.0: 0x8D1A: [ (0x50) - INIT_ZM_TMDS_GROUP ]
[drm] nouveau 0000:01:00.0: 0x8D1A: MagicLookupValue: 0x80, Count: 0x0F
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x000000F1
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000090
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x00000002
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x00000029
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000005
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x0000002E
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000030
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x00000040
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000008
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x00000041
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x00000043
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000080
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x00000004
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000068
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x00000005
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x0000002F
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x00000030
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x00000031
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x00000032
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x00000033
[drm] nouveau 0000:01:00.0: 0x8D3B: [ (0x50) - INIT_ZM_TMDS_GROUP ]
[drm] nouveau 0000:01:00.0: 0x8D3B: MagicLookupValue: 0x81, Count: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808BC, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B8, Data: 0x00000004
[drm] nouveau 0000:01:00.0: 0x8D40: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: 0x8CF1: End of 0x8D1A subroutine
[drm] nouveau 0000:01:00.0: 0x8CF4: [ (0x5B) - INIT_SUB_DIRECT ]
[drm] nouveau 0000:01:00.0: 0x8CF4: Executing subroutine at 0x8D61
[drm] nouveau 0000:01:00.0: 0x8D61: [ (0x50) - INIT_ZM_TMDS_GROUP ]
[drm] nouveau 0000:01:00.0: 0x8D61: MagicLookupValue: 0x80, Count: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000008
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x0000002F
[drm] nouveau 0000:01:00.0: 0x8D66: [ (0x74) - INIT_TIME ]
[drm] nouveau 0000:01:00.0: 0x8D66: Sleeping for 0xC350 microseconds
[drm] nouveau 0000:01:00.0: 0x8D69: [ (0x50) - INIT_ZM_TMDS_GROUP ]
[drm] nouveau 0000:01:00.0: 0x8D69: MagicLookupValue: 0x80, Count: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000021
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x0000002F
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x0000002C
[drm] nouveau 0000:01:00.0: 0x8D70: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: 0x8CF4: End of 0x8D61 subroutine
[drm] nouveau 0000:01:00.0: 0x8CF7: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: 0xC213: End of 0x8CF1 subroutine
[drm] nouveau 0000:01:00.0: 0xC216: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 1=
)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 0 using out=
put A
[drm] nouveau 0000:01:00.0: nv_crtc_dpms:165 - Setting dpms mode 3 on CRT=
C 1
[drm:drm_crtc_helper_set_config],=20
[drm:drm_crtc_helper_set_config], crtc: f64ab800 6 fb: f658bb78 connector=
s: f6ad0d40 num_connectors: 0 (x, y) (0, 0)
[drm:drm_crtc_helper_set_config], crtc has no fb, full mode set
[drm:drm_crtc_helper_set_config], setting connector 7 crtc to f64ab000
[drm] nouveau 0000:01:00.0: nv_crtc_dpms:165 - Setting dpms mode 3 on CRT=
C 1
[drm:drm_crtc_helper_set_config],=20
[drm:drm_crtc_helper_set_config], crtc: f64ab000 5 fb: f658bb78 connector=
s: f6ad0d30 num_connectors: 1 (x, y) (0, 0)
[drm:drm_crtc_helper_set_config], setting connector 7 crtc to f64ab000
[drm] nouveau 0000:01:00.0: PFIFO_DMA_PUSHER - Ch 0
[drm] nouveau 0000:01:00.0: GPU lockup - switching to software fbcon
Console: switching to colour frame buffer device 160x64
[drm:drm_crtc_helper_set_config],=20
[drm:drm_crtc_helper_set_config], crtc: f64ab000 5 fb: f658bb78 connector=
s: f6ad0d30 num_connectors: 1 (x, y) (0, 0)
[drm:drm_crtc_helper_set_config], setting connector 7 crtc to f64ab000
fb0: nouveaufb frame buffer device
drm: registered panic notifier
[drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0 on minor 0

--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: attachment; filename="dmesg-nouveau-worked.log"
Content-Transfer-Encoding: quoted-printable

: 2, 16384 bytes)
NET: Registered protocol family 1
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
pci 0000:00:00.0: Limiting direct PCI/PCI transfers
pci 0000:00:14.0: Firmware left e100 interrupts enabled; disabling
pci 0000:01:00.0: Boot video device
PCI: CLS 32 bytes, default 32
Scanning for low memory corruption every 60 seconds
highmem bounce pool size: 64 pages
squashfs: version 4.0 (2009/01/31) Phillip Lougher
Installing knfsd (copyright (C) 1996 okir-pn4DOG8n3UYbFoVRYvo4fw@public.gmane.org).
Slow work thread pool: Starting up
Slow work thread pool: Ready
fuse init (API version 7.14)
msgmni has been set to 1743
alg: No test for stdrng (krng)
alg: No test for fips(ansi_cprng) (fips_ansi_cprng)
io scheduler noop registered
io scheduler cfq registered (default)
Hangcheck: starting hangcheck timer 0.9.1 (tick is 180 seconds, margin is=
 60 seconds).
Hangcheck: Using getrawmonotonic().
input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/=
input0
ACPI: Sleep Button [SLPB]
input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
ACPI: Power Button [PWRF]
ACPI: acpi_idle registered with cpuidle
ERST: Table is not found!
GHES: HEST is not enabled!
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
serial8250: ttyS0 at I/O 0x3f8 (irq =3D 4) is a 16550A
serial8250: ttyS1 at I/O 0x2f8 (irq =3D 3) is a NS16550A
00:06: ttyS0 at I/O 0x3f8 (irq =3D 4) is a 16550A
00:07: ttyS1 at I/O 0x2f8 (irq =3D 3) is a NS16550A
floppy0: no floppy controllers found
loop: module loaded
ata_piix 0000:00:07.1: version 2.13
scsi0 : ata_piix
scsi1 : ata_piix
ata1: PATA max UDMA/33 cmd 0x1f0 ctl 0x3f6 bmdma 0xffa0 irq 14
ata2: PATA max UDMA/33 cmd 0x170 ctl 0x376 bmdma 0xffa8 irq 15
sata_sil 0000:00:11.0: version 2.4
ata1: port disabled. ignoring.
sata_sil 0000:00:11.0: PCI INT A -> GSI 17 (level, low) -> IRQ 17
scsi2 : sata_sil
scsi3 : sata_sil
ata3: SATA max UDMA/100 mmio m512@0xfebffe00 tf 0xfebffe80 irq 17
ata4: SATA max UDMA/100 mmio m512@0xfebffe00 tf 0xfebffec0 irq 17
e100: Intel(R) PRO/100 Network Driver, 3.5.24-k2-NAPI
e100: Copyright(c) 1999-2006 Intel Corporation
e100 0000:00:14.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
e100 0000:00:14.0: PME# disabled
e100 0000:00:14.0: eth0: addr 0xfebfe000, irq 16, MAC addr 00:90:27:c6:b1=
:08
PPP generic driver version 2.4.2
PPP Deflate Compression module registered
PPP BSD Compression module registered
tun: Universal TUN/TAP device driver, 1.6
tun: (C) 1999-2004 Max Krasnyansky <maxk-zC7DfRvBq/JWk0Htik3J/w@public.gmane.org>
PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq 1
PNP: PS/2 appears to have AUX port disabled, if this is incorrect please =
boot with i8042.nopnp
serio: i8042 KBD port at 0x60,0x64 irq 1
mice: PS/2 mouse device common for all mice
gameport gameport0: EMU10K1 is pci0000:00:13.1/gameport0, io 0xeff0, spee=
d 1269kHz
input: PC Speaker as /devices/platform/pcspkr/input/input2
I2O subsystem v1.325
i2o: max drivers =3D 8
I2O Configuration OSM v1.323
I2O Bus Adapter OSM v1.317
I2O Block Device OSM v1.325
I2O SCSI Peripheral OSM v1.316
I2O ProcFS OSM v1.316
i2c /dev entries driver
ACPI: resource piix4_smbus [io  0x0440-0x0447] conflicts with ACPI region=
 SMRG [??? 0x00000440-0x0000044f flags 0x47]
ACPI: If an ACPI driver is available for this device, you should use it i=
nstead of the native driver
ata2.00: ATAPI: TSSTcorp CDDVDW SH-S222L, SB02, max UDMA/66
ata2.00: configured for UDMA/33
scsi 1:0:0:0: CD-ROM            TSSTcorp CDDVDW SH-S222L  SB02 PQ: 0 ANSI=
: 5
sr0: scsi3-mmc drive: 125x/125x writer dvd-ram cd/rw xa/form2 cdda tray
Uniform CD-ROM driver Revision: 3.20
sr 1:0:0:0: Attached scsi CD-ROM sr0
sr 1:0:0:0: Attached scsi generic sg0 type 5
IR NEC protocol handler initialized
IR RC5(x) protocol handler initialized
IR RC6 protocol handler initialized
IR JVC protocol handler initialized
IR Sony protocol handler initialized
Linux video capture interface: v2.00
lm78: Found an LM79 chip at 0x290
device-mapper: ioctl: 4.17.0-ioctl (2010-03-05) initialised: dm-devel@red=
hat.com
cpuidle: using governor ladder
EMU10K1_Audigy 0000:00:13.0: PCI INT A -> GSI 19 (level, low) -> IRQ 19
ALSA device list:
  #0: SB Live! Value [CT4832] (rev.6, serial:0x80271102) at 0xef20, irq 1=
9
Netfilter messages via NETLINK v0.30.
nf_conntrack version 0.5.0 (16120 buckets, 64480 max)
CONFIG_NF_CT_ACCT is deprecated and will be removed soon. Please use
nf_conntrack.acct=3D1 kernel parameter, acct=3D1 nf_conntrack module opti=
on or
sysctl net.netfilter.nf_conntrack_acct=3D1 to enable it.
ctnetlink v0.93: registering with nfnetlink.
IPv4 over IPv4 tunneling driver
ip_tables: (C) 2000-2006 Netfilter Core Team
arp_tables: (C) 2002 David S. Miller
TCP cubic registered
NET: Registered protocol family 17
Using IPI No-Shortcut mode
ata3: SATA link up 1.5 Gbps (SStatus 113 SControl 310)
ata3.00: ATA-7: ST3320620AS, 3.AAE, max UDMA/133
ata3.00: 625142448 sectors, multi 16: LBA48 NCQ (depth 0/32)
ata3.00: configured for UDMA/100
scsi 2:0:0:0: Direct-Access     ATA      ST3320620AS      3.AA PQ: 0 ANSI=
: 5
sd 2:0:0:0: [sda] 625142448 512-byte logical blocks: (320 GB/298 GiB)
sd 2:0:0:0: Attached scsi generic sg1 type 0
sd 2:0:0:0: [sda] Write Protect is off
sd 2:0:0:0: [sda] Mode Sense: 00 3a 00 00
sd 2:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't supp=
ort DPO or FUA
 sda: sda1 sda2 sda3 < sda5 >
sd 2:0:0:0: [sda] Attached SCSI disk
ata4: SATA link up 1.5 Gbps (SStatus 113 SControl 310)
ata4.00: ATA-7: ST3500641AS, 3.AAJ, max UDMA/133
ata4.00: 976773168 sectors, multi 16: LBA48 NCQ (depth 0/32)
ata4.00: configured for UDMA/100
scsi 3:0:0:0: Direct-Access     ATA      ST3500641AS      3.AA PQ: 0 ANSI=
: 5
sd 3:0:0:0: [sdb] 976773168 512-byte logical blocks: (500 GB/465 GiB)
sd 3:0:0:0: Attached scsi generic sg2 type 0
sd 3:0:0:0: [sdb] Write Protect is off
sd 3:0:0:0: [sdb] Mode Sense: 00 3a 00 00
sd 3:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't supp=
ort DPO or FUA
 sdb: sdb1 sdb2
sd 3:0:0:0: [sdb] Attached SCSI disk
EXT3-fs (sda2): error: couldn't mount because of unsupported optional fea=
tures (240)
EXT2-fs (sda2): error: couldn't mount because of unsupported optional fea=
tures (240)
EXT4-fs (sda2): mounted filesystem with ordered data mode. Opts: (null)
VFS: Mounted root (ext4 filesystem) readonly on device 8:2.
Freeing unused kernel memory: 416k freed
Write protecting the kernel text: 4420k
Write protecting the kernel read-only data: 1532k
udev: starting version 151
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
ohci_hcd 0000:02:08.0: PCI INT A -> GSI 18 (level, low) -> IRQ 18
ohci_hcd 0000:02:08.0: OHCI Host Controller
ohci_hcd 0000:02:08.0: new USB bus registered, assigned bus number 1
ohci_hcd 0000:02:08.0: irq 18, io mem 0xfe5fd000
uhci_hcd: USB Universal Host Controller Interface driver
uhci_hcd 0000:00:07.2: PCI INT D -> GSI 19 (level, low) -> IRQ 19
uhci_hcd 0000:00:07.2: UHCI Host Controller
uhci_hcd 0000:00:07.2: new USB bus registered, assigned bus number 2
uhci_hcd 0000:00:07.2: irq 19, io base 0x0000ef40
usb usb2: New USB device found, idVendor=3D1d6b, idProduct=3D0001
usb usb2: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb2: Product: UHCI Host Controller
usb usb2: Manufacturer: Linux 2.6.35-gentoo-r12 uhci_hcd
usb usb2: SerialNumber: 0000:00:07.2
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 2 ports detected
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
Warning! ehci_hcd should always be loaded before uhci_hcd and ohci_hcd, n=
ot after
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
Buffer I/O error on device sr0, logical block 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
Buffer I/O error on device sr0, logical block 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
Buffer I/O error on device sr0, logical block 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
Buffer I/O error on device sr0, logical block 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
Buffer I/O error on device sr0, logical block 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
Buffer I/O error on device sr0, logical block 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
Buffer I/O error on device sr0, logical block 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
Buffer I/O error on device sr0, logical block 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
Buffer I/O error on device sr0, logical block 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
Buffer I/O error on device sr0, logical block 0
Linux agpgart interface v0.103
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
sr 1:0:0:0: [sr0] Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE
sr 1:0:0:0: [sr0] Sense Key : Illegal Request [current]=20
sr 1:0:0:0: [sr0] Add. Sense: Logical block address out of range
sr 1:0:0:0: [sr0] CDB: Read(10): 28 00 00 00 00 00 00 00 01 00
end_request: I/O error, dev sr0, sector 0
usb 2-1: new full speed USB device using uhci_hcd and address 2
agpgart-intel 0000:00:00.0: Intel 440BX Chipset
agpgart-intel 0000:00:00.0: AGP aperture is 64M @ 0xf4000000
rtc_cmos 00:02: rtc core: registered rtc_cmos as rtc0
rtc0: alarms up to one month, 114 bytes nvram
usb 2-1: New USB device found, idVendor=3D1046, idProduct=3D9967
usb 2-1: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D0
usb 2-1: Product: W9967CF
usb 2-1: Manufacturer: WINBOND
usb 2-2: new low speed USB device using uhci_hcd and address 3
usb usb1: New USB device found, idVendor=3D1d6b, idProduct=3D0001
usb usb1: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb1: Product: OHCI Host Controller
usb usb1: Manufacturer: Linux 2.6.35-gentoo-r12 ohci_hcd
usb usb1: SerialNumber: 0000:02:08.0
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 3 ports detected
ehci_hcd 0000:02:08.2: PCI INT C -> GSI 16 (level, low) -> IRQ 16
ehci_hcd 0000:02:08.2: EHCI Host Controller
ehci_hcd 0000:02:08.2: new USB bus registered, assigned bus number 3
ehci_hcd 0000:02:08.2: irq 16, io mem 0xfe5fff00
ehci_hcd 0000:02:08.2: USB 2.0 started, EHCI 0.95
usb usb3: New USB device found, idVendor=3D1d6b, idProduct=3D0002
usb usb3: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb3: Product: EHCI Host Controller
usb usb3: Manufacturer: Linux 2.6.35-gentoo-r12 ehci_hcd
usb usb3: SerialNumber: 0000:02:08.2
hub 3-0:1.0: USB hub found
hub 3-0:1.0: 5 ports detected
ohci1394 0000:02:0b.0: PCI INT A -> GSI 17 (level, low) -> IRQ 17
ohci1394: fw-host0: OHCI-1394 1.0 (PCI): IRQ=3D[17]  MMIO=3D[fe5ff000-fe5=
ff7ff]  Max Packet=3D[2048]  IR/IT contexts=3D[4/8]
usb 2-2: New USB device found, idVendor=3D045e, idProduct=3D00db
usb 2-2: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D0
usb 2-2: Product: Natural=AE Ergonomic Keyboard 4000
usb 2-2: Manufacturer: Microsoft
ohci_hcd 0000:02:08.1: PCI INT B -> GSI 19 (level, low) -> IRQ 19
ohci_hcd 0000:02:08.1: OHCI Host Controller
ohci_hcd 0000:02:08.1: new USB bus registered, assigned bus number 4
ohci_hcd 0000:02:08.1: irq 19, io mem 0xfe5fe000
usbcore: registered new interface driver hiddev
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
input: Microsoft Natural=AE Ergonomic Keyboard 4000 as /devices/pci0000:0=
0/0000:00:07.2/usb2/2-2/2-2:1.0/input/input3
microsoft 0003:045E:00DB.0001: input,hidraw0: USB HID v1.11 Keyboard [Mic=
rosoft Natural=AE Ergonomic Keyboard 4000] on usb-0000:00:07.2-2/input0
input: Microsoft Natural=AE Ergonomic Keyboard 4000 as /devices/pci0000:0=
0/0000:00:07.2/usb2/2-2/2-2:1.1/input/input4
microsoft 0003:045E:00DB.0002: input,hidraw1: USB HID v1.11 Device [Micro=
soft Natural=AE Ergonomic Keyboard 4000] on usb-0000:00:07.2-2/input1
usb 3-2: new high speed USB device using ehci_hcd and address 2
usb 3-2: New USB device found, idVendor=3D050d, idProduct=3D0237
usb 3-2: New USB device strings: Mfr=3D0, Product=3D0, SerialNumber=3D0
hub 3-2:1.0: USB hub found
hub 3-2:1.0: 7 ports detected
usb usb4: New USB device found, idVendor=3D1d6b, idProduct=3D0001
usb usb4: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb4: Product: OHCI Host Controller
usb usb4: Manufacturer: Linux 2.6.35-gentoo-r12 ohci_hcd
usb usb4: SerialNumber: 0000:02:08.1
hub 4-0:1.0: USB hub found
hub 4-0:1.0: 2 ports detected
usb 3-2.3: new low speed USB device using ehci_hcd and address 3
usb 3-2.3: New USB device found, idVendor=3D045e, idProduct=3D00d1
usb 3-2.3: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D0
usb 3-2.3: Product: Microsoft Optical Mouse with Tilt Wheel
usb 3-2.3: Manufacturer: Microsoft
input: Microsoft Microsoft Optical Mouse with Tilt Wheel as /devices/pci0=
000:00/0000:00:12.0/0000:02:08.2/usb3/3-2/3-2.3/3-2.3:1.0/input/input5
generic-usb 0003:045E:00D1.0003: input,hidraw2: USB HID v1.11 Mouse [Micr=
osoft Microsoft Optical Mouse with Tilt Wheel] on usb-0000:02:08.2-2.3/in=
put0
ieee1394: The root node is not cycle master capable; selecting a new root=
 node and resetting...
EXT4-fs (sda2): re-mounted. Opts: (null)
ieee1394: Error parsing configrom for node 0-00:1023
ieee1394: Host added: ID:BUS[0-01:1023]  GUID[005042b5000097c6]
usb 3-4: new high speed USB device using ehci_hcd and address 4
usb 3-4: New USB device found, idVendor=3D2040, idProduct=3D7501
usb 3-4: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D3
usb 3-4: Product: WinTV
usb 3-4: Manufacturer: Hauppauge
usb 3-4: SerialNumber: 7300-00-F05EA556
pvrusb2: Hardware description: WinTV HVR-1950 Model 751xx
usbcore: registered new interface driver pvrusb2
pvrusb2: V4L in-tree version:Hauppauge WinTV-PVR-USB2 MPEG2 Encoder/Tuner
pvrusb2: Debug mask is 31 (0x1f)
EXT3-fs: barriers not enabled
kjournald starting.  Commit interval 5 seconds
EXT3-fs (sdb2): using internal journal
EXT3-fs (sdb2): mounted filesystem with ordered data mode
Adding 2136028k swap on /dev/sda1.  Priority:-1 extents:1 across:2136028k=
=20
pvrusb2: Device microcontroller firmware (re)loaded; it should now reset =
and reconnect.
usb 3-4: USB disconnect, address 4
pvrusb2: Device being rendered inoperable
usb 3-4: new high speed USB device using ehci_hcd and address 5
usb 3-4: New USB device found, idVendor=3D2040, idProduct=3D7501
usb 3-4: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D3
usb 3-4: Product: WinTV
usb 3-4: Manufacturer: Hauppauge
usb 3-4: SerialNumber: 7300-00-F05EA556
pvrusb2: Hardware description: WinTV HVR-1950 Model 751xx
pvrusb2: Binding ir_video to i2c address 0x71.
cx25840 0-0044: cx25843-24 found @ 0x88 (pvrusb2_a)
pvrusb2: Attached sub-driver cx25840
tuner 0-0042: chip found @ 0x84 (pvrusb2_a)
pvrusb2: Attached sub-driver tuner
cx25840 0-0044: loaded v4l-cx25840.fw firmware (16382 bytes)
tveeprom 0-00a2: Hauppauge model 75111, rev C3E9, serial# 6202710
tveeprom 0-00a2: MAC address is 00:0d:fe:5e:a5:56
tveeprom 0-00a2: tuner model is Philips 18271_8295 (idx 149, type 54)
tveeprom 0-00a2: TV standards NTSC(M) ATSC/DVB Digital (eeprom 0x88)
tveeprom 0-00a2: audio processor is CX25843 (idx 37)
tveeprom 0-00a2: decoder processor is CX25843 (idx 30)
tveeprom 0-00a2: has radio, has IR receiver, has IR transmitter
pvrusb2: Supported video standard(s) reported available in hardware: PAL-=
M/N/Nc;NTSC-M/Mj/Mk;ATSC-8VSB/16VSB
pvrusb2: Mapping standards mask=3D0x300b700 (PAL-M/N/Nc;NTSC-M/Mj/Mk;ATSC=
-8VSB/16VSB)
pvrusb2: Setting up 6 unique standard(s)
pvrusb2: Set up standard idx=3D0 name=3DPAL-M
pvrusb2: Set up standard idx=3D1 name=3DPAL-N
pvrusb2: Set up standard idx=3D2 name=3DPAL-Nc
pvrusb2: Set up standard idx=3D3 name=3DNTSC-M
pvrusb2: Set up standard idx=3D4 name=3DNTSC-Mj
pvrusb2: Set up standard idx=3D5 name=3DNTSC-Mk
pvrusb2: Initial video standard (determined by device type): NTSC-M
pvrusb2: Device initialization completed successfully.
pvrusb2: registered device video0 [mpeg]
DVB: registering new adapter (pvrusb2-dvb)
cx25840 0-0044: loaded v4l-cx25840.fw firmware (16382 bytes)
tda829x 0-0042: setting tuner address to 60
tda18271 0-0060: creating new instance
TDA18271HD/C1 detected @ 0-0060
tda829x 0-0042: type set to tda8295+18271
cx25840 0-0044: 0x0000 is not a valid video input!
DVB: registering adapter 0 frontend 0 (Samsung S5H1411 QAM/8VSB Frontend)=
...
tda829x 0-0042: type set to tda8295
tda18271 0-0060: attaching existing instance
e100 0000:00:14.0: eth0: NIC Link is Up 100 Mbps Half Duplex
NET: Registered protocol family 10
lo: Disabled Privacy Extensions
tunl0: Disabled Privacy Extensions
svc: failed to register lockdv1 RPC service (errno 97).
NFSD: Using /var/lib/nfs/v4recovery as the NFSv4 state recovery directory
NFSD: starting 90-second grace period
eth0: no IPv6 routers present
[drm] Initialized drm 1.1.0 20060810
nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
[drm] nouveau 0000:01:00.0: nouveau_load:800 - vendor: 0x10DE device: 0x2=
E1 class: 0x30000
[drm] nouveau 0000:01:00.0: nouveau_load:823 - regs mapped ok at 0xfd0000=
00
[drm] nouveau 0000:01:00.0: Detected an NV40 generation card (0x04b200b1)
[drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PRAMIN
[drm] nouveau 0000:01:00.0: ... appears to be valid
[drm] nouveau 0000:01:00.0: BIT BIOS found
[drm] nouveau 0000:01:00.0: Bios version 05.73.22.51
[drm] nouveau 0000:01:00.0: TMDS table script pointers not stubbed
[drm] nouveau 0000:01:00.0: BIT table 'd' not found
[drm] nouveau 0000:01:00.0: Found Display Configuration Block version 3.0
[drm] nouveau 0000:01:00.0: Raw DCB entry 0: 01000300 00000028
[drm] nouveau 0000:01:00.0: Raw DCB entry 1: 03000302 00000000
[drm] nouveau 0000:01:00.0: Raw DCB entry 2: 04011310 00000028
[drm] nouveau 0000:01:00.0: Raw DCB entry 3: 020223f1 00c0c080
[drm] nouveau 0000:01:00.0: DCB connector table: VHER 0x30 5 10 2
[drm] nouveau 0000:01:00.0:   0: 0x00002030: type 0x30 idx 0 tag 0x08
[drm] nouveau 0000:01:00.0:   1: 0x00000100: type 0x00 idx 1 tag 0xff
[drm] nouveau 0000:01:00.0:   2: 0x00000210: type 0x10 idx 2 tag 0xff
[drm] nouveau 0000:01:00.0:   3: 0x00000211: type 0x11 idx 3 tag 0xff
[drm] nouveau 0000:01:00.0:   4: 0x00000213: type 0x13 idx 4 tag 0xff
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset 0xCDAD
[drm] nouveau 0000:01:00.0: 0xCDAD: ------ Executing following commands -=
-----
[drm] nouveau 0000:01:00.0: 0xCDAD: [ (0x53) - INIT_ZM_CR ]
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x44,=
 Head: 0x00, Data: 0x03
[drm] nouveau 0000:01:00.0: 0xCDB0: [ (0x78) - INIT_INDEX_IO ]
[drm] nouveau 0000:01:00.0: 0xCDB0: Port: 0x03C4, Index: 0x01, Mask: 0xFF=
, Data: 0x20
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03C4, Index: 0x01,=
 Head: 0x01, Data: 0x20
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03C4, Index: 0x01,=
 Head: 0x01, Data: 0x20
[drm] nouveau 0000:01:00.0: 0xCDB6: [ (0x53) - INIT_ZM_CR ]
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x44,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 0xCDB9: [ (0x78) - INIT_INDEX_IO ]
[drm] nouveau 0000:01:00.0: 0xCDB9: Port: 0x03C4, Index: 0x01, Mask: 0xFF=
, Data: 0x20
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03C4, Index: 0x01,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03C4, Index: 0x01,=
 Head: 0x00, Data: 0x20
[drm] nouveau 0000:01:00.0: 0xCDBF: [ (0x65) - INIT_RESET ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x0000184C, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0000184C, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00000200, Data: 0x01100000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00000200, Data: 0x05110111
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0000184C, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00001850, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001850, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xCDCC: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0000C040, Data: 0x3C000400
[drm] nouveau 0000:01:00.0: 0xCDD5: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xCDD5: Reg: 0x00101000, Mask: 0xFFFFFFFF, Da=
ta: 0x80000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xCDE2: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xCDE2: Reg: 0x0010100C, Mask: 0xFFFFFFFF, Da=
ta: 0x80000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x0010100C, Data: 0x80010490
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0010100C, Data: 0x80010490
[drm] nouveau 0000:01:00.0: 0xCDEF: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xCDEF: Reg: 0x00600818, Mask: 0xFFFFFFFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00600818, Data: 0x01100010
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00600818, Data: 0x01100010
[drm] nouveau 0000:01:00.0: 0xCDFC: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xCDFC: Reg: 0x0060081C, Mask: 0xFFFFFFFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x0060081C, Data: 0x22222222
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0060081C, Data: 0x22222222
[drm] nouveau 0000:01:00.0: 0xCE09: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xCE09: Reg: 0x00600850, Mask: 0xFFFFFFFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00600850, Data: 0x00002222
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00600850, Data: 0x00002222
[drm] nouveau 0000:01:00.0: 0xCE16: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00600854, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xCE1F: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00600858, Data: 0x00001FFF
[drm] nouveau 0000:01:00.0: 0xCE28: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00602858, Data: 0x00001FFF
[drm] nouveau 0000:01:00.0: 0xCE31: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xCE31: Reg: 0x00600818, Mask: 0xFFFFFFFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00600818, Data: 0x01100010
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00600818, Data: 0x01100010
[drm] nouveau 0000:01:00.0: 0xCE3E: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xCE3E: Reg: 0x0060081C, Mask: 0xFFFFFFFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x0060081C, Data: 0x22222222
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0060081C, Data: 0x22222222
[drm] nouveau 0000:01:00.0: 0xCE4B: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xCE4B: Reg: 0x00600850, Mask: 0xFFFFFFFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00600850, Data: 0x00002222
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00600850, Data: 0x00002222
[drm] nouveau 0000:01:00.0: 0xCE58: [ (0x58) - INIT_ZM_REG_SEQUENCE ]
[drm] nouveau 0000:01:00.0: 0xCE58: BaseReg: 0x00001540, Count: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001540, Data: 0x73F31F0B
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001544, Data: 0x00000FFF
[drm] nouveau 0000:01:00.0: 0xCE66: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100210, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xCE6F: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004000, Data: 0x00010000
[drm] nouveau 0000:01:00.0: 0xCE78: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004008, Data: 0x03310000
[drm] nouveau 0000:01:00.0: 0xCE81: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00680580, Data: 0x03D0003D
[drm] nouveau 0000:01:00.0: 0xCE8A: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004600, Data: 0x80000001
[drm] nouveau 0000:01:00.0: 0xCE93: [ (0x91) - INIT_ZM_REG_GROUP_ADDRESS_=
LATCHED ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004020, Data: 0x34880000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004020, Data: 0x34800000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004020, Data: 0x24800000
[drm] nouveau 0000:01:00.0: 0xCEA5: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xCEA5: Reg: 0x00100A40, RegIncrement: 0x04, =
Count: 0x02, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A40, Data: 0x8703280F
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A44, Data: 0x8703280F
[drm] nouveau 0000:01:00.0: 0xCEEC: [ (0x58) - INIT_ZM_REG_SEQUENCE ]
[drm] nouveau 0000:01:00.0: 0xCEEC: BaseReg: 0x000015B4, Count: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x000015B4, Data: 0x08000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x000015B8, Data: 0x98800F08
[drm] nouveau 0000:01:00.0: 0xCEFA: [ (0x75) - INIT_CONDITION ]
[drm] nouveau 0000:01:00.0: 0xCEFA: Condition: 0x03
[drm] nouveau 0000:01:00.0: 0xCEFA: Cond: 0x03, Reg: 0x00000000, Mask: 0x=
000000FF
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00000000, Data: 0x04B200B1
[drm] nouveau 0000:01:00.0: 0xCEFA: Checking if 0x000000B1 equals 0x00000=
0A1
[drm] nouveau 0000:01:00.0: 0xCEFA: Condition not fulfilled -- skipping f=
ollowing commands
[drm] nouveau 0000:01:00.0: 0xCEFC: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 0xCF05: [ (0x38) - INIT_NOT ]
[drm] nouveau 0000:01:00.0: 0xCF05: ------ Executing following commands -=
-----
[drm] nouveau 0000:01:00.0: 0xCF06: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100360, Data: 0x8B183A98
[drm] nouveau 0000:01:00.0: 0xCF0F: [ (0x72) - INIT_RESUME ]
[drm] nouveau 0000:01:00.0: 0xCF10: [ (0x75) - INIT_CONDITION ]
[drm] nouveau 0000:01:00.0: 0xCF10: Condition: 0x00
[drm] nouveau 0000:01:00.0: 0xCF10: Cond: 0x00, Reg: 0x00101000, Mask: 0x=
00000040
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xCF10: Checking if 0x00000000 equals 0x00000=
040
[drm] nouveau 0000:01:00.0: 0xCF10: Condition not fulfilled -- skipping f=
ollowing commands
[drm] nouveau 0000:01:00.0: 0xCF12: [ (0x62) - INIT_ZM_INDEX_IO ]
[drm] nouveau 0000:01:00.0: 0xCF17: [ (0x38) - INIT_NOT ]
[drm] nouveau 0000:01:00.0: 0xCF17: ------ Executing following commands -=
-----
[drm] nouveau 0000:01:00.0: 0xCF18: [ (0x62) - INIT_ZM_INDEX_IO ]
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x3C,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 0xCF1D: [ (0x72) - INIT_RESUME ]
[drm] nouveau 0000:01:00.0: 0xCF1E: [ (0x37) - INIT_COPY ]
[drm] nouveau 0000:01:00.0: 0xCF1E: Reg: 0x00101000, Shift: 0xFE, SrcMask=
: 0xF0, Port: 0x03D4, Index: 0x3C, Mask: 0x0F
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x3C,=
 Head: 0x00, Data: 0x20
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x3C,=
 Head: 0x00, Data: 0x20
[drm] nouveau 0000:01:00.0: 0xCF29: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00680510, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xCF32: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xCF32: Reg: 0x00001580, Mask: 0xCFFFFFFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00001580, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001580, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xCF3F: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00000140, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xCF48: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00000200, Data: 0x07110111
[drm] nouveau 0000:01:00.0: 0xCF51: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00680608, Data: 0x00100000
[drm] nouveau 0000:01:00.0: 0xCF5A: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00682608, Data: 0x00100000
[drm] nouveau 0000:01:00.0: 0xCF63: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00680670, Data: 0x00100000
[drm] nouveau 0000:01:00.0: 0xCF6C: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001084, Data: 0x00205649
[drm] nouveau 0000:01:00.0: 0xCF75: [ (0x6B) - INIT_SUB ]
[drm] nouveau 0000:01:00.0: 0xCF75: Calling script 6
[drm] nouveau 0000:01:00.0: 0xDCB7: [ (0x4A) - INIT_IO_RESTRICT_PLL2 ]
[drm] nouveau 0000:01:00.0: 0xDCB7: Port: 0x03D4, Index: 0x3C, Mask: 0x70=
, Shift: 0x04, Count: 0x08, Reg: 0x00004004
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x3C,=
 Head: 0x00, Data: 0x20
[drm] nouveau 0000:01:00.0: 0xDCB7: Reg: 0x00004004, Config: 0x02, Freq: =
400000kHz
[drm] nouveau 0000:01:00.0: Loading PLL limits for reg 0x00000000
[drm] nouveau 0000:01:00.0: pll.vco1.minfreq: 100000
[drm] nouveau 0000:01:00.0: pll.vco1.maxfreq: 300000
[drm] nouveau 0000:01:00.0: pll.vco1.min_inputfreq: 2000
[drm] nouveau 0000:01:00.0: pll.vco1.max_inputfreq: 27000
[drm] nouveau 0000:01:00.0: pll.vco1.min_n: 8
[drm] nouveau 0000:01:00.0: pll.vco1.max_n: 255
[drm] nouveau 0000:01:00.0: pll.vco1.min_m: 1
[drm] nouveau 0000:01:00.0: pll.vco1.max_m: 255
[drm] nouveau 0000:01:00.0: pll.vco2.minfreq: 500000
[drm] nouveau 0000:01:00.0: pll.vco2.maxfreq: 1000000
[drm] nouveau 0000:01:00.0: pll.vco2.min_inputfreq: 25000
[drm] nouveau 0000:01:00.0: pll.vco2.max_inputfreq: 75000
[drm] nouveau 0000:01:00.0: pll.vco2.min_n: 8
[drm] nouveau 0000:01:00.0: pll.vco2.max_n: 50
[drm] nouveau 0000:01:00.0: pll.vco2.min_m: 1
[drm] nouveau 0000:01:00.0: pll.vco2.max_m: 255
[drm] nouveau 0000:01:00.0: pll.max_log2p: 7
[drm] nouveau 0000:01:00.0: pll.log2p_bias: 0
[drm] nouveau 0000:01:00.0: pll.refclk: 27000
[drm] nouveau 0000:01:00.0: 0xDCE2: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: 0xCF75: End of script 6
[drm] nouveau 0000:01:00.0: 0xCF77: [ (0x5B) - INIT_SUB_DIRECT ]
[drm] nouveau 0000:01:00.0: 0xCF77: Executing subroutine at 0xDE82
[drm] nouveau 0000:01:00.0: 0xDE82: [ (0x92) - INIT_RESERVED ]
[drm] nouveau 0000:01:00.0: 0xDE83: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: 0xCF77: End of 0xDE82 subroutine
[drm] nouveau 0000:01:00.0: 0xCF7A: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004024, Data: 0x00005904
[drm] nouveau 0000:01:00.0: 0xCF83: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004020, Data: 0xACB12000
[drm] nouveau 0000:01:00.0: 0xCF8C: [ (0x74) - INIT_TIME ]
[drm] nouveau 0000:01:00.0: 0xCF8C: Sleeping for 0x00C8 microseconds
[drm] nouveau 0000:01:00.0: 0xCF8F: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004020, Data: 0xACB13000
[drm] nouveau 0000:01:00.0: 0xCF98: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004020, Data: 0xAC313000
[drm] nouveau 0000:01:00.0: 0xCFA1: [ (0x90) - INIT_COPY_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00004024, Data: 0x00001401
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0000403C, Data: 0x00001401
[drm] nouveau 0000:01:00.0: 0xCFAA: [ (0x90) - INIT_COPY_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00004020, Data: 0xAC413000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004038, Data: 0xAC413000
[drm] nouveau 0000:01:00.0: 0xCFB3: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xCFB3: Reg: 0x00100440, RegIncrement: 0x10, =
Count: 0x06, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100440, Data: 0x01F00111
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100450, Data: 0x01F00111
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100460, Data: 0x00001111
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100470, Data: 0x00001111
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100480, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100490, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xD07A: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD07A: Reg: 0x00100444, RegIncrement: 0x10, =
Count: 0x06, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100444, Data: 0x01022123
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100454, Data: 0x01022123
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100464, Data: 0x000D0010
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100474, Data: 0x000D0010
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100484, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100494, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xD141: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD141: Reg: 0x001003E4, RegIncrement: 0x04, =
Count: 0x0E, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001003E4, Data: 0x04040004
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001003E8, Data: 0x00000404
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001003EC, Data: 0x04040004
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001003F0, Data: 0x00000404
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001003F4, Data: 0x00000404
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001003F8, Data: 0x04000004
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001003FC, Data: 0x04000004
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100400, Data: 0x0B00000B
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100404, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100408, Data: 0x0B00000B
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0010040C, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100410, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100414, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100418, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xD308: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xD308: Reg: 0x0000425C, Mask: 0xFFFFFFFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x0000425C, Data: 0x0C221464
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0000425C, Data: 0x0C221464
[drm] nouveau 0000:01:00.0: 0xD315: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xD315: Reg: 0x00004410, Mask: 0xFFF003FF, Da=
ta: 0x00000400
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00004410, Data: 0x161004E0
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00004410, Data: 0x161004E0
[drm] nouveau 0000:01:00.0: 0xD322: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xD322: Reg: 0x0000C040, Mask: 0xFFFCFFFF, Da=
ta: 0x00030000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x0000C040, Data: 0x3C0B07FF
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0000C040, Data: 0x3C0B07FF
[drm] nouveau 0000:01:00.0: 0xD32F: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD32F: Reg: 0x00100220, RegIncrement: 0x04, =
Count: 0x09, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100220, Data: 0x06121E18
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100224, Data: 0x0A010805
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100228, Data: 0x23230606
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0010022C, Data: 0x5311F304
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100230, Data: 0x00000C1F
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100234, Data: 0x01E69677
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100238, Data: 0x001E0211
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0010023C, Data: 0x00000031
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100240, Data: 0x00090000
[drm] nouveau 0000:01:00.0: 0xD456: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset 0xD457
[drm] nouveau 0000:01:00.0: 0xD457: ------ Executing following commands -=
-----
[drm] nouveau 0000:01:00.0: 0xD457: [ (0x58) - INIT_ZM_REG_SEQUENCE ]
[drm] nouveau 0000:01:00.0: 0xD457: BaseReg: 0x00100328, Count: 0x09
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100328, Data: 0x08030114
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0010032C, Data: 0xFFFF18FF
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100330, Data: 0xCCCC5044
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100334, Data: 0x33332022
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100338, Data: 0x0000000A
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0010033C, Data: 0x00041244
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100340, Data: 0x000001FB
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100344, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100348, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xD481: [ (0x58) - INIT_ZM_REG_SEQUENCE ]
[drm] nouveau 0000:01:00.0: 0xD481: BaseReg: 0x00100350, Count: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100350, Data: 0x0000440A
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100354, Data: 0x00000806
[drm] nouveau 0000:01:00.0: 0xD48F: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100210, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xD498: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001220, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xD4A1: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001228, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xD4AA: [ (0x58) - INIT_ZM_REG_SEQUENCE ]
[drm] nouveau 0000:01:00.0: 0xD4AA: BaseReg: 0x00100A50, Count: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A50, Data: 0x00100077
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A54, Data: 0x00100077
[drm] nouveau 0000:01:00.0: 0xD4B8: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001218, Data: 0x00010000
[drm] nouveau 0000:01:00.0: 0xD4C1: [ (0x58) - INIT_ZM_REG_SEQUENCE ]
[drm] nouveau 0000:01:00.0: 0xD4C1: BaseReg: 0x00001230, Count: 0x03
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001230, Data: 0x8000DFDF
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001234, Data: 0x0004000F
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001238, Data: 0xF83E0000
[drm] nouveau 0000:01:00.0: 0xD4D3: [ (0x58) - INIT_ZM_REG_SEQUENCE ]
[drm] nouveau 0000:01:00.0: 0xD4D3: BaseReg: 0x00001240, Count: 0x04
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001240, Data: 0x80000A0A
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001244, Data: 0x0001000F
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001248, Data: 0xF83E0000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0000124C, Data: 0xAA11AA11
[drm] nouveau 0000:01:00.0: 0xD4E9: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xD4E9: Reg: 0x00001280, Mask: 0xFFFFFFFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00001280, Data: 0x2F192F19
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001280, Data: 0x2F192F19
[drm] nouveau 0000:01:00.0: 0xD4F6: [ (0x74) - INIT_TIME ]
[drm] nouveau 0000:01:00.0: 0xD4F6: Sleeping for 0x07D0 microseconds
[drm] nouveau 0000:01:00.0: 0xD4F9: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD4F9: Reg: 0x00100218, RegIncrement: 0x04, =
Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100218, Data: 0x00000100
[drm] nouveau 0000:01:00.0: 0xD520: [ (0x74) - INIT_TIME ]
[drm] nouveau 0000:01:00.0: 0xD520: Sleeping for 0x07D0 microseconds
[drm] nouveau 0000:01:00.0: 0xD523: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xD523: Macro: 0x01, MacroTableIndex: 0x01, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0010021C, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xD525: [ (0x74) - INIT_TIME ]
[drm] nouveau 0000:01:00.0: 0xD525: Sleeping for 0x07D0 microseconds
[drm] nouveau 0000:01:00.0: 0xD528: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD528: Reg: 0x00100200, RegIncrement: 0x04, =
Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100200, Data: 0x43003071
[drm] nouveau 0000:01:00.0: 0xD54F: [ (0x75) - INIT_CONDITION ]
[drm] nouveau 0000:01:00.0: 0xD54F: Condition: 0x02
[drm] nouveau 0000:01:00.0: 0xD54F: Cond: 0x02, Reg: 0x00101000, Mask: 0x=
00000020
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD54F: Checking if 0x00000000 equals 0x00000=
020
[drm] nouveau 0000:01:00.0: 0xD54F: Condition not fulfilled -- skipping f=
ollowing commands
[drm] nouveau 0000:01:00.0: 0xD551: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xD55E: [ (0x72) - INIT_RESUME ]
[drm] nouveau 0000:01:00.0: 0xD55E: ---- Executing following commands ---=
-
[drm] nouveau 0000:01:00.0: 0xD55F: [ (0x75) - INIT_CONDITION ]
[drm] nouveau 0000:01:00.0: 0xD55F: Condition: 0x04
[drm] nouveau 0000:01:00.0: 0xD55F: Cond: 0x04, Reg: 0x00001540, Mask: 0x=
000F0000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00001540, Data: 0x73F31F0B
[drm] nouveau 0000:01:00.0: 0xD55F: Checking if 0x00030000 equals 0x00030=
000
[drm] nouveau 0000:01:00.0: 0xD55F: Condition fulfilled -- continuing to =
execute
[drm] nouveau 0000:01:00.0: 0xD561: [ (0x38) - INIT_NOT ]
[drm] nouveau 0000:01:00.0: 0xD561: ------ Skipping following commands  -=
-----
[drm] nouveau 0000:01:00.0: 0xD562: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xD56F: [ (0x5F) - INIT_COPY_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xD585: [ (0x72) - INIT_RESUME ]
[drm] nouveau 0000:01:00.0: 0xD585: ---- Executing following commands ---=
-
[drm] nouveau 0000:01:00.0: 0xD586: [ (0x74) - INIT_TIME ]
[drm] nouveau 0000:01:00.0: 0xD586: Sleeping for 0x07D0 microseconds
[drm] nouveau 0000:01:00.0: 0xD589: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD589: Reg: 0x00100204, RegIncrement: 0x04, =
Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100204, Data: 0x0055A220
[drm] nouveau 0000:01:00.0: 0xD5B0: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100210, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xD5B9: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100214, Data: 0x000000B0
[drm] nouveau 0000:01:00.0: 0xD5C2: [ (0x74) - INIT_TIME ]
[drm] nouveau 0000:01:00.0: 0xD5C2: Sleeping for 0x00C8 microseconds
[drm] nouveau 0000:01:00.0: 0xD5C5: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD5C5: Reg: 0x00100218, RegIncrement: 0x04, =
Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100218, Data: 0x00000100
[drm] nouveau 0000:01:00.0: 0xD5EC: [ (0x74) - INIT_TIME ]
[drm] nouveau 0000:01:00.0: 0xD5EC: Sleeping for 0x07D0 microseconds
[drm] nouveau 0000:01:00.0: 0xD5EF: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD5EF: Reg: 0x00100218, RegIncrement: 0x04, =
Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100218, Data: 0x00000101
[drm] nouveau 0000:01:00.0: 0xD616: [ (0x74) - INIT_TIME ]
[drm] nouveau 0000:01:00.0: 0xD616: Sleeping for 0x07D0 microseconds
[drm] nouveau 0000:01:00.0: 0xD619: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xD619: Macro: 0x03, MacroTableIndex: 0x03, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D8, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xD61B: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xD61B: Macro: 0x00, MacroTableIndex: 0x00, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D4, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xD61D: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD61D: Reg: 0x001002E0, RegIncrement: 0x04, =
Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002E0, Data: 0x00200000
[drm] nouveau 0000:01:00.0: 0xD644: [ (0x90) - INIT_COPY_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002E0, Data: 0x00300000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002E8, Data: 0x00300000
[drm] nouveau 0000:01:00.0: 0xD64D: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD64D: Reg: 0x001002E0, RegIncrement: 0x04, =
Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002E0, Data: 0x00300000
[drm] nouveau 0000:01:00.0: 0xD674: [ (0x90) - INIT_COPY_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002E0, Data: 0x00300000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002E8, Data: 0x00300000
[drm] nouveau 0000:01:00.0: 0xD67D: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD67D: Reg: 0x001002C4, RegIncrement: 0x04, =
Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C4, Data: 0x00100006
[drm] nouveau 0000:01:00.0: 0xD6A4: [ (0x90) - INIT_COPY_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C4, Data: 0x00100006
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002CC, Data: 0x00100006
[drm] nouveau 0000:01:00.0: 0xD6AD: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD6AD: Reg: 0x00100900, RegIncrement: 0x04, =
Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100900, Data: 0x00000101
[drm] nouveau 0000:01:00.0: 0xD6D4: [ (0x39) - INIT_IO_FLAG_CONDITION ]
[drm] nouveau 0000:01:00.0: 0xD6D4: Port: 0x03D4, Index: 0x3C, Mask: 0x70=
, Shift: 0x04, FlagArray: 0x58DC, FAMask: 0x08, Cmpval: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x3C,=
 Head: 0x00, Data: 0x20
[drm] nouveau 0000:01:00.0: 0xD6D4: Checking if 0x00 equals 0x00
[drm] nouveau 0000:01:00.0: 0xD6D4: Condition fulfilled -- continuing to =
execute
[drm] nouveau 0000:01:00.0: 0xD6D6: [ (0x5B) - INIT_SUB_DIRECT ]
[drm] nouveau 0000:01:00.0: 0xD6D6: Executing subroutine at 0xD79D
[drm] nouveau 0000:01:00.0: 0xD79D: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD79D: Reg: 0x00100940, RegIncrement: 0x10, =
Count: 0x06, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100940, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100950, Data: 0xACABAA89
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100960, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100970, Data: 0xACABAA89
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100980, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100990, Data: 0x21411411
[drm] nouveau 0000:01:00.0: 0xD864: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD864: Reg: 0x00100944, RegIncrement: 0x10, =
Count: 0x06, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100944, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100954, Data: 0xBDA8A9AA
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100964, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100974, Data: 0xBDA8A9AA
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100984, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100994, Data: 0x11131221
[drm] nouveau 0000:01:00.0: 0xD92B: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: 0xD6D6: End of 0xD79D subroutine
[drm] nouveau 0000:01:00.0: 0xD6D9: [ (0x38) - INIT_NOT ]
[drm] nouveau 0000:01:00.0: 0xD6D9: ------ Skipping following commands  -=
-----
[drm] nouveau 0000:01:00.0: 0xD6DA: [ (0x5B) - INIT_SUB_DIRECT ]
[drm] nouveau 0000:01:00.0: 0xD6DD: [ (0x72) - INIT_RESUME ]
[drm] nouveau 0000:01:00.0: 0xD6DD: ---- Executing following commands ---=
-
[drm] nouveau 0000:01:00.0: 0xD6DE: [ (0x39) - INIT_IO_FLAG_CONDITION ]
[drm] nouveau 0000:01:00.0: 0xD6DE: Port: 0x03D4, Index: 0x3C, Mask: 0x70=
, Shift: 0x04, FlagArray: 0x58DC, FAMask: 0x10, Cmpval: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x3C,=
 Head: 0x00, Data: 0x20
[drm] nouveau 0000:01:00.0: 0xD6DE: Checking if 0x00 equals 0x00
[drm] nouveau 0000:01:00.0: 0xD6DE: Condition fulfilled -- continuing to =
execute
[drm] nouveau 0000:01:00.0: 0xD6E0: [ (0x5B) - INIT_SUB_DIRECT ]
[drm] nouveau 0000:01:00.0: 0xD6E0: Executing subroutine at 0xDA6D
[drm] nouveau 0000:01:00.0: 0xDA6D: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xDA6D: Reg: 0x00100A00, RegIncrement: 0x04, =
Count: 0x02, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A00, Data: 0x11111111
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A04, Data: 0x11111111
[drm] nouveau 0000:01:00.0: 0xDAB4: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xDAB4: Reg: 0x00100A10, RegIncrement: 0x04, =
Count: 0x02, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A10, Data: 0x45332202
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A14, Data: 0x23103103
[drm] nouveau 0000:01:00.0: 0xDAFB: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: 0xD6E0: End of 0xDA6D subroutine
[drm] nouveau 0000:01:00.0: 0xD6E3: [ (0x72) - INIT_RESUME ]
[drm] nouveau 0000:01:00.0: 0xD6E4: [ (0x39) - INIT_IO_FLAG_CONDITION ]
[drm] nouveau 0000:01:00.0: 0xD6E4: Port: 0x03D4, Index: 0x3C, Mask: 0x70=
, Shift: 0x04, FlagArray: 0x58DC, FAMask: 0x80, Cmpval: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x3C,=
 Head: 0x00, Data: 0x20
[drm] nouveau 0000:01:00.0: 0xD6E4: Checking if 0x00 equals 0x00
[drm] nouveau 0000:01:00.0: 0xD6E4: Condition fulfilled -- continuing to =
execute
[drm] nouveau 0000:01:00.0: 0xD6E6: [ (0x5B) - INIT_SUB_DIRECT ]
[drm] nouveau 0000:01:00.0: 0xD6E6: Executing subroutine at 0xDAFC
[drm] nouveau 0000:01:00.0: 0xDAFC: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xDAFC: Reg: 0x00100A20, RegIncrement: 0x04, =
Count: 0x02, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A20, Data: 0x11011101
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A24, Data: 0x11111111
[drm] nouveau 0000:01:00.0: 0xDB43: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xDB43: Reg: 0x00100A30, RegIncrement: 0x04, =
Count: 0x02, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A30, Data: 0x20F000E2
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100A34, Data: 0x20005010
[drm] nouveau 0000:01:00.0: 0xDB8A: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: 0xD6E6: End of 0xDAFC subroutine
[drm] nouveau 0000:01:00.0: 0xD6E9: [ (0x72) - INIT_RESUME ]
[drm] nouveau 0000:01:00.0: 0xD6EA: [ (0x58) - INIT_ZM_REG_SEQUENCE ]
[drm] nouveau 0000:01:00.0: 0xD6EA: BaseReg: 0x00100920, Count: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100920, Data: 0xCCCCCCCC
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100924, Data: 0xCCCDCCCC
[drm] nouveau 0000:01:00.0: 0xD6F8: [ (0x5B) - INIT_SUB_DIRECT ]
[drm] nouveau 0000:01:00.0: 0xD6F8: Executing subroutine at 0xD755
[drm] nouveau 0000:01:00.0: 0xD755: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD755: Reg: 0x00100930, RegIncrement: 0x04, =
Count: 0x02, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100930, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100934, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xD79C: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: 0xD6F8: End of 0xD755 subroutine
[drm] nouveau 0000:01:00.0: 0xD6FB: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100910, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xD704: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xD704: Reg: 0x00100914, RegIncrement: 0x04, =
Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100914, Data: 0x10000111
[drm] nouveau 0000:01:00.0: 0xD72B: [ (0x58) - INIT_ZM_REG_SEQUENCE ]
[drm] nouveau 0000:01:00.0: 0xD72B: BaseReg: 0x00100080, Count: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100080, Data: 0xF0000020
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100084, Data: 0x0000001D
[drm] nouveau 0000:01:00.0: 0xD739: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100090, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xD742: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001000A0, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xD74B: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001000F0, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xD754: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset 0xDB8B
[drm] nouveau 0000:01:00.0: 0xDB8B: ------ Executing following commands -=
-----
[drm] nouveau 0000:01:00.0: 0xDB8B: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00680D38, Data: 0x80000000
[drm] nouveau 0000:01:00.0: 0xDB94: [ (0x4B) - INIT_PLL2 ]
[drm] nouveau 0000:01:00.0: 0xDB94: Reg: 0x680508, Freq: 36000kHz
[drm] nouveau 0000:01:00.0: Loading PLL limits for reg 0x00000000
[drm] nouveau 0000:01:00.0: pll.vco1.minfreq: 100000
[drm] nouveau 0000:01:00.0: pll.vco1.maxfreq: 300000
[drm] nouveau 0000:01:00.0: pll.vco1.min_inputfreq: 2000
[drm] nouveau 0000:01:00.0: pll.vco1.max_inputfreq: 27000
[drm] nouveau 0000:01:00.0: pll.vco1.min_n: 8
[drm] nouveau 0000:01:00.0: pll.vco1.max_n: 255
[drm] nouveau 0000:01:00.0: pll.vco1.min_m: 1
[drm] nouveau 0000:01:00.0: pll.vco1.max_m: 255
[drm] nouveau 0000:01:00.0: pll.vco2.minfreq: 500000
[drm] nouveau 0000:01:00.0: pll.vco2.maxfreq: 1000000
[drm] nouveau 0000:01:00.0: pll.vco2.min_inputfreq: 25000
[drm] nouveau 0000:01:00.0: pll.vco2.max_inputfreq: 75000
[drm] nouveau 0000:01:00.0: pll.vco2.min_n: 8
[drm] nouveau 0000:01:00.0: pll.vco2.max_n: 50
[drm] nouveau 0000:01:00.0: pll.vco2.min_m: 1
[drm] nouveau 0000:01:00.0: pll.vco2.max_m: 255
[drm] nouveau 0000:01:00.0: pll.max_log2p: 7
[drm] nouveau 0000:01:00.0: pll.log2p_bias: 0
[drm] nouveau 0000:01:00.0: pll.refclk: 27000
[drm] nouveau 0000:01:00.0: 0xDB9D: [ (0x58) - INIT_ZM_REG_SEQUENCE ]
[drm] nouveau 0000:01:00.0: 0xDB9D: BaseReg: 0x00001088, Count: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001088, Data: 0x000011F0
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0000108C, Data: 0x000000D0
[drm] nouveau 0000:01:00.0: 0xDBAB: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDBAB: Reg: 0x00001518, Mask: 0xFFFFFFFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00001518, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001518, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xDBB8: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDBB8: Reg: 0x00001530, Mask: 0xFFFFFFFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00001530, Data: 0x800503FF
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001530, Data: 0x800503FF
[drm] nouveau 0000:01:00.0: 0xDBC5: [ (0x52) - INIT_CR ]
[drm] nouveau 0000:01:00.0: 0xDBC5: Index: 0x2B, Mask: 0x20, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x2B,=
 Head: 0x00, Data: 0x20
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x2B,=
 Head: 0x00, Data: 0x20
[drm] nouveau 0000:01:00.0: 0xDBC9: [ (0x54) - INIT_ZM_CR_GROUP ]
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x38,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x1A,=
 Head: 0x00, Data: 0x3F
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x28,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x33,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x21,=
 Head: 0x00, Data: 0xFA
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x43,=
 Head: 0x00, Data: 0x01
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x52,=
 Head: 0x00, Data: 0x04
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x53,=
 Head: 0x00, Data: 0x40
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x2C,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x3A,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x3B,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x4A,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x4B,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x4C,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 0xDBE7: [ (0x51) - INIT_CR_INDEX_ADDRESS_LATC=
HED ]
[drm] nouveau 0000:01:00.0: 0xDBE7: Index1: 0x57, Index2: 0x58, BaseAddr:=
 0x00, Count: 0x10
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x04
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x7F
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x01
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x02
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x03
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x04
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x05
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x06
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x07
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x08
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x09
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x0A
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x0B
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x0C
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x0D
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x0E
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x0F
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x00, Data: 0x04
[drm] nouveau 0000:01:00.0: 0xDBFC: [ (0x78) - INIT_INDEX_IO ]
[drm] nouveau 0000:01:00.0: 0xDBFC: Port: 0x03D4, Index: 0x85, Mask: 0x00=
, Data: 0xFF
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x85,=
 Head: 0x00, Data: 0xFF
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x85,=
 Head: 0x00, Data: 0xFF
[drm] nouveau 0000:01:00.0: 0xDC02: [ (0x78) - INIT_INDEX_IO ]
[drm] nouveau 0000:01:00.0: 0xDC02: Port: 0x03D4, Index: 0x86, Mask: 0x00=
, Data: 0x01
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x86,=
 Head: 0x00, Data: 0x01
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x86,=
 Head: 0x00, Data: 0x01
[drm] nouveau 0000:01:00.0: 0xDC08: [ (0x53) - INIT_ZM_CR ]
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x44,=
 Head: 0x00, Data: 0x03
[drm] nouveau 0000:01:00.0: 0xDC0B: [ (0x52) - INIT_CR ]
[drm] nouveau 0000:01:00.0: 0xDC0B: Index: 0x2B, Mask: 0x10, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x2B,=
 Head: 0x01, Data: 0x10
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x2B,=
 Head: 0x01, Data: 0x10
[drm] nouveau 0000:01:00.0: 0xDC0F: [ (0x54) - INIT_ZM_CR_GROUP ]
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x33,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x21,=
 Head: 0x01, Data: 0xFA
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x43,=
 Head: 0x01, Data: 0x01
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x2C,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x3A,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x3B,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x3C,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x4A,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x4B,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x4C,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 0xDC25: [ (0x51) - INIT_CR_INDEX_ADDRESS_LATC=
HED ]
[drm] nouveau 0000:01:00.0: 0xDC25: Index1: 0x57, Index2: 0x58, BaseAddr:=
 0x00, Count: 0x10
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x7F
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x01
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x02
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x03
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x04
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x05
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x06
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x07
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x08
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x09
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x0A
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x0B
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x0C
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x0D
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x0E
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x0F
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x58,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x57,=
 Head: 0x01, Data: 0x00
[drm] nouveau 0000:01:00.0: 0xDC3A: [ (0x78) - INIT_INDEX_IO ]
[drm] nouveau 0000:01:00.0: 0xDC3A: Port: 0x03D4, Index: 0x85, Mask: 0x00=
, Data: 0xFF
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x85,=
 Head: 0x01, Data: 0xFF
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x85,=
 Head: 0x01, Data: 0xFF
[drm] nouveau 0000:01:00.0: 0xDC40: [ (0x78) - INIT_INDEX_IO ]
[drm] nouveau 0000:01:00.0: 0xDC40: Port: 0x03D4, Index: 0x86, Mask: 0x00=
, Data: 0x01
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x86,=
 Head: 0x01, Data: 0x01
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x86,=
 Head: 0x01, Data: 0x01
[drm] nouveau 0000:01:00.0: 0xDC46: [ (0x53) - INIT_ZM_CR ]
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x44,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 0xDC49: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDC49: Reg: 0x00001584, Mask: 0xFFF00000, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00001584, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001584, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xDC56: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100210, Data: 0x80000000
[drm] nouveau 0000:01:00.0: 0xDC5F: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDC5F: Reg: 0x0068052C, Mask: 0xFFFFFEFF, Da=
ta: 0x00000001
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x0068052C, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0068052C, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xDC6C: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDC6C: Reg: 0x0068252C, Mask: 0xFFFFFFFF, Da=
ta: 0x00000101
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x0068252C, Data: 0x00000100
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0068252C, Data: 0x00000101
[drm] nouveau 0000:01:00.0: 0xDC79: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDC79: Reg: 0x00680848, Mask: 0xFFFFFFFF, Da=
ta: 0x00100000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00680848, Data: 0x15100011
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00680848, Data: 0x15100011
[drm] nouveau 0000:01:00.0: 0xDC86: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDC86: Reg: 0x00682848, Mask: 0xFFFFFFFF, Da=
ta: 0x00100000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00682848, Data: 0x15100011
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00682848, Data: 0x15100011
[drm] nouveau 0000:01:00.0: 0xDC93: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDC93: Reg: 0x00680880, Mask: 0xFFFBFFFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00680880, Data: 0x01101191
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00680880, Data: 0x01101191
[drm] nouveau 0000:01:00.0: 0xDCA0: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDCA0: Reg: 0x00682880, Mask: 0xDFFBFFFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00682880, Data: 0x01101111
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00682880, Data: 0x01101111
[drm] nouveau 0000:01:00.0: 0xDCAD: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00001200, Data: 0x0003103C
[drm] nouveau 0000:01:00.0: 0xDCB6: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset 0xDD0F
[drm] nouveau 0000:01:00.0: 0xDD0F: ------ Executing following commands -=
-----
[drm] nouveau 0000:01:00.0: 0xDD0F: [ (0x5B) - INIT_SUB_DIRECT ]
[drm] nouveau 0000:01:00.0: 0xDD0F: Executing subroutine at 0x28B2
[drm] nouveau 0000:01:00.0: 0x28B2: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: 0xDD0F: End of 0x28B2 subroutine
[drm] nouveau 0000:01:00.0: 0xDD12: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xDD12: Reg: 0x001002C0, RegIncrement: 0x04, =
Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C0, Data: 0x00000B52
[drm] nouveau 0000:01:00.0: 0xDD39: [ (0x90) - INIT_COPY_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C0, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C8, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 0xDD42: [ (0x74) - INIT_TIME ]
[drm] nouveau 0000:01:00.0: 0xDD42: Sleeping for 0x03E8 microseconds
[drm] nouveau 0000:01:00.0: 0xDD45: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xDD45: Macro: 0x00, MacroTableIndex: 0x00, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D4, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xDD47: [ (0x33) - INIT_REPEAT ]
[drm] nouveau 0000:01:00.0: 0xDD47: Repeating following segment 10 times
[drm] nouveau 0000:01:00.0: 0xDD49: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xDD49: Macro: 0x02, MacroTableIndex: 0x02, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D0, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xDD4B: [ (0x36) - INIT_END_REPEAT ]
[drm] nouveau 0000:01:00.0: 0xDD49: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xDD49: Macro: 0x02, MacroTableIndex: 0x02, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D0, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xDD4B: [ (0x36) - INIT_END_REPEAT ]
[drm] nouveau 0000:01:00.0: 0xDD49: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xDD49: Macro: 0x02, MacroTableIndex: 0x02, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D0, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xDD4B: [ (0x36) - INIT_END_REPEAT ]
[drm] nouveau 0000:01:00.0: 0xDD49: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xDD49: Macro: 0x02, MacroTableIndex: 0x02, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D0, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xDD4B: [ (0x36) - INIT_END_REPEAT ]
[drm] nouveau 0000:01:00.0: 0xDD49: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xDD49: Macro: 0x02, MacroTableIndex: 0x02, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D0, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xDD4B: [ (0x36) - INIT_END_REPEAT ]
[drm] nouveau 0000:01:00.0: 0xDD49: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xDD49: Macro: 0x02, MacroTableIndex: 0x02, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D0, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xDD4B: [ (0x36) - INIT_END_REPEAT ]
[drm] nouveau 0000:01:00.0: 0xDD49: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xDD49: Macro: 0x02, MacroTableIndex: 0x02, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D0, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xDD4B: [ (0x36) - INIT_END_REPEAT ]
[drm] nouveau 0000:01:00.0: 0xDD49: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xDD49: Macro: 0x02, MacroTableIndex: 0x02, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D0, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xDD4B: [ (0x36) - INIT_END_REPEAT ]
[drm] nouveau 0000:01:00.0: 0xDD49: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xDD49: Macro: 0x02, MacroTableIndex: 0x02, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D0, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xDD4B: [ (0x36) - INIT_END_REPEAT ]
[drm] nouveau 0000:01:00.0: 0xDD49: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xDD49: Macro: 0x02, MacroTableIndex: 0x02, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002D0, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xDD4B: [ (0x36) - INIT_END_REPEAT ]
[drm] nouveau 0000:01:00.0: 0xDD4C: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDD4C: Reg: 0x001002C0, Mask: 0xFFFFFEFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C0, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C0, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 0xDD59: [ (0x90) - INIT_COPY_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C0, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C8, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 0xDD62: [ (0x74) - INIT_TIME ]
[drm] nouveau 0000:01:00.0: 0xDD62: Sleeping for 0x0064 microseconds
[drm] nouveau 0000:01:00.0: 0xDD65: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xDD65: Macro: 0x04, MacroTableIndex: 0x04, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002DC, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 0xDD67: [ (0x6B) - INIT_SUB ]
[drm] nouveau 0000:01:00.0: 0xDD67: Calling script 7
[drm] nouveau 0000:01:00.0: 0xDCE3: [ (0x4A) - INIT_IO_RESTRICT_PLL2 ]
[drm] nouveau 0000:01:00.0: 0xDCE3: Port: 0x03D4, Index: 0x3C, Mask: 0x70=
, Shift: 0x04, Count: 0x08, Reg: 0x00004024
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x3C,=
 Head: 0x00, Data: 0x20
[drm] nouveau 0000:01:00.0: 0xDCE3: Reg: 0x00004024, Config: 0x02, Freq: =
270000kHz
[drm] nouveau 0000:01:00.0: Loading PLL limits for reg 0x00004020
[drm] nouveau 0000:01:00.0: pll.vco1.minfreq: 400000
[drm] nouveau 0000:01:00.0: pll.vco1.maxfreq: 800000
[drm] nouveau 0000:01:00.0: pll.vco1.min_inputfreq: 5000
[drm] nouveau 0000:01:00.0: pll.vco1.max_inputfreq: 75000
[drm] nouveau 0000:01:00.0: pll.vco1.min_n: 8
[drm] nouveau 0000:01:00.0: pll.vco1.max_n: 255
[drm] nouveau 0000:01:00.0: pll.vco1.min_m: 1
[drm] nouveau 0000:01:00.0: pll.vco1.max_m: 255
[drm] nouveau 0000:01:00.0: pll.vco2.minfreq: 400000
[drm] nouveau 0000:01:00.0: pll.vco2.maxfreq: 800000
[drm] nouveau 0000:01:00.0: pll.vco2.min_inputfreq: 0
[drm] nouveau 0000:01:00.0: pll.vco2.max_inputfreq: 800000
[drm] nouveau 0000:01:00.0: pll.vco2.min_n: 1
[drm] nouveau 0000:01:00.0: pll.vco2.max_n: 1
[drm] nouveau 0000:01:00.0: pll.vco2.min_m: 1
[drm] nouveau 0000:01:00.0: pll.vco2.max_m: 1
[drm] nouveau 0000:01:00.0: pll.max_log2p: 7
[drm] nouveau 0000:01:00.0: pll.log2p_bias: 3
[drm] nouveau 0000:01:00.0: pll.refclk: 27000
[drm] nouveau 0000:01:00.0: 0xDD0E: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: 0xDD67: End of script 7
[drm] nouveau 0000:01:00.0: 0xDD69: [ (0x74) - INIT_TIME ]
[drm] nouveau 0000:01:00.0: 0xDD69: Sleeping for 0x03E8 microseconds
[drm] nouveau 0000:01:00.0: 0xDD6C: [ (0x6F) - INIT_MACRO ]
[drm] nouveau 0000:01:00.0: 0xDD6C: Macro: 0x05, MacroTableIndex: 0x05, C=
ount: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002DC, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xDD6E: [ (0x6B) - INIT_SUB ]
[drm] nouveau 0000:01:00.0: 0xDD6E: Calling script 8
[drm] nouveau 0000:01:00.0: 0x5BE8: [ (0x78) - INIT_INDEX_IO ]
[drm] nouveau 0000:01:00.0: 0x5BE8: Port: 0x03D4, Index: 0x44, Mask: 0x00=
, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x44,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x44,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 0x5BEE: [ (0x39) - INIT_IO_FLAG_CONDITION ]
[drm] nouveau 0000:01:00.0: 0x5BEE: Port: 0x03D4, Index: 0x3C, Mask: 0x70=
, Shift: 0x04, FlagArray: 0x58DC, FAMask: 0x20, Cmpval: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x3C,=
 Head: 0x00, Data: 0x20
[drm] nouveau 0000:01:00.0: 0x5BEE: Checking if 0x00 equals 0x00
[drm] nouveau 0000:01:00.0: 0x5BEE: Condition fulfilled -- continuing to =
execute
[drm] nouveau 0000:01:00.0: 0x5BF0: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0x5BF0: Reg: 0x001002C8, Mask: 0xFFFFFEFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C8, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C8, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 0x5BFD: [ (0x90) - INIT_COPY_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C8, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C0, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 0x5C06: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0x5C06: Reg: 0x001002C8, Mask: 0xFFFFFFFF, Da=
ta: 0x00000100
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C8, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C8, Data: 0x00000B52
[drm] nouveau 0000:01:00.0: 0x5C13: [ (0x90) - INIT_COPY_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C8, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C0, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 0x5C1C: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0x5C1C: Reg: 0x001002C8, Mask: 0xFFFFFEFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C8, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C8, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 0x5C29: [ (0x90) - INIT_COPY_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C8, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C0, Data: 0x00000A52
[drm] nouveau 0000:01:00.0: 0x5C32: [ (0x72) - INIT_RESUME ]
[drm] nouveau 0000:01:00.0: 0x5C33: [ (0x39) - INIT_IO_FLAG_CONDITION ]
[drm] nouveau 0000:01:00.0: 0x5C33: Port: 0x03D4, Index: 0x3C, Mask: 0x70=
, Shift: 0x04, FlagArray: 0x58DC, FAMask: 0x2F, Cmpval: 0x03
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03D4, Index: 0x3C,=
 Head: 0x00, Data: 0x20
[drm] nouveau 0000:01:00.0: 0x5C33: Checking if 0x02 equals 0x03
[drm] nouveau 0000:01:00.0: 0x5C33: Condition not fulfilled -- skipping f=
ollowing commands
[drm] nouveau 0000:01:00.0: 0x5C35: [ (0x74) - INIT_TIME ]
[drm] nouveau 0000:01:00.0: 0x5C38: [ (0x72) - INIT_RESUME ]
[drm] nouveau 0000:01:00.0: 0x5C38: ---- Executing following commands ---=
-
[drm] nouveau 0000:01:00.0: 0x5C39: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: 0xDD6E: End of script 8
[drm] nouveau 0000:01:00.0: 0xDD70: [ (0x74) - INIT_TIME ]
[drm] nouveau 0000:01:00.0: 0xDD70: Sleeping for 0x03E8 microseconds
[drm] nouveau 0000:01:00.0: 0xDD73: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xDD73: Reg: 0x001004E0, RegIncrement: 0x04, =
Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001004E0, Data: 0x8030010B
[drm] nouveau 0000:01:00.0: 0xDD9A: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDD9A: Reg: 0x00100200, Mask: 0xFFFFFFFF, Da=
ta: 0x10000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00100200, Data: 0x53003071
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100200, Data: 0x53003071
[drm] nouveau 0000:01:00.0: 0xDDA7: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100210, Data: 0x80000001
[drm] nouveau 0000:01:00.0: 0xDDB0: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xDDB0: Reg: 0x001002C4, RegIncrement: 0x04, =
Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C4, Data: 0x00100386
[drm] nouveau 0000:01:00.0: 0xDDD7: [ (0x90) - INIT_COPY_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C4, Data: 0x00100006
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002CC, Data: 0x00100006
[drm] nouveau 0000:01:00.0: 0xDDE0: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_G=
ROUP ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00101000, Data: 0xA340EE8B
[drm] nouveau 0000:01:00.0: 0xDDE0: Reg: 0x001002C4, RegIncrement: 0x04, =
Count: 0x01, StrapRamCfg: 0x02, Index: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002C4, Data: 0x00100006
[drm] nouveau 0000:01:00.0: 0xDE07: [ (0x90) - INIT_COPY_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x001002C4, Data: 0x00100006
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x001002CC, Data: 0x00100006
[drm] nouveau 0000:01:00.0: 0xDE10: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0070FFF0, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xDE19: [ (0x63) - INIT_COMPUTE_MEM ]
[drm] nouveau 0000:01:00.0: 0xDE1A: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDE1A: Reg: 0x00100200, Mask: 0xFFFFFFFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00100200, Data: 0x53003071
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100200, Data: 0x53003071
[drm] nouveau 0000:01:00.0: 0xDE27: [ (0x78) - INIT_INDEX_IO ]
[drm] nouveau 0000:01:00.0: 0xDE27: Port: 0x03C4, Index: 0x01, Mask: 0xDF=
, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO read:  Port: 0x03C4, Index: 0x01,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03C4, Index: 0x01,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 0xDE2D: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDE2D: Reg: 0x0000C040, Mask: 0xFFF3FC00, Da=
ta: 0x000803FF
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x0000C040, Data: 0x3C0B07FF
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0000C040, Data: 0x3C0B07FF
[drm] nouveau 0000:01:00.0: 0xDE3A: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDE3A: Reg: 0x00088138, Mask: 0xBFFFFC01, Da=
ta: 0x00000100
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00088138, Data: 0x00000100
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00088138, Data: 0x00000100
[drm] nouveau 0000:01:00.0: 0xDE47: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDE47: Reg: 0x0008813C, Mask: 0xF0FFFFFF, Da=
ta: 0x07000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x0008813C, Data: 0x07000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x0008813C, Data: 0x07000000
[drm] nouveau 0000:01:00.0: 0xDE54: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDE54: Reg: 0x00011014, Mask: 0xFFFF7FFF, Da=
ta: 0x00008000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00011014, Data: 0x0000B6C8
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00011014, Data: 0x0000B6C8
[drm] nouveau 0000:01:00.0: 0xDE61: [ (0x7A) - INIT_ZM_REG ]
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00680524, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xDE6A: [ (0x5B) - INIT_SUB_DIRECT ]
[drm] nouveau 0000:01:00.0: 0xDE6A: Executing subroutine at 0xC28A
[drm] nouveau 0000:01:00.0: 0xC28A: [ (0x50) - INIT_ZM_TMDS_GROUP ]
[drm] nouveau 0000:01:00.0: 0xC28A: MagicLookupValue: 0x00, Count: 0x03
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x00000043
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x000000FE
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x00000033
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x000000FB
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x0000002F
[drm] nouveau 0000:01:00.0: 0xC293: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: 0xDE6A: End of 0xC28A subroutine
[drm] nouveau 0000:01:00.0: 0xDE6D: [ (0x5B) - INIT_SUB_DIRECT ]
[drm] nouveau 0000:01:00.0: 0xDE6D: Executing subroutine at 0xC294
[drm] nouveau 0000:01:00.0: 0xC294: [ (0x50) - INIT_ZM_TMDS_GROUP ]
[drm] nouveau 0000:01:00.0: 0xC294: MagicLookupValue: 0x02, Count: 0x03
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006828B4, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006828B0, Data: 0x00000043
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006828B4, Data: 0x000000FE
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006828B0, Data: 0x00000033
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006828B4, Data: 0x000000FB
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006828B0, Data: 0x0000002F
[drm] nouveau 0000:01:00.0: 0xC29D: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: 0xDE6D: End of 0xC294 subroutine
[drm] nouveau 0000:01:00.0: 0xDE70: [ (0x75) - INIT_CONDITION ]
[drm] nouveau 0000:01:00.0: 0xDE70: Condition: 0x03
[drm] nouveau 0000:01:00.0: 0xDE70: Cond: 0x03, Reg: 0x00000000, Mask: 0x=
000000FF
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00000000, Data: 0x04B200B1
[drm] nouveau 0000:01:00.0: 0xDE70: Checking if 0x000000B1 equals 0x00000=
0A1
[drm] nouveau 0000:01:00.0: 0xDE70: Condition not fulfilled -- skipping f=
ollowing commands
[drm] nouveau 0000:01:00.0: 0xDE72: [ (0x38) - INIT_NOT ]
[drm] nouveau 0000:01:00.0: 0xDE72: ------ Executing following commands -=
-----
[drm] nouveau 0000:01:00.0: 0xDE73: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xDE73: Reg: 0x00100360, Mask: 0xFF00FFFF, Da=
ta: 0x00300000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00100360, Data: 0x8B303A98
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00100360, Data: 0x8B303A98
[drm] nouveau 0000:01:00.0: 0xDE80: [ (0x72) - INIT_RESUME ]
[drm] nouveau 0000:01:00.0: 0xDE81: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset 0xDF1B
[drm] nouveau 0000:01:00.0: 0xDF1B: ------ Executing following commands -=
-----
[drm] nouveau 0000:01:00.0: 0xDF1B: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: Detected 512MiB VRAM
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_early_init:280 -=20
[drm] nouveau 0000:01:00.0: nv04_instmem_determine_amount:49 - RAMIN size=
: 2048KiB
[drm] nouveau 0000:01:00.0: nv04_instmem_configure_fixed_tables:71 - RAMH=
T offset=3D0x10000, size=3D4096
[drm] nouveau 0000:01:00.0: nv04_instmem_configure_fixed_tables:77 - RAMR=
O offset=3D0x11200, size=3D512
[drm] nouveau 0000:01:00.0: nv04_instmem_configure_fixed_tables:100 - RAM=
FC offset=3D0x20000, size=3D4096
[TTM] Zone  kernel: Available graphics memory: 446486 kiB.
[TTM] Zone highmem: Available graphics memory: 516058 kiB.
[TTM] Initializing pool allocator.
agpgart-intel 0000:00:00.0: AGP 1.0 bridge
agpgart-intel 0000:00:00.0: putting AGP V2 device into 2x mode
nouveau 0000:01:00.0: putting AGP V2 device into 2x mode
[drm] nouveau 0000:01:00.0: 64 MiB GART (aperture)
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_init:293 -=20
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new_fake:562 - p_offset=3D0x00=
010000 b_offset=3D0xffffffff size=3D0x00001000 flags=3D0x00000003
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new_fake:567 - gpuobj f675c600
[drm] nouveau 0000:01:00.0: nv04_display_create:122 -=20
[drm] nouveau 0000:01:00.0: Saving VGA fonts
[drm] nouveau 0000:01:00.0: nouveau_connector_create:737 -=20
[drm] nouveau 0000:01:00.0: nouveau_connector_create:737 -=20
[drm] nouveau 0000:01:00.0: nouveau_connector_create:737 -=20
[drm] nouveau 0000:01:00.0: nouveau_connector_create:737 -=20
[drm] nouveau 0000:01:00.0: Loading PLL limits for reg 0x00000000
[drm] nouveau 0000:01:00.0: pll.vco1.minfreq: 100000
[drm] nouveau 0000:01:00.0: pll.vco1.maxfreq: 300000
[drm] nouveau 0000:01:00.0: pll.vco1.min_inputfreq: 2000
[drm] nouveau 0000:01:00.0: pll.vco1.max_inputfreq: 27000
[drm] nouveau 0000:01:00.0: pll.vco1.min_n: 8
[drm] nouveau 0000:01:00.0: pll.vco1.max_n: 255
[drm] nouveau 0000:01:00.0: pll.vco1.min_m: 1
[drm] nouveau 0000:01:00.0: pll.vco1.max_m: 255
[drm] nouveau 0000:01:00.0: pll.vco2.minfreq: 500000
[drm] nouveau 0000:01:00.0: pll.vco2.maxfreq: 1000000
[drm] nouveau 0000:01:00.0: pll.vco2.min_inputfreq: 25000
[drm] nouveau 0000:01:00.0: pll.vco2.max_inputfreq: 75000
[drm] nouveau 0000:01:00.0: pll.vco2.min_n: 8
[drm] nouveau 0000:01:00.0: pll.vco2.max_n: 50
[drm] nouveau 0000:01:00.0: pll.vco2.min_m: 1
[drm] nouveau 0000:01:00.0: pll.vco2.max_m: 255
[drm] nouveau 0000:01:00.0: pll.max_log2p: 7
[drm] nouveau 0000:01:00.0: pll.log2p_bias: 0
[drm] nouveau 0000:01:00.0: pll.refclk: 27000
[drm] nouveau 0000:01:00.0: Loading PLL limits for reg 0x00000000
[drm] nouveau 0000:01:00.0: pll.vco1.minfreq: 100000
[drm] nouveau 0000:01:00.0: pll.vco1.maxfreq: 300000
[drm] nouveau 0000:01:00.0: pll.vco1.min_inputfreq: 2000
[drm] nouveau 0000:01:00.0: pll.vco1.max_inputfreq: 27000
[drm] nouveau 0000:01:00.0: pll.vco1.min_n: 8
[drm] nouveau 0000:01:00.0: pll.vco1.max_n: 255
[drm] nouveau 0000:01:00.0: pll.vco1.min_m: 1
[drm] nouveau 0000:01:00.0: pll.vco1.max_m: 255
[drm] nouveau 0000:01:00.0: pll.vco2.minfreq: 500000
[drm] nouveau 0000:01:00.0: pll.vco2.maxfreq: 1000000
[drm] nouveau 0000:01:00.0: pll.vco2.min_inputfreq: 25000
[drm] nouveau 0000:01:00.0: pll.vco2.max_inputfreq: 75000
[drm] nouveau 0000:01:00.0: pll.vco2.min_n: 8
[drm] nouveau 0000:01:00.0: pll.vco2.max_n: 50
[drm] nouveau 0000:01:00.0: pll.vco2.min_m: 1
[drm] nouveau 0000:01:00.0: pll.vco2.max_m: 255
[drm] nouveau 0000:01:00.0: pll.max_log2p: 7
[drm] nouveau 0000:01:00.0: pll.log2p_bias: 0
[drm] nouveau 0000:01:00.0: pll.refclk: 27000
[drm] nouveau 0000:01:00.0: Allocating FIFO number 0
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_channel_init:944 - ch0 vram=3D=
0x80000002 tt=3D0x80000003
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_channel_init_pramin:894 - ch0
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:212 - ch-1 size=3D166732 a=
lign=3D4096 flags=3D0x00000000
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:220 - gpuobj f67d83c0
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:235 - global heap
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch-1 h=3D0x00000=
000 gpuobj=3Df67d83c0
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch-1 h=3D0x00000=
000 gpuobj=3Df675c600
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:660 - ch0 class=3D0x00=
3d offset=3D0x0 size=3D0x1fe00000
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:661 - access=3D0 targe=
t=3D0
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:212 - ch0 size=3D32 align=3D=
16 flags=3D0x00000006
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:220 - gpuobj f67d8480
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:232 - channel heap
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch0 h=3D0x800000=
02 gpuobj=3Df67d8480
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 - ch0 handle=3D0=
x80000002
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 - hash=3D0x00000=
090
[drm] nouveau 0000:01:00.0: nouveau_ramht_insert:140 - insert ch0 0x00000=
090: h=3D0x80000002, c=3D0x00004000
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:660 - ch0 class=3D0x00=
3d offset=3D0x0 size=3D0x4000000
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:661 - access=3D0 targe=
t=3D3
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:212 - ch0 size=3D32 align=3D=
16 flags=3D0x00000006
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:220 - gpuobj f67d8500
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:232 - channel heap
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch0 h=3D0x800000=
03 gpuobj=3Df67d8500
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 - ch0 handle=3D0=
x80000003
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 - hash=3D0x00000=
098
[drm] nouveau 0000:01:00.0: nouveau_ramht_insert:140 - insert ch0 0x00000=
098: h=3D0x80000003, c=3D0x00004002
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:660 - ch0 class=3D0x00=
3d offset=3D0x0 size=3D0x4000000
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:661 - access=3D1 targe=
t=3D3
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:212 - ch0 size=3D32 align=3D=
16 flags=3D0x00000006
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:220 - gpuobj f67d8580
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:232 - channel heap
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch0 h=3D0x000000=
00 gpuobj=3Df67d8580
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:212 - ch0 size=3D162636 al=
ign=3D16 flags=3D0x00000002
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:220 - gpuobj f67d8600
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:232 - channel heap
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch-1 h=3D0x00000=
000 gpuobj=3Df67d8600
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new_fake:562 - p_offset=3D0x00=
020000 b_offset=3D0xffffffff size=3D0x00000080 flags=3D0x00000006
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new_fake:567 - gpuobj f67d8680
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch-1 h=3D0x00000=
000 gpuobj=3Df67d8680
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:819 - ch0 class=3D0x003=
9
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:212 - ch0 size=3D32 align=3D=
16 flags=3D0x00000006
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:220 - gpuobj f67d8700
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:232 - channel heap
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch0 h=3D0x800000=
01 gpuobj=3Df67d8700
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 - ch0 handle=3D0=
x80000001
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 - hash=3D0x00000=
088
[drm] nouveau 0000:01:00.0: nouveau_ramht_insert:140 - insert ch0 0x00000=
088: h=3D0x80000001, c=3D0x001067bb
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch0 h=3D0x800000=
0e gpuobj=3Df67d87c0
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 - ch0 handle=3D0=
x8000000e
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 - hash=3D0x00000=
0f0
[drm] nouveau 0000:01:00.0: nouveau_ramht_insert:140 - insert ch0 0x00000=
0f0: h=3D0x8000000e, c=3D0x00000004
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:660 - ch0 class=3D0x00=
3d offset=3D0x10000 size=3D0x20
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:661 - access=3D0 targe=
t=3D3
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:212 - ch0 size=3D32 align=3D=
16 flags=3D0x00000006
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:220 - gpuobj f67d8840
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:232 - channel heap
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch0 h=3D0x800000=
06 gpuobj=3Df67d8840
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 - ch0 handle=3D0=
x80000006
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 - hash=3D0x00000=
0b0
[drm] nouveau 0000:01:00.0: nouveau_ramht_insert:140 - insert ch0 0x00000=
0b0: h=3D0x80000006, c=3D0x000067bd
[drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 0
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:660 - ch0 class=3D0x00=
3d offset=3D0x0 size=3D0x20000000
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:661 - access=3D0 targe=
t=3D0
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:212 - ch0 size=3D32 align=3D=
16 flags=3D0x00000006
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:220 - gpuobj f67d8940
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:232 - channel heap
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch0 h=3D0x800000=
04 gpuobj=3Df67d8940
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 - ch0 handle=3D0=
x80000004
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 - hash=3D0x00000=
0a0
[drm] nouveau 0000:01:00.0: nouveau_ramht_insert:140 - insert ch0 0x00000=
0a0: h=3D0x80000004, c=3D0x000067bf
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:660 - ch0 class=3D0x00=
3d offset=3D0x0 size=3D0x4000000
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:661 - access=3D0 targe=
t=3D3
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:212 - ch0 size=3D32 align=3D=
16 flags=3D0x00000006
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:220 - gpuobj f67d89c0
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:232 - channel heap
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch0 h=3D0x800000=
05 gpuobj=3Df67d89c0
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 - ch0 handle=3D0=
x80000005
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 - hash=3D0x00000=
0a8
[drm] nouveau 0000:01:00.0: nouveau_ramht_insert:140 - insert ch0 0x00000=
0a8: h=3D0x80000005, c=3D0x000067c1
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 1=
)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 2)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on TV encoder (output 3)
[drm] nouveau 0000:01:00.0: nv_crtc_dpms:165 - Setting dpms mode 3 on CRT=
C 0
[drm] nouveau 0000:01:00.0: nv_crtc_dpms:165 - Setting dpms mode 3 on CRT=
C 1
[drm:drm_helper_probe_single_connector_modes], DVI-I-1
[drm] nouveau 0000:01:00.0: nouveau_connector_native_mode:454 - native mo=
de from preferred
[drm:drm_helper_probe_single_connector_modes], Probed modes for DVI-I-1
[drm:drm_mode_debug_printmodeline], Modeline 30:"1280x1024" 60 108000 128=
0 1328 1440 1688 1024 1025 1028 1066 0x48 0x5
[drm:drm_mode_debug_printmodeline], Modeline 42:"1152x864" 75 108000 1152=
 1216 1344 1600 864 865 868 900 0x40 0x5
[drm:drm_mode_debug_printmodeline], Modeline 38:"1024x768" 75 78800 1024 =
1040 1136 1312 768 769 772 800 0x40 0x5
[drm:drm_mode_debug_printmodeline], Modeline 33:"1024x768" 75 78750 1024 =
1040 1136 1312 768 769 772 800 0x40 0x5
[drm:drm_mode_debug_printmodeline], Modeline 39:"1024x768" 60 65000 1024 =
1048 1184 1344 768 771 777 806 0x40 0xa
[drm:drm_mode_debug_printmodeline], Modeline 40:"832x624" 75 57284 832 86=
4 928 1152 624 625 628 667 0x40 0xa
[drm:drm_mode_debug_printmodeline], Modeline 41:"800x600" 75 49500 800 81=
6 896 1056 600 601 604 625 0x40 0x5
[drm:drm_mode_debug_printmodeline], Modeline 34:"800x600" 60 40000 800 84=
0 968 1056 600 601 605 628 0x40 0x5
[drm:drm_mode_debug_printmodeline], Modeline 35:"640x480" 75 31500 640 65=
6 720 840 480 481 484 500 0x40 0xa
[drm:drm_mode_debug_printmodeline], Modeline 36:"640x480" 60 25200 640 65=
6 752 800 480 490 492 525 0x40 0xa
[drm:drm_mode_debug_printmodeline], Modeline 37:"720x400" 70 28320 720 73=
8 846 900 400 412 414 449 0x40 0x6
[drm:drm_helper_probe_single_connector_modes], VGA-1
[drm:drm_helper_probe_single_connector_modes], VGA-1 is disconnected
[drm:drm_helper_probe_single_connector_modes], TV-1
[drm:drm_helper_probe_single_connector_modes], TV-1 is disconnected
[drm:drm_setup_crtcs],=20
[drm:drm_enable_connectors], connector 7 enabled? yes
[drm:drm_enable_connectors], connector 12 enabled? no
[drm:drm_enable_connectors], connector 14 enabled? no
[drm:drm_target_preferred], looking for cmdline mode on connector 7
[drm:drm_target_preferred], looking for preferred mode on connector 7
[drm:drm_target_preferred], found mode 1280x1024
[drm:drm_setup_crtcs], picking CRTCs for 4096x4096 config
[drm:drm_setup_crtcs], desired mode 1280x1024 set on crtc 5
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:819 - ch0 class=3D0x006=
2
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:212 - ch0 size=3D32 align=3D=
16 flags=3D0x00000006
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:220 - gpuobj f66ec1c0
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:232 - channel heap
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch0 h=3D0x800000=
08 gpuobj=3Df66ec1c0
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 - ch0 handle=3D0=
x80000008
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 - hash=3D0x00000=
0c0
[drm] nouveau 0000:01:00.0: nouveau_ramht_insert:140 - insert ch0 0x00000=
0c0: h=3D0x80000008, c=3D0x001067c3
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:819 - ch0 class=3D0x001=
9
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:212 - ch0 size=3D32 align=3D=
16 flags=3D0x00000006
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:220 - gpuobj f66ec000
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:232 - channel heap
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch0 h=3D0x800000=
0b gpuobj=3Df66ec000
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 - ch0 handle=3D0=
x8000000b
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 - hash=3D0x00000=
0d8
[drm] nouveau 0000:01:00.0: nouveau_ramht_insert:140 - insert ch0 0x00000=
0d8: h=3D0x8000000b, c=3D0x001067c5
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:819 - ch0 class=3D0x004=
3
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:212 - ch0 size=3D32 align=3D=
16 flags=3D0x00000006
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:220 - gpuobj f66ec880
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:232 - channel heap
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch0 h=3D0x800000=
09 gpuobj=3Df66ec880
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 - ch0 handle=3D0=
x80000009
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 - hash=3D0x00000=
0c8
[drm] nouveau 0000:01:00.0: nouveau_ramht_insert:140 - insert ch0 0x00000=
0c8: h=3D0x80000009, c=3D0x001067c7
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:819 - ch0 class=3D0x004=
4
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:212 - ch0 size=3D32 align=3D=
16 flags=3D0x00000006
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:220 - gpuobj f66ec680
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:232 - channel heap
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch0 h=3D0x800000=
0a gpuobj=3Df66ec680
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 - ch0 handle=3D0=
x8000000a
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 - hash=3D0x00000=
0d0
[drm] nouveau 0000:01:00.0: nouveau_ramht_insert:140 - insert ch0 0x00000=
0d0: h=3D0x8000000a, c=3D0x001067c9
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:819 - ch0 class=3D0x004=
a
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:212 - ch0 size=3D32 align=3D=
16 flags=3D0x00000006
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:220 - gpuobj f66ec940
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:232 - channel heap
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch0 h=3D0x800000=
0c gpuobj=3Df66ec940
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 - ch0 handle=3D0=
x8000000c
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 - hash=3D0x00000=
0e0
[drm] nouveau 0000:01:00.0: nouveau_ramht_insert:140 - insert ch0 0x00000=
0e0: h=3D0x8000000c, c=3D0x001067cb
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_gr_new:819 - ch0 class=3D0x009=
f
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:212 - ch0 size=3D32 align=3D=
16 flags=3D0x00000006
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:220 - gpuobj f66ecf40
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:232 - channel heap
[drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:439 - ch0 h=3D0x800000=
0d gpuobj=3Df66ecf40
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 - ch0 handle=3D0=
x8000000d
[drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 - hash=3D0x00000=
0e8
[drm] nouveau 0000:01:00.0: nouveau_ramht_insert:140 - insert ch0 0x00000=
0e8: h=3D0x8000000d, c=3D0x001067cd
[drm] nouveau 0000:01:00.0: allocated 1280x1024 fb: 0x48000, bo f66ca000
[drm:drm_crtc_helper_set_config],=20
[drm:drm_crtc_helper_set_config], crtc: f64ab000 5 fb: f658bb78 connector=
s: f6ad0d30 num_connectors: 1 (x, y) (0, 0)
[drm:drm_crtc_helper_set_config], crtc has no fb, full mode set
[drm:drm_crtc_helper_set_config], modes are different, full mode set
[drm:drm_mode_debug_printmodeline], Modeline 0:"" 0 0 0 0 0 0 0 0 0 0 0x0=
 0x0
[drm:drm_mode_debug_printmodeline], Modeline 31:"1280x1024" 60 108000 128=
0 1328 1440 1688 1024 1025 1028 1066 0x48 0x5
[drm:drm_crtc_helper_set_config], encoder changed, full mode switch
[drm:drm_crtc_helper_set_config], crtc changed, full mode switch
[drm:drm_crtc_helper_set_config], setting connector 7 crtc to f64ab000
[drm:drm_crtc_helper_set_config], attempting to set mode from userspace
[drm:drm_mode_debug_printmodeline], Modeline 31:"1280x1024" 60 108000 128=
0 1328 1440 1688 1024 1025 1028 1066 0x48 0x5
[drm] nouveau 0000:01:00.0: nv_crtc_dpms:165 - Setting dpms mode 3 on CRT=
C 0
[drm] nouveau 0000:01:00.0: nv_crtc_mode_set:614 - CTRC mode on CRTC 0:
[drm:drm_mode_debug_printmodeline], Modeline 44:"1280x1024" 60 108000 128=
0 1328 1440 1688 1024 1025 1028 1066 0x48 0x5
[drm] nouveau 0000:01:00.0: Loading PLL limits for reg 0x00000000
[drm] nouveau 0000:01:00.0: pll.vco1.minfreq: 100000
[drm] nouveau 0000:01:00.0: pll.vco1.maxfreq: 300000
[drm] nouveau 0000:01:00.0: pll.vco1.min_inputfreq: 2000
[drm] nouveau 0000:01:00.0: pll.vco1.max_inputfreq: 27000
[drm] nouveau 0000:01:00.0: pll.vco1.min_n: 8
[drm] nouveau 0000:01:00.0: pll.vco1.max_n: 255
[drm] nouveau 0000:01:00.0: pll.vco1.min_m: 1
[drm] nouveau 0000:01:00.0: pll.vco1.max_m: 255
[drm] nouveau 0000:01:00.0: pll.vco2.minfreq: 500000
[drm] nouveau 0000:01:00.0: pll.vco2.maxfreq: 1000000
[drm] nouveau 0000:01:00.0: pll.vco2.min_inputfreq: 25000
[drm] nouveau 0000:01:00.0: pll.vco2.max_inputfreq: 75000
[drm] nouveau 0000:01:00.0: pll.vco2.min_n: 8
[drm] nouveau 0000:01:00.0: pll.vco2.max_n: 50
[drm] nouveau 0000:01:00.0: pll.vco2.min_m: 1
[drm] nouveau 0000:01:00.0: pll.vco2.max_m: 255
[drm] nouveau 0000:01:00.0: pll.max_log2p: 7
[drm] nouveau 0000:01:00.0: pll.log2p_bias: 0
[drm] nouveau 0000:01:00.0: pll.refclk: 27000
[drm] nouveau 0000:01:00.0: nv_crtc_calc_state_ext:150 - vpll: n 8 m 2 lo=
g2p 0
[drm] nouveau 0000:01:00.0: nv04_dfp_mode_set:296 - Output mode on CRTC 0=
:
[drm:drm_mode_debug_printmodeline], Modeline 43:"1280x1024" 0 108000 1280=
 1328 1440 1688 1024 1025 1028 1066 0x48 0x5
[drm] nouveau 0000:01:00.0: nv_crtc_dpms:165 - Setting dpms mode 0 on CRT=
C 0
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00680524, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 0xC210: Parsing digital output script table
[drm] nouveau 0000:01:00.0: 	Indexed IO write: Port: 0x03D4, Index: 0x44,=
 Head: 0x00, Data: 0x00
[drm] nouveau 0000:01:00.0: 0xC210: [ (0x5B) - INIT_SUB_DIRECT ]
[drm] nouveau 0000:01:00.0: 0xC210: Executing subroutine at 0xC22C
[drm] nouveau 0000:01:00.0: 0xC22C: [ (0x6E) - INIT_NV_REG ]
[drm] nouveau 0000:01:00.0: 0xC22C: Reg: 0x00680880, Mask: 0xDFFFFFFF, Da=
ta: 0x00000000
[drm] nouveau 0000:01:00.0: 	Read:  Reg: 0x00680880, Data: 0x01101191
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x00680880, Data: 0x01101191
[drm] nouveau 0000:01:00.0: 0xC239: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: 0xC210: End of 0xC22C subroutine
[drm] nouveau 0000:01:00.0: 0xC213: [ (0x5B) - INIT_SUB_DIRECT ]
[drm] nouveau 0000:01:00.0: 0xC213: Executing subroutine at 0x8CF1
[drm] nouveau 0000:01:00.0: 0x8CF1: [ (0x5B) - INIT_SUB_DIRECT ]
[drm] nouveau 0000:01:00.0: 0x8CF1: Executing subroutine at 0x8D1A
[drm] nouveau 0000:01:00.0: 0x8D1A: [ (0x50) - INIT_ZM_TMDS_GROUP ]
[drm] nouveau 0000:01:00.0: 0x8D1A: MagicLookupValue: 0x80, Count: 0x0F
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x000000F1
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x00000001
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000090
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x00000002
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x00000029
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000005
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x0000002E
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000030
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x00000040
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000008
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x00000041
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x00000043
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000080
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x00000004
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000068
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x00000005
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x0000002F
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x00000030
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x00000031
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x00000032
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x00000033
[drm] nouveau 0000:01:00.0: 0x8D3B: [ (0x50) - INIT_ZM_TMDS_GROUP ]
[drm] nouveau 0000:01:00.0: 0x8D3B: MagicLookupValue: 0x81, Count: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808BC, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B8, Data: 0x00000004
[drm] nouveau 0000:01:00.0: 0x8D40: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: 0x8CF1: End of 0x8D1A subroutine
[drm] nouveau 0000:01:00.0: 0x8CF4: [ (0x5B) - INIT_SUB_DIRECT ]
[drm] nouveau 0000:01:00.0: 0x8CF4: Executing subroutine at 0x8D61
[drm] nouveau 0000:01:00.0: 0x8D61: [ (0x50) - INIT_ZM_TMDS_GROUP ]
[drm] nouveau 0000:01:00.0: 0x8D61: MagicLookupValue: 0x80, Count: 0x01
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000008
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x0000002F
[drm] nouveau 0000:01:00.0: 0x8D66: [ (0x74) - INIT_TIME ]
[drm] nouveau 0000:01:00.0: 0x8D66: Sleeping for 0xC350 microseconds
[drm] nouveau 0000:01:00.0: 0x8D69: [ (0x50) - INIT_ZM_TMDS_GROUP ]
[drm] nouveau 0000:01:00.0: 0x8D69: MagicLookupValue: 0x80, Count: 0x02
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000021
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x0000002F
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B4, Data: 0x00000000
[drm] nouveau 0000:01:00.0: 	Write: Reg: 0x006808B0, Data: 0x0000002C
[drm] nouveau 0000:01:00.0: 0x8D70: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: 0x8CF4: End of 0x8D61 subroutine
[drm] nouveau 0000:01:00.0: 0x8CF7: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: 0xC213: End of 0x8CF1 subroutine
[drm] nouveau 0000:01:00.0: 0xC216: [ (0x71) - INIT_DONE ]
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 1=
)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 0 using out=
put A
[drm] nouveau 0000:01:00.0: nv_crtc_dpms:165 - Setting dpms mode 3 on CRT=
C 1
[drm:drm_crtc_helper_set_config],=20
[drm:drm_crtc_helper_set_config], crtc: f64ab800 6 fb: f658bb78 connector=
s: f6ad0d40 num_connectors: 0 (x, y) (0, 0)
[drm:drm_crtc_helper_set_config], crtc has no fb, full mode set
[drm:drm_crtc_helper_set_config], setting connector 7 crtc to f64ab000
[drm] nouveau 0000:01:00.0: nv_crtc_dpms:165 - Setting dpms mode 3 on CRT=
C 1
[drm:drm_crtc_helper_set_config],=20
[drm:drm_crtc_helper_set_config], crtc: f64ab000 5 fb: f658bb78 connector=
s: f6ad0d30 num_connectors: 1 (x, y) (0, 0)
[drm:drm_crtc_helper_set_config], setting connector 7 crtc to f64ab000
[drm] nouveau 0000:01:00.0: PFIFO_DMA_PUSHER - Ch 0
[drm] nouveau 0000:01:00.0: GPU lockup - switching to software fbcon
Console: switching to colour frame buffer device 160x64
[drm:drm_crtc_helper_set_config],=20
[drm:drm_crtc_helper_set_config], crtc: f64ab000 5 fb: f658bb78 connector=
s: f6ad0d30 num_connectors: 1 (x, y) (0, 0)
[drm:drm_crtc_helper_set_config], setting connector 7 crtc to f64ab000
fb0: nouveaufb frame buffer device
drm: registered panic notifier
[drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0 on minor 0

--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="lspci.log"

00:00.0 Host bridge: Intel Corporation 440BX/ZX/DX - 82443BX/ZX/DX Host bridge (rev 03)
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort+ >SERR- <PERR- INTx-
	Latency: 64
	Region 0: Memory at fa000000 (32-bit, prefetchable) [size=4M]
	Capabilities: [a0] AGP version 1.0
		Status: RQ=32 Iso- ArqSz=0 Cal=0 SBA+ ITACoh- GART64- HTrans- 64bit- FW- AGP3- Rate=x1,x2
		Command: RQ=1 ArqSz=0 Cal=0 SBA- AGP- GART64- 64bit- FW- Rate=<none>
	Kernel driver in use: agpgart-intel
	Kernel modules: intel-agp

00:01.0 PCI bridge: Intel Corporation 440BX/ZX/DX - 82443BX/ZX/DX AGP bridge (rev 03) (prog-if 00 [Normal decode])
	Control: I/O+ Mem+ BusMaster+ SpecCycle+ MemWINV+ VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz+ UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 64
	Bus: primary=00, secondary=01, subordinate=01, sec-latency=64
	I/O behind bridge: 0000c000-0000cfff
	Memory behind bridge: fa400000-fe4fffff
	Prefetchable memory behind bridge: d9900000-f99fffff
	Secondary status: 66MHz+ FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- <SERR- <PERR-
	BridgeCtl: Parity- SERR- NoISA- VGA+ MAbort- >Reset- FastB2B+
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-

00:07.0 ISA bridge: Intel Corporation 82371AB/EB/MB PIIX4 ISA (rev 02)
	Control: I/O+ Mem+ BusMaster+ SpecCycle+ MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0

00:07.1 IDE interface: Intel Corporation 82371AB/EB/MB PIIX4 IDE (rev 01) (prog-if 80 [Master])
	Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 64
	Region 0: [virtual] Memory at 000001f0 (32-bit, non-prefetchable) [size=8]
	Region 1: [virtual] Memory at 000003f0 (type 3, non-prefetchable) [size=1]
	Region 2: [virtual] Memory at 00000170 (32-bit, non-prefetchable) [size=8]
	Region 3: [virtual] Memory at 00000370 (type 3, non-prefetchable) [size=1]
	Region 4: I/O ports at ffa0 [size=16]
	Kernel driver in use: ata_piix

00:07.2 USB Controller: Intel Corporation 82371AB/EB/MB PIIX4 USB (rev 01) (prog-if 00 [UHCI])
	Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort+ <MAbort- >SERR- <PERR- INTx-
	Latency: 64
	Interrupt: pin D routed to IRQ 19
	Region 4: I/O ports at ef40 [size=32]
	Kernel driver in use: uhci_hcd
	Kernel modules: uhci-hcd

00:07.3 Bridge: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev 02)
	Control: I/O+ Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin ? routed to IRQ 9

00:11.0 Mass storage controller: Silicon Image, Inc. SiI 3512 [SATALink/SATARaid] Serial ATA Controller (rev 02)
	Subsystem: Silicon Image, Inc. SiI 3512 SATALink Controller
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx-
	Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 64, Cache Line Size: 32 bytes
	Interrupt: pin A routed to IRQ 17
	Region 0: I/O ports at efe0 [size=8]
	Region 1: I/O ports at efac [size=4]
	Region 2: I/O ports at efa0 [size=8]
	Region 3: I/O ports at efa8 [size=4]
	Region 4: I/O ports at ef90 [size=16]
	Region 5: Memory at febffe00 (32-bit, non-prefetchable) [size=512]
	Expansion ROM at feb00000 [disabled] [size=512K]
	Capabilities: [60] Power Management version 2
		Flags: PMEClk- DSI+ D1+ D2+ AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=2 PME-
	Kernel driver in use: sata_sil

00:12.0 PCI bridge: Hint Corp HB6 Universal PCI-PCI bridge (non-transparent mode) (rev 13) (prog-if 00 [Normal decode])
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 64, Cache Line Size: 32 bytes
	Bus: primary=00, secondary=02, subordinate=02, sec-latency=64
	I/O behind bridge: 0000d000-0000dfff
	Memory behind bridge: fe500000-fe5fffff
	Prefetchable memory behind bridge: 00000000f9a00000-00000000f9afffff
	Secondary status: 66MHz- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- <SERR- <PERR-
	BridgeCtl: Parity+ SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: [80] Power Management version 2
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0+,D1+,D2+,D3hot+,D3cold-)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
		Bridge: PM- B3+
	Capabilities: [90] CompactPCI hot-swap <?>
	Capabilities: [a0] Vital Product Data
		No end tag found

00:13.0 Multimedia audio controller: Creative Labs SB Live! EMU10k1 (rev 06)
	Subsystem: Creative Labs CT4832 SBLive! Value
	Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 64 (500ns min, 5000ns max)
	Interrupt: pin A routed to IRQ 19
	Region 0: I/O ports at ef20 [size=32]
	Capabilities: [dc] Power Management version 1
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Kernel driver in use: EMU10K1_Audigy

00:13.1 Input device controller: Creative Labs SB Live! Game Port (rev 06)
	Subsystem: Creative Labs Gameport Joystick
	Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 64
	Region 0: I/O ports at eff0 [size=8]
	Capabilities: [dc] Power Management version 1
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Kernel driver in use: Emu10k1_gameport

00:14.0 Ethernet controller: Intel Corporation 82557/8/9/0/1 Ethernet Pro 100 (rev 08)
	Subsystem: Intel Corporation EtherExpress PRO/100+ Management Adapter
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 64 (2000ns min, 14000ns max), Cache Line Size: 32 bytes
	Interrupt: pin A routed to IRQ 16
	Region 0: Memory at febfe000 (32-bit, non-prefetchable) [size=4K]
	Region 1: I/O ports at ee80 [size=64]
	Region 2: Memory at fea00000 (32-bit, non-prefetchable) [size=1M]
	Expansion ROM at fe900000 [disabled] [size=1M]
	Capabilities: [dc] Power Management version 2
		Flags: PMEClk- DSI+ D1+ D2+ AuxCurrent=0mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=2 PME-
	Kernel driver in use: e100

01:00.0 VGA compatible controller: nVidia Corporation G73 [GeForce 7600 GS] (rev a2) (prog-if 00 [VGA controller])
	Subsystem: Device 196e:0380
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx-
	Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 64 (1250ns min, 250ns max)
	Interrupt: pin A routed to IRQ 10
	Region 0: Memory at fd000000 (32-bit, non-prefetchable) [size=16M]
	Region 1: Memory at e0000000 (32-bit, prefetchable) [size=256M]
	Region 2: Memory at fc000000 (32-bit, non-prefetchable) [size=16M]
	Expansion ROM at fe4e0000 [disabled] [size=128K]
	Capabilities: [60] Power Management version 2
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [44] AGP version 3.0
		Status: RQ=32 Iso- ArqSz=0 Cal=0 SBA+ ITACoh- GART64- HTrans- 64bit- FW+ AGP3- Rate=x1,x2,x4
		Command: RQ=1 ArqSz=0 Cal=0 SBA- AGP- GART64- 64bit- FW- Rate=<none>
	Kernel modules: nouveau

02:08.0 USB Controller: NEC Corporation USB (rev 41) (prog-if 10 [OHCI])
	Subsystem: Adaptec Device 0235
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 64 (250ns min, 10500ns max), Cache Line Size: 32 bytes
	Interrupt: pin A routed to IRQ 18
	Region 0: Memory at fe5fd000 (32-bit, non-prefetchable) [size=4K]
	Capabilities: [40] Power Management version 2
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0+,D1+,D2+,D3hot+,D3cold-)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Kernel driver in use: ohci_hcd
	Kernel modules: ohci-hcd

02:08.1 USB Controller: NEC Corporation USB (rev 41) (prog-if 10 [OHCI])
	Subsystem: Adaptec Device 0235
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 64 (250ns min, 10500ns max), Cache Line Size: 32 bytes
	Interrupt: pin B routed to IRQ 19
	Region 0: Memory at fe5fe000 (32-bit, non-prefetchable) [size=4K]
	Capabilities: [40] Power Management version 2
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0+,D1+,D2+,D3hot+,D3cold-)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Kernel driver in use: ohci_hcd
	Kernel modules: ohci-hcd

02:08.2 USB Controller: NEC Corporation USB 2.0 (rev 02) (prog-if 20 [EHCI])
	Subsystem: Adaptec Device 02e0
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 64 (4000ns min, 8500ns max), Cache Line Size: 32 bytes
	Interrupt: pin C routed to IRQ 16
	Region 0: Memory at fe5fff00 (32-bit, non-prefetchable) [size=256]
	Capabilities: [40] Power Management version 2
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0+,D1+,D2+,D3hot+,D3cold-)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Kernel driver in use: ehci_hcd
	Kernel modules: ehci-hcd

02:0b.0 FireWire (IEEE 1394): Texas Instruments TSB12LV26 IEEE-1394 Controller (Link) (prog-if 10 [OHCI])
	Subsystem: Texas Instruments Device 8010
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 64 (750ns min, 1000ns max), Cache Line Size: 32 bytes
	Interrupt: pin A routed to IRQ 17
	Region 0: Memory at fe5ff000 (32-bit, non-prefetchable) [size=2K]
	Region 1: Memory at fe5f8000 (32-bit, non-prefetchable) [size=16K]
	Capabilities: [44] Power Management version 1
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot+,D3cold-)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Kernel driver in use: ohci1394
	Kernel modules: firewire-ohci, ohci1394


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--/04w6evG8XlLl3ft--
