From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: Re: Fix for vblank on nvc0
Date: Sun, 11 Nov 2012 19:35:19 +0100
Message-ID: <20121111183519.GA2959@joi.lan>
References: <CAES2CiZRdkaOwYUbtp28ZMKu+DqtPOoKRwHPpLWaF2WeB6F8+g@mail.gmail.com>
	<50995728.8080305@canonical.com> <20121111182617.GA15689@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20121111182617.GA15689@joi.lan>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Cc: Kelly Doran <kel.p.doran@gmail.com>, nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Sun, Nov 11, 2012 at 07:26:17PM +0100, Marcin Slusarz wrote:
> On Tue, Nov 06, 2012 at 07:30:00PM +0100, Maarten Lankhorst wrote:
> > 
> > 
> > Op 06-11-12 15:48, Kelly Doran schreef:
> > > The vblank on nvc0 was not working correctly and would freeze X, I managed
> > > to track it down and fix it with some help from m.b.lankhorst, see
> > > https://bugs.freedesktop.org/show_bug.cgi?id=56692 for details.
> > >
> > Reviewed-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
> > 
> > I recommended the bar flush since nvd0 does as well, and there might be a small race
> > otherwise.
> > 
> > Can this still get in before final 3.7 release?
> 
> This patch breaks vblank here (nv92) completely.
> 
> [ 6879.200427] Console: switching to colour VGA+ 80x25
> [ 6879.202884] drm: unregistered panic notifier
> [ 6879.334278] [TTM] Finalizing pool allocator
> [ 6879.334518] [TTM] Finalizing DMA pool allocator
> [ 6879.334765] [TTM] Zone  kernel: Used memory at exit: 0 kiB
> [ 6879.335004] [TTM] Zone   dma32: Used memory at exit: 0 kiB
> [ 6879.340472] [drm] Module unloaded
> [ 6879.397744] [drm] Initialized drm 1.1.0 20060810
> [ 6879.408149] nouveau  [  DEVICE][0000:02:00.0] BOOT0  : 0x092a00a2
> [ 6879.408401] nouveau  [  DEVICE][0000:02:00.0] Chipset: G92 (NV92)
> [ 6879.408641] nouveau  [  DEVICE][0000:02:00.0] Family : NV50
> [ 6879.409752] nouveau  [   VBIOS][0000:02:00.0] checking PRAMIN for image...
> [ 6879.409997] nouveau  [   VBIOS][0000:02:00.0] ... signature not found
> [ 6879.410236] nouveau  [   VBIOS][0000:02:00.0] checking PROM for image...
> [ 6879.549018] nouveau  [   VBIOS][0000:02:00.0] ... appears to be valid
> [ 6879.549259] nouveau  [   VBIOS][0000:02:00.0] using image from PROM
> [ 6879.549640] nouveau  [   VBIOS][0000:02:00.0] BIT signature found
> [ 6879.549879] nouveau  [   VBIOS][0000:02:00.0] version 62.92.63.00
> [ 6879.570275] nouveau  [     MXM][0000:02:00.0] no VBIOS data, nothing to do
> [ 6879.572488] nouveau  [     PFB][0000:02:00.0] RAM type: GDDR3
> [ 6879.572726] nouveau  [     PFB][0000:02:00.0] RAM size: 512 MiB
> [ 6879.572964] nouveau  [     PFB][0000:02:00.0]    ZCOMP: 4032 tags
> [ 6879.597652] [TTM] Zone  kernel: Available graphics memory: 3047140 kiB
> [ 6879.597892] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
> [ 6879.598130] [TTM] Initializing pool allocator
> [ 6879.598367] [TTM] Initializing DMA pool allocator
> [ 6879.602860] nouveau  [     DRM] VRAM: 512 MiB
> [ 6879.603102] nouveau  [     DRM] GART: 512 MiB
> [ 6879.603339] nouveau  [     DRM] BIT BIOS found
> [ 6879.603575] nouveau  [     DRM] Bios version 62.92.63.00
> [ 6879.603813] nouveau  [     DRM] TMDS table version 2.0
> [ 6879.604050] nouveau  [     DRM] DCB version 4.0
> [ 6879.604287] nouveau  [     DRM] DCB outp 00: 02000300 00000028
> [ 6879.604524] nouveau  [     DRM] DCB outp 01: 01000302 00020030
> [ 6879.604763] nouveau  [     DRM] DCB outp 02: 04011310 00000028
> [ 6879.605000] nouveau  [     DRM] DCB outp 03: 02011312 00020030
> [ 6879.605238] nouveau  [     DRM] DCB conn 00: 00001030
> [ 6879.605516] nouveau  [     DRM] DCB conn 01: 00002130
> [ 6879.648012] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
> [ 6879.648257] [drm] No driver support for vblank timestamp query.
> [ 6879.648708] nouveau  [     DRM] 1 available performance level(s)
> [ 6879.648953] nouveau  [     DRM] 3: core 650MHz shader 1625MHz memory 1000MHz voltage 1050mV fanspeed 100%
> [ 6879.649391] nouveau  [     DRM] c: core 399MHz shader 810MHz memory 399MHz voltage 1050mV fanspeed 34%
> [ 6879.693947] nouveau  [     DRM] MM: using CRYPT for buffer copies
> [ 6879.791680] nouveau  [     DRM] allocated 1920x1080 fb: 0x70000, bo ffff880018f20800
> [ 6879.792175] fbcon: nouveaufb (fb0) is primary device
> [ 6879.850216] Console: switching to colour frame buffer device 240x67
> [ 6879.897075] fb0: nouveaufb frame buffer device
> [ 6879.897075] drm: registered panic notifier
> [ 6879.897078] [drm] Initialized nouveau 1.1.0 20120801 for 0000:02:00.0 on minor 0
> I'm starting glxgears here
> xorg hangs, with occasional mouse movement
> [ 6907.054696] nouveau  [   PFIFO][0000:02:00.0] unknown intr 0x00000040, ch 2
> pkill glxgears from fbcon
> [ 6963.987969] nouveau E[   15318] failed to idle channel 0xcccc0000
> xorg still hangs
> [ 7034.713069] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_2D - TP 0 - Unknown fault at address 0020060000
> [ 7034.713167] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_2D - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00000000, e20: 00000037, e24: 0c030000
> [ 7034.713286] nouveau  [  PGRAPH][0000:02:00.0]  TRAP
> [ 7034.713353] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x001faf9000] subc 2 class 0x502d mthd 0x060c data 0x0000000b
> [ 7034.713454] nouveau E[     PFB][0000:02:00.0] trapped write at 0x0000000000 on channel 0x0001fea0 PEEPHOLE/PFIFO_WRITE/00 reason: NULL_DMAOBJ
> [ 7034.713624] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP 0 - Unknown fault at address 0020060000
> [ 7034.713713] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00020000, e20: 00003b00, e24: 00030000
> [ 7034.713834] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP 1 - Unknown fault at address 0020060000
> [ 7034.713921] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP 1 - e0c: 00000000, e18: 00000000, e1c: 00020010, e20: 00003b00, e24: 00030000
> [ 7034.714043] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP 2 - Unknown fault at address 0020060000
> [ 7034.714141] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP 2 - e0c: 00000000, e18: 00000000, e1c: 00020020, e20: 00003b00, e24: 00030000
> [ 7034.714259] nouveau  [  PGRAPH][0000:02:00.0]  TRAP
> [ 7034.714325] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x001faf9000] subc 7 class 0x8297 mthd 0x15e0 data 0x00000000
> [ 7034.714425] nouveau E[     PFB][0000:02:00.0] trapped read at 0x0020060100 on channel 0x0001faf9 PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
> [ 7034.714594] nouveau E[  PGRAPH][0000:02:00.0] magic set 0:
> [ 7034.714650] nouveau E[  PGRAPH][0000:02:00.0] 	0x00408904: 0x74087b05
> [ 7034.714711] nouveau E[  PGRAPH][0000:02:00.0] 	0x00408908: 0x00200601
> [ 7034.714772] nouveau E[  PGRAPH][0000:02:00.0] 	0x0040890c: 0x40000432
> [ 7034.714832] nouveau E[  PGRAPH][0000:02:00.0] 	0x00408910: 0x06000000
> [ 7034.714893] nouveau  [  PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP0: Unhandled ustatus 0x00000003
> [ 7034.714971] nouveau E[  PGRAPH][0000:02:00.0] magic set 1:
> [ 7034.715026] nouveau E[  PGRAPH][0000:02:00.0] 	0x00409904: 0x74087b05
> [ 7034.715086] nouveau E[  PGRAPH][0000:02:00.0] 	0x00409908: 0x00200601
> [ 7034.715146] nouveau E[  PGRAPH][0000:02:00.0] 	0x0040990c: 0x40000432
> [ 7034.715207] nouveau E[  PGRAPH][0000:02:00.0] 	0x00409910: 0x06000000
> [ 7034.715266] nouveau  [  PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP1: Unhandled ustatus 0x00000003
> [ 7034.715345] nouveau E[  PGRAPH][0000:02:00.0] magic set 2:
> [ 7034.715399] nouveau E[  PGRAPH][0000:02:00.0] 	0x0040a904: 0x74087b0a
> [ 7034.715460] nouveau E[  PGRAPH][0000:02:00.0] 	0x0040a908: 0x00200601
> [ 7034.715520] nouveau E[  PGRAPH][0000:02:00.0] 	0x0040a90c: 0x40000432
> [ 7034.715581] nouveau E[  PGRAPH][0000:02:00.0] 	0x0040a910: 0x06000000
> [ 7034.715641] nouveau  [  PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP2: Unhandled ustatus 0x00000003
> [ 7034.715720] nouveau E[  PGRAPH][0000:02:00.0] magic set 3:
> [ 7034.715774] nouveau E[  PGRAPH][0000:02:00.0] 	0x0040b904: 0x74087e05
> [ 7034.715836] nouveau E[  PGRAPH][0000:02:00.0] 	0x0040b908: 0x00200602
> [ 7034.715896] nouveau E[  PGRAPH][0000:02:00.0] 	0x0040b90c: 0x40000432
> [ 7034.715956] nouveau E[  PGRAPH][0000:02:00.0] 	0x0040b910: 0x06000000
> [ 7034.716017] nouveau  [  PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP3: Unhandled ustatus 0x00000003
> [ 7034.716098] nouveau  [  PGRAPH][0000:02:00.0]  TRAP
> [ 7034.716163] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x001faf9000] subc 7 class 0x8297 mthd 0x15e0 data 0x00000000
> [ 7034.716262] nouveau E[     PFB][0000:02:00.0] trapped read at 0x0020158000 on channel 0x0001faf9 PGRAPH/DISPATCH/M2M_IN reason: PAGE_NOT_PRESENT
> [ 7034.716422] nouveau E[  PGRAPH][0000:02:00.0] TRAP_M2MF IN
> [ 7034.716497] nouveau E[  PGRAPH][0000:02:00.0] TRAP_M2MF 00320151 20156f00 00000000 04000432
> [ 7034.716572] nouveau  [  PGRAPH][0000:02:00.0]  TRAP
> [ 7034.716638] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x001faf9000] subc 0 class 0x5039 mthd 0x0328 data 0x00000000
> [ 7034.716736] nouveau E[     PFB][0000:02:00.0] trapped read at 0x00200fc000 on channel 0x0001faf9 PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
> [ 7034.716901] nouveau E[  PGRAPH][0000:02:00.0] magic set 0:
> [ 7034.716956] nouveau E[  PGRAPH][0000:02:00.0] 	0x00408904: 0x20087a01
> [ 7034.717017] nouveau E[  PGRAPH][0000:02:00.0] 	0x00408908: 0x00200fc0
> [ 7034.717077] nouveau E[  PGRAPH][0000:02:00.0] 	0x0040890c: 0x80000432
> [ 7034.717138] nouveau E[  PGRAPH][0000:02:00.0] 	0x00408910: 0x0fc00000
> [ 7034.717198] nouveau  [  PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP0: Unhandled ustatus 0x00000003
> [ 7034.717291] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_2D - TP 0 - Unknown fault at address 0020104000
> [ 7034.717377] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_2D - TP 0 - e0c: 00000000, e18: 00000000, e1c: 000000c0, e20: 00000011, e24: 0c030000
> [ 7034.717495] nouveau  [  PGRAPH][0000:02:00.0]  TRAP
> [ 7034.717560] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x001faf9000] subc 2 class 0x502d mthd 0x08dc data 0x00000000
> [ 7034.717659] nouveau E[     PFB][0000:02:00.0] trapped write at 0x0020060000 on channel 0x0001faf9 PGRAPH/PROP/DST2D reason: PAGE_NOT_PRESENT
> [ 7034.717828] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_2D - TP 0 - Unknown fault at address 0020060000
> [ 7034.717916] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_2D - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00000000, e20: 00000037, e24: 0c030000
> [ 7034.718034] nouveau  [  PGRAPH][0000:02:00.0]  TRAP
> [ 7034.718099] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x001faf9000] subc 2 class 0x502d mthd 0x060c data 0x0000000b
> [ 7034.718197] nouveau E[     PFB][0000:02:00.0] trapped write at 0x0020060000 on channel 0x0001faf9 PGRAPH/PROP/RT0 reason: PAGE_NOT_PRESENT
> [ 7034.718366] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP 0 - Unknown fault at address 0020060000
> [ 7034.718454] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00020000, e20: 00003b00, e24: 00030000
> [ 7034.718574] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP 1 - Unknown fault at address 0020060000
> [ 7034.718660] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP 1 - e0c: 00000000, e18: 00000000, e1c: 00020010, e20: 00003b00, e24: 00030000
> [ 7034.718780] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP 2 - Unknown fault at address 0020060000
> [ 7034.722082] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP 2 - e0c: 00000000, e18: 00000000, e1c: 00020020, e20: 00003b00, e24: 00030000
> [ 7034.725066] nouveau  [  PGRAPH][0000:02:00.0]  TRAP
> [ 7034.725069] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x001faf9000] subc 7 class 0x8297 mthd 0x15e0 data 0x00000000
> [ 7034.725104] nouveau E[  PGRAPH][0000:02:00.0] magic set 0:
> [ 7034.725106] nouveau E[  PGRAPH][0000:02:00.0] 	0x00408904: 0x74084105
> [ 7034.725108] nouveau E[  PGRAPH][0000:02:00.0] 	0x00408908: 0x00200601
> [ 7034.725109] nouveau E[  PGRAPH][0000:02:00.0] 	0x0040890c: 0x40000432
> [ 7034.725111] nouveau E[  PGRAPH][0000:02:00.0] 	0x00408910: 0x06000000
> [ 7034.725113] nouveau  [  PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP0: Unhandled ustatus 0x00000003
> [ 7034.725115] nouveau E[  PGRAPH][0000:02:00.0] magic set 1:
> [ 7034.725116] nouveau E[  PGRAPH][0000:02:00.0] 	0x00409904: 0x74087605
> [ 7034.725118] nouveau E[  PGRAPH][0000:02:00.0] 	0x00409908: 0x00200601
> [ 7034.725120] nouveau E[  PGRAPH][0000:02:00.0] 	0x0040990c: 0x40000432
> [ 7034.725122] nouveau E[  PGRAPH][0000:02:00.0] 	0x00409910: 0x06000000
> [ 7034.725124] nouveau  [  PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP1: Unhandled ustatus 0x00000003
> [ 7034.725125] nouveau E[  PGRAPH][0000:02:00.0] magic set 2:
> [ 7034.725127] nouveau E[  PGRAPH][0000:02:00.0] 	0x0040a904: 0x7408740a
> [ 7034.725129] nouveau E[  PGRAPH][0000:02:00.0] 	0x0040a908: 0x00200601
> [ 7034.725131] nouveau E[  PGRAPH][0000:02:00.0] 	0x0040a90c: 0x40000432
> [ 7034.725132] nouveau E[  PGRAPH][0000:02:00.0] 	0x0040a910: 0x06000000
> [ 7034.725134] nouveau  [  PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP2: Unhandled ustatus 0x00000003
> [ 7034.725136] nouveau E[  PGRAPH][0000:02:00.0] magic set 3:
> [ 7034.725138] nouveau E[  PGRAPH][0000:02:00.0] 	0x0040b904: 0x74087b05
> [ 7034.725140] nouveau E[  PGRAPH][0000:02:00.0] 	0x0040b908: 0x00200600
> [ 7034.725142] nouveau E[  PGRAPH][0000:02:00.0] 	0x0040b90c: 0x40000432
> [ 7034.725144] nouveau E[  PGRAPH][0000:02:00.0] 	0x0040b910: 0x06000000
> [ 7034.725145] nouveau  [  PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP3: Unhandled ustatus 0x00000003
> [ 7034.725151] nouveau  [  PGRAPH][0000:02:00.0]  TRAP
> [ 7034.725153] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x001faf9000] subc 7 class 0x8297 mthd 0x15e0 data 0x00000000
> [ 7034.725167] nouveau E[     PFB][0000:02:00.0] trapped read at 0x0020060100 on channel 0x0001faf9 PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
> [ 7034.725177] nouveau E[  PGRAPH][0000:02:00.0] TRAP_M2MF IN
> [ 7034.725182] nouveau E[  PGRAPH][0000:02:00.0] TRAP_M2MF 00320151 20103240 00000000 04000432
> [ 7034.725184] nouveau  [  PGRAPH][0000:02:00.0]  TRAP
> [ 7034.725186] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x001faf9000] subc 0 class 0x5039 mthd 0x0328 data 0x00000000
> [ 7034.726101] nouveau E[  PGRAPH][0000:02:00.0] magic set 0:
> [ 7034.726103] nouveau E[  PGRAPH][0000:02:00.0] 	0x00408904: 0x20087f01
> [ 7034.726105] nouveau E[  PGRAPH][0000:02:00.0] 	0x00408908: 0x00200fc0
> [ 7034.726107] nouveau E[  PGRAPH][0000:02:00.0] 	0x0040890c: 0x80000432
> [ 7034.726110] nouveau E[  PGRAPH][0000:02:00.0] 	0x00408910: 0x0fc00000
> [ 7034.726111] nouveau  [  PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP0: Unhandled ustatus 0x00000003
> [ 7034.726130] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_2D - TP 0 - Unknown fault at address 0020159000
> [ 7034.726132] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_2D - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00000000, e20: 00000011, e24: 0c030000
> [ 7034.726140] nouveau  [  PGRAPH][0000:02:00.0]  TRAP
> [ 7034.726142] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x001faf9000] subc 2 class 0x502d mthd 0x08dc data 0x00000000
> [ 7034.726153] nouveau E[     PFB][0000:02:00.0] trapped write at 0x0020159000 on channel 0x0001faf9 PGRAPH/PROP/DST2D reason: PAGE_NOT_PRESENT
> [ 7037.703052] nouveau E[   15220] failed to idle channel 0xcccc0000
> xorg crashes
> 
> another try:
> glxgears
> xorg hangs
> [ 7220.463528] nouveau  [   PFIFO][0000:02:00.0] unknown intr 0x00000040, ch 2
> pkill glxgears from fbcon
> [ 7286.269036] nouveau E[   15542] failed to idle channel 0xcccc0000
> xorg still hangs
> [ 7358.490445] nouveau E[  PGRAPH][0000:02:00.0] TRAP_M2MF IN
> [ 7358.492458] nouveau E[  PGRAPH][0000:02:00.0] TRAP_M2MF 00320151 200e5f00 00000000 04000432
> [ 7358.494351] nouveau  [  PGRAPH][0000:02:00.0]  TRAP
> [ 7358.496265] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x001faf9000] subc 0 class 0x5039 mthd 0x0328 data 0x00000000
> [ 7358.498229] nouveau E[     PFB][0000:02:00.0] trapped write at 0x0000000000 on channel 0x0001fea0 PEEPHOLE/PFIFO_WRITE/00 reason: NULL_DMAOBJ
> [ 7358.500320] nouveau E[  PGRAPH][0000:02:00.0] TRAP_M2MF OUT
> [ 7358.502377] nouveau E[  PGRAPH][0000:02:00.0] TRAP_M2MF 00340241 203b0900 00000000 05000432
> [ 7358.504449] nouveau  [  PGRAPH][0000:02:00.0]  TRAP
> [ 7358.505976] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x001faf9000] subc 0 class 0x5039 mthd 0x0328 data 0x00000000
> [ 7361.483615] nouveau E[   15431] failed to idle channel 0xcccc0000
> xorg crashes

On another boot:
[  132.447094] nouveau E[    2776] failed to idle channel 0xcccc0000
[  160.136850] nouveau E[  PGRAPH][0000:02:00.0] TRAP_M2MF OUT
[  160.136940] nouveau E[  PGRAPH][0000:02:00.0] TRAP_M2MF 00340241 202fdb00 00000000 05000432
[  160.137024] nouveau  [  PGRAPH][0000:02:00.0]  TRAP
[  160.137100] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x001faf9000] subc 0 class 0x5039 mthd 0x0328 data 0x00000000
[  160.137208] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002001a020 on channel 0x0001faf9 SEMAPHORE_BG/PFIFO_READ/00 reason: PAGE_NOT_PRESENT
[  160.137388] nouveau E[  PGRAPH][0000:02:00.0] TRAP_M2MF IN
[  160.137468] nouveau E[  PGRAPH][0000:02:00.0] TRAP_M2MF 00320251 20308d00 00000000 04000000
[  160.137551] nouveau  [  PGRAPH][0000:02:00.0]  TRAP
[  160.137624] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x001faf9000] subc 0 class 0x5039 mthd 0x0328 data 0x00000000
[  163.126736] nouveau E[    2650] failed to idle channel 0xcccc0000
