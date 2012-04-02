From: Meelis Roos <mroos-Y27EyoLml9s@public.gmane.org>
Subject: Nouveau: NV43 unknown ROM tables?
Date: Mon, 2 Apr 2012 16:48:02 +0300 (EEST)
Message-ID: <alpine.SOC.1.00.1204021640130.14978@math.ut.ee>
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

Tried a 6600 (NV43) in one of my test machines. It works and gets a good 
picture, but runs quite hot (91 degrees Celsius last I looked - but it 
is passsively cooled).

Looking in dmesg I found that nouveau driver tells about some unknown 
timing and voltage tables. Maybe related, maybe not, so here is the post 
for the unknown tables (whether or not it is the cause of hot board). 

Can I provide some additional information about this, like a ROM dump or 
something similar? Is there any interest or is it a known unimportant 
problem?

Please CC, as I am not subscribed to the list.

[    6.906924] nouveau 0000:05:00.0: PCI INT A -> Link[APC6] -> GSI 16 (level, low) -> IRQ 16
[    6.906978] nouveau 0000:05:00.0: setting latency timer to 64
[    6.908651] [drm] nouveau 0000:05:00.0: Detected an NV40 generation card (0x043100a4)
[    6.910722] [drm] nouveau 0000:05:00.0: Attempting to load BIOS image from PRAMIN
[    6.981478] [drm] nouveau 0000:05:00.0: ... BIOS checksum invalid
[    6.981517] [drm] nouveau 0000:05:00.0: Attempting to load BIOS image from PROM
[    6.981579] [drm] nouveau 0000:05:00.0: ... BIOS signature not found
[    6.981618] [drm] nouveau 0000:05:00.0: Attempting to load BIOS image from PCIROM
[    6.983572] [drm] nouveau 0000:05:00.0: ... appears to be valid
[    6.983614] [drm] nouveau 0000:05:00.0: BIT BIOS found
[    6.983653] [drm] nouveau 0000:05:00.0: Bios version 05.43.02.87
[    6.983694] [drm] nouveau 0000:05:00.0: TMDS table version 1.1
[    6.983734] [drm] nouveau 0000:05:00.0: Found Display Configuration Block version 3.0
[    6.983786] [drm] nouveau 0000:05:00.0: Raw DCB entry 0: 01000300 00000028
[    6.983828] [drm] nouveau 0000:05:00.0: Raw DCB entry 1: 04011320 00000028
[    6.983868] [drm] nouveau 0000:05:00.0: Raw DCB entry 2: 04011322 00000000
[    6.983909] [drm] nouveau 0000:05:00.0: Raw DCB entry 3: 020223f1 00c0c080
[    6.983951] [drm] nouveau 0000:05:00.0: DCB connector table: VHER 0x30 5 7 2
[    6.983992] [drm] nouveau 0000:05:00.0:   0: 0x00000000: type 0x00 idx 0 tag 0xff
[    6.984060] [drm] nouveau 0000:05:00.0:   1: 0x00001130: type 0x30 idx 1 tag 0x07
[    6.984111] [drm] nouveau 0000:05:00.0:   2: 0x00000210: type 0x10 idx 2 tag 0xff
[    6.984162] [drm] nouveau 0000:05:00.0:   3: 0x00000211: type 0x11 idx 3 tag 0xff
[    6.984212] [drm] nouveau 0000:05:00.0:   4: 0x00000213: type 0x13 idx 4 tag 0xff
[    6.984268] [drm] nouveau 0000:05:00.0: Parsing VBIOS init table 0 at offset 0xE1F1
[    6.984320] [drm] nouveau 0000:05:00.0: 0xE1F1: Init table command not found: 0x00
[    6.984371] [drm] nouveau 0000:05:00.0: Parsing VBIOS init table 1 at offset 0xE63D
[    6.984421] [drm] nouveau 0000:05:00.0: 0xE63D: Init table command not found: 0x02
[    6.984472] [drm] nouveau 0000:05:00.0: Parsing VBIOS init table 2 at offset 0xEBB9
[    6.984523] [drm] nouveau 0000:05:00.0: 0xEBB9: Init table command not found: 0xF8
[    6.984573] [drm] nouveau 0000:05:00.0: Parsing VBIOS init table 3 at offset 0xED43
[    6.984624] [drm] nouveau 0000:05:00.0: 0xED43: Init table command not found: 0x00
[    6.984675] [drm] nouveau 0000:05:00.0: Parsing VBIOS init table 4 at offset 0xEEF8
[    6.984728] [drm] nouveau 0000:05:00.0: memory timing table 0x66 unknown
[    6.984769] [drm] nouveau 0000:05:00.0: voltage table 0x1b unknown
[    7.004267] [drm] nouveau 0000:05:00.0: 8 available performance level(s)
[    7.004312] [drm] nouveau 0000:05:00.0: 0:
[    7.004349] [drm] nouveau 0000:05:00.0: 1:
[    7.004385] [drm] nouveau 0000:05:00.0: 2:
[    7.004422] [drm] nouveau 0000:05:00.0: 3:
[    7.004459] [drm] nouveau 0000:05:00.0: 4:
[    7.004496] [drm] nouveau 0000:05:00.0: 5:
[    7.004533] [drm] nouveau 0000:05:00.0: 6:
[    7.004569] [drm] nouveau 0000:05:00.0: 7:
[    7.004612] [drm] nouveau 0000:05:00.0: c: core 351MHz shader 351MHz memory 803MHz
[    7.004837] [TTM] Zone  kernel: Available graphics memory: 2031988 kiB.
[    7.004877] [TTM] Initializing pool allocator.
[    7.004927] [drm] nouveau 0000:05:00.0: Detected 256MiB VRAM
[    7.008282] [drm] nouveau 0000:05:00.0: 512 MiB GART (aperture)
[    7.008422] [drm] nouveau 0000:05:00.0: Saving VGA fonts
[    7.054655] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    7.054699] [drm] No driver support for vblank timestamp query.
[    7.054742] [drm] nouveau 0000:05:00.0: Setting dpms mode 3 on vga encoder (output 0)
[    7.054800] [drm] nouveau 0000:05:00.0: Setting dpms mode 3 on vga encoder (output 1)
[    7.054851] [drm] nouveau 0000:05:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[    7.054903] [drm] nouveau 0000:05:00.0: Setting dpms mode 3 on TV encoder (output 3)

-- 
Meelis Roos (mroos-Y27EyoLml9s@public.gmane.org)
