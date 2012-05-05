From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 49397] Not able to set monitor resolution
Date: Sat, 05 May 2012 13:03:20 +0000
Message-ID: <bug-49397-8800-oQZXRYRkve@http.bugs.freedesktop.org/>
References: <bug-49397-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-49397-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=49397

--- Comment #2 from Rob Koll <rob-Mw7XmEnvAQ/z+pZb47iToQ@public.gmane.org> 2012-05-05 06:03:20 PDT ---
I seem to have the same issue. I am using Ubuntu. Up to version 11.10 the
nvidia blob was able to run the Philips 240S at 1920*1200. It took required to
tell to nvidia not to perform the check on max pixel rate. Somehow the 240S
seems to report to different values: one of 135M and one of 175M. I guess
nvidia reject the mode initially as it would not fit into 135M pixel clock. So
I turned of the check and created a modeline resulting in a pixel clock of
about 155M, worked nice. After upgrading to Ubuntu 12.4 the high resolution was
gone. Ubuntu appears now to use the nouveau driver. The resolution is degraded
to 1440*900. While entering this I see that xrandr offers 1280*1024, the GUI
tool to set the resolution doesn't show that one. Anyway, the correct
resolution 1920*1200 disappeared... Please let me know if I need to put this
ticket into Ubuntu first, but I added to this one as I am using same nvidia
hardware as the person that started this bug report. But I guess some more info
may help. So below I provide what I believe is relevant. Oops, I need to
shorten (65535 limit). The full text is added as attachment, s available. Let
me know if more is needed.

Rob Koll: Output from dmesg:

