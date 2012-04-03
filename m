From: Meelis Roos <mroos-Y27EyoLml9s@public.gmane.org>
Subject: Re: Nouveau: NV43 unknown ROM tables? + division by zero
Date: Tue, 3 Apr 2012 12:03:23 +0300 (EEST)
Message-ID: <alpine.SOC.1.00.1204031158040.23847@math.ut.ee>
References: <alpine.SOC.1.00.1204021640130.14978@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <alpine.SOC.1.00.1204021640130.14978-ptEonEWSGqKptlylMvRsHA@public.gmane.org>
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

> Tried a 6600 (NV43) in one of my test machines. It works and gets a good 
> picture, but runs quite hot (91 degrees Celsius last I looked - but it 
> is passsively cooled).
> 
> Looking in dmesg I found that nouveau driver tells about some unknown 
> timing and voltage tables. Maybe related, maybe not, so here is the post 
> for the unknown tables (whether or not it is the cause of hot board). 
> 
> [    6.984728] [drm] nouveau 0000:05:00.0: memory timing table 0x66 unknown
> [    6.984769] [drm] nouveau 0000:05:00.0: voltage table 0x1b unknown
> [    7.004267] [drm] nouveau 0000:05:00.0: 8 available performance level(s)
> [    7.004312] [drm] nouveau 0000:05:00.0: 0:
> [    7.004349] [drm] nouveau 0000:05:00.0: 1:
> [    7.004385] [drm] nouveau 0000:05:00.0: 2:
> [    7.004422] [drm] nouveau 0000:05:00.0: 3:
> [    7.004459] [drm] nouveau 0000:05:00.0: 4:
> [    7.004496] [drm] nouveau 0000:05:00.0: 5:
> [    7.004533] [drm] nouveau 0000:05:00.0: 6:
> [    7.004569] [drm] nouveau 0000:05:00.0: 7:
> [    7.004612] [drm] nouveau 0000:05:00.0: c: core 351MHz shader 351MHz memory 803MHz

This was from 3.2.something (Debian package). Tried 3.4.0-rc1-104 
(todays git), this is slightly different:

