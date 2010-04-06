From: Didier Spaier <didier.spaier-GqzDj6/B2j8@public.gmane.org>
Subject: Re: Blank screen at startup (conflict with VESA VGA)
Date: Tue, 06 Apr 2010 10:48:49 +0200
Message-ID: <4BBAF571.8050200@epsm.fr>
References: <4BBA4F3C.9070606@epsm.fr> <20100405214559.GA4230@joi.lan>
	<4BBAF07E.9070005@epsm.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------010203080002080500030006"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4BBAF07E.9070005-GqzDj6/B2j8@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--------------010203080002080500030006
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

With the logs, this time. Sorry about that.

Didier Spaier wrote:
> Thansk for your answer, kernel logs are attached.
>=20
> Please note that this time I tried with a 2.6.32.2 kernel (nouveau work=
s=20
> under X).
>=20
> Marcin Slusarz wrote:
>> On Mon, Apr 05, 2010 at 10:59:40PM +0200, Didier Spaier wrote:
>>> Hi all,
>>>
>>> new to this list ;)
>>>
>>> I have a Lenovo Thinkpad T61. lspci|grep VGA says:
>>> 01:00.0 VGA compatible controller: nVidia Corporation Quadro NVS 140M=
=20
>>> (rev a1)
>>>
>>> I have Slacware64-13.0 and Slackware64-current installed.
>>>
>>> Nouveau is modularized in all my kernels for -current.
>>>
>>> A problem arise even if I don't want to use nouveau under X: unless=20
>>> nouveau be blacklisted in /etc/modprobe.d/blacklist.conf at startup,
>>> - when using one of the VESA modes at startup after a while screen=20
>>> goes blank and I get a warning in syslog e.g:
>>>    Apr  2 18:58:56 darkstar kernel: fb: conflicting fb hw usage=20
>>> nouveaufb vs VESA VGA - removing generic driver,
>>
>> It should work. Please provide full kernel log.
>=20
> Kernel logs are attached for both cases. Unfortunately I don't see many=
=20
> differences ??
>=20
>>
>>> - no problem when using a VGA mode (text only),
>>
>> But Nouveau framebuffer activates without errors, right?
>>
> Yes, switching to nouveau framebuffer OK in the latter case but not in=20
> the former
>=20
>>> this disregarding which X driver I use afterwards (I always start in=20
>>> console mode).
>>>
>>> But according to this page:
>>> http://nouveau.freedesktop.org/wiki/KernelModeSetting
>>> I thought nouveaufb shouldn't conflict with vesafb ? Am I wrong ?
>>>
>>> I tried with modules shipped in vanilla 2.6.33.1 as well as the last=20
>>> Nouveau kernel repository pulled from git: no luck in both cases.
>>>
>>> I know there are easy workarounds: either use "VGA=3Dask", "VGA=3Dext=
" or=20
>>> "VGA=3Dnormal" as a lilo.conf option or blacklist nouveau -- which=20
>>> doesn't hurt anyway as nouveau will be loaded at X startup anyhow.
>>>
>>> But this is still is an annoyance for newcomers as when they are=20
>>> trapped all they can do if they have a VESA mode in lilo.conf is=20
>>> launch another system or live CD/DVD and either edit lilo.conf and=20
>>> run lilo again or edit blacklist.conf to blacklist nouveau.
>>>
>>> But still, before kindly requesting Patrick Volkerding to blacklist=20
>>> nouveau in -current for the time being, I wanted to now of another=20
>>> way to go if possible.
>>>
>>> Thanks in advance for your answers,
>>>
>>> Didier
>>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>=20


--=20
Didier Spaier
G=E9rant
EPSM
33 avenue Bosquet
75007 PARIS
T. 01 45 51 03 26 | M. 06 64 98 45 51
didier.spaier-GqzDj6/B2j8@public.gmane.org | http://epsm.fr

--------------010203080002080500030006
Content-Type: text/plain;
 name="messages"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="messages"



