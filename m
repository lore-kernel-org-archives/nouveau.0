From: Gianluca Cecchi <gianluca.cecchi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Problem with GT520 and optimus on Fedora 17
Date: Fri, 22 Jun 2012 10:45:35 +0200
Message-ID: <CAG2kNCxHWS2vzLweyuZE2yfMOb1g3mAagTXX9qedz70YDRqV8Q@mail.gmail.com>
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

Hello,
I have an Asus laptop, U36SD, with Optimus technology.
The discrete gpu is an NVIDIA GeForce GT 520M with 1GB DDR3 VRAM
Using Fedora 17; up to kernel 3.3.7-1 I was able to use bumblebee and
bbswitch and then running optirun command (as I could do in F16).
No more with kernel 3.4. Tried 3.4.0-1.fc17.x86_64,
3.4.2-4.fc17.x86_64 and 3.4.3-1.fc17.x86_64.
I already opened a bug against F17:
https://bugzilla.redhat.com/show_bug.cgi?id=831136

I'm using
bbswitch-0.4.2.tar.gz
VirtualGL-2.3.1.x86_64.rpm
bumblebee-3.0.tar.gz
and nouveau kernel module

In dmesg output of 3.3.7 I see this:
[ 3.146911] [drm] nouveau 0000:01:00.0: ... appears to be valid
[ 3.146921] [drm] nouveau 0000:01:00.0: BIT BIOS found
[ 3.146928] [drm] nouveau 0000:01:00.0: Bios version 75.19.21.00
[ 3.146936] [drm] nouveau 0000:01:00.0: TMDS table version 2.0
[ 3.147430] [drm] nouveau 0000:01:00.0: MXM: no VBIOS data, nothing to do
[ 3.147436] [drm] nouveau 0000:01:00.0: DCB version 4.0
[ 3.147442] [drm] nouveau 0000:01:00.0: DCB outp 00: 02000300 00000000
[ 3.147447] [drm] nouveau 0000:01:00.0: DCB conn 00: 00000000
[ 3.147468] [drm] nouveau 0000:01:00.0: Adaptor not initialised,
running VBIOS init tables.
[ 3.147474] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at
offset 0x7263
[ 3.177791] [drm] nouveau 0000:01:00.0: 0x7241: i2c wr fail: -5
[ 3.179707] [drm] nouveau 0000:01:00.0: 0x7253: i2c rd fail: -5
..
[ 3.241772] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at
offset 0x78D7
[ 3.268816] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at
offset 0x8887
[ 3.268821] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at
offset 0x8888
[ 3.268882] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at
offset 0x8979
[ 3.268887] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table at
offset 0x89DE
[ 3.289801] [drm] nouveau 0000:01:00.0: 1 available performance level(s)
[ 3.289813] [drm] nouveau 0000:01:00.0: 1: core 270MHz shader 540MHz
memory 405MHz timing 5
[ 3.289907] [drm] nouveau 0000:01:00.0: c: core 270MHz shader 540MHz
memory 405MHz voltage 850mV
[ 3.296899] [TTM] Zone kernel: Available graphics memory: 4040386 kiB.
[ 3.296906] [TTM] Zone dma32: Available graphics memory: 2097152 kiB.
[ 3.296911] [TTM] Initializing pool allocator.
[ 3.296921] [TTM] Initializing DMA pool allocator.
[ 3.296953] [drm] nouveau 0000:01:00.0: Detected 1024MiB VRAM
[ 3.304951] [drm] nouveau 0000:01:00.0: 512 MiB GART (aperture)
[ 3.315636] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[ 3.315637] [drm] No driver support for vblank timestamp query.
[ 3.315723] [drm] nouveau 0000:01:00.0: ACPI backlight interface
available, not registering our own
[ 3.327452] [drm] nouveau 0000:01:00.0: allocated 1024x768 fb:
0xe0000, bo ffff880243525400
[ 3.327455] checking generic (b0000000 410000) vs hw (c0000000 10000000)
[ 3.327456] checking generic (b0000000 410000) vs hw (d0000000 2000000)
[ 3.327702] fb1: nouveaufb frame buffer device
[ 3.327704] drm: registered panic notifier
[ 3.327708] [drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0
on minor 0

Instead in 3.4.3:
[ 2.643224] [drm] Initialized drm 1.1.0 20060810
[ 2.644723] wmi: Mapper loaded
[ 2.647064] MXM: GUID detected in BIOS
[ 2.647107] ACPI Error: Needed [Buffer/String/Package], found
[Integer] ffff88023ee2c510 (20120320/exresop-590)
[ 2.647112] ACPI Exception: AEAML_OPERAND_TYPE, While resolving
operands for OpcodeName unavailable
[ 2.647118] ACPI Error: Method parse/execution failed
_SB_.PCI0.GFX0._DSM, AE_AML_OPERAND_TYPE (20120320/psparse-536)
[ 2.647129] failed to evaluate _DSM: 12291
[ 2.647229] ACPI Error: Needed [Buffer/String/Package], found
[Integer] ffff88023ee2c510 (20120320/exresop-590)
[ 2.647233] ACPI Exception: AE_AML_OPERAND_TYPE, While resolving
operands for OpcodeName unavailable
[ 2.647238] ACPI Error: Method parse/execution failed
_SB_.PCI0.GFX0._DSM, AE_AML_OPERAND_TYPE (20120320/psparse-536)
[ 2.647245] ACPI Error: Method parse/execution failed
_SB_.PCI0.PEG0.GFX0._DSM, AE_AML_OPERAND_TYPE (20120320/psparse-536)
[ 2.647253] failed to evaluate _DSM: 12291
[ 2.647328] VGA switcheroo: detected Optimus DSM method
_SB.PCI0.PEG0.GFX0 handle
[ 2.647366] nouveau 0000:01:00.0: power state changed by ACPI to D0
[ 2.647371] nouveau 0000:01:00.0: power state changed by ACPI to D0
[ 2.647376] nouveau 0000:01:00.0: enabling device (0000 -> 0003)
[ 2.647903] [drm] nouveau 0000:01:00.0: Detected an NVd0 generation
card (0x0d9100a1)
[ 2.650194] [drm] nouveau 0000:01:00.0: acceleration disabled by
default, pass noaccel=0 to force enable
[ 2.650199] checking generic (b0000000 410000) vs hw (c0000000 10000000)
[ 2.650201] checking generic (b0000000 410000) vs hw (d0000000 2000000)
[ 2.657380] [drm] nouveau 0000:01:00.0: Checking PRAMIN for VBIOS
[ 2.705503] [drm] nouveau 0000:01:00.0: ... BIOS signature not found
[ 2.705504] [drm] nouveau 0000:01:00.0: Checking PROM for VBIOS
[ 2.705597] [drm] nouveau 0000:01:00.0: ... BIOS signature not found
[ 2.705610] [drm] nouveau 0000:01:00.0: Checking ACPI for VBIOS
[ 2.705666] ACPI Error: Field [ROMI] Base+Offset+Width 0+24+1 is
beyond end of region VROM (20120320/exfldio-210)
[ 2.705670] ACPI Error: Method parse/execution failed
_SB_.PCI0.PEG0.GFX0._ROM, AE_AML_REGION_LIMIT (20120320/psparse-536)
[ 2.759759] failed to evaluate ROM got AE_AML_REGION_LIMIT
[ 2.759761] [drm] nouveau 0000:01:00.0: ... BIOS signature not found
[ 2.759763] [drm] nouveau 0000:01:00.0: Checking PCIROM for VBIOS
[ 2.759894] nouveau 0000:01:00.0: Invalid ROM contents
[ 2.760356] [drm] nouveau 0000:01:00.0: ... BIOS signature not found
[ 2.760357] [drm] nouveau 0000:01:00.0: No valid VBIOS image found

Let me know if you need more info and tThanks in advance for your help.
Gianluca