[    4.169797] VGA switcheroo: detected Optimus DSM method \ handle
[    4.170273] ACPI: PCI Interrupt Link [APC6] enabled at IRQ 16
[    4.171160] [drm] nouveau 0000:05:00.0: Detected an NV40 generation card (0x043100a4)
[    4.177934] [drm] nouveau 0000:05:00.0: Checking PRAMIN for VBIOS
[    4.252378] [drm] nouveau 0000:05:00.0: ... BIOS checksum invalid
[    4.252424] [drm] nouveau 0000:05:00.0: Checking PROM for VBIOS
[    4.252698] [drm] nouveau 0000:05:00.0: ... BIOS checksum invalid
[    4.252742] [drm] nouveau 0000:05:00.0: Checking ACPI for VBIOS
[    4.252982] [drm] nouveau 0000:05:00.0: ... BIOS checksum invalid
[    4.253026] [drm] nouveau 0000:05:00.0: Checking PCIROM for VBIOS
[    4.256860] [drm] nouveau 0000:05:00.0: ... appears to be valid
[    4.256918] [drm] nouveau 0000:05:00.0: Using VBIOS from PCIROM
[    4.256969] [drm] nouveau 0000:05:00.0: BIT BIOS found
[    4.257015] [drm] nouveau 0000:05:00.0: Bios version 05.43.02.87
[    4.257061] [drm] nouveau 0000:05:00.0: TMDS table version 1.1
[    4.257303] [drm] nouveau 0000:05:00.0: MXM: no VBIOS data, nothing to do
[    4.257351] [drm] nouveau 0000:05:00.0: DCB version 3.0
[    4.257398] [drm] nouveau 0000:05:00.0: DCB outp 00: 01000300 00000028
[    4.257448] [drm] nouveau 0000:05:00.0: DCB outp 01: 04011320 00000028
[    4.257494] [drm] nouveau 0000:05:00.0: DCB outp 02: 04011322 00000000
[    4.257539] [drm] nouveau 0000:05:00.0: DCB outp 03: 020223f1 00c0c080
[    4.257584] [drm] nouveau 0000:05:00.0: DCB conn 00: 0000
[    4.257651] [drm] nouveau 0000:05:00.0: DCB conn 01: 1130
[    4.257718] [drm] nouveau 0000:05:00.0: DCB conn 02: 0210
[    4.257784] [drm] nouveau 0000:05:00.0: DCB conn 03: 0211
[    4.257850] [drm] nouveau 0000:05:00.0: DCB conn 04: 0213
[    4.257923] [drm] nouveau 0000:05:00.0: Parsing VBIOS init table 0 at offset 0xE1F1
[    4.257982] [drm] nouveau 0000:05:00.0: 0xE1F1: Init table command not found: 0x00
[    4.258038] [drm] nouveau 0000:05:00.0: Parsing VBIOS init table 1 at offset 0xE63D
[    4.258094] [drm] nouveau 0000:05:00.0: 0xE63D: Init table command not found: 0x02
[    4.258150] [drm] nouveau 0000:05:00.0: Parsing VBIOS init table 2 at offset 0xEBB9
[    4.258206] [drm] nouveau 0000:05:00.0: 0xEBB9: Init table command not found: 0xF8
[    4.258262] [drm] nouveau 0000:05:00.0: Parsing VBIOS init table 3 at offset 0xED43
[    4.258318] [drm] nouveau 0000:05:00.0: 0xED43: Init table command not found: 0x00
[    4.258374] [drm] nouveau 0000:05:00.0: Parsing VBIOS init table 4 at offset 0xEEF8
[    4.258658] [TTM] Zone  kernel: Available graphics memory: 2025616 kiB
[    4.258705] [TTM] Initializing pool allocator
[    4.258753] [TTM] Initializing DMA pool allocator
[    4.258816] [drm] nouveau 0000:05:00.0: Detected 256MiB VRAM (DDR2)
[    4.265279] [drm] nouveau 0000:05:00.0: 512 MiB GART (aperture)
[    4.265480] [drm] nouveau 0000:05:00.0: Saving VGA fonts
[    4.315588] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    4.315635] [drm] No driver support for vblank timestamp query.
[    4.315861] [drm] nouveau 0000:05:00.0: voltage table 0x1b unknown
[    4.316950] [drm] nouveau 0000:05:00.0: 0 available performance level(s)
[    4.317012] [drm] nouveau 0000:05:00.0: c: core 351MHz shader 351MHz memory 803MHz fanspeed 100%
[    4.318231] [drm] nouveau 0000:05:00.0: 0xD650: Parsing digital output script table
[    4.368464] [drm] nouveau 0000:05:00.0: Setting dpms mode 3 on vga encoder (output 0)
[    4.368532] [drm] nouveau 0000:05:00.0: Setting dpms mode 3 on vga encoder (output 1)
[    4.368590] [drm] nouveau 0000:05:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[    4.368651] [drm] nouveau 0000:05:00.0: Setting dpms mode 3 on TV encoder (output 3)
[    4.500046] No connectors reported connected with modes
[    4.500106] [drm] Cannot find any crtc or sizes - going 1024x768
[    4.501185] [drm] nouveau 0000:05:00.0: allocated 1024x768 fb: 0x49000, bo ffff88013a781000
[    4.501353] fbcon: nouveaufb (fb0) is primary device
[    4.507045] Console: switching to colour frame buffer device 128x48
[    4.508397] fb0: nouveaufb frame buffer device
[    4.508412] drm: registered panic notifier
[    4.508437] [drm] Initialized nouveau 1.0.0 20120316 for 0000:05:00.0 on minor 0

This time, memory timing table is not unknown, but voltage tabele still 
is, and only 0 available performance levels instead of 8 empty ones. 
Also, monitor is not attached at the moment, used somewhere else.

-- 
Meelis Roos (mroos-Y27EyoLml9s@public.gmane.org)