-----------------Starting with VESA framebuffer console 1680x1050-----------------------------
Apr  6 09:02:50 machine syslogd 1.4.1: restart.
Apr  6 09:02:50 machine kernel: klogd 1.4.1, log source = /proc/kmsg started.
Apr  6 09:02:50 machine kernel: etting latency timer to 64
Apr  6 09:02:50 machine kernel: pci 0000:00:1c.3: PCI INT D -> GSI 23 (level, low) -> IRQ 23
Apr  6 09:02:50 machine kernel: pci 0000:00:1c.4: PCI INT A -> GSI 20 (level, low) -> IRQ 20
Apr  6 09:02:50 machine kernel: pci 0000:00:1e.0: enabling device (0005 -> 0007)
Apr  6 09:02:50 machine kernel: pci 0000:15:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
Apr  6 09:02:50 machine kernel: NET: Registered protocol family 2
Apr  6 09:02:50 machine kernel: IP route cache hash table entries: 131072 (order: 8, 1048576 bytes)
Apr  6 09:02:50 machine kernel: TCP established hash table entries: 262144 (order: 10, 4194304 bytes)
Apr  6 09:02:50 machine kernel: TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
Apr  6 09:02:50 machine kernel: TCP: Hash tables configured (established 262144 bind 65536)
Apr  6 09:02:50 machine kernel: TCP reno registered
Apr  6 09:02:50 machine kernel: NET: Registered protocol family 1
Apr  6 09:02:50 machine kernel: Simple Boot Flag at 0x35 set to 0x1
Apr  6 09:02:50 machine kernel: Intel AES-NI instructions are not detected.
Apr  6 09:02:50 machine kernel: VFS: Disk quotas dquot_6.5.2
Apr  6 09:02:50 machine kernel: ROMFS MTD (C) 2007 Red Hat, Inc.
Apr  6 09:02:50 machine kernel: msgmni has been set to 5997
Apr  6 09:02:50 machine kernel: alg: No test for cipher_null (cipher_null-generic)
Apr  6 09:02:50 machine kernel: alg: No test for ecb(cipher_null) (ecb-cipher_null)
Apr  6 09:02:50 machine kernel: alg: No test for digest_null (digest_null-generic)
Apr  6 09:02:50 machine kernel: alg: No test for compress_null (compress_null-generic)
Apr  6 09:02:50 machine kernel: alg: No test for fcrypt (fcrypt-generic)
Apr  6 09:02:50 machine kernel: alg: No test for stdrng (krng)
Apr  6 09:02:50 machine kernel: Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)
Apr  6 09:02:50 machine kernel: io scheduler noop registered
Apr  6 09:02:50 machine kernel: io scheduler anticipatory registered
Apr  6 09:02:50 machine kernel: io scheduler deadline registered
Apr  6 09:02:50 machine kernel: io scheduler cfq registered (default)
Apr  6 09:02:50 machine kernel: pci_hotplug: PCI Hot Plug PCI Core version: 0.5
Apr  6 09:02:50 machine kernel: vesafb: framebuffer at 0xd5000000, mapped to 0xffffc90004100000, using 13781k, total 14336k
Apr  6 09:02:50 machine kernel: vesafb: mode is 1680x1050x32, linelength=6720, pages=1
Apr  6 09:02:50 machine kernel: vesafb: scrolling: redraw
Apr  6 09:02:50 machine kernel: vesafb: Truecolor: size=8:8:8:8, shift=24:16:8:0
Apr  6 09:02:50 machine kernel: fb0: VESA VGA frame buffer device
Apr  6 09:02:50 machine kernel: Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
Apr  6 09:02:50 machine kernel: brd: module loaded
Apr  6 09:02:50 machine kernel: loop: module loaded
Apr  6 09:02:50 machine kernel: input: Macintosh mouse button emulation as /devices/virtual/input/input0
Apr  6 09:02:50 machine kernel: ahci 0000:00:1f.2: PCI INT B -> GSI 16 (level, low) -> IRQ 16
Apr  6 09:02:50 machine kernel: ahci 0000:00:1f.2: AHCI 0001.0100 32 slots 3 ports 1.5 Gbps 0x1 impl SATA mode
Apr  6 09:02:50 machine kernel: ahci 0000:00:1f.2: flags: 64bit ncq sntf pm led clo pio slum part ccc 
Apr  6 09:02:50 machine kernel: scsi0 : ahci
Apr  6 09:02:50 machine kernel: scsi1 : ahci
Apr  6 09:02:50 machine kernel: scsi2 : ahci
Apr  6 09:02:50 machine kernel: ata1: SATA max UDMA/133 irq_stat 0x00400040 irq 30, connection status changed
Apr  6 09:02:50 machine kernel: ata2: DUMMY
Apr  6 09:02:50 machine kernel: ata3: DUMMY
Apr  6 09:02:50 machine kernel: ata_piix 0000:00:1f.1: PCI INT C -> GSI 16 (level, low) -> IRQ 16
Apr  6 09:02:50 machine kernel: scsi3 : ata_piix
Apr  6 09:02:50 machine kernel: scsi4 : ata_piix
Apr  6 09:02:50 machine kernel: ata4: PATA max UDMA/100 cmd 0x1f0 ctl 0x3f6 bmdma 0x1830 irq 14
Apr  6 09:02:50 machine kernel: ata5: PATA max UDMA/100 cmd 0x170 ctl 0x376 bmdma 0x1838 irq 15
Apr  6 09:02:50 machine kernel: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0x60,0x64 irq 1,12
Apr  6 09:02:50 machine kernel: serio: i8042 KBD port at 0x60,0x64 irq 1
Apr  6 09:02:50 machine kernel: serio: i8042 AUX port at 0x60,0x64 irq 12
Apr  6 09:02:50 machine kernel: mice: PS/2 mouse device common for all mice
Apr  6 09:02:50 machine kernel: md: linear personality registered for level -1
Apr  6 09:02:50 machine kernel: md: raid0 personality registered for level 0
Apr  6 09:02:50 machine kernel: md: raid1 personality registered for level 1
Apr  6 09:02:50 machine kernel: md: raid10 personality registered for level 10
Apr  6 09:02:50 machine kernel: md: raid6 personality registered for level 6
Apr  6 09:02:50 machine kernel: md: raid5 personality registered for level 5
Apr  6 09:02:50 machine kernel: md: raid4 personality registered for level 4
Apr  6 09:02:50 machine kernel: md: multipath personality registered for level -4
Apr  6 09:02:50 machine kernel: device-mapper: uevent: version 1.0.3
Apr  6 09:02:50 machine kernel: device-mapper: ioctl: 4.15.0-ioctl (2009-04-01) initialised: dm-devel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Apr  6 09:02:50 machine kernel: cpuidle: using governor ladder
Apr  6 09:02:50 machine kernel: cpuidle: using governor menu
Apr  6 09:02:50 machine kernel: TCP cubic registered
Apr  6 09:02:50 machine kernel: input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input1
Apr  6 09:02:50 machine kernel: NET: Registered protocol family 17
Apr  6 09:02:50 machine kernel: ata4.00: ATAPI: HL-DT-ST DVDRAM GSA-U10N, 1.05, max UDMA/33
Apr  6 09:02:50 machine kernel: ata4.00: configured for UDMA/33
Apr  6 09:02:50 machine kernel: ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
Apr  6 09:02:50 machine kernel: ata1.00: ACPI cmd f5/00:00:00:00:00:a0 (SECURITY FREEZE LOCK) filtered out
Apr  6 09:02:50 machine kernel: ata1.00: ACPI cmd ef/10:03:00:00:00:a0 (SET FEATURES) filtered out
Apr  6 09:02:50 machine kernel: ata1.00: ATA-8: HITACHI HTS543216L9SA00, FB2ZC4EC, max UDMA/100
Apr  6 09:02:50 machine kernel: ata1.00: 312581808 sectors, multi 16: LBA48 NCQ (depth 31/32), AA
Apr  6 09:02:50 machine kernel: ata1.00: ACPI cmd f5/00:00:00:00:00:a0 (SECURITY FREEZE LOCK) filtered out
Apr  6 09:02:50 machine kernel: ata1.00: ACPI cmd ef/10:03:00:00:00:a0 (SET FEATURES) filtered out
Apr  6 09:02:50 machine kernel: ata1.00: configured for UDMA/100
Apr  6 09:02:50 machine kernel: ata1.00: configured for UDMA/100
Apr  6 09:02:50 machine kernel: ata1: EH complete
Apr  6 09:02:50 machine kernel: scsi 0:0:0:0: Direct-Access     ATA      HITACHI HTS54321 FB2Z PQ: 0 ANSI: 5
Apr  6 09:02:50 machine kernel: sd 0:0:0:0: [sda] 312581808 512-byte logical blocks: (160 GB/149 GiB)
Apr  6 09:02:50 machine kernel: sd 0:0:0:0: [sda] Write Protect is off
Apr  6 09:02:50 machine kernel: scsi 3:0:0:0: CD-ROM            HL-DT-ST DVDRAM GSA-U10N  1.05 PQ: 0 ANSI: 5
Apr  6 09:02:50 machine kernel: sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
Apr  6 09:02:50 machine kernel:  sda:sr0: scsi3-mmc drive: 24x/24x writer dvd-ram cd/rw xa/form2 cdda tray
Apr  6 09:02:50 machine kernel: Uniform CD-ROM driver Revision: 3.20
Apr  6 09:02:50 machine kernel: sd 0:0:0:0: [sda] Attached SCSI disk
Apr  6 09:02:50 machine kernel: md: Waiting for all devices to be available before autodetect
Apr  6 09:02:50 machine kernel: md: If you don't use raid, use raid=noautodetect
Apr  6 09:02:50 machine kernel: md: Autodetecting RAID arrays.
Apr  6 09:02:50 machine kernel: md: Scanned 0 and added 0 devices.
Apr  6 09:02:50 machine kernel: md: autorun ...
Apr  6 09:02:50 machine kernel: md: ... autorun DONE.
Apr  6 09:02:50 machine kernel: REISERFS (device sda4): found reiserfs format "3.6" with standard journal
Apr  6 09:02:50 machine kernel: REISERFS (device sda4): using ordered data mode
Apr  6 09:02:50 machine kernel: REISERFS (device sda4): journal params: device sda4, size 8192, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
Apr  6 09:02:50 machine kernel: REISERFS (device sda4): checking transaction log (sda4)
Apr  6 09:02:50 machine kernel: REISERFS (device sda4): Using r5 hash to sort names
Apr  6 09:02:50 machine kernel: devtmpfs: mounted
Apr  6 09:02:50 machine kernel: Freeing unused kernel memory: 576k freed
Apr  6 09:02:50 machine kernel: cfg80211: Using static regulatory domain info
Apr  6 09:02:50 machine kernel: cfg80211: Regulatory domain: US
Apr  6 09:02:50 machine kernel: ^I(start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp)
Apr  6 09:02:50 machine kernel: ^I(2402000 KHz - 2472000 KHz @ 40000 KHz), (600 mBi, 2700 mBm)
Apr  6 09:02:50 machine kernel: HDA Intel 0000:00:1b.0: PCI INT B -> GSI 17 (level, low) -> IRQ 17
Apr  6 09:02:50 machine kernel: hda_intel: probe_mask set to 0x1 for device 17aa:20ac
Apr  6 09:02:50 machine kernel: ^I(5170000 KHz - 5190000 KHz @ 40000 KHz), (600 mBi, 2300 mBm)
Apr  6 09:02:50 machine kernel: input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input2
Apr  6 09:02:50 machine kernel: ACPI: AC Adapter [AC] (on-line)
Apr  6 09:02:50 machine kernel: ^I(5190000 KHz - 5210000 KHz @ 40000 KHz), (600 mBi, 2300 mBm)
Apr  6 09:02:50 machine kernel: ^I(5210000 KHz - 5230000 KHz @ 40000 KHz), (600 mBi, 2300 mBm)
Apr  6 09:02:50 machine kernel: ^I(5230000 KHz - 5330000 KHz @ 40000 KHz), (600 mBi, 2300 mBm)
Apr  6 09:02:50 machine kernel: ^I(5735000 KHz - 5835000 KHz @ 40000 KHz), (600 mBi, 3000 mBm)
Apr  6 09:02:50 machine kernel: cfg80211: Calling CRDA for country: US
Apr  6 09:02:50 machine kernel: ACPI: Battery Slot [BAT0] (battery present)
Apr  6 09:02:50 machine kernel: ACPI: Lid Switch [LID]
Apr  6 09:02:50 machine kernel: input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input3
Apr  6 09:02:50 machine kernel: ACPI: Sleep Button [SLPB]
Apr  6 09:02:50 machine kernel: input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input4
Apr  6 09:02:50 machine kernel: ACPI: Power Button [PWRF]
Apr  6 09:02:50 machine kernel: e1000e: Intel(R) PRO/1000 Network Driver - 1.0.2-k2
Apr  6 09:02:50 machine kernel: e1000e: Copyright (c) 1999-2008 Intel Corporation.
Apr  6 09:02:50 machine kernel: ACPI: WMI: Mapper loaded
Apr  6 09:02:50 machine kernel: acpi device:05: registered as cooling_device0
Apr  6 09:02:50 machine kernel: ricoh-mmc: Ricoh MMC Controller disabling driver
Apr  6 09:02:50 machine kernel: input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:04/LNXVIDEO:01/input/input5
Apr  6 09:02:50 machine kernel: ACPI: Video Device [VID1] (multi-head: yes  rom: no  post: no)
Apr  6 09:02:50 machine kernel: ricoh-mmc: Copyright(c) Philip Langdale
Apr  6 09:02:50 machine kernel: ricoh-mmc: Ricoh MMC controller found at 0000:15:00.3 [1180:0843] (rev 11)
Apr  6 09:02:50 machine kernel: ricoh-mmc: Controller is now disabled.
Apr  6 09:02:50 machine kernel: yenta_cardbus 0000:15:00.0: CardBus bridge found [17aa:20c6]
Apr  6 09:02:50 machine kernel: Non-volatile memory driver v1.3
Apr  6 09:02:50 machine kernel: yenta_cardbus 0000:15:00.0: ISA IRQ mask 0x0cb8, PCI irq 16
Apr  6 09:02:50 machine kernel: yenta_cardbus 0000:15:00.0: Socket status: 30000006
Apr  6 09:02:50 machine kernel: yenta_cardbus 0000:15:00.0: pcmcia: parent PCI bridge I/O window: 0x8000 - 0xbfff
Apr  6 09:02:50 machine kernel: yenta_cardbus 0000:15:00.0: pcmcia: parent PCI bridge Memory window: 0xf8100000 - 0xfbffffff
Apr  6 09:02:50 machine kernel: yenta_cardbus 0000:15:00.0: pcmcia: parent PCI bridge Memory window: 0xf4000000 - 0xf7ffffff
Apr  6 09:02:50 machine kernel: rtc_cmos 00:07: RTC can wake from S4
Apr  6 09:02:50 machine kernel: rtc_cmos 00:07: rtc core: registered rtc_cmos as rtc0
Apr  6 09:02:50 machine kernel: ohci1394 0000:15:00.1: PCI INT B -> GSI 17 (level, low) -> IRQ 17
Apr  6 09:02:50 machine kernel: rtc0: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
Apr  6 09:02:50 machine kernel: ohci1394: fw-host0: OHCI-1394 1.1 (PCI): IRQ=[17]  MMIO=[f8101000-f81017ff]  Max Packet=[2048]  IR/IT contexts=[4/4]
Apr  6 09:02:50 machine kernel: sd 0:0:0:0: Attached scsi generic sg0 type 0
Apr  6 09:02:50 machine kernel: sr 3:0:0:0: Attached scsi generic sg1 type 5
Apr  6 09:02:50 machine kernel: ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
Apr  6 09:02:50 machine kernel: Linux agpgart interface v0.103
Apr  6 09:02:50 machine kernel: thermal LNXTHERM:01: registered as thermal_zone0
Apr  6 09:02:50 machine kernel: ACPI: Thermal Zone [THM0] (58 C)
Apr  6 09:02:50 machine kernel: thermal LNXTHERM:02: registered as thermal_zone1
Apr  6 09:02:50 machine kernel: ACPI: Thermal Zone [THM1] (57 C)
Apr  6 09:02:50 machine kernel: thinkpad_acpi: ThinkPad ACPI Extras v0.23
Apr  6 09:02:50 machine kernel: thinkpad_acpi: http://ibm-acpi.sf.net/
Apr  6 09:02:50 machine kernel: thinkpad_acpi: ThinkPad BIOS 7LETC5WW (2.25 ), EC 7KHT24WW-1.08
Apr  6 09:02:50 machine kernel: thinkpad_acpi: Lenovo ThinkPad T61, model 64574XG
Apr  6 09:02:50 machine kernel: thinkpad_acpi: ACPI backlight control delay disabled
Apr  6 09:02:50 machine kernel: thinkpad_acpi: radio switch found; radios are disabled
Apr  6 09:02:50 machine kernel: thinkpad_acpi: This ThinkPad has standard ACPI backlight brightness control, supported by the ACPI video driver
Apr  6 09:02:50 machine kernel: thinkpad_acpi: Disabling thinkpad-acpi brightness events by default...
Apr  6 09:02:50 machine kernel: processor LNXCPU:00: registered as cooling_device1
Apr  6 09:02:50 machine kernel: Registered led device: tpacpi::thinklight
Apr  6 09:02:50 machine kernel: Registered led device: tpacpi::power
Apr  6 09:02:50 machine kernel: Registered led device: tpacpi::standby
Apr  6 09:02:50 machine kernel: processor LNXCPU:01: registered as cooling_device2
Apr  6 09:02:50 machine kernel: uhci_hcd: USB Universal Host Controller Interface driver
Apr  6 09:02:50 machine kernel: Registered led device: tpacpi::thinkvantage
Apr  6 09:02:50 machine kernel: sdhci: Secure Digital Host Controller Interface driver
Apr  6 09:02:50 machine kernel: sdhci: Copyright(c) Pierre Ossman
Apr  6 09:02:50 machine kernel: thinkpad_acpi: Standard ACPI backlight interface available, not loading native one.
Apr  6 09:02:50 machine kernel: input: ThinkPad Extra Buttons as /devices/virtual/input/input6
Apr  6 09:02:50 machine kernel: e1000e 0000:00:19.0: PCI INT A -> GSI 20 (level, low) -> IRQ 20
Apr  6 09:02:50 machine kernel: sdhci-pci 0000:15:00.2: SDHCI controller found [1180:0822] (rev 21)
Apr  6 09:02:50 machine kernel: sdhci-pci 0000:15:00.2: PCI INT C -> GSI 18 (level, low) -> IRQ 18
Apr  6 09:02:50 machine kernel: Registered led device: mmc0::
Apr  6 09:02:50 machine kernel: mmc0: SDHCI controller on PCI [0000:15:00.2] using DMA
Apr  6 09:02:50 machine kernel: 0000:00:19.0: eth0: (PCI Express:2.5GB/s:Width x1) 00:1f:e2:1a:ea:c0
Apr  6 09:02:50 machine kernel: 0000:00:19.0: eth0: Intel(R) PRO/1000 Network Connection
Apr  6 09:02:50 machine kernel: 0000:00:19.0: eth0: MAC: 6, PHY: 6, PBA No: 1008ff-0ff
Apr  6 09:02:50 machine kernel: ehci_hcd 0000:00:1a.7: power state changed by ACPI to D0
Apr  6 09:02:50 machine kernel: ehci_hcd 0000:00:1a.7: PCI INT C -> GSI 22 (level, low) -> IRQ 22
Apr  6 09:02:50 machine kernel: ehci_hcd 0000:00:1a.7: EHCI Host Controller
Apr  6 09:02:50 machine kernel: ehci_hcd 0000:00:1a.7: new USB bus registered, assigned bus number 1
Apr  6 09:02:50 machine kernel: ehci_hcd 0000:00:1a.7: irq 22, io mem 0xfe226c00
Apr  6 09:02:50 machine kernel: ehci_hcd 0000:00:1a.7: USB 2.0 started, EHCI 1.00
Apr  6 09:02:50 machine kernel: usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
Apr  6 09:02:50 machine kernel: usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Apr  6 09:02:50 machine kernel: usb usb1: Product: EHCI Host Controller
Apr  6 09:02:50 machine kernel: usb usb1: Manufacturer: Linux 2.6.32.2-strip ehci_hcd
Apr  6 09:02:50 machine kernel: usb usb1: SerialNumber: 0000:00:1a.7
Apr  6 09:02:50 machine kernel: usb usb1: configuration #1 chosen from 1 choice
Apr  6 09:02:50 machine kernel: hub 1-0:1.0: USB hub found
Apr  6 09:02:50 machine kernel: hub 1-0:1.0: 4 ports detected
Apr  6 09:02:50 machine kernel: i801_smbus 0000:00:1f.3: PCI INT A -> GSI 23 (level, low) -> IRQ 23
Apr  6 09:02:50 machine kernel: [drm] Initialized drm 1.1.0 20060810
Apr  6 09:02:50 machine kernel: uhci_hcd 0000:00:1a.0: PCI INT A -> GSI 20 (level, low) -> IRQ 20
Apr  6 09:02:50 machine kernel: uhci_hcd 0000:00:1a.0: UHCI Host Controller
Apr  6 09:02:50 machine kernel: uhci_hcd 0000:00:1a.0: new USB bus registered, assigned bus number 2
Apr  6 09:02:50 machine kernel: uhci_hcd 0000:00:1a.0: irq 20, io base 0x00001860
Apr  6 09:02:50 machine kernel: usb usb2: New USB device found, idVendor=1d6b, idProduct=0001
Apr  6 09:02:50 machine kernel: usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Apr  6 09:02:50 machine kernel: usb usb2: Product: UHCI Host Controller
Apr  6 09:02:50 machine kernel: usb usb2: Manufacturer: Linux 2.6.32.2-strip uhci_hcd
Apr  6 09:02:50 machine kernel: usb usb2: SerialNumber: 0000:00:1a.0
Apr  6 09:02:50 machine kernel: usb usb2: configuration #1 chosen from 1 choice
Apr  6 09:02:50 machine kernel: hub 2-0:1.0: USB hub found
Apr  6 09:02:50 machine kernel: hub 2-0:1.0: 2 ports detected
Apr  6 09:02:50 machine kernel: ehci_hcd 0000:00:1d.7: power state changed by ACPI to D0
Apr  6 09:02:50 machine kernel: ehci_hcd 0000:00:1d.7: PCI INT D -> GSI 19 (level, low) -> IRQ 19
Apr  6 09:02:50 machine kernel: ehci_hcd 0000:00:1d.7: EHCI Host Controller
Apr  6 09:02:50 machine kernel: ehci_hcd 0000:00:1d.7: new USB bus registered, assigned bus number 3
Apr  6 09:02:50 machine kernel: ehci_hcd 0000:00:1d.7: debug port 1
Apr  6 09:02:50 machine kernel: ehci_hcd 0000:00:1d.7: irq 19, io mem 0xfe227000
Apr  6 09:02:50 machine kernel: ehci_hcd 0000:00:1d.7: USB 2.0 started, EHCI 1.00
Apr  6 09:02:50 machine kernel: usb usb3: New USB device found, idVendor=1d6b, idProduct=0002
Apr  6 09:02:50 machine kernel: usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Apr  6 09:02:50 machine kernel: usb usb3: Product: EHCI Host Controller
Apr  6 09:02:50 machine kernel: usb usb3: Manufacturer: Linux 2.6.32.2-strip ehci_hcd
Apr  6 09:02:50 machine kernel: usb usb3: SerialNumber: 0000:00:1d.7
Apr  6 09:02:50 machine kernel: usb usb3: configuration #1 chosen from 1 choice
Apr  6 09:02:50 machine kernel: hub 3-0:1.0: USB hub found
Apr  6 09:02:50 machine kernel: hub 3-0:1.0: 6 ports detected
Apr  6 09:02:50 machine kernel: uhci_hcd 0000:00:1a.1: power state changed by ACPI to D0
Apr  6 09:02:50 machine kernel: uhci_hcd 0000:00:1a.1: PCI INT B -> GSI 21 (level, low) -> IRQ 21
Apr  6 09:02:50 machine kernel: uhci_hcd 0000:00:1a.1: UHCI Host Controller
Apr  6 09:02:50 machine kernel: uhci_hcd 0000:00:1a.1: new USB bus registered, assigned bus number 4
Apr  6 09:02:50 machine kernel: uhci_hcd 0000:00:1a.1: irq 21, io base 0x00001880
Apr  6 09:02:50 machine kernel: usb usb4: New USB device found, idVendor=1d6b, idProduct=0001
Apr  6 09:02:50 machine kernel: usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Apr  6 09:02:50 machine kernel: usb usb4: Product: UHCI Host Controller
Apr  6 09:02:50 machine kernel: usb usb4: Manufacturer: Linux 2.6.32.2-strip uhci_hcd
Apr  6 09:02:50 machine kernel: usb usb4: SerialNumber: 0000:00:1a.1
Apr  6 09:02:50 machine kernel: usb usb4: configuration #1 chosen from 1 choice
Apr  6 09:02:50 machine kernel: hub 4-0:1.0: USB hub found
Apr  6 09:02:50 machine kernel: hub 4-0:1.0: 2 ports detected
Apr  6 09:02:50 machine kernel: uhci_hcd 0000:00:1d.0: power state changed by ACPI to D0
Apr  6 09:02:50 machine kernel: uhci_hcd 0000:00:1d.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
Apr  6 09:02:50 machine kernel: uhci_hcd 0000:00:1d.0: UHCI Host Controller
Apr  6 09:02:50 machine kernel: uhci_hcd 0000:00:1d.0: new USB bus registered, assigned bus number 5
Apr  6 09:02:50 machine kernel: uhci_hcd 0000:00:1d.0: irq 16, io base 0x000018a0
Apr  6 09:02:50 machine kernel: usb usb5: New USB device found, idVendor=1d6b, idProduct=0001
Apr  6 09:02:50 machine kernel: usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Apr  6 09:02:50 machine kernel: usb usb5: Product: UHCI Host Controller
Apr  6 09:02:50 machine kernel: usb usb5: Manufacturer: Linux 2.6.32.2-strip uhci_hcd
Apr  6 09:02:50 machine kernel: usb usb5: SerialNumber: 0000:00:1d.0
Apr  6 09:02:50 machine kernel: usb usb5: configuration #1 chosen from 1 choice
Apr  6 09:02:50 machine kernel: hub 5-0:1.0: USB hub found
Apr  6 09:02:50 machine kernel: hub 5-0:1.0: 2 ports detected
Apr  6 09:02:50 machine kernel: uhci_hcd 0000:00:1d.1: PCI INT B -> GSI 17 (level, low) -> IRQ 17
Apr  6 09:02:50 machine kernel: uhci_hcd 0000:00:1d.1: UHCI Host Controller
Apr  6 09:02:50 machine kernel: uhci_hcd 0000:00:1d.1: new USB bus registered, assigned bus number 6
Apr  6 09:02:50 machine kernel: uhci_hcd 0000:00:1d.1: irq 17, io base 0x000018c0
Apr  6 09:02:50 machine kernel: usb usb6: New USB device found, idVendor=1d6b, idProduct=0001
Apr  6 09:02:50 machine kernel: usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Apr  6 09:02:50 machine kernel: usb usb6: Product: UHCI Host Controller
Apr  6 09:02:50 machine kernel: usb usb6: Manufacturer: Linux 2.6.32.2-strip uhci_hcd
Apr  6 09:02:50 machine kernel: usb usb6: SerialNumber: 0000:00:1d.1
Apr  6 09:02:50 machine kernel: usb usb6: configuration #1 chosen from 1 choice
Apr  6 09:02:50 machine kernel: hub 6-0:1.0: USB hub found
Apr  6 09:02:50 machine kernel: hub 6-0:1.0: 2 ports detected
Apr  6 09:02:50 machine kernel: uhci_hcd 0000:00:1d.2: power state changed by ACPI to D0
Apr  6 09:02:50 machine kernel: uhci_hcd 0000:00:1d.2: PCI INT C -> GSI 18 (level, low) -> IRQ 18
Apr  6 09:02:50 machine kernel: uhci_hcd 0000:00:1d.2: UHCI Host Controller
Apr  6 09:02:50 machine kernel: uhci_hcd 0000:00:1d.2: new USB bus registered, assigned bus number 7
Apr  6 09:02:50 machine kernel: uhci_hcd 0000:00:1d.2: irq 18, io base 0x000018e0
Apr  6 09:02:50 machine kernel: usb usb7: New USB device found, idVendor=1d6b, idProduct=0001
Apr  6 09:02:50 machine kernel: usb usb7: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Apr  6 09:02:50 machine kernel: usb usb7: Product: UHCI Host Controller
Apr  6 09:02:50 machine kernel: usb usb7: Manufacturer: Linux 2.6.32.2-strip uhci_hcd
Apr  6 09:02:50 machine kernel: usb usb7: SerialNumber: 0000:00:1d.2
Apr  6 09:02:50 machine kernel: usb usb7: configuration #1 chosen from 1 choice
Apr  6 09:02:50 machine kernel: hub 7-0:1.0: USB hub found
Apr  6 09:02:50 machine kernel: hub 7-0:1.0: 2 ports detected
Apr  6 09:02:50 machine kernel: iwlagn: Intel(R) Wireless WiFi Link AGN driver for Linux, 1.3.27ks
Apr  6 09:02:50 machine kernel: iwlagn: Copyright(c) 2003-2009 Intel Corporation
Apr  6 09:02:50 machine kernel: iwlagn 0000:03:00.0: PCI INT A -> GSI 17 (level, low) -> IRQ 17
Apr  6 09:02:50 machine kernel: iwlagn 0000:03:00.0: Detected Intel Wireless WiFi Link 4965AGN REV=0x4
Apr  6 09:02:50 machine kernel: iwlagn 0000:03:00.0: Tunable channels: 13 802.11bg, 19 802.11a channels
Apr  6 09:02:50 machine kernel: cfg80211: Regulatory domain changed to country: US
Apr  6 09:02:50 machine kernel: ^I(start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp)
Apr  6 09:02:50 machine kernel: ^I(2402000 KHz - 2472000 KHz @ 40000 KHz), (300 mBi, 2700 mBm)
Apr  6 09:02:50 machine kernel: ^I(5170000 KHz - 5250000 KHz @ 40000 KHz), (300 mBi, 1700 mBm)
Apr  6 09:02:50 machine kernel: ^I(5250000 KHz - 5330000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
Apr  6 09:02:50 machine kernel: ^I(5490000 KHz - 5710000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
Apr  6 09:02:50 machine kernel: ^I(5735000 KHz - 5835000 KHz @ 40000 KHz), (300 mBi, 3000 mBm)
Apr  6 09:02:50 machine kernel: usb 2-2: new full speed USB device using uhci_hcd and address 2
Apr  6 09:02:50 machine kernel: usb 2-2: New USB device found, idVendor=0483, idProduct=2016
Apr  6 09:02:50 machine kernel: usb 2-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
Apr  6 09:02:50 machine kernel: usb 2-2: Product: Biometric Coprocessor
Apr  6 09:02:50 machine kernel: usb 2-2: Manufacturer: STMicroelectronics
Apr  6 09:02:50 machine kernel: usb 2-2: configuration #1 chosen from 1 choice
Apr  6 09:02:50 machine kernel: usb 3-2: new high speed USB device using ehci_hcd and address 2
Apr  6 09:02:50 machine kernel: nouveau 0000:01:00.0: power state changed by ACPI to D0
Apr  6 09:02:50 machine kernel: nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: failed to evaluate _DSM: 5
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: Detected an NV50 generation card (0x086900a2)
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PRAMIN
Apr  6 09:02:50 machine kernel: usb 3-2: New USB device found, idVendor=03f0, idProduct=1812
Apr  6 09:02:50 machine kernel: usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
Apr  6 09:02:50 machine kernel: usb 3-2: Product: Officejet Pro K550
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: ... appears to be valid
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: BIT BIOS found
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: Bios version 60.86.3e.00
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: BIT table 'd' not found
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: Found Display Configuration Block version 4.0
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: DCB connector table: VHER 0x40 5 14 2
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0:   0: 0x00000040: type 0x40 idx 0 tag 0xff
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0:   1: 0x00000100: type 0x00 idx 1 tag 0xff
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0:   2: 0x00001231: type 0x31 idx 2 tag 0x07
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0:   3: 0x00000311: type 0x11 idx 3 tag 0xff
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: Raw DCB entry 0: 01000323 00010034
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: Raw DCB entry 1: 02811300 00000028
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: Raw DCB entry 2: 02822312 00010030
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: Raw DCB entry 3: 014333f1 0080c080
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: Raw DCB entry 4: 0000000e 00000000
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset 0xDD0F
Apr  6 09:02:50 machine kernel: usb 3-2: Manufacturer: HP
Apr  6 09:02:50 machine kernel: usb 3-2: SerialNumber: MY5AL2105T
Apr  6 09:02:50 machine kernel: usb 3-2: configuration #1 chosen from 1 choice
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset 0xE04F
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset 0xEAA4
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset 0xEB96
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset 0xED83
Apr  6 09:02:50 machine kernel: usblp0: USB Bidirectional printer dev 2 if 0 alt 0 proto 2 vid 0x03F0 pid 0x1812
Apr  6 09:02:50 machine kernel: usbcore: registered new interface driver usblp
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS init table at offset 0xEDE8
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: 0xCE7E: parsing output script 0
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: 0xCFF4: parsing output script 0
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: 0xC66A: parsing output script 0
Apr  6 09:02:50 machine kernel: usb 4-1: new low speed USB device using uhci_hcd and address 2
Apr  6 09:02:50 machine kernel: [TTM] Zone  kernel: Available graphics memory: 1535528 kiB.
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: 128 MiB VRAM
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: 512 MiB GART (aperture)
Apr  6 09:02:50 machine kernel: nouveau 0000:01:00.0: firmware: requesting nouveau/nv86.ctxprog
Apr  6 09:02:50 machine kernel: usb 4-1: New USB device found, idVendor=0461, idProduct=4d62
Apr  6 09:02:50 machine kernel: usb 4-1: New USB device strings: Mfr=0, Product=2, SerialNumber=0
Apr  6 09:02:50 machine kernel: usb 4-1: Product: HP Laser Mobile Mouse
Apr  6 09:02:50 machine kernel: usb 4-1: configuration #1 chosen from 1 choice
Apr  6 09:02:50 machine kernel: nouveau 0000:01:00.0: firmware: requesting nouveau/nv86.ctxvals
Apr  6 09:02:50 machine kernel: usbcore: registered new interface driver hiddev
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: Allocating FIFO number 1
Apr  6 09:02:50 machine kernel: input: HP Laser Mobile Mouse as /devices/pci0000:00/0000:00:1a.1/usb4/4-1/4-1:1.0/input/input7
Apr  6 09:02:50 machine kernel: generic-usb 0003:0461:4D62.0001: input,hidraw0: USB HID v1.11 Mouse [HP Laser Mobile Mouse] on usb-0000:00:1a.1-1/input0
Apr  6 09:02:50 machine kernel: usbcore: registered new interface driver usbhid
Apr  6 09:02:50 machine kernel: usbhid: v2.6:USB HID core driver
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00000010 - Ch 127
Apr  6 09:02:50 machine last message repeated 101 times
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: PFIFO still angry after 101 spins, halt
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 1
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: Detected a LVDS output
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: Detected a DAC output
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: Detected a TMDS output
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: Detected a LVDS connector
Apr  6 09:02:50 machine kernel: usb 6-2: new full speed USB device using uhci_hcd and address 2
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: Detected a VGA connector
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: Detected a DVI-D connector
Apr  6 09:02:50 machine kernel: usb 6-2: New USB device found, idVendor=17ef, idProduct=1003
Apr  6 09:02:50 machine kernel: usb 6-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
Apr  6 09:02:50 machine kernel: usb 6-2: Product: Integrated Smart Card Reader
Apr  6 09:02:50 machine kernel: usb 6-2: Manufacturer: Lenovo
Apr  6 09:02:50 machine kernel: usb 6-2: configuration #1 chosen from 1 choice
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: allocated 1680x1050 fb: 0x40210000, bo ffff8800bda82200
Apr  6 09:02:50 machine kernel: [drm] LVDS-7: set mode 1680x1050 1f
Apr  6 09:02:50 machine kernel: fb0: nouveaufb frame buffer device
Apr  6 09:02:50 machine kernel: registered panic notifier
Apr  6 09:02:50 machine kernel: [drm] Initialized nouveau 0.0.15 20090420 for 0000:01:00.0 on minor 0
Apr  6 09:02:50 machine kernel: Adding 4192924k swap on /dev/sda6.  Priority:-1 extents:1 across:4192924k 
Apr  6 09:02:50 machine kernel: fuse init (API version 7.13)
Apr  6 09:02:50 machine kernel: lp: driver loaded but no devices found
Apr  6 09:02:50 machine kernel: ppdev: user-space parallel port driver
Apr  6 09:02:50 machine kernel: REISERFS (device sda5): found reiserfs format "3.6" with standard journal
Apr  6 09:02:50 machine kernel: REISERFS (device sda5): using ordered data mode
Apr  6 09:02:50 machine kernel: REISERFS (device sda5): journal params: device sda5, size 8192, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
Apr  6 09:02:50 machine kernel: REISERFS (device sda5): checking transaction log (sda5)
Apr  6 09:02:50 machine kernel: REISERFS (device sda5): Using r5 hash to sort names
Apr  6 09:02:50 machine logger: /etc/rc.d/rc.inet1:  /sbin/ifconfig lo 127.0.0.1
Apr  6 09:02:50 machine logger: /etc/rc.d/rc.inet1:  /sbin/route add -net 127.0.0.0 netmask 255.0.0.0 lo
Apr  6 09:02:50 machine logger: /etc/rc.d/rc.inet1:  /sbin/ifconfig eth0 82.229.182.39 broadcast 82.229.182.255 netmask 255.255.255.0
Apr  6 09:02:52 machine kernel: e1000e: eth0 NIC Link is Up 100 Mbps Full Duplex, Flow Control: None
Apr  6 09:02:52 machine kernel: 0000:00:19.0: eth0: 10/100 speed: disabling TSO
Apr  6 09:02:53 machine logger: /etc/rc.d/rc.M:  /sbin/iwconfig wlan0 nick machine
Apr  6 09:02:53 machine logger: /etc/rc.d/rc.M:  /sbin/iwconfig wlan0 key ************
Apr  6 09:02:54 machine logger: /etc/rc.d/rc.M:  /sbin/iwconfig wlan0 key restricted
Apr  6 09:02:54 machine logger: /etc/rc.d/rc.M:  /sbin/iwconfig wlan0 essid "clauxdeserignac"
Apr  6 09:02:54 machine logger: /etc/rc.d/rc.M:  /sbin/iwconfig wlan0 essid "clauxdeserignac"
Apr  6 09:02:54 machine logger: /etc/rc.d/rc.inet1:  /sbin/route add default gw 82.229.182.254 metric 1
Apr  6 09:02:54 machine acpid: starting up 
Apr  6 09:02:54 machine acpid: 1 rule loaded 
Apr  6 09:02:54 machine acpid: waiting for events: event logging is off 
Apr  6 09:02:56 machine kernel: NET: Registered protocol family 10
Apr  6 09:02:56 machine kernel: lo: Disabled Privacy Extensions
Apr  6 09:02:56 machine smartd[2277]: smartd version 5.38 [x86_64-slackware-linux-gnu] Copyright (C) 2002-8 Bruce Allen 
Apr  6 09:02:56 machine smartd[2277]: Home page is http://smartmontools.sourceforge.net/  
Apr  6 09:02:56 machine smartd[2277]: Opened configuration file /etc/smartd.conf 
Apr  6 09:02:56 machine smartd[2277]: Drive: DEVICESCAN, implied '-a' Directive on line 23 of file /etc/smartd.conf 
Apr  6 09:02:56 machine smartd[2277]: Configuration file /etc/smartd.conf was parsed, found DEVICESCAN, scanning devices 
Apr  6 09:02:56 machine smartd[2277]: Device: /dev/sda, opened 
Apr  6 09:02:56 machine smartd[2277]: Device /dev/sda: using '-d sat' for ATA disk behind SAT layer. 
Apr  6 09:02:56 machine smartd[2277]: Device: /dev/sda, opened 
Apr  6 09:02:56 machine smartd[2277]: Device: /dev/sda, not found in smartd database. 
Apr  6 09:02:57 machine smartd[2277]: Device: /dev/sda, is SMART capable. Adding to "monitor" list. 
Apr  6 09:02:57 machine smartd[2277]: Monitoring 0 ATA and 1 SCSI devices 
Apr  6 09:02:57 machine smartd[2299]: smartd has fork()ed into background mode. New PID=2299. 
Apr  6 09:03:02 machine /usr/sbin/gpm[2383]: *** info [startup.c(95)]: 
Apr  6 09:03:02 machine /usr/sbin/gpm[2383]: Started gpm successfully. Entered daemon mode.
Apr  6 09:03:02 machine hdapsd[2387]: Starting hdapsd
Apr  6 09:03:02 machine kernel: thinkpad_ec: thinkpad_ec 0.40 loaded.
Apr  6 09:03:02 machine kernel: tp_smapi 0.40 loading...
Apr  6 09:03:02 machine kernel: tp_smapi successfully loaded (smapi_port=0xb2).
Apr  6 09:03:02 machine /usr/sbin/gpm[2383]: *** info [mice.c(1766)]: 
Apr  6 09:03:02 machine /usr/sbin/gpm[2383]: imps2: Auto-detected intellimouse PS/2
Apr  6 09:03:02 machine kernel: hdaps: LENOVO ThinkPad T61 detected, setting orientation 1
Apr  6 09:03:02 machine kernel: hdaps: device successfully initialized.
Apr  6 09:03:02 machine kernel: input: ThinkPad HDAPS joystick emulation as /devices/virtual/input/input8
Apr  6 09:03:02 machine kernel: input: ThinkPad HDAPS accelerometer data as /devices/virtual/input/input9
Apr  6 09:03:02 machine kernel: hdaps: driver successfully loaded.
Apr  6 09:03:02 machine hdapsd[2387]: Selected interface: HDAPS
Apr  6 09:03:02 machine hdapsd[2387]: Selected HDAPS input device: /dev/input/event9
Apr  6 09:03:02 machine hdapsd[2432]: Could not read from /sys/devices/platform/hdaps/position: Device or resource busy
Apr  6 09:03:02 machine kernel: vboxdrv: TSC mode is 'asynchronous', kernel timer mode is 'normal'.
Apr  6 09:03:02 machine hdapsd[2432]: Could not read from /sys/devices/platform/hdaps/position: Device or resource busy
Apr  6 09:03:03 machine last message repeated 3 times
Apr  6 09:03:48 machine shutdown[2473]: shutting down for system reboot
Apr  6 09:03:48 machine init: Switching to runlevel: 6
Apr  6 09:03:49 machine shutdown[2476]: shutting down for system reboot
Apr  6 09:03:51 machine logger: /etc/rc.d/rc.inet1:  /sbin/route del default
Apr  6 09:03:51 machine logger: /etc/rc.d/rc.inet1:  /sbin/ifconfig eth0 down
Apr  6 09:03:52 machine logger: /etc/rc.d/rc.inet1:  /sbin/ifconfig wlan0 down
Apr  6 09:03:52 machine logger: /etc/rc.d/rc.inet1:  /sbin/ifconfig lo down
Apr  6 09:03:52 machine acpid: exiting 
Apr  6 09:03:52 machine exiting on signal 15


------------------------------Starting with VGA text only console 80x25----------------------
Apr  6 09:05:02 machine syslogd 1.4.1: restart.
Apr  6 09:05:02 machine kernel: klogd 1.4.1, log source = /proc/kmsg started.
Apr  6 09:05:02 machine kernel: 3cold
Apr  6 09:05:02 machine kernel: pci 0000:15:00.3: PME# disabled
Apr  6 09:05:02 machine kernel: pci 0000:15:00.4: PME# supported from D0 D1 D2 D3hot D3cold
Apr  6 09:05:02 machine kernel: pci 0000:15:00.4: PME# disabled
Apr  6 09:05:02 machine kernel: pci 0000:15:00.5: PME# supported from D0 D1 D2 D3hot D3cold
Apr  6 09:05:02 machine kernel: pci 0000:15:00.5: PME# disabled
Apr  6 09:05:02 machine kernel: pci 0000:00:1e.0: transparent bridge
Apr  6 09:05:02 machine kernel: ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 7 9 *10 11)
Apr  6 09:05:02 machine kernel: ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 7 9 10 *11)
Apr  6 09:05:02 machine kernel: ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 7 9 10 *11)
Apr  6 09:05:02 machine kernel: ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 7 9 10 *11)
Apr  6 09:05:02 machine kernel: ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 7 9 10 *11)
Apr  6 09:05:02 machine kernel: ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 7 9 10 *11)
Apr  6 09:05:02 machine kernel: ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 7 9 10 *11)
Apr  6 09:05:02 machine kernel: ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 7 9 10 *11)
Apr  6 09:05:02 machine kernel: vgaarb: device added: PCI:0000:01:00.0,decodes=io+mem,owns=io+mem,locks=none
Apr  6 09:05:02 machine kernel: vgaarb: loaded
Apr  6 09:05:02 machine kernel: SCSI subsystem initialized
Apr  6 09:05:02 machine kernel: usbcore: registered new interface driver usbfs
Apr  6 09:05:02 machine kernel: usbcore: registered new interface driver hub
Apr  6 09:05:02 machine kernel: usbcore: registered new device driver usb
Apr  6 09:05:02 machine kernel: PCI: Using ACPI for IRQ routing
Apr  6 09:05:02 machine kernel: hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
Apr  6 09:05:02 machine kernel: hpet0: 3 comparators, 64-bit 14.318180 MHz counter
Apr  6 09:05:02 machine kernel: Switching to clocksource hpet
Apr  6 09:05:02 machine kernel: pnp: PnP ACPI init
Apr  6 09:05:02 machine kernel: ACPI: bus type pnp registered
Apr  6 09:05:02 machine kernel: pnp: PnP ACPI: found 11 devices
Apr  6 09:05:02 machine kernel: ACPI: ACPI bus type pnp unregistered
Apr  6 09:05:02 machine kernel: system 00:00: iomem range 0x0-0x9ffff could not be reserved
Apr  6 09:05:02 machine kernel: system 00:00: iomem range 0xc0000-0xc3fff has been reserved
Apr  6 09:05:02 machine kernel: system 00:00: iomem range 0xc4000-0xc7fff has been reserved
Apr  6 09:05:02 machine kernel: system 00:00: iomem range 0xc8000-0xcbfff has been reserved
Apr  6 09:05:02 machine kernel: system 00:00: iomem range 0xcc000-0xcffff has been reserved
Apr  6 09:05:02 machine kernel: system 00:00: iomem range 0xd0000-0xd3fff could not be reserved
Apr  6 09:05:02 machine kernel: system 00:00: iomem range 0xe0000-0xe3fff could not be reserved
Apr  6 09:05:02 machine kernel: system 00:00: iomem range 0xe4000-0xe7fff could not be reserved
Apr  6 09:05:02 machine kernel: system 00:00: iomem range 0xe8000-0xebfff could not be reserved
Apr  6 09:05:02 machine kernel: system 00:00: iomem range 0xec000-0xeffff could not be reserved
Apr  6 09:05:02 machine kernel: system 00:00: iomem range 0xf0000-0xfffff could not be reserved
Apr  6 09:05:02 machine kernel: system 00:00: iomem range 0x100000-0xbeffffff could not be reserved
Apr  6 09:05:02 machine kernel: system 00:00: iomem range 0xfec00000-0xfed3ffff could not be reserved
Apr  6 09:05:02 machine kernel: system 00:00: iomem range 0xfed4c000-0xffffffff could not be reserved
Apr  6 09:05:02 machine kernel: system 00:02: ioport range 0x164e-0x164f has been reserved
Apr  6 09:05:02 machine kernel: system 00:02: ioport range 0x1000-0x107f has been reserved
Apr  6 09:05:02 machine kernel: system 00:02: ioport range 0x1180-0x11bf has been reserved
Apr  6 09:05:02 machine kernel: system 00:02: ioport range 0x800-0x80f has been reserved
Apr  6 09:05:02 machine kernel: system 00:02: ioport range 0x15e0-0x15ef has been reserved
Apr  6 09:05:02 machine kernel: system 00:02: ioport range 0x1600-0x165f could not be reserved
Apr  6 09:05:02 machine kernel: system 00:02: iomem range 0xf0000000-0xf3ffffff has been reserved
Apr  6 09:05:02 machine kernel: system 00:02: iomem range 0xfed1c000-0xfed1ffff has been reserved
Apr  6 09:05:02 machine kernel: system 00:02: iomem range 0xfed14000-0xfed17fff has been reserved
Apr  6 09:05:02 machine kernel: system 00:02: iomem range 0xfed18000-0xfed18fff has been reserved
Apr  6 09:05:02 machine kernel: system 00:02: iomem range 0xfed19000-0xfed19fff has been reserved
Apr  6 09:05:02 machine kernel: system 00:02: iomem range 0xfed45000-0xfed4bfff has been reserved
Apr  6 09:05:02 machine kernel: pci 0000:01:00.0: BAR 6: can't allocate mem resource [0xf0000000-0xefffffff]
Apr  6 09:05:02 machine kernel: pci 0000:00:01.0: PCI bridge, secondary bus 0000:01
Apr  6 09:05:02 machine kernel: pci 0000:00:01.0:   IO window: 0x2000-0x2fff
Apr  6 09:05:02 machine kernel: pci 0000:00:01.0:   MEM window: 0xd4000000-0xd6ffffff
Apr  6 09:05:02 machine kernel: pci 0000:00:01.0:   PREFETCH window: 0x000000e0000000-0x000000efffffff
Apr  6 09:05:02 machine kernel: pci 0000:00:1c.0: PCI bridge, secondary bus 0000:02
Apr  6 09:05:02 machine kernel: pci 0000:00:1c.0:   IO window: 0x3000-0x3fff
Apr  6 09:05:02 machine kernel: pci 0000:00:1c.0:   MEM window: 0xfc000000-0xfdffffff
Apr  6 09:05:02 machine kernel: pci 0000:00:1c.0:   PREFETCH window: 0x000000f8000000-0x000000f80fffff
Apr  6 09:05:02 machine kernel: pci 0000:00:1c.1: PCI bridge, secondary bus 0000:03
Apr  6 09:05:02 machine kernel: pci 0000:00:1c.1:   IO window: 0x4000-0x4fff
Apr  6 09:05:02 machine kernel: pci 0000:00:1c.1:   MEM window: 0xdc100000-0xdf2fffff
Apr  6 09:05:02 machine kernel: pci 0000:00:1c.1:   PREFETCH window: 0x000000dfd00000-0x000000dfdfffff
Apr  6 09:05:02 machine kernel: pci 0000:00:1c.2: PCI bridge, secondary bus 0000:04
Apr  6 09:05:02 machine kernel: pci 0000:00:1c.2:   IO window: 0x5000-0x5fff
Apr  6 09:05:02 machine kernel: pci 0000:00:1c.2:   MEM window: 0xd8000000-0xd9ffffff
Apr  6 09:05:02 machine kernel: pci 0000:00:1c.2:   PREFETCH window: 0x000000dfa00000-0x000000dfafffff
Apr  6 09:05:02 machine kernel: pci 0000:00:1c.3: PCI bridge, secondary bus 0000:05
Apr  6 09:05:02 machine kernel: pci 0000:00:1c.3:   IO window: 0x6000-0x6fff
Apr  6 09:05:02 machine kernel: pci 0000:00:1c.3:   MEM window: 0xd0000000-0xd1ffffff
Apr  6 09:05:02 machine kernel: pci 0000:00:1c.3:   PREFETCH window: 0x000000df700000-0x000000df7fffff
Apr  6 09:05:02 machine kernel: pci 0000:00:1c.4: PCI bridge, secondary bus 0000:0d
Apr  6 09:05:02 machine kernel: pci 0000:00:1c.4:   IO window: 0x7000-0x7fff
Apr  6 09:05:02 machine kernel: pci 0000:00:1c.4:   MEM window: 0xcc000000-0xcdffffff
Apr  6 09:05:02 machine kernel: pci 0000:00:1c.4:   PREFETCH window: 0x000000df400000-0x000000df4fffff
Apr  6 09:05:02 machine kernel: pci 0000:15:00.0: CardBus bridge, secondary bus 0000:16
Apr  6 09:05:02 machine kernel: pci 0000:15:00.0:   IO window: 0x008000-0x0080ff
Apr  6 09:05:02 machine kernel: pci 0000:15:00.0:   IO window: 0x008400-0x0084ff
Apr  6 09:05:02 machine kernel: pci 0000:15:00.0:   PREFETCH window: 0xf4000000-0xf7ffffff
Apr  6 09:05:02 machine kernel: pci 0000:15:00.0:   MEM window: 0xc0000000-0xc3ffffff
Apr  6 09:05:02 machine kernel: pci 0000:00:1e.0: PCI bridge, secondary bus 0000:15
Apr  6 09:05:02 machine kernel: pci 0000:00:1e.0:   IO window: 0x8000-0xbfff
Apr  6 09:05:02 machine kernel: pci 0000:00:1e.0:   MEM window: 0xf8100000-0xfbffffff
Apr  6 09:05:02 machine kernel: pci 0000:00:1e.0:   PREFETCH window: 0x000000f4000000-0x000000f7ffffff
Apr  6 09:05:02 machine kernel: pci 0000:00:01.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
Apr  6 09:05:02 machine kernel: pci 0000:00:1c.0: PCI INT A -> GSI 20 (level, low) -> IRQ 20
Apr  6 09:05:02 machine kernel: pci 0000:00:1c.1: PCI INT B -> GSI 21 (level, low) -> IRQ 21
Apr  6 09:05:02 machine kernel: pci 0000:00:1c.2: PCI INT C -> GSI 22 (level, low) -> IRQ 22
Apr  6 09:05:02 machine kernel: pci 0000:00:1c.3: PCI INT D -> GSI 23 (level, low) -> IRQ 23
Apr  6 09:05:02 machine kernel: pci 0000:00:1c.4: PCI INT A -> GSI 20 (level, low) -> IRQ 20
Apr  6 09:05:02 machine kernel: pci 0000:00:1e.0: enabling device (0005 -> 0007)
Apr  6 09:05:02 machine kernel: pci 0000:15:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
Apr  6 09:05:02 machine kernel: NET: Registered protocol family 2
Apr  6 09:05:02 machine kernel: IP route cache hash table entries: 131072 (order: 8, 1048576 bytes)
Apr  6 09:05:02 machine kernel: TCP established hash table entries: 262144 (order: 10, 4194304 bytes)
Apr  6 09:05:02 machine kernel: TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
Apr  6 09:05:02 machine kernel: TCP: Hash tables configured (established 262144 bind 65536)
Apr  6 09:05:02 machine kernel: TCP reno registered
Apr  6 09:05:02 machine kernel: NET: Registered protocol family 1
Apr  6 09:05:02 machine kernel: Simple Boot Flag at 0x35 set to 0x1
Apr  6 09:05:02 machine kernel: Intel AES-NI instructions are not detected.
Apr  6 09:05:02 machine kernel: VFS: Disk quotas dquot_6.5.2
Apr  6 09:05:02 machine kernel: ROMFS MTD (C) 2007 Red Hat, Inc.
Apr  6 09:05:02 machine kernel: msgmni has been set to 5997
Apr  6 09:05:02 machine kernel: alg: No test for cipher_null (cipher_null-generic)
Apr  6 09:05:02 machine kernel: alg: No test for ecb(cipher_null) (ecb-cipher_null)
Apr  6 09:05:02 machine kernel: alg: No test for digest_null (digest_null-generic)
Apr  6 09:05:02 machine kernel: alg: No test for compress_null (compress_null-generic)
Apr  6 09:05:02 machine kernel: alg: No test for fcrypt (fcrypt-generic)
Apr  6 09:05:02 machine kernel: alg: No test for stdrng (krng)
Apr  6 09:05:02 machine kernel: Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)
Apr  6 09:05:02 machine kernel: io scheduler noop registered
Apr  6 09:05:02 machine kernel: io scheduler anticipatory registered
Apr  6 09:05:02 machine kernel: io scheduler deadline registered
Apr  6 09:05:02 machine kernel: io scheduler cfq registered (default)
Apr  6 09:05:02 machine kernel: pci_hotplug: PCI Hot Plug PCI Core version: 0.5
Apr  6 09:05:02 machine kernel: Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
Apr  6 09:05:02 machine kernel: brd: module loaded
Apr  6 09:05:02 machine kernel: loop: module loaded
Apr  6 09:05:02 machine kernel: input: Macintosh mouse button emulation as /devices/virtual/input/input0
Apr  6 09:05:02 machine kernel: ahci 0000:00:1f.2: PCI INT B -> GSI 16 (level, low) -> IRQ 16
Apr  6 09:05:02 machine kernel: ahci 0000:00:1f.2: AHCI 0001.0100 32 slots 3 ports 1.5 Gbps 0x1 impl SATA mode
Apr  6 09:05:02 machine kernel: ahci 0000:00:1f.2: flags: 64bit ncq sntf pm led clo pio slum part ccc 
Apr  6 09:05:02 machine kernel: scsi0 : ahci
Apr  6 09:05:02 machine kernel: scsi1 : ahci
Apr  6 09:05:02 machine kernel: scsi2 : ahci
Apr  6 09:05:02 machine kernel: ata1: SATA max UDMA/133 irq_stat 0x00400040 irq 30, connection status changed
Apr  6 09:05:02 machine kernel: ata2: DUMMY
Apr  6 09:05:02 machine kernel: ata3: DUMMY
Apr  6 09:05:02 machine kernel: ata_piix 0000:00:1f.1: PCI INT C -> GSI 16 (level, low) -> IRQ 16
Apr  6 09:05:02 machine kernel: scsi3 : ata_piix
Apr  6 09:05:02 machine kernel: scsi4 : ata_piix
Apr  6 09:05:02 machine kernel: ata4: PATA max UDMA/100 cmd 0x1f0 ctl 0x3f6 bmdma 0x1830 irq 14
Apr  6 09:05:02 machine kernel: ata5: PATA max UDMA/100 cmd 0x170 ctl 0x376 bmdma 0x1838 irq 15
Apr  6 09:05:02 machine kernel: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0x60,0x64 irq 1,12
Apr  6 09:05:02 machine kernel: serio: i8042 KBD port at 0x60,0x64 irq 1
Apr  6 09:05:02 machine kernel: serio: i8042 AUX port at 0x60,0x64 irq 12
Apr  6 09:05:02 machine kernel: mice: PS/2 mouse device common for all mice
Apr  6 09:05:02 machine kernel: md: linear personality registered for level -1
Apr  6 09:05:02 machine kernel: md: raid0 personality registered for level 0
Apr  6 09:05:02 machine kernel: md: raid1 personality registered for level 1
Apr  6 09:05:02 machine kernel: md: raid10 personality registered for level 10
Apr  6 09:05:02 machine kernel: md: raid6 personality registered for level 6
Apr  6 09:05:02 machine kernel: md: raid5 personality registered for level 5
Apr  6 09:05:02 machine kernel: md: raid4 personality registered for level 4
Apr  6 09:05:02 machine kernel: md: multipath personality registered for level -4
Apr  6 09:05:02 machine kernel: device-mapper: uevent: version 1.0.3
Apr  6 09:05:02 machine kernel: device-mapper: ioctl: 4.15.0-ioctl (2009-04-01) initialised: dm-devel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Apr  6 09:05:02 machine kernel: cpuidle: using governor ladder
Apr  6 09:05:02 machine kernel: cpuidle: using governor menu
Apr  6 09:05:02 machine kernel: TCP cubic registered
Apr  6 09:05:02 machine kernel: NET: Registered protocol family 17
Apr  6 09:05:02 machine kernel: input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input1
Apr  6 09:05:02 machine kernel: ata4.00: ATAPI: HL-DT-ST DVDRAM GSA-U10N, 1.05, max UDMA/33
Apr  6 09:05:02 machine kernel: ata4.00: configured for UDMA/33
Apr  6 09:05:02 machine kernel: ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
Apr  6 09:05:02 machine kernel: ata1.00: ACPI cmd f5/00:00:00:00:00:a0 (SECURITY FREEZE LOCK) filtered out
Apr  6 09:05:02 machine kernel: ata1.00: ACPI cmd ef/10:03:00:00:00:a0 (SET FEATURES) filtered out
Apr  6 09:05:02 machine kernel: ata1.00: ATA-8: HITACHI HTS543216L9SA00, FB2ZC4EC, max UDMA/100
Apr  6 09:05:02 machine kernel: ata1.00: 312581808 sectors, multi 16: LBA48 NCQ (depth 31/32), AA
Apr  6 09:05:02 machine kernel: ata1.00: ACPI cmd f5/00:00:00:00:00:a0 (SECURITY FREEZE LOCK) filtered out
Apr  6 09:05:02 machine kernel: ata1.00: ACPI cmd ef/10:03:00:00:00:a0 (SET FEATURES) filtered out
Apr  6 09:05:02 machine kernel: ata1.00: configured for UDMA/100
Apr  6 09:05:02 machine kernel: ata1.00: configured for UDMA/100
Apr  6 09:05:02 machine kernel: ata1: EH complete
Apr  6 09:05:02 machine kernel: scsi 0:0:0:0: Direct-Access     ATA      HITACHI HTS54321 FB2Z PQ: 0 ANSI: 5
Apr  6 09:05:02 machine kernel: sd 0:0:0:0: [sda] 312581808 512-byte logical blocks: (160 GB/149 GiB)
Apr  6 09:05:02 machine kernel: sd 0:0:0:0: [sda] Write Protect is off
Apr  6 09:05:02 machine kernel: sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
Apr  6 09:05:02 machine kernel:  sda:
Apr  6 09:05:02 machine kernel: scsi 3:0:0:0: CD-ROM            HL-DT-ST DVDRAM GSA-U10N  1.05 PQ: 0 ANSI: 5
Apr  6 09:05:02 machine kernel: Uniform CD-ROM driver Revision: 3.20
Apr  6 09:05:02 machine kernel: sd 0:0:0:0: [sda] Attached SCSI disk
Apr  6 09:05:02 machine kernel: md: Waiting for all devices to be available before autodetect
Apr  6 09:05:02 machine kernel: md: If you don't use raid, use raid=noautodetect
Apr  6 09:05:02 machine kernel: md: Autodetecting RAID arrays.
Apr  6 09:05:02 machine kernel: md: Scanned 0 and added 0 devices.
Apr  6 09:05:02 machine kernel: md: autorun ...
Apr  6 09:05:02 machine kernel: md: ... autorun DONE.
Apr  6 09:05:02 machine kernel: REISERFS (device sda4): found reiserfs format "3.6" with standard journal
Apr  6 09:05:02 machine kernel: REISERFS (device sda4): using ordered data mode
Apr  6 09:05:02 machine kernel: REISERFS (device sda4): journal params: device sda4, size 8192, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
Apr  6 09:05:02 machine kernel: REISERFS (device sda4): checking transaction log (sda4)
Apr  6 09:05:02 machine kernel: REISERFS (device sda4): Using r5 hash to sort names
Apr  6 09:05:02 machine kernel: devtmpfs: mounted
Apr  6 09:05:02 machine kernel: Freeing unused kernel memory: 576k freed
Apr  6 09:05:02 machine kernel: ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
Apr  6 09:05:02 machine kernel: ehci_hcd 0000:00:1a.7: power state changed by ACPI to D0
Apr  6 09:05:02 machine kernel: ehci_hcd 0000:00:1a.7: PCI INT C -> GSI 22 (level, low) -> IRQ 22
Apr  6 09:05:02 machine kernel: ehci_hcd 0000:00:1a.7: EHCI Host Controller
Apr  6 09:05:02 machine kernel: ehci_hcd 0000:00:1a.7: new USB bus registered, assigned bus number 1
Apr  6 09:05:02 machine kernel: ehci_hcd 0000:00:1a.7: irq 22, io mem 0xfe226c00
Apr  6 09:05:02 machine kernel: ehci_hcd 0000:00:1a.7: USB 2.0 started, EHCI 1.00
Apr  6 09:05:02 machine kernel: usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
Apr  6 09:05:02 machine kernel: usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Apr  6 09:05:02 machine kernel: usb usb1: Product: EHCI Host Controller
Apr  6 09:05:02 machine kernel: usb usb1: Manufacturer: Linux 2.6.32.2-strip ehci_hcd
Apr  6 09:05:02 machine kernel: usb usb1: SerialNumber: 0000:00:1a.7
Apr  6 09:05:02 machine kernel: usb usb1: configuration #1 chosen from 1 choice
Apr  6 09:05:02 machine kernel: hub 1-0:1.0: USB hub found
Apr  6 09:05:02 machine kernel: hub 1-0:1.0: 4 ports detected
Apr  6 09:05:02 machine kernel: ehci_hcd 0000:00:1d.7: power state changed by ACPI to D0
Apr  6 09:05:02 machine kernel: ehci_hcd 0000:00:1d.7: PCI INT D -> GSI 19 (level, low) -> IRQ 19
Apr  6 09:05:02 machine kernel: ehci_hcd 0000:00:1d.7: EHCI Host Controller
Apr  6 09:05:02 machine kernel: ehci_hcd 0000:00:1d.7: new USB bus registered, assigned bus number 2
Apr  6 09:05:02 machine kernel: ehci_hcd 0000:00:1d.7: debug port 1
Apr  6 09:05:02 machine kernel: ehci_hcd 0000:00:1d.7: irq 19, io mem 0xfe227000
Apr  6 09:05:02 machine kernel: ehci_hcd 0000:00:1d.7: USB 2.0 started, EHCI 1.00
Apr  6 09:05:02 machine kernel: usb usb2: New USB device found, idVendor=1d6b, idProduct=0002
Apr  6 09:05:02 machine kernel: usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Apr  6 09:05:02 machine kernel: usb usb2: Product: EHCI Host Controller
Apr  6 09:05:02 machine kernel: usb usb2: Manufacturer: Linux 2.6.32.2-strip ehci_hcd
Apr  6 09:05:02 machine kernel: usb usb2: SerialNumber: 0000:00:1d.7
Apr  6 09:05:02 machine kernel: usb usb2: configuration #1 chosen from 1 choice
Apr  6 09:05:02 machine kernel: hub 2-0:1.0: USB hub found
Apr  6 09:05:02 machine kernel: hub 2-0:1.0: 6 ports detected
Apr  6 09:05:02 machine kernel: e1000e: Intel(R) PRO/1000 Network Driver - 1.0.2-k2
Apr  6 09:05:02 machine kernel: e1000e: Copyright (c) 1999-2008 Intel Corporation.
Apr  6 09:05:02 machine kernel: e1000e 0000:00:19.0: PCI INT A -> GSI 20 (level, low) -> IRQ 20
Apr  6 09:05:02 machine kernel: cfg80211: Using static regulatory domain info
Apr  6 09:05:02 machine kernel: cfg80211: Regulatory domain: US
Apr  6 09:05:02 machine kernel: ^I(start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp)
Apr  6 09:05:02 machine kernel: ^I(2402000 KHz - 2472000 KHz @ 40000 KHz), (600 mBi, 2700 mBm)
Apr  6 09:05:02 machine kernel: ^I(5170000 KHz - 5190000 KHz @ 40000 KHz), (600 mBi, 2300 mBm)
Apr  6 09:05:02 machine kernel: ^I(5190000 KHz - 5210000 KHz @ 40000 KHz), (600 mBi, 2300 mBm)
Apr  6 09:05:02 machine kernel: ^I(5210000 KHz - 5230000 KHz @ 40000 KHz), (600 mBi, 2300 mBm)
Apr  6 09:05:02 machine kernel: ^I(5230000 KHz - 5330000 KHz @ 40000 KHz), (600 mBi, 2300 mBm)
Apr  6 09:05:02 machine kernel: ^I(5735000 KHz - 5835000 KHz @ 40000 KHz), (600 mBi, 3000 mBm)
Apr  6 09:05:02 machine kernel: cfg80211: Calling CRDA for country: US
Apr  6 09:05:02 machine kernel: Non-volatile memory driver v1.3
Apr  6 09:05:02 machine kernel: 0000:00:19.0: eth0: (PCI Express:2.5GB/s:Width x1) 00:1f:e2:1a:ea:c0
Apr  6 09:05:02 machine kernel: 0000:00:19.0: eth0: Intel(R) PRO/1000 Network Connection
Apr  6 09:05:02 machine kernel: 0000:00:19.0: eth0: MAC: 6, PHY: 6, PBA No: 1008ff-0ff
Apr  6 09:05:02 machine kernel: sd 0:0:0:0: Attached scsi generic sg0 type 0
Apr  6 09:05:02 machine kernel: sr 3:0:0:0: Attached scsi generic sg1 type 5
Apr  6 09:05:02 machine kernel: Linux agpgart interface v0.103
Apr  6 09:05:02 machine kernel: usb 2-2: new high speed USB device using ehci_hcd and address 2
Apr  6 09:05:02 machine kernel: uhci_hcd: USB Universal Host Controller Interface driver
Apr  6 09:05:02 machine kernel: uhci_hcd 0000:00:1a.0: PCI INT A -> GSI 20 (level, low) -> IRQ 20
Apr  6 09:05:02 machine kernel: uhci_hcd 0000:00:1a.0: UHCI Host Controller
Apr  6 09:05:02 machine kernel: uhci_hcd 0000:00:1a.0: new USB bus registered, assigned bus number 3
Apr  6 09:05:02 machine kernel: uhci_hcd 0000:00:1a.0: irq 20, io base 0x00001860
Apr  6 09:05:02 machine kernel: usb usb3: New USB device found, idVendor=1d6b, idProduct=0001
Apr  6 09:05:02 machine kernel: usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Apr  6 09:05:02 machine kernel: usb usb3: Product: UHCI Host Controller
Apr  6 09:05:02 machine kernel: usb usb3: Manufacturer: Linux 2.6.32.2-strip uhci_hcd
Apr  6 09:05:02 machine kernel: usb usb3: SerialNumber: 0000:00:1a.0
Apr  6 09:05:02 machine kernel: usb usb3: configuration #1 chosen from 1 choice
Apr  6 09:05:02 machine kernel: hub 3-0:1.0: USB hub found
Apr  6 09:05:02 machine kernel: hub 3-0:1.0: 2 ports detected
Apr  6 09:05:02 machine kernel: uhci_hcd 0000:00:1a.1: power state changed by ACPI to D0
Apr  6 09:05:02 machine kernel: uhci_hcd 0000:00:1a.1: PCI INT B -> GSI 21 (level, low) -> IRQ 21
Apr  6 09:05:02 machine kernel: uhci_hcd 0000:00:1a.1: UHCI Host Controller
Apr  6 09:05:02 machine kernel: uhci_hcd 0000:00:1a.1: new USB bus registered, assigned bus number 4
Apr  6 09:05:02 machine kernel: uhci_hcd 0000:00:1a.1: irq 21, io base 0x00001880
Apr  6 09:05:02 machine kernel: usb usb4: New USB device found, idVendor=1d6b, idProduct=0001
Apr  6 09:05:02 machine kernel: usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Apr  6 09:05:02 machine kernel: usb usb4: Product: UHCI Host Controller
Apr  6 09:05:02 machine kernel: usb usb4: Manufacturer: Linux 2.6.32.2-strip uhci_hcd
Apr  6 09:05:02 machine kernel: usb usb4: SerialNumber: 0000:00:1a.1
Apr  6 09:05:02 machine kernel: usb usb4: configuration #1 chosen from 1 choice
Apr  6 09:05:02 machine kernel: hub 4-0:1.0: USB hub found
Apr  6 09:05:02 machine kernel: hub 4-0:1.0: 2 ports detected
Apr  6 09:05:02 machine kernel: uhci_hcd 0000:00:1d.0: power state changed by ACPI to D0
Apr  6 09:05:02 machine kernel: uhci_hcd 0000:00:1d.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
Apr  6 09:05:02 machine kernel: uhci_hcd 0000:00:1d.0: UHCI Host Controller
Apr  6 09:05:02 machine kernel: uhci_hcd 0000:00:1d.0: new USB bus registered, assigned bus number 5
Apr  6 09:05:02 machine kernel: uhci_hcd 0000:00:1d.0: irq 16, io base 0x000018a0
Apr  6 09:05:02 machine kernel: usb usb5: New USB device found, idVendor=1d6b, idProduct=0001
Apr  6 09:05:02 machine kernel: usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Apr  6 09:05:02 machine kernel: usb usb5: Product: UHCI Host Controller
Apr  6 09:05:02 machine kernel: usb usb5: Manufacturer: Linux 2.6.32.2-strip uhci_hcd
Apr  6 09:05:02 machine kernel: usb usb5: SerialNumber: 0000:00:1d.0
Apr  6 09:05:02 machine kernel: usb usb5: configuration #1 chosen from 1 choice
Apr  6 09:05:02 machine kernel: hub 5-0:1.0: USB hub found
Apr  6 09:05:02 machine kernel: hub 5-0:1.0: 2 ports detected
Apr  6 09:05:02 machine kernel: uhci_hcd 0000:00:1d.1: PCI INT B -> GSI 17 (level, low) -> IRQ 17
Apr  6 09:05:02 machine kernel: uhci_hcd 0000:00:1d.1: UHCI Host Controller
Apr  6 09:05:02 machine kernel: uhci_hcd 0000:00:1d.1: new USB bus registered, assigned bus number 6
Apr  6 09:05:02 machine kernel: uhci_hcd 0000:00:1d.1: irq 17, io base 0x000018c0
Apr  6 09:05:02 machine kernel: usb usb6: New USB device found, idVendor=1d6b, idProduct=0001
Apr  6 09:05:02 machine kernel: usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Apr  6 09:05:02 machine kernel: usb usb6: Product: UHCI Host Controller
Apr  6 09:05:02 machine kernel: usb usb6: Manufacturer: Linux 2.6.32.2-strip uhci_hcd
Apr  6 09:05:02 machine kernel: usb usb6: SerialNumber: 0000:00:1d.1
Apr  6 09:05:02 machine kernel: usb usb6: configuration #1 chosen from 1 choice
Apr  6 09:05:02 machine kernel: hub 6-0:1.0: USB hub found
Apr  6 09:05:02 machine kernel: hub 6-0:1.0: 2 ports detected
Apr  6 09:05:02 machine kernel: uhci_hcd 0000:00:1d.2: power state changed by ACPI to D0
Apr  6 09:05:02 machine kernel: uhci_hcd 0000:00:1d.2: PCI INT C -> GSI 18 (level, low) -> IRQ 18
Apr  6 09:05:02 machine kernel: uhci_hcd 0000:00:1d.2: UHCI Host Controller
Apr  6 09:05:02 machine kernel: uhci_hcd 0000:00:1d.2: new USB bus registered, assigned bus number 7
Apr  6 09:05:02 machine kernel: uhci_hcd 0000:00:1d.2: irq 18, io base 0x000018e0
Apr  6 09:05:02 machine kernel: usb usb7: New USB device found, idVendor=1d6b, idProduct=0001
Apr  6 09:05:02 machine kernel: usb usb7: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Apr  6 09:05:02 machine kernel: usb usb7: Product: UHCI Host Controller
Apr  6 09:05:02 machine kernel: usb usb7: Manufacturer: Linux 2.6.32.2-strip uhci_hcd
Apr  6 09:05:02 machine kernel: usb usb7: SerialNumber: 0000:00:1d.2
Apr  6 09:05:02 machine kernel: usb usb7: configuration #1 chosen from 1 choice
Apr  6 09:05:02 machine kernel: hub 7-0:1.0: USB hub found
Apr  6 09:05:02 machine kernel: hub 7-0:1.0: 2 ports detected
Apr  6 09:05:02 machine kernel: ricoh-mmc: Ricoh MMC Controller disabling driver
Apr  6 09:05:02 machine kernel: ricoh-mmc: Copyright(c) Philip Langdale
Apr  6 09:05:02 machine kernel: ricoh-mmc: Ricoh MMC controller found at 0000:15:00.3 [1180:0843] (rev 11)
Apr  6 09:05:02 machine kernel: ricoh-mmc: Controller is now disabled.
Apr  6 09:05:02 machine kernel: usb 2-2: New USB device found, idVendor=03f0, idProduct=1812
Apr  6 09:05:02 machine kernel: usb 2-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
Apr  6 09:05:02 machine kernel: usb 2-2: Product: Officejet Pro K550
Apr  6 09:05:02 machine kernel: usb 2-2: Manufacturer: HP
Apr  6 09:05:02 machine kernel: usb 2-2: SerialNumber: MY5AL2105T
Apr  6 09:05:02 machine kernel: usb 2-2: configuration #1 chosen from 1 choice
Apr  6 09:05:02 machine kernel: yenta_cardbus 0000:15:00.0: CardBus bridge found [17aa:20c6]
Apr  6 09:05:02 machine kernel: input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input2
Apr  6 09:05:02 machine kernel: ACPI: Lid Switch [LID]
Apr  6 09:05:02 machine kernel: input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input3
Apr  6 09:05:02 machine kernel: ACPI: Sleep Button [SLPB]
Apr  6 09:05:02 machine kernel: input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input4
Apr  6 09:05:02 machine kernel: ACPI: Power Button [PWRF]
Apr  6 09:05:02 machine kernel: ACPI: AC Adapter [AC] (on-line)
Apr  6 09:05:02 machine kernel: ACPI: Battery Slot [BAT0] (battery present)
Apr  6 09:05:02 machine kernel: yenta_cardbus 0000:15:00.0: ISA IRQ mask 0x0cb8, PCI irq 16
Apr  6 09:05:02 machine kernel: yenta_cardbus 0000:15:00.0: Socket status: 30000006
Apr  6 09:05:02 machine kernel: yenta_cardbus 0000:15:00.0: pcmcia: parent PCI bridge I/O window: 0x8000 - 0xbfff
Apr  6 09:05:02 machine kernel: yenta_cardbus 0000:15:00.0: pcmcia: parent PCI bridge Memory window: 0xf8100000 - 0xfbffffff
Apr  6 09:05:02 machine kernel: yenta_cardbus 0000:15:00.0: pcmcia: parent PCI bridge Memory window: 0xf4000000 - 0xf7ffffff
Apr  6 09:05:02 machine kernel: usb 3-2: new full speed USB device using uhci_hcd and address 2
Apr  6 09:05:02 machine kernel: ACPI: WMI: Mapper loaded
Apr  6 09:05:02 machine kernel: i801_smbus 0000:00:1f.3: PCI INT A -> GSI 23 (level, low) -> IRQ 23
Apr  6 09:05:02 machine kernel: usb 3-2: New USB device found, idVendor=0483, idProduct=2016
Apr  6 09:05:02 machine kernel: usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
Apr  6 09:05:02 machine kernel: usb 3-2: Product: Biometric Coprocessor
Apr  6 09:05:02 machine kernel: usb 3-2: Manufacturer: STMicroelectronics
Apr  6 09:05:02 machine kernel: usb 3-2: configuration #1 chosen from 1 choice
Apr  6 09:05:02 machine kernel: usblp0: USB Bidirectional printer dev 2 if 0 alt 0 proto 2 vid 0x03F0 pid 0x1812
Apr  6 09:05:02 machine kernel: usbcore: registered new interface driver usblp
Apr  6 09:05:02 machine kernel: sdhci: Secure Digital Host Controller Interface driver
Apr  6 09:05:02 machine kernel: sdhci: Copyright(c) Pierre Ossman
Apr  6 09:05:02 machine kernel: usb 4-1: new low speed USB device using uhci_hcd and address 2
Apr  6 09:05:02 machine kernel: rtc_cmos 00:07: RTC can wake from S4
Apr  6 09:05:02 machine kernel: rtc_cmos 00:07: rtc core: registered rtc_cmos as rtc0
Apr  6 09:05:02 machine kernel: rtc0: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
Apr  6 09:05:02 machine kernel: ohci1394 0000:15:00.1: PCI INT B -> GSI 17 (level, low) -> IRQ 17
Apr  6 09:05:02 machine kernel: ohci1394: fw-host0: OHCI-1394 1.1 (PCI): IRQ=[17]  MMIO=[f8101000-f81017ff]  Max Packet=[2048]  IR/IT contexts=[4/4]
Apr  6 09:05:02 machine kernel: thermal LNXTHERM:01: registered as thermal_zone0
Apr  6 09:05:02 machine kernel: ACPI: Thermal Zone [THM0] (60 C)
Apr  6 09:05:02 machine kernel: thermal LNXTHERM:02: registered as thermal_zone1
Apr  6 09:05:02 machine kernel: ACPI: Thermal Zone [THM1] (53 C)
Apr  6 09:05:02 machine kernel: acpi device:05: registered as cooling_device0
Apr  6 09:05:02 machine kernel: input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:04/LNXVIDEO:01/input/input5
Apr  6 09:05:02 machine kernel: ACPI: Video Device [VID1] (multi-head: yes  rom: no  post: no)
Apr  6 09:05:02 machine kernel: usb 4-1: New USB device found, idVendor=0461, idProduct=4d62
Apr  6 09:05:02 machine kernel: usb 4-1: New USB device strings: Mfr=0, Product=2, SerialNumber=0
Apr  6 09:05:02 machine kernel: usb 4-1: Product: HP Laser Mobile Mouse
Apr  6 09:05:02 machine kernel: usb 4-1: configuration #1 chosen from 1 choice
Apr  6 09:05:02 machine kernel: HDA Intel 0000:00:1b.0: PCI INT B -> GSI 17 (level, low) -> IRQ 17
Apr  6 09:05:02 machine kernel: hda_intel: probe_mask set to 0x1 for device 17aa:20ac
Apr  6 09:05:02 machine kernel: sdhci-pci 0000:15:00.2: SDHCI controller found [1180:0822] (rev 21)
Apr  6 09:05:02 machine kernel: sdhci-pci 0000:15:00.2: PCI INT C -> GSI 18 (level, low) -> IRQ 18
Apr  6 09:05:02 machine kernel: Registered led device: mmc0::
Apr  6 09:05:02 machine kernel: mmc0: SDHCI controller on PCI [0000:15:00.2] using DMA
Apr  6 09:05:02 machine kernel: thinkpad_acpi: ThinkPad ACPI Extras v0.23
Apr  6 09:05:02 machine kernel: thinkpad_acpi: http://ibm-acpi.sf.net/
Apr  6 09:05:02 machine kernel: thinkpad_acpi: ThinkPad BIOS 7LETC5WW (2.25 ), EC 7KHT24WW-1.08
Apr  6 09:05:02 machine kernel: thinkpad_acpi: Lenovo ThinkPad T61, model 64574XG
Apr  6 09:05:02 machine kernel: thinkpad_acpi: ACPI backlight control delay disabled
Apr  6 09:05:02 machine kernel: thinkpad_acpi: radio switch found; radios are disabled
Apr  6 09:05:02 machine kernel: thinkpad_acpi: This ThinkPad has standard ACPI backlight brightness control, supported by the ACPI video driver
Apr  6 09:05:02 machine kernel: thinkpad_acpi: Disabling thinkpad-acpi brightness events by default...
Apr  6 09:05:02 machine kernel: Registered led device: tpacpi::thinklight
Apr  6 09:05:02 machine kernel: Registered led device: tpacpi::power
Apr  6 09:05:02 machine kernel: Registered led device: tpacpi::standby
Apr  6 09:05:02 machine kernel: Registered led device: tpacpi::thinkvantage
Apr  6 09:05:02 machine kernel: thinkpad_acpi: Standard ACPI backlight interface available, not loading native one.
Apr  6 09:05:02 machine kernel: input: ThinkPad Extra Buttons as /devices/virtual/input/input6
Apr  6 09:05:02 machine kernel: usb 6-2: new full speed USB device using uhci_hcd and address 2
Apr  6 09:05:02 machine kernel: [drm] Initialized drm 1.1.0 20060810
Apr  6 09:05:02 machine kernel: usbcore: registered new interface driver hiddev
Apr  6 09:05:02 machine kernel: input: HP Laser Mobile Mouse as /devices/pci0000:00/0000:00:1a.1/usb4/4-1/4-1:1.0/input/input7
Apr  6 09:05:02 machine kernel: generic-usb 0003:0461:4D62.0001: input,hidraw0: USB HID v1.11 Mouse [HP Laser Mobile Mouse] on usb-0000:00:1a.1-1/input0
Apr  6 09:05:02 machine kernel: usbcore: registered new interface driver usbhid
Apr  6 09:05:02 machine kernel: usbhid: v2.6:USB HID core driver
Apr  6 09:05:02 machine kernel: processor LNXCPU:00: registered as cooling_device1
Apr  6 09:05:02 machine kernel: usb 6-2: New USB device found, idVendor=17ef, idProduct=1003
Apr  6 09:05:02 machine kernel: usb 6-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
Apr  6 09:05:02 machine kernel: usb 6-2: Product: Integrated Smart Card Reader
Apr  6 09:05:02 machine kernel: usb 6-2: Manufacturer: Lenovo
Apr  6 09:05:02 machine kernel: usb 6-2: configuration #1 chosen from 1 choice
Apr  6 09:05:02 machine kernel: processor LNXCPU:01: registered as cooling_device2
Apr  6 09:05:02 machine kernel: iwlagn: Intel(R) Wireless WiFi Link AGN driver for Linux, 1.3.27ks
Apr  6 09:05:02 machine kernel: iwlagn: Copyright(c) 2003-2009 Intel Corporation
Apr  6 09:05:02 machine kernel: iwlagn 0000:03:00.0: PCI INT A -> GSI 17 (level, low) -> IRQ 17
Apr  6 09:05:02 machine kernel: iwlagn 0000:03:00.0: Detected Intel Wireless WiFi Link 4965AGN REV=0x4
Apr  6 09:05:02 machine kernel: iwlagn 0000:03:00.0: Tunable channels: 13 802.11bg, 19 802.11a channels
Apr  6 09:05:02 machine kernel: cfg80211: Regulatory domain changed to country: US
Apr  6 09:05:02 machine kernel: ^I(start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp)
Apr  6 09:05:02 machine kernel: ^I(2402000 KHz - 2472000 KHz @ 40000 KHz), (300 mBi, 2700 mBm)
Apr  6 09:05:02 machine kernel: ^I(5170000 KHz - 5250000 KHz @ 40000 KHz), (300 mBi, 1700 mBm)
Apr  6 09:05:02 machine kernel: ^I(5250000 KHz - 5330000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
Apr  6 09:05:02 machine kernel: ^I(5490000 KHz - 5710000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
Apr  6 09:05:02 machine kernel: ^I(5735000 KHz - 5835000 KHz @ 40000 KHz), (300 mBi, 3000 mBm)
Apr  6 09:05:02 machine kernel: nouveau 0000:01:00.0: power state changed by ACPI to D0
Apr  6 09:05:02 machine kernel: nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: failed to evaluate _DSM: 5
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: Detected an NV50 generation card (0x086900a2)
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PRAMIN
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: ... appears to be valid
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: BIT BIOS found
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: Bios version 60.86.3e.00
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: BIT table 'd' not found
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: Found Display Configuration Block version 4.0
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: DCB connector table: VHER 0x40 5 14 2
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0:   0: 0x00000040: type 0x40 idx 0 tag 0xff
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0:   1: 0x00000100: type 0x00 idx 1 tag 0xff
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0:   2: 0x00001231: type 0x31 idx 2 tag 0x07
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0:   3: 0x00000311: type 0x11 idx 3 tag 0xff
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: Raw DCB entry 0: 01000323 00010034
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: Raw DCB entry 1: 02811300 00000028
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: Raw DCB entry 2: 02822312 00010030
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: Raw DCB entry 3: 014333f1 0080c080
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: Raw DCB entry 4: 0000000e 00000000
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset 0xDD0F
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset 0xE04F
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset 0xEAA4
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset 0xEB96
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset 0xED83
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS init table at offset 0xEDE8
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: 0xCE7E: parsing output script 0
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: 0xCFF4: parsing output script 0
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: 0xC66A: parsing output script 0
Apr  6 09:05:02 machine kernel: [TTM] Zone  kernel: Available graphics memory: 1535528 kiB.
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: 128 MiB VRAM
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: 512 MiB GART (aperture)
Apr  6 09:05:02 machine kernel: nouveau 0000:01:00.0: firmware: requesting nouveau/nv86.ctxprog
Apr  6 09:05:02 machine kernel: nouveau 0000:01:00.0: firmware: requesting nouveau/nv86.ctxvals
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: Allocating FIFO number 1
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 1
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: Detected a LVDS output
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: Detected a DAC output
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: Detected a TMDS output
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: Detected a LVDS connector
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: Detected a VGA connector
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: Detected a DVI-D connector
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: allocated 1680x1050 fb: 0x40210000, bo ffff8800bc81ae00
Apr  6 09:05:02 machine kernel: [drm] LVDS-7: set mode 1680x1050 1f
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: 0xCE82: parsing output script 1
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: 0xCD07: parsing clock script 0
Apr  6 09:05:02 machine kernel: fb0: nouveaufb frame buffer device
Apr  6 09:05:02 machine kernel: registered panic notifier
Apr  6 09:05:02 machine kernel: [drm] Initialized nouveau 0.0.15 20090420 for 0000:01:00.0 on minor 0
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: 0xCE41: parsing clock script 1
Apr  6 09:05:02 machine kernel: Adding 4192924k swap on /dev/sda6.  Priority:-1 extents:1 across:4192924k 
Apr  6 09:05:02 machine kernel: fuse init (API version 7.13)
Apr  6 09:05:02 machine kernel: lp: driver loaded but no devices found
Apr  6 09:05:02 machine kernel: ppdev: user-space parallel port driver
Apr  6 09:05:02 machine kernel: REISERFS (device sda5): found reiserfs format "3.6" with standard journal
Apr  6 09:05:02 machine kernel: REISERFS (device sda5): using ordered data mode
Apr  6 09:05:02 machine kernel: REISERFS (device sda5): journal params: device sda5, size 8192, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
Apr  6 09:05:02 machine kernel: REISERFS (device sda5): checking transaction log (sda5)
Apr  6 09:05:02 machine kernel: REISERFS (device sda5): Using r5 hash to sort names
Apr  6 09:05:02 machine logger: /etc/rc.d/rc.inet1:  /sbin/ifconfig lo 127.0.0.1
Apr  6 09:05:02 machine logger: /etc/rc.d/rc.inet1:  /sbin/route add -net 127.0.0.0 netmask 255.0.0.0 lo
Apr  6 09:05:02 machine logger: /etc/rc.d/rc.inet1:  /sbin/ifconfig eth0 82.229.182.39 broadcast 82.229.182.255 netmask 255.255.255.0
Apr  6 09:05:04 machine kernel: e1000e: eth0 NIC Link is Up 100 Mbps Full Duplex, Flow Control: None
Apr  6 09:05:04 machine kernel: 0000:00:19.0: eth0: 10/100 speed: disabling TSO
Apr  6 09:05:05 machine logger: /etc/rc.d/rc.M:  /sbin/iwconfig wlan0 nick machine
Apr  6 09:05:05 machine logger: /etc/rc.d/rc.M:  /sbin/iwconfig wlan0 key ************
Apr  6 09:05:05 machine logger: /etc/rc.d/rc.M:  /sbin/iwconfig wlan0 key restricted
Apr  6 09:05:05 machine logger: /etc/rc.d/rc.M:  /sbin/iwconfig wlan0 essid "clauxdeserignac"
Apr  6 09:05:06 machine logger: /etc/rc.d/rc.M:  /sbin/iwconfig wlan0 essid "clauxdeserignac"
Apr  6 09:05:06 machine logger: /etc/rc.d/rc.inet1:  /sbin/route add default gw 82.229.182.254 metric 1
Apr  6 09:05:06 machine acpid: starting up 
Apr  6 09:05:06 machine acpid: 1 rule loaded 
Apr  6 09:05:06 machine acpid: waiting for events: event logging is off 
Apr  6 09:05:08 machine kernel: NET: Registered protocol family 10
Apr  6 09:05:08 machine kernel: lo: Disabled Privacy Extensions
Apr  6 09:05:08 machine smartd[2232]: smartd version 5.38 [x86_64-slackware-linux-gnu] Copyright (C) 2002-8 Bruce Allen 
Apr  6 09:05:08 machine smartd[2232]: Home page is http://smartmontools.sourceforge.net/  
Apr  6 09:05:08 machine smartd[2232]: Opened configuration file /etc/smartd.conf 
Apr  6 09:05:08 machine smartd[2232]: Drive: DEVICESCAN, implied '-a' Directive on line 23 of file /etc/smartd.conf 
Apr  6 09:05:08 machine smartd[2232]: Configuration file /etc/smartd.conf was parsed, found DEVICESCAN, scanning devices 
Apr  6 09:05:08 machine smartd[2232]: Device: /dev/sda, opened 
Apr  6 09:05:08 machine smartd[2232]: Device /dev/sda: using '-d sat' for ATA disk behind SAT layer. 
Apr  6 09:05:08 machine smartd[2232]: Device: /dev/sda, opened 
Apr  6 09:05:08 machine smartd[2232]: Device: /dev/sda, not found in smartd database. 
Apr  6 09:05:09 machine smartd[2232]: Device: /dev/sda, is SMART capable. Adding to "monitor" list. 
Apr  6 09:05:09 machine smartd[2232]: Monitoring 0 ATA and 1 SCSI devices 
Apr  6 09:05:09 machine smartd[2254]: smartd has fork()ed into background mode. New PID=2254. 
Apr  6 09:05:14 machine /usr/sbin/gpm[2338]: *** info [startup.c(95)]: 
Apr  6 09:05:14 machine /usr/sbin/gpm[2338]: Started gpm successfully. Entered daemon mode.
Apr  6 09:05:14 machine hdapsd[2342]: Starting hdapsd
Apr  6 09:05:14 machine kernel: thinkpad_ec: thinkpad_ec 0.40 loaded.
Apr  6 09:05:14 machine kernel: tp_smapi 0.40 loading...
Apr  6 09:05:14 machine kernel: tp_smapi successfully loaded (smapi_port=0xb2).
Apr  6 09:05:14 machine /usr/sbin/gpm[2338]: *** info [mice.c(1766)]: 
Apr  6 09:05:14 machine /usr/sbin/gpm[2338]: imps2: Auto-detected intellimouse PS/2
Apr  6 09:05:14 machine kernel: hdaps: LENOVO ThinkPad T61 detected, setting orientation 1
Apr  6 09:05:14 machine kernel: hdaps: device successfully initialized.
Apr  6 09:05:14 machine kernel: input: ThinkPad HDAPS joystick emulation as /devices/virtual/input/input8
Apr  6 09:05:14 machine kernel: input: ThinkPad HDAPS accelerometer data as /devices/virtual/input/input9
Apr  6 09:05:14 machine kernel: hdaps: driver successfully loaded.
Apr  6 09:05:14 machine hdapsd[2342]: Selected interface: HDAPS
Apr  6 09:05:14 machine hdapsd[2342]: Selected HDAPS input device: /dev/input/event9
Apr  6 09:05:14 machine hdapsd[2387]: Could not read from /sys/devices/platform/hdaps/position: Device or resource busy
Apr  6 09:05:14 machine kernel: vboxdrv: TSC mode is 'asynchronous', kernel timer mode is 'normal'.
Apr  6 09:05:14 machine hdapsd[2387]: Could not read from /sys/devices/platform/hdaps/position: Device or resource busy
Apr  6 09:05:15 machine last message repeated 4 times
Apr  6 09:05:36 machine acpid: client connected from 2459[0:100] 
Apr  6 09:05:36 machine acpid: 1 client rule loaded 
Apr  6 09:05:37 machine kernel: [drm] nouveau 0000:01:00.0: Allocating FIFO number 2
Apr  6 09:05:37 machine kernel: [drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 2
Apr  6 09:24:11 machine hdapsd[2387]: parking
Apr  6 09:24:12 machine hdapsd[2387]: un-parking
Apr  6 09:26:47 machine hdapsd[2387]: parking
Apr  6 09:26:48 machine hdapsd[2387]: un-parking
Apr  6 09:30:25 machine hdapsd[2387]: parking
Apr  6 09:30:26 machine hdapsd[2387]: un-parking
Apr  6 09:32:00 machine kernel: usblp0: removed
Apr  6 09:43:11 machine hdapsd[2387]: parking
Apr  6 09:43:12 machine hdapsd[2387]: un-parking
Apr  6 09:55:31 machine hdapsd[2387]: parking
Apr  6 09:55:32 machine hdapsd[2387]: un-parking
Apr  6 09:55:40 machine hdapsd[2387]: parking
Apr  6 09:55:42 machine hdapsd[2387]: un-parking
Apr  6 09:58:58 machine kernel: [drm] nouveau 0000:01:00.0: nouveau_channel_free: freeing fifo 2
Apr  6 09:59:00 machine /usr/sbin/gpm[2338]: *** info [mice.c(1766)]: 
Apr  6 09:59:00 machine /usr/sbin/gpm[2338]: imps2: Auto-detected intellimouse PS/2
Apr  6 09:59:04 machine shutdown[5842]: shutting down for system reboot
Apr  6 09:59:04 machine init: Switching to runlevel: 6
Apr  6 09:59:13 machine logger: /etc/rc.d/rc.inet1:  /sbin/route del default
Apr  6 09:59:13 machine logger: /etc/rc.d/rc.inet1:  /sbin/ifconfig eth0 down
Apr  6 09:59:13 machine logger: /etc/rc.d/rc.inet1:  /sbin/ifconfig wlan0 down
Apr  6 09:59:13 machine logger: /etc/rc.d/rc.inet1:  /sbin/ifconfig lo down
Apr  6 09:59:13 machine acpid: exiting 
Apr  6 09:59:14 machine exiting on signal 15


--------------010203080002080500030006
Content-Type: text/plain;
 name="syslog"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="syslog"



----------------------------Starting with VESA framebuffer console 1680x1050----------------------
Apr  6 09:02:50 machine kernel: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
Apr  6 09:02:50 machine kernel: Console: switching to colour frame buffer device 210x65
Apr  6 09:02:50 machine kernel: floppy0: no floppy controllers found
Apr  6 09:02:50 machine kernel:  sda1 sda2 sda3 < sda5 sda6 > sda4
Apr  6 09:02:50 machine kernel: registered taskstats version 1
Apr  6 09:02:50 machine kernel: VFS: Mounted root (reiserfs filesystem) readonly on device 8:4.
Apr  6 09:02:50 machine kernel: Driver 'rtc_cmos' needs updating - please use bus_type methods
Apr  6 09:02:50 machine kernel: ACPI: SSDT 00000000beee1b32 002C4 (v01  PmRef  Cpu0Ist 00000100 INTL 20050513)
Apr  6 09:02:50 machine kernel: ACPI: SSDT 00000000beee1e7b 0085E (v01  PmRef  Cpu0Cst 00000100 INTL 20050513)
Apr  6 09:02:50 machine kernel: ACPI: SSDT 00000000beee1a6a 000C8 (v01  PmRef  Cpu1Ist 00000100 INTL 20050513)
Apr  6 09:02:50 machine kernel: ACPI: SSDT 00000000beee1df6 00085 (v01  PmRef  Cpu1Cst 00000100 INTL 20050513)
Apr  6 09:02:50 machine kernel: sdhci-pci 0000:15:00.2: Will use DMA mode even though HW doesn't fully claim to support it.
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: TMDS table revision 2.0 not currently supported
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: 0xEDE8: Condition still not met after 20ms, skipping following opcodes
Apr  6 09:02:50 machine kernel: [drm] nouveau 0000:01:00.0: DCB encoder 1 unknown
Apr  6 09:02:50 machine kernel: fb: conflicting fb hw usage nouveaufb vs VESA VGA - removing generic driver
Apr  6 09:02:50 machine kernel: Console: switching to colour dummy device 80x25
Apr  6 09:02:50 machine kernel: Console: switching to colour frame buffer device 210x65
Apr  6 09:02:56 machine smartd[2277]: Problem creating device name scan list 
Apr  6 09:03:02 machine kernel: vboxdrv: Warning: 2.6.31+ kernel detected. Most likely the hardware performance
Apr  6 09:03:02 machine kernel: vboxdrv: counter framework which can generate NMIs is active. You have to prevent
Apr  6 09:03:02 machine kernel: vboxdrv: the usage of hardware performance counters by
Apr  6 09:03:02 machine kernel: vboxdrv:   echo 2 > /proc/sys/kernel/perf_counter_paranoid
Apr  6 09:03:02 machine kernel: VBoxDrv: dbg - g_abExecMemory=ffffffffa056a500
Apr  6 09:03:02 machine kernel: vboxdrv: fAsync=1 offMin=0x6111b offMax=0x6111b


---------------------Starting with text VGA text only console 80x25-------------------------------
Apr  6 09:05:02 machine kernel: raid6: int64x1   1746 MB/s
Apr  6 09:05:02 machine kernel: raid6: int64x2   2417 MB/s
Apr  6 09:05:02 machine kernel: raid6: int64x4   1816 MB/s
Apr  6 09:05:02 machine kernel: raid6: int64x8   1644 MB/s
Apr  6 09:05:02 machine kernel: raid6: sse2x1    3531 MB/s
Apr  6 09:05:02 machine kernel: raid6: sse2x2    3804 MB/s
Apr  6 09:05:02 machine kernel: raid6: sse2x4    6531 MB/s
Apr  6 09:05:02 machine kernel: raid6: using algorithm sse2x4 (6531 MB/s)
Apr  6 09:05:02 machine kernel: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
Apr  6 09:05:02 machine kernel: floppy0: no floppy controllers found
Apr  6 09:05:02 machine kernel: sr0: scsi3-mmc drive: 24x/24x writer dvd-ram cd/rw xa/form2 cdda tray
Apr  6 09:05:02 machine kernel:  sda1 sda2 sda3 < sda5 sda6 > sda4
Apr  6 09:05:02 machine kernel: registered taskstats version 1
Apr  6 09:05:02 machine kernel: VFS: Mounted root (reiserfs filesystem) readonly on device 8:4.
Apr  6 09:05:02 machine kernel: Driver 'rtc_cmos' needs updating - please use bus_type methods
Apr  6 09:05:02 machine kernel: sdhci-pci 0000:15:00.2: Will use DMA mode even though HW doesn't fully claim to support it.
Apr  6 09:05:02 machine kernel: ACPI: SSDT 00000000beee1b32 002C4 (v01  PmRef  Cpu0Ist 00000100 INTL 20050513)
Apr  6 09:05:02 machine kernel: ACPI: SSDT 00000000beee1e7b 0085E (v01  PmRef  Cpu0Cst 00000100 INTL 20050513)
Apr  6 09:05:02 machine kernel: ACPI: SSDT 00000000beee1a6a 000C8 (v01  PmRef  Cpu1Ist 00000100 INTL 20050513)
Apr  6 09:05:02 machine kernel: ACPI: 
Apr  6 09:05:02 machine kernel: SSDT 00000000beee1df6 00085 (v01  PmRef  Cpu1Cst 00000100 INTL 20050513)
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: TMDS table revision 2.0 not currently supported
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: 0xEDE8: Condition still not met after 20ms, skipping following opcodes
Apr  6 09:05:02 machine kernel: [drm] nouveau 0000:01:00.0: DCB encoder 1 unknown
Apr  6 09:05:02 machine kernel: Console: switching to colour frame buffer device 210x65
Apr  6 09:05:08 machine smartd[2232]: Problem creating device name scan list 
Apr  6 09:05:14 machine kernel: vboxdrv: Warning: 2.6.31+ kernel detected. Most likely the hardware performance
Apr  6 09:05:14 machine kernel: vboxdrv: counter framework which can generate NMIs is active. You have to prevent
Apr  6 09:05:14 machine kernel: vboxdrv: the usage of hardware performance counters by
Apr  6 09:05:14 machine kernel: vboxdrv:   echo 2 > /proc/sys/kernel/perf_counter_paranoid
Apr  6 09:05:14 machine kernel: VBoxDrv: dbg - g_abExecMemory=ffffffffa056a500
Apr  6 09:05:14 machine kernel: vboxdrv: fAsync=1 offMin=0x61265 offMax=0x61265
Apr  6 09:05:15 machine kernel: CE: hpet increasing min_delta_ns to 15000 nsec

--------------010203080002080500030006
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------010203080002080500030006--
