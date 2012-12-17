From: rm.riches-BRax14MUi1YI9MI5TlNUSA@public.gmane.org (Robert M. Riches Jr.)
Subject: seeking meaning of PMFB0_SUBP{0,1} messages
Date: Mon, 17 Dec 2012 14:52:52 -0800
Message-ID: <20121217225252.B570718589D@one.localnet>
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

What is the meaning of messages of this form in dmesg:

[158362.148203] [drm] nouveau 0000:06:00.0: PMFB0_SUBP0: 0x037f0040
[158362.148208] [drm] nouveau 0000:06:00.0: PMFB0_SUBP1: 0x037f0000

They seem to always appear in pairs.  Out of 1702 lines in dmesg,
286 of them are of the above form.  I don't recall having ever
seen them with Mageia 1, kernel 2.6.38.8-server-10.mga.  However,
there are lots of them with Mageia 2 (just installed a couple of
days ago), kernel 3.3.8-desktop-2.mga2.  The video card is an
Asus ENGT430.  Googling for the relevant strings did not yield
anything that appeared relevant and explanatory.

Fwiw, with Mageia 1, at random intervals between 1-2 and 14 days,
the graphics driver would either misbehave or lock up.  Reloading
the module seemed to fix it--until the next time.  So far (in ~3
days), I have not seen that problem with Mageia 2.

In case it might be relevant, here's a snippet from dmesg from
when it loaded the module:

[    6.450980] [drm] nouveau 0000:06:00.0: Detected an NVc0 generation card (0x0c1080a1)
[    6.465401] checking generic (d7000000 e00000) vs hw (d8000000 8000000)
[    6.465403] checking generic (d7000000 e00000) vs hw (d6000000 2000000)
[    6.465404] fb: conflicting fb hw usage nouveaufb vs VESA VGA - removing generic driver
[    6.478764] Console: switching to colour dummy device 80x25
[    6.482852] [drm] nouveau 0000:06:00.0: Checking PRAMIN for VBIOS
[    6.541739] [drm] nouveau 0000:06:00.0: ... appears to be valid
[    6.541741] [drm] nouveau 0000:06:00.0: Using VBIOS from PRAMIN
[    6.541744] [drm] nouveau 0000:06:00.0: BIT BIOS found
[    6.541746] [drm] nouveau 0000:06:00.0: Bios version 70.08.29.00
[    6.541749] [drm] nouveau 0000:06:00.0: TMDS table version 2.0
[    6.541851] [drm] nouveau 0000:06:00.0: MXM: no VBIOS data, nothing to do
[    6.541854] [drm] nouveau 0000:06:00.0: DCB version 4.0
[    6.541857] [drm] nouveau 0000:06:00.0: DCB outp 00: 01000302 00020030
[    6.541859] [drm] nouveau 0000:06:00.0: DCB outp 01: 02000300 00000000
[    6.541861] [drm] nouveau 0000:06:00.0: DCB outp 02: 08011392 00020020
[    6.541864] [drm] nouveau 0000:06:00.0: DCB outp 03: 04022310 00000000
[    6.541866] [drm] nouveau 0000:06:00.0: DCB conn 00: 00001030
[    6.541869] [drm] nouveau 0000:06:00.0: DCB conn 01: 00002161
[    6.541871] [drm] nouveau 0000:06:00.0: DCB conn 02: 00000200
[    6.541875] [drm] nouveau 0000:06:00.0: Parsing VBIOS init table 0 at offset 0x6BB6
[    6.561986] [drm] nouveau 0000:06:00.0: Parsing VBIOS init table 1 at offset 0x71FC
[    6.569045] [drm] nouveau 0000:06:00.0: Parsing VBIOS init table 2 at offset 0x8391
[    6.569048] [drm] nouveau 0000:06:00.0: Parsing VBIOS init table 3 at offset 0x8395
[    6.569094] [drm] nouveau 0000:06:00.0: Parsing VBIOS init table 4 at offset 0x847D
[    6.569097] [drm] nouveau 0000:06:00.0: Parsing VBIOS init table at offset 0x84E2
[    6.589097] [drm] nouveau 0000:06:00.0: 0x6B29: Condition still not met after 20ms, skipping following opcodes
[    6.593868] [TTM] Zone  kernel: Available graphics memory: 6150454 kiB.
[    6.593876] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB.
[    6.593881] [TTM] Initializing pool allocator.
[    6.593888] [TTM] Initializing DMA pool allocator.
[    6.593903] [drm] nouveau 0000:06:00.0: Detected 512MiB VRAM (DDR3)
[    6.593912] mtrr: type mismatch for d8000000,8000000 old: write-back new: write-combining
[    6.593928] [drm] nouveau 0000:06:00.0: 512 MiB GART (aperture)
[    6.604978] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    6.604981] [drm] No driver support for vblank timestamp query.
[    6.644265] [drm] nouveau 0000:06:00.0: 3 available performance level(s)
[    6.644269] [drm] nouveau 0000:06:00.0: 0: core 50MHz shader 101MHz memory 135MHz voltage 880mV
[    6.644272] [drm] nouveau 0000:06:00.0: 1: core 405MHz shader 810MHz memory 324MHz voltage 900mV
[    6.644276] [drm] nouveau 0000:06:00.0: 3: core 700MHz shader 1400MHz memory 800MHz voltage 1080mV
[    6.644280] [drm] nouveau 0000:06:00.0: c: core 405MHz shader 810MHz memory 324MHz voltage 900mV
[    6.827195] [drm] nouveau 0000:06:00.0: allocated 1920x1200 fb: 0x1a0000, bo ffff88032eb86800
[    6.827367] fbcon: nouveaufb (fb0) is primary device
[    6.862138] Console: switching to colour frame buffer device 240x75
[    6.864716] fb0: nouveaufb frame buffer device
[    6.864727] drm: registered panic notifier
[    6.864739] [drm] Initialized nouveau 1.0.0 20120316 for 0000:06:00.0 on minor 0

Thanks,

Robert