[    0.883898] rtc_cmos 00:02: setting system clock to 2012-05-05 13:57:25 UTC
(1336226245)
[    0.883925] BIOS EDD facility v0.16 2004-Jun-25, 0 devices found
[    0.883928] EDD information not available.
[    0.888402] input: AT Translated Set 2 keyboard as
/devices/platform/i8042/serio0/input/input2
[    0.992752] ata4.00: ATA-8: ST31000524AS, JC4B, max UDMA/133
[    0.992761] ata4.00: 1953525168 sectors, multi 16: LBA48 NCQ (depth 0/32)
[    1.008452] ata3.00: ATA-8: OCZ-VERTEX2, 1.35, max UDMA/133
[    1.008459] ata3.00: 351651888 sectors, multi 16: LBA48 NCQ (depth 0/32)
[    1.008534] ata4.00: configured for UDMA/133
[    1.016689] ata2.00: ATAPI: BENQ    DVD-ROM 16X, A.DD, max UDMA/66
[    1.016695] ata2.01: ATAPI: Optiarc DVD RW AD-5170A, 1.14, max UDMA/66
[    1.048376] ata2.00: configured for UDMA/66
[    1.064420] ata2.01: configured for UDMA/66
[    1.065898] scsi 1:0:0:0: CD-ROM            BENQ     DVD-ROM 16X      A.DD
PQ: 0 ANSI: 5
[    1.068096] sr0: scsi3-mmc drive: 0x/50x cd/rw xa/form2 cdda tray
[    1.068101] cdrom: Uniform CD-ROM driver Revision: 3.20
[    1.068300] sr 1:0:0:0: Attached scsi CD-ROM sr0
[    1.068477] sr 1:0:0:0: Attached scsi generic sg0 type 5
[    1.069974] scsi 1:0:1:0: CD-ROM            Optiarc  DVD RW AD-5170A  1.14
PQ: 0 ANSI: 5
[    1.071176] sr1: scsi3-mmc drive: 48x/48x writer cd/rw xa/form2 cdda tray
[    1.071342] sr 1:0:1:0: Attached scsi CD-ROM sr1
[    1.071512] sr 1:0:1:0: Attached scsi generic sg1 type 5
[    1.080153] ata3.00: configured for UDMA/133
[    1.080301] scsi 2:0:0:0: Direct-Access     ATA      OCZ-VERTEX2      1.35
PQ: 0 ANSI: 5
[    1.080508] sd 2:0:0:0: [sda] 351651888 512-byte logical blocks: (180 GB/167
GiB)
[    1.080573] sd 2:0:0:0: Attached scsi generic sg2 type 0
[    1.080679] sd 2:0:0:0: [sda] Write Protect is off
[    1.080687] sd 2:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    1.080738] sd 2:0:0:0: [sda] Write cache: enabled, read cache: enabled,
doesn't support DPO or FUA
[    1.080829] scsi 3:0:0:0: Direct-Access     ATA      ST31000524AS     JC4B
PQ: 0 ANSI: 5
[    1.081023] sd 3:0:0:0: [sdb] 1953525168 512-byte logical blocks: (1.00
TB/931 GiB)
[    1.081098] sd 3:0:0:0: Attached scsi generic sg3 type 0
[    1.081280] sd 3:0:0:0: [sdb] Write Protect is off
[    1.081288] sd 3:0:0:0: [sdb] Mode Sense: 00 3a 00 00
[    1.081351] sd 3:0:0:0: [sdb] Write cache: enabled, read cache: enabled,
doesn't support DPO or FUA
[    1.082584]  sda: sda1 sda2 < sda5 sda6 >
[    1.083198] sd 2:0:0:0: [sda] Attached SCSI disk
[    1.094918]  sdb: sdb1
[    1.095317] sd 3:0:0:0: [sdb] Attached SCSI disk
[    1.095355] Freeing unused kernel memory: 712k freed
[    1.095867] Write protecting the kernel text: 5632k
[    1.095936] Write protecting the kernel read-only data: 2324k
[    1.124326] udevd[94]: starting version 175
[    1.268086] Refined TSC clocksource calibration: 3198.461 MHz.
[    1.268097] Switching to clocksource tsc
[    1.303253] Floppy drive(s): fd0 is 1.44M
[    1.320242] FDC 0 is a post-1991 82077
[    1.355396] skge 0000:02:05.0: PCI INT A -> GSI 22 (level, low) -> IRQ 22
[    1.355454] skge: 1.14 addr 0xfeafc000 irq 22 chip Yukon-Lite rev 7
[    1.374086] skge 0000:02:05.0: eth0: addr 00:11:2f:e2:1a:4b
[    1.412189] EXT4-fs (sda5): mounted filesystem with ordered data mode. Opts:
(null)
[    1.512068] usb 3-2: new full-speed USB device number 2 using uhci_hcd
[    1.912038] usb 4-1: new full-speed USB device number 2 using uhci_hcd
[    2.071125] ADDRCONF(NETDEV_UP): eth0: link is not ready
[    2.094933] udevd[379]: starting version 175
[    3.923242] lp: driver loaded but no devices found
[    3.951127] intel_rng: FWH not detected
[    3.951389] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    4.084422] wmi: Mapper loaded
[    4.092706] parport_pc 00:0a: reported by Plug and Play ACPI
[    4.092733] parport0: PC-style at 0x378, irq 7 [PCSPP,TRISTATE,EPP]
[    4.121023] [drm] Initialized drm 1.1.0 20060810
[    4.188200] lp0: using parport0 (interrupt-driven).
[    4.404967] Adding 2618364k swap on /dev/sda6.  Priority:-1 extents:1
across:2618364k SS
[    4.417395] ppdev: user-space parallel port driver
[    4.502789] type=1400 audit(1336219049.115:2): apparmor="STATUS"
operation="profile_load" name="/sbin/dhclient" pid=623 comm="apparmor_parser"
[    4.504717] type=1400 audit(1336219049.119:3): apparmor="STATUS"
operation="profile_replace" name="/sbin/dhclient" pid=559
comm="apparmor_parser"
[    4.506027] type=1400 audit(1336219049.119:4): apparmor="STATUS"
operation="profile_load" name="/usr/lib/NetworkManager/nm-dhcp-client.action"
pid=623 comm="apparmor_parser"
[    4.507822] type=1400 audit(1336219049.119:5): apparmor="STATUS"
operation="profile_replace"
name="/usr/lib/NetworkManager/nm-dhcp-client.action" pid=559
comm="apparmor_parser"
[    4.509146] type=1400 audit(1336219049.123:6): apparmor="STATUS"
operation="profile_load" name="/usr/lib/connman/scripts/dhclient-script"
pid=623 comm="apparmor_parser"
[    4.510170] type=1400 audit(1336219049.123:7): apparmor="STATUS"
operation="profile_replace" name="/usr/lib/connman/scripts/dhclient-script"
pid=559 comm="apparmor_parser"
[    4.545020] VGA switcheroo: detected Optimus DSM method \ handle
[    4.545083] nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
[    4.549576] [drm] nouveau 0000:01:00.0: Detected an NV30 generation card
(0x034200b1)
[    4.553400] [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from
PRAMIN
[    4.562934] usblp0: USB Bidirectional printer dev 2 if 0 alt 0 proto 2 vid
0x03F0 pid 0x7204
[    4.564114] usbcore: registered new interface driver usblp
[    4.604429] [drm] nouveau 0000:01:00.0: ... appears to be valid
[    4.604641] [drm] nouveau 0000:01:00.0: BMP BIOS found
[    4.604647] [drm] nouveau 0000:01:00.0: BMP version 5.41
[    4.604653] [drm] nouveau 0000:01:00.0: Bios version 04.34.20.87
[    4.604659] [drm] nouveau 0000:01:00.0: Found Display Configuration Block
version 2.2
[    4.604667] [drm] nouveau 0000:01:00.0: Raw DCB entry 0: 01000310 00009c40
[    4.604673] [drm] nouveau 0000:01:00.0: Raw DCB entry 1: 01010302 00000000
[    4.604678] [drm] nouveau 0000:01:00.0: Raw DCB entry 2: 020203f1 00000203
[    4.604856] [drm] nouveau 0000:01:00.0: Loading NV17 power sequencing
microcode
[    4.604864] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset
0xED03
[    4.606896] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset
0xEF9E
[    4.606911] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset
0xF0E4
[    4.606956] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset
0xF26D
[    4.606964] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset
0xF28A
[    4.606972] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 5 at offset
0xF2A7
[    4.625845] psmouse serio1: hgpk: ID: 10 00 64
[    4.632808] Linux video capture interface: v2.00
[    4.635920] gspca_main: v2.14.0 registered
[    4.637793] gspca_main: sonixb-2.14.0 probing 0c45:6028
[    4.642375] input: sonixb as
/devices/pci0000:00/0000:00:1d.0/usb3/3-2/input/input3
[    4.653212] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 6 at offset
0xF440
[    4.659245] EXT4-fs (sda5): re-mounted. Opts: errors=remount-ro
[    4.664538] usbcore: registered new interface driver sonixb
[    4.699402] [drm] nouveau 0000:01:00.0: 0 available performance level(s)
[    4.699418] [drm] nouveau 0000:01:00.0: c: core 249MHz memory 405MHz
[    4.700077] [TTM] Zone  kernel: Available graphics memory: 433926 kiB.
[    4.700082] [TTM] Zone highmem: Available graphics memory: 1289834 kiB.
[    4.700087] [TTM] Initializing pool allocator.
[    4.700114] [drm] nouveau 0000:01:00.0: Detected 128MiB VRAM
[    4.701093] agpgart-intel 0000:00:00.0: AGP 3.0 bridge
[    4.701117] agpgart: modprobe tried to set rate=x12. Setting to AGP3 x8
mode.
[    4.701132] agpgart-intel 0000:00:00.0: putting AGP V3 device into 8x mode
[    4.701191] nouveau 0000:01:00.0: putting AGP V3 device into 8x mode
[    4.701227] [drm] nouveau 0000:01:00.0: 128 MiB GART (aperture)
[    4.706781] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    4.706790] [drm] No driver support for vblank timestamp query.
[    4.706802] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder
(output 0)
[    4.706809] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder
(output 1)
[    4.706816] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on TV encoder
(output 2)
[    4.871566] snd_intel8x0 0000:00:1f.5: PCI INT B -> GSI 17 (level, low) ->
IRQ 17
[    4.871609] snd_intel8x0 0000:00:1f.5: setting latency timer to 64
[    4.915794] [drm] nouveau 0000:01:00.0: allocated 1280x1024 fb: 0x49000, bo
f6de6000
[    4.920134] fbcon: nouveaufb (fb0) is primary device
[    4.920433] Console: switching to colour frame buffer device 160x64
[    4.920499] fb0: nouveaufb frame buffer device
[    4.920503] drm: registered panic notifier
[    4.920520] [drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0 on
minor 0
[    5.240473] intel8x0: white list rate for 1043:80f3 is 48000
[    5.292632] input: ImExPS/2 Logitech Wheel Mouse as
/devices/platform/i8042/serio1/input/input4
[    5.613567] init: failsafe main process (833) killed by TERM signal
[    5.815942] type=1400 audit(1336219050.427:8): apparmor="STATUS"
operation="profile_load" name="/usr/lib/cups/backend/cups-pdf" pid=900
comm="apparmor_parser"

[    5.934498] type=1400 audit(1336219050.547:10): apparmor="STATUS"
operation="profile_load"
name="/usr/lib/lightdm/lightdm/lightdm-guest-session-wrapper" pid=945
comm="apparmor_parser"
[    5.958270] type=1400 audit(1336219050.571:11): apparmor="STATUS"
operation="profile_replace" name="/sbin/dhclient" pid=946
comm="apparmor_parser"
[    5.959505] type=1400 audit(1336219050.571:12): apparmor="STATUS"
operation="profile_replace"
name="/usr/lib/NetworkManager/nm-dhcp-client.action" pid=946
comm="apparmor_parser"
[    5.960379] type=1400 audit(1336219050.575:13): apparmor="STATUS"
operation="profile_replace" name="/usr/lib/connman/scripts/dhclient-script"
pid=946 comm="apparmor_parser"
[    5.987441] type=1400 audit(1336219050.599:14): apparmor="STATUS"
operation="profile_load" name="/usr/lib/telepathy/mission-control-5" pid=949
comm="apparmor_parser"
[    5.988733] type=1400 audit(1336219050.603:15): apparmor="STATUS"
operation="profile_load" name="/usr/lib/telepathy/telepathy-*" pid=949
comm="apparmor_parser"
[    5.998861] type=1400 audit(1336219050.611:16): apparmor="STATUS"
operation="profile_replace" name="/usr/lib/cups/backend/cups-pdf" pid=950
comm="apparmor_parser"
[    5.999921] type=1400 audit(1336219050.611:17): apparmor="STATUS"
operation="profile_replace" name="/usr/sbin/cupsd" pid=950
comm="apparmor_parser"
[    6.019443] skge 0000:02:05.0: eth0: enabling interface
[    7.047045] vboxdrv: Found 2 processor cores.
[    7.054186] vboxdrv: fAsync=0 offMin=0x558 offMax=0x1c28
[    7.055941] vboxdrv: TSC mode is 'synchronous', kernel timer mode is
'normal'.
[    7.055950] vboxdrv: Successfully loaded version 4.1.8 (interface
0x00190000).
[    7.124293] [drm] nouveau 0000:01:00.0: 0xE0FB: Parsing digital output
script table
[    7.173963] [drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder
(output 1)
[    7.173974] [drm] nouveau 0000:01:00.0: Output DVI-D-1 is running on CRTC 0
using output A
[    7.310454] vboxpci: IOMMU not found (not registered)
[    7.945552] init: plymouth-stop pre-start process (1755) terminated with
status 1
[    9.190004] skge 0000:02:05.0: eth0: Link is up at 1000 Mbps, full duplex,
flow control both
[   16.800010] eth0: no IPv6 routers present

Rob Koll: uname output:
Linux RobbiesP4 3.2.0-24-generic #38-Ubuntu SMP Tue May 1 16:21:07 UTC 2012
i686 i686 i386 GNU/Linux

Rob Koll: sudo lspci -vvnn
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation NV34 [GeForce FX
5200] [10de:0322] (rev a1) (prog-if 00 [VGA controller])
    Subsystem: ASUSTeK Computer Inc. V9520-X/TD/128M [1043:8180]
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop+ ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
    Latency: 64 (1250ns min, 250ns max)
    Interrupt: pin A routed to IRQ 16
    Region 0: Memory at fd000000 (32-bit, non-prefetchable) [size=16M]
    Region 1: Memory at e0000000 (32-bit, prefetchable) [size=128M]
    Expansion ROM at fe9e0000 [disabled] [size=128K]
    Capabilities: [60] Power Management version 2
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [44] AGP version 3.0
        Status: RQ=32 Iso- ArqSz=0 Cal=3 SBA+ ITACoh- GART64- HTrans- 64bit-
FW+ AGP3+ Rate=x4,x8
        Command: RQ=32 ArqSz=2 Cal=0 SBA+ AGP+ GART64- 64bit- FW+ Rate=x8
    Kernel driver in use: nouveau
    Kernel modules: nouveau, nvidiafb


Rob Koll: xrandr -q:
Screen 0: minimum 320 x 200, current 1440 x 900, maximum 4096 x 4096
VGA-1 disconnected (normal left inverted right x axis y axis)
DVI-D-1 connected 1440x900+0+0 (normal left inverted right x axis y axis) 519mm
x 324mm
   1280x1024      75.0  
   1440x900       59.9* 
   1280x960       60.0  
   1152x864       75.0     60.0  
   1280x720       60.0  
   1024x768       75.1     70.1     60.0  
   832x624        74.6  
   800x600        72.2     75.0     60.3     56.2  
   640x480        72.8     75.0     66.7     60.0  
   720x400        70.1  
TV-1 disconnected (normal left inverted right x axis y axis)

Rob Koll: xorg conf:
Section "Device"
Identifier "n"
Driver "nouveau"
EndSection

Sorry, you have to read the x log from the attachment ... 65535 ... limit. I
might try to delete part of the text, but I'm afraid to delete the wrong part.

Kind regards from the netherlands,
Rob Koll

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
