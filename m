From: Kelly Doran <kel.p.doran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Fix for vblank on nvc0
Date: Sun, 11 Nov 2012 12:51:34 -0600
Message-ID: <CAES2CiZMtsZB6wcAerURtLnTY-F6U8CSrL6YGg0p0A+Zt+SbCQ@mail.gmail.com>
References: <CAES2CiZRdkaOwYUbtp28ZMKu+DqtPOoKRwHPpLWaF2WeB6F8+g@mail.gmail.com>
	<50995728.8080305@canonical.com> <20121111182617.GA15689@joi.lan>
	<20121111183519.GA2959@joi.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1315812813=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20121111183519.GA2959-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1315812813==
Content-Type: multipart/alternative; boundary=14dae9340883845c1304ce3cac22

--14dae9340883845c1304ce3cac22
Content-Type: text/plain; charset=ISO-8859-1

I was under the impression that the "else" block was only executed for nvc0
code, but maybe the nv92 code was executing it too, so that may need an
extra code block to work again.  Otherwise the bar flush in the nv50
section is causing the problems...  I can write up some patches later if
you want but I don't have any cards from these chipsets to test with, and I
gotta go for the afternoon.

On Sun, Nov 11, 2012 at 12:35 PM, Marcin Slusarz
<marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>wrote:

> On Sun, Nov 11, 2012 at 07:26:17PM +0100, Marcin Slusarz wrote:
> > On Tue, Nov 06, 2012 at 07:30:00PM +0100, Maarten Lankhorst wrote:
> > >
> > >
> > > Op 06-11-12 15:48, Kelly Doran schreef:
> > > > The vblank on nvc0 was not working correctly and would freeze X, I
> managed
> > > > to track it down and fix it with some help from m.b.lankhorst, see
> > > > https://bugs.freedesktop.org/show_bug.cgi?id=56692 for details.
> > > >
> > > Reviewed-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
> > >
> > > I recommended the bar flush since nvd0 does as well, and there might
> be a small race
> > > otherwise.
> > >
> > > Can this still get in before final 3.7 release?
> >
> > This patch breaks vblank here (nv92) completely.
> >
> > [ 6879.200427] Console: switching to colour VGA+ 80x25
> > [ 6879.202884] drm: unregistered panic notifier
> > [ 6879.334278] [TTM] Finalizing pool allocator
> > [ 6879.334518] [TTM] Finalizing DMA pool allocator
> > [ 6879.334765] [TTM] Zone  kernel: Used memory at exit: 0 kiB
> > [ 6879.335004] [TTM] Zone   dma32: Used memory at exit: 0 kiB
> > [ 6879.340472] [drm] Module unloaded
> > [ 6879.397744] [drm] Initialized drm 1.1.0 20060810
> > [ 6879.408149] nouveau  [  DEVICE][0000:02:00.0] BOOT0  : 0x092a00a2
> > [ 6879.408401] nouveau  [  DEVICE][0000:02:00.0] Chipset: G92 (NV92)
> > [ 6879.408641] nouveau  [  DEVICE][0000:02:00.0] Family : NV50
> > [ 6879.409752] nouveau  [   VBIOS][0000:02:00.0] checking PRAMIN for
> image...
> > [ 6879.409997] nouveau  [   VBIOS][0000:02:00.0] ... signature not found
> > [ 6879.410236] nouveau  [   VBIOS][0000:02:00.0] checking PROM for
> image...
> > [ 6879.549018] nouveau  [   VBIOS][0000:02:00.0] ... appears to be valid
> > [ 6879.549259] nouveau  [   VBIOS][0000:02:00.0] using image from PROM
> > [ 6879.549640] nouveau  [   VBIOS][0000:02:00.0] BIT signature found
> > [ 6879.549879] nouveau  [   VBIOS][0000:02:00.0] version 62.92.63.00
> > [ 6879.570275] nouveau  [     MXM][0000:02:00.0] no VBIOS data, nothing
> to do
> > [ 6879.572488] nouveau  [     PFB][0000:02:00.0] RAM type: GDDR3
> > [ 6879.572726] nouveau  [     PFB][0000:02:00.0] RAM size: 512 MiB
> > [ 6879.572964] nouveau  [     PFB][0000:02:00.0]    ZCOMP: 4032 tags
> > [ 6879.597652] [TTM] Zone  kernel: Available graphics memory: 3047140 kiB
> > [ 6879.597892] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
> > [ 6879.598130] [TTM] Initializing pool allocator
> > [ 6879.598367] [TTM] Initializing DMA pool allocator
> > [ 6879.602860] nouveau  [     DRM] VRAM: 512 MiB
> > [ 6879.603102] nouveau  [     DRM] GART: 512 MiB
> > [ 6879.603339] nouveau  [     DRM] BIT BIOS found
> > [ 6879.603575] nouveau  [     DRM] Bios version 62.92.63.00
> > [ 6879.603813] nouveau  [     DRM] TMDS table version 2.0
> > [ 6879.604050] nouveau  [     DRM] DCB version 4.0
> > [ 6879.604287] nouveau  [     DRM] DCB outp 00: 02000300 00000028
> > [ 6879.604524] nouveau  [     DRM] DCB outp 01: 01000302 00020030
> > [ 6879.604763] nouveau  [     DRM] DCB outp 02: 04011310 00000028
> > [ 6879.605000] nouveau  [     DRM] DCB outp 03: 02011312 00020030
> > [ 6879.605238] nouveau  [     DRM] DCB conn 00: 00001030
> > [ 6879.605516] nouveau  [     DRM] DCB conn 01: 00002130
> > [ 6879.648012] [drm] Supports vblank timestamp caching Rev 1
> (10.10.2010).
> > [ 6879.648257] [drm] No driver support for vblank timestamp query.
> > [ 6879.648708] nouveau  [     DRM] 1 available performance level(s)
> > [ 6879.648953] nouveau  [     DRM] 3: core 650MHz shader 1625MHz memory
> 1000MHz voltage 1050mV fanspeed 100%
> > [ 6879.649391] nouveau  [     DRM] c: core 399MHz shader 810MHz memory
> 399MHz voltage 1050mV fanspeed 34%
> > [ 6879.693947] nouveau  [     DRM] MM: using CRYPT for buffer copies
> > [ 6879.791680] nouveau  [     DRM] allocated 1920x1080 fb: 0x70000, bo
> ffff880018f20800
> > [ 6879.792175] fbcon: nouveaufb (fb0) is primary device
> > [ 6879.850216] Console: switching to colour frame buffer device 240x67
> > [ 6879.897075] fb0: nouveaufb frame buffer device
> > [ 6879.897075] drm: registered panic notifier
> > [ 6879.897078] [drm] Initialized nouveau 1.1.0 20120801 for 0000:02:00.0
> on minor 0
> > I'm starting glxgears here
> > xorg hangs, with occasional mouse movement
> > [ 6907.054696] nouveau  [   PFIFO][0000:02:00.0] unknown intr
> 0x00000040, ch 2
> > pkill glxgears from fbcon
> > [ 6963.987969] nouveau E[   15318] failed to idle channel 0xcccc0000
> > xorg still hangs
> > [ 7034.713069] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_2D - TP 0 -
> Unknown fault at address 0020060000
> > [ 7034.713167] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_2D - TP 0 -
> e0c: 00000000, e18: 00000000, e1c: 00000000, e20: 00000037, e24: 0c030000
> > [ 7034.713286] nouveau  [  PGRAPH][0000:02:00.0]  TRAP
> > [ 7034.713353] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x001faf9000]
> subc 2 class 0x502d mthd 0x060c data 0x0000000b
> > [ 7034.713454] nouveau E[     PFB][0000:02:00.0] trapped write at
> 0x0000000000 on channel 0x0001fea0 PEEPHOLE/PFIFO_WRITE/00 reason:
> NULL_DMAOBJ
> > [ 7034.713624] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP 0 -
> Unknown fault at address 0020060000
> > [ 7034.713713] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP 0 -
> e0c: 00000000, e18: 00000000, e1c: 00020000, e20: 00003b00, e24: 00030000
> > [ 7034.713834] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP 1 -
> Unknown fault at address 0020060000
> > [ 7034.713921] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP 1 -
> e0c: 00000000, e18: 00000000, e1c: 00020010, e20: 00003b00, e24: 00030000
> > [ 7034.714043] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP 2 -
> Unknown fault at address 0020060000
> > [ 7034.714141] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP 2 -
> e0c: 00000000, e18: 00000000, e1c: 00020020, e20: 00003b00, e24: 00030000
> > [ 7034.714259] nouveau  [  PGRAPH][0000:02:00.0]  TRAP
> > [ 7034.714325] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x001faf9000]
> subc 7 class 0x8297 mthd 0x15e0 data 0x00000000
> > [ 7034.714425] nouveau E[     PFB][0000:02:00.0] trapped read at
> 0x0020060100 on channel 0x0001faf9 PGRAPH/TEXTURE/00 reason:
> PAGE_NOT_PRESENT
> > [ 7034.714594] nouveau E[  PGRAPH][0000:02:00.0] magic set 0:
> > [ 7034.714650] nouveau E[  PGRAPH][0000:02:00.0]      0x00408904:
> 0x74087b05
> > [ 7034.714711] nouveau E[  PGRAPH][0000:02:00.0]      0x00408908:
> 0x00200601
> > [ 7034.714772] nouveau E[  PGRAPH][0000:02:00.0]      0x0040890c:
> 0x40000432
> > [ 7034.714832] nouveau E[  PGRAPH][0000:02:00.0]      0x00408910:
> 0x06000000
> > [ 7034.714893] nouveau  [  PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP0:
> Unhandled ustatus 0x00000003
> > [ 7034.714971] nouveau E[  PGRAPH][0000:02:00.0] magic set 1:
> > [ 7034.715026] nouveau E[  PGRAPH][0000:02:00.0]      0x00409904:
> 0x74087b05
> > [ 7034.715086] nouveau E[  PGRAPH][0000:02:00.0]      0x00409908:
> 0x00200601
> > [ 7034.715146] nouveau E[  PGRAPH][0000:02:00.0]      0x0040990c:
> 0x40000432
> > [ 7034.715207] nouveau E[  PGRAPH][0000:02:00.0]      0x00409910:
> 0x06000000
> > [ 7034.715266] nouveau  [  PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP1:
> Unhandled ustatus 0x00000003
> > [ 7034.715345] nouveau E[  PGRAPH][0000:02:00.0] magic set 2:
> > [ 7034.715399] nouveau E[  PGRAPH][0000:02:00.0]      0x0040a904:
> 0x74087b0a
> > [ 7034.715460] nouveau E[  PGRAPH][0000:02:00.0]      0x0040a908:
> 0x00200601
> > [ 7034.715520] nouveau E[  PGRAPH][0000:02:00.0]      0x0040a90c:
> 0x40000432
> > [ 7034.715581] nouveau E[  PGRAPH][0000:02:00.0]      0x0040a910:
> 0x06000000
> > [ 7034.715641] nouveau  [  PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP2:
> Unhandled ustatus 0x00000003
> > [ 7034.715720] nouveau E[  PGRAPH][0000:02:00.0] magic set 3:
> > [ 7034.715774] nouveau E[  PGRAPH][0000:02:00.0]      0x0040b904:
> 0x74087e05
> > [ 7034.715836] nouveau E[  PGRAPH][0000:02:00.0]      0x0040b908:
> 0x00200602
> > [ 7034.715896] nouveau E[  PGRAPH][0000:02:00.0]      0x0040b90c:
> 0x40000432
> > [ 7034.715956] nouveau E[  PGRAPH][0000:02:00.0]      0x0040b910:
> 0x06000000
> > [ 7034.716017] nouveau  [  PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP3:
> Unhandled ustatus 0x00000003
> > [ 7034.716098] nouveau  [  PGRAPH][0000:02:00.0]  TRAP
> > [ 7034.716163] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x001faf9000]
> subc 7 class 0x8297 mthd 0x15e0 data 0x00000000
> > [ 7034.716262] nouveau E[     PFB][0000:02:00.0] trapped read at
> 0x0020158000 on channel 0x0001faf9 PGRAPH/DISPATCH/M2M_IN reason:
> PAGE_NOT_PRESENT
> > [ 7034.716422] nouveau E[  PGRAPH][0000:02:00.0] TRAP_M2MF IN
> > [ 7034.716497] nouveau E[  PGRAPH][0000:02:00.0] TRAP_M2MF 00320151
> 20156f00 00000000 04000432
> > [ 7034.716572] nouveau  [  PGRAPH][0000:02:00.0]  TRAP
> > [ 7034.716638] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x001faf9000]
> subc 0 class 0x5039 mthd 0x0328 data 0x00000000
> > [ 7034.716736] nouveau E[     PFB][0000:02:00.0] trapped read at
> 0x00200fc000 on channel 0x0001faf9 PGRAPH/TEXTURE/00 reason:
> PAGE_NOT_PRESENT
> > [ 7034.716901] nouveau E[  PGRAPH][0000:02:00.0] magic set 0:
> > [ 7034.716956] nouveau E[  PGRAPH][0000:02:00.0]      0x00408904:
> 0x20087a01
> > [ 7034.717017] nouveau E[  PGRAPH][0000:02:00.0]      0x00408908:
> 0x00200fc0
> > [ 7034.717077] nouveau E[  PGRAPH][0000:02:00.0]      0x0040890c:
> 0x80000432
> > [ 7034.717138] nouveau E[  PGRAPH][0000:02:00.0]      0x00408910:
> 0x0fc00000
> > [ 7034.717198] nouveau  [  PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP0:
> Unhandled ustatus 0x00000003
> > [ 7034.717291] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_2D - TP 0 -
> Unknown fault at address 0020104000
> > [ 7034.717377] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_2D - TP 0 -
> e0c: 00000000, e18: 00000000, e1c: 000000c0, e20: 00000011, e24: 0c030000
> > [ 7034.717495] nouveau  [  PGRAPH][0000:02:00.0]  TRAP
> > [ 7034.717560] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x001faf9000]
> subc 2 class 0x502d mthd 0x08dc data 0x00000000
> > [ 7034.717659] nouveau E[     PFB][0000:02:00.0] trapped write at
> 0x0020060000 on channel 0x0001faf9 PGRAPH/PROP/DST2D reason:
> PAGE_NOT_PRESENT
> > [ 7034.717828] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_2D - TP 0 -
> Unknown fault at address 0020060000
> > [ 7034.717916] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_2D - TP 0 -
> e0c: 00000000, e18: 00000000, e1c: 00000000, e20: 00000037, e24: 0c030000
> > [ 7034.718034] nouveau  [  PGRAPH][0000:02:00.0]  TRAP
> > [ 7034.718099] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x001faf9000]
> subc 2 class 0x502d mthd 0x060c data 0x0000000b
> > [ 7034.718197] nouveau E[     PFB][0000:02:00.0] trapped write at
> 0x0020060000 on channel 0x0001faf9 PGRAPH/PROP/RT0 reason: PAGE_NOT_PRESENT
> > [ 7034.718366] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP 0 -
> Unknown fault at address 0020060000
> > [ 7034.718454] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP 0 -
> e0c: 00000000, e18: 00000000, e1c: 00020000, e20: 00003b00, e24: 00030000
> > [ 7034.718574] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP 1 -
> Unknown fault at address 0020060000
> > [ 7034.718660] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP 1 -
> e0c: 00000000, e18: 00000000, e1c: 00020010, e20: 00003b00, e24: 00030000
> > [ 7034.718780] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP 2 -
> Unknown fault at address 0020060000
> > [ 7034.722082] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP 2 -
> e0c: 00000000, e18: 00000000, e1c: 00020020, e20: 00003b00, e24: 00030000
> > [ 7034.725066] nouveau  [  PGRAPH][0000:02:00.0]  TRAP
> > [ 7034.725069] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x001faf9000]
> subc 7 class 0x8297 mthd 0x15e0 data 0x00000000
> > [ 7034.725104] nouveau E[  PGRAPH][0000:02:00.0] magic set 0:
> > [ 7034.725106] nouveau E[  PGRAPH][0000:02:00.0]      0x00408904:
> 0x74084105
> > [ 7034.725108] nouveau E[  PGRAPH][0000:02:00.0]      0x00408908:
> 0x00200601
> > [ 7034.725109] nouveau E[  PGRAPH][0000:02:00.0]      0x0040890c:
> 0x40000432
> > [ 7034.725111] nouveau E[  PGRAPH][0000:02:00.0]      0x00408910:
> 0x06000000
> > [ 7034.725113] nouveau  [  PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP0:
> Unhandled ustatus 0x00000003
> > [ 7034.725115] nouveau E[  PGRAPH][0000:02:00.0] magic set 1:
> > [ 7034.725116] nouveau E[  PGRAPH][0000:02:00.0]      0x00409904:
> 0x74087605
> > [ 7034.725118] nouveau E[  PGRAPH][0000:02:00.0]      0x00409908:
> 0x00200601
> > [ 7034.725120] nouveau E[  PGRAPH][0000:02:00.0]      0x0040990c:
> 0x40000432
> > [ 7034.725122] nouveau E[  PGRAPH][0000:02:00.0]      0x00409910:
> 0x06000000
> > [ 7034.725124] nouveau  [  PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP1:
> Unhandled ustatus 0x00000003
> > [ 7034.725125] nouveau E[  PGRAPH][0000:02:00.0] magic set 2:
> > [ 7034.725127] nouveau E[  PGRAPH][0000:02:00.0]      0x0040a904:
> 0x7408740a
> > [ 7034.725129] nouveau E[  PGRAPH][0000:02:00.0]      0x0040a908:
> 0x00200601
> > [ 7034.725131] nouveau E[  PGRAPH][0000:02:00.0]      0x0040a90c:
> 0x40000432
> > [ 7034.725132] nouveau E[  PGRAPH][0000:02:00.0]      0x0040a910:
> 0x06000000
> > [ 7034.725134] nouveau  [  PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP2:
> Unhandled ustatus 0x00000003
> > [ 7034.725136] nouveau E[  PGRAPH][0000:02:00.0] magic set 3:
> > [ 7034.725138] nouveau E[  PGRAPH][0000:02:00.0]      0x0040b904:
> 0x74087b05
> > [ 7034.725140] nouveau E[  PGRAPH][0000:02:00.0]      0x0040b908:
> 0x00200600
> > [ 7034.725142] nouveau E[  PGRAPH][0000:02:00.0]      0x0040b90c:
> 0x40000432
> > [ 7034.725144] nouveau E[  PGRAPH][0000:02:00.0]      0x0040b910:
> 0x06000000
> > [ 7034.725145] nouveau  [  PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP3:
> Unhandled ustatus 0x00000003
> > [ 7034.725151] nouveau  [  PGRAPH][0000:02:00.0]  TRAP
> > [ 7034.725153] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x001faf9000]
> subc 7 class 0x8297 mthd 0x15e0 data 0x00000000
> > [ 7034.725167] nouveau E[     PFB][0000:02:00.0] trapped read at
> 0x0020060100 on channel 0x0001faf9 PGRAPH/TEXTURE/00 reason:
> PAGE_NOT_PRESENT
> > [ 7034.725177] nouveau E[  PGRAPH][0000:02:00.0] TRAP_M2MF IN
> > [ 7034.725182] nouveau E[  PGRAPH][0000:02:00.0] TRAP_M2MF 00320151
> 20103240 00000000 04000432
> > [ 7034.725184] nouveau  [  PGRAPH][0000:02:00.0]  TRAP
> > [ 7034.725186] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x001faf9000]
> subc 0 class 0x5039 mthd 0x0328 data 0x00000000
> > [ 7034.726101] nouveau E[  PGRAPH][0000:02:00.0] magic set 0:
> > [ 7034.726103] nouveau E[  PGRAPH][0000:02:00.0]      0x00408904:
> 0x20087f01
> > [ 7034.726105] nouveau E[  PGRAPH][0000:02:00.0]      0x00408908:
> 0x00200fc0
> > [ 7034.726107] nouveau E[  PGRAPH][0000:02:00.0]      0x0040890c:
> 0x80000432
> > [ 7034.726110] nouveau E[  PGRAPH][0000:02:00.0]      0x00408910:
> 0x0fc00000
> > [ 7034.726111] nouveau  [  PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP0:
> Unhandled ustatus 0x00000003
> > [ 7034.726130] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_2D - TP 0 -
> Unknown fault at address 0020159000
> > [ 7034.726132] nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA_2D - TP 0 -
> e0c: 00000000, e18: 00000000, e1c: 00000000, e20: 00000011, e24: 0c030000
> > [ 7034.726140] nouveau  [  PGRAPH][0000:02:00.0]  TRAP
> > [ 7034.726142] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x001faf9000]
> subc 2 class 0x502d mthd 0x08dc data 0x00000000
> > [ 7034.726153] nouveau E[     PFB][0000:02:00.0] trapped write at
> 0x0020159000 on channel 0x0001faf9 PGRAPH/PROP/DST2D reason:
> PAGE_NOT_PRESENT
> > [ 7037.703052] nouveau E[   15220] failed to idle channel 0xcccc0000
> > xorg crashes
> >
> > another try:
> > glxgears
> > xorg hangs
> > [ 7220.463528] nouveau  [   PFIFO][0000:02:00.0] unknown intr
> 0x00000040, ch 2
> > pkill glxgears from fbcon
> > [ 7286.269036] nouveau E[   15542] failed to idle channel 0xcccc0000
> > xorg still hangs
> > [ 7358.490445] nouveau E[  PGRAPH][0000:02:00.0] TRAP_M2MF IN
> > [ 7358.492458] nouveau E[  PGRAPH][0000:02:00.0] TRAP_M2MF 00320151
> 200e5f00 00000000 04000432
> > [ 7358.494351] nouveau  [  PGRAPH][0000:02:00.0]  TRAP
> > [ 7358.496265] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x001faf9000]
> subc 0 class 0x5039 mthd 0x0328 data 0x00000000
> > [ 7358.498229] nouveau E[     PFB][0000:02:00.0] trapped write at
> 0x0000000000 on channel 0x0001fea0 PEEPHOLE/PFIFO_WRITE/00 reason:
> NULL_DMAOBJ
> > [ 7358.500320] nouveau E[  PGRAPH][0000:02:00.0] TRAP_M2MF OUT
> > [ 7358.502377] nouveau E[  PGRAPH][0000:02:00.0] TRAP_M2MF 00340241
> 203b0900 00000000 05000432
> > [ 7358.504449] nouveau  [  PGRAPH][0000:02:00.0]  TRAP
> > [ 7358.505976] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x001faf9000]
> subc 0 class 0x5039 mthd 0x0328 data 0x00000000
> > [ 7361.483615] nouveau E[   15431] failed to idle channel 0xcccc0000
> > xorg crashes
>
> On another boot:
> [  132.447094] nouveau E[    2776] failed to idle channel 0xcccc0000
> [  160.136850] nouveau E[  PGRAPH][0000:02:00.0] TRAP_M2MF OUT
> [  160.136940] nouveau E[  PGRAPH][0000:02:00.0] TRAP_M2MF 00340241
> 202fdb00 00000000 05000432
> [  160.137024] nouveau  [  PGRAPH][0000:02:00.0]  TRAP
> [  160.137100] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x001faf9000] subc
> 0 class 0x5039 mthd 0x0328 data 0x00000000
> [  160.137208] nouveau E[     PFB][0000:02:00.0] trapped read at
> 0x002001a020 on channel 0x0001faf9 SEMAPHORE_BG/PFIFO_READ/00 reason:
> PAGE_NOT_PRESENT
> [  160.137388] nouveau E[  PGRAPH][0000:02:00.0] TRAP_M2MF IN
> [  160.137468] nouveau E[  PGRAPH][0000:02:00.0] TRAP_M2MF 00320251
> 20308d00 00000000 04000000
> [  160.137551] nouveau  [  PGRAPH][0000:02:00.0]  TRAP
> [  160.137624] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x001faf9000] subc
> 0 class 0x5039 mthd 0x0328 data 0x00000000
> [  163.126736] nouveau E[    2650] failed to idle channel 0xcccc0000
>

--14dae9340883845c1304ce3cac22
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I was under the impression that the &quot;else&quot; block was only execute=
d for nvc0 code, but maybe the nv92 code was executing it too, so that may =
need an extra code block to work again. =A0Otherwise the bar flush in the n=
v50 section is causing the problems... =A0I can write up some patches later=
 if you want but I don&#39;t have any cards from these chipsets to test wit=
h, and I gotta go for the afternoon.<br>
<br><div class=3D"gmail_quote">On Sun, Nov 11, 2012 at 12:35 PM, Marcin Slu=
sarz <span dir=3D"ltr">&lt;<a href=3D"mailto:marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" targ=
et=3D"_blank">marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span> wrote:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">On Sun, Nov 11, 2012 at 07:26:17PM =
+0100, Marcin Slusarz wrote:<br>
&gt; On Tue, Nov 06, 2012 at 07:30:00PM +0100, Maarten Lankhorst wrote:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Op 06-11-12 15:48, Kelly Doran schreef:<br>
&gt; &gt; &gt; The vblank on nvc0 was not working correctly and would freez=
e X, I managed<br>
&gt; &gt; &gt; to track it down and fix it with some help from m.b.lankhors=
t, see<br>
&gt; &gt; &gt; <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D56=
692" target=3D"_blank">https://bugs.freedesktop.org/show_bug.cgi?id=3D56692=
</a> for details.<br>
&gt; &gt; &gt;<br>
&gt; &gt; Reviewed-by: Maarten Lankhorst &lt;<a href=3D"mailto:maarten.lank=
horst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org">maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; I recommended the bar flush since nvd0 does as well, and there mi=
ght be a small race<br>
&gt; &gt; otherwise.<br>
&gt; &gt;<br>
&gt; &gt; Can this still get in before final 3.7 release?<br>
&gt;<br>
&gt; This patch breaks vblank here (nv92) completely.<br>
&gt;<br>
&gt; [ 6879.200427] Console: switching to colour VGA+ 80x25<br>
&gt; [ 6879.202884] drm: unregistered panic notifier<br>
&gt; [ 6879.334278] [TTM] Finalizing pool allocator<br>
&gt; [ 6879.334518] [TTM] Finalizing DMA pool allocator<br>
&gt; [ 6879.334765] [TTM] Zone =A0kernel: Used memory at exit: 0 kiB<br>
&gt; [ 6879.335004] [TTM] Zone =A0 dma32: Used memory at exit: 0 kiB<br>
&gt; [ 6879.340472] [drm] Module unloaded<br>
&gt; [ 6879.397744] [drm] Initialized drm 1.1.0 20060810<br>
&gt; [ 6879.408149] nouveau =A0[ =A0DEVICE][0000:02:00.0] BOOT0 =A0: 0x092a=
00a2<br>
&gt; [ 6879.408401] nouveau =A0[ =A0DEVICE][0000:02:00.0] Chipset: G92 (NV9=
2)<br>
&gt; [ 6879.408641] nouveau =A0[ =A0DEVICE][0000:02:00.0] Family : NV50<br>
&gt; [ 6879.409752] nouveau =A0[ =A0 VBIOS][0000:02:00.0] checking PRAMIN f=
or image...<br>
&gt; [ 6879.409997] nouveau =A0[ =A0 VBIOS][0000:02:00.0] ... signature not=
 found<br>
&gt; [ 6879.410236] nouveau =A0[ =A0 VBIOS][0000:02:00.0] checking PROM for=
 image...<br>
&gt; [ 6879.549018] nouveau =A0[ =A0 VBIOS][0000:02:00.0] ... appears to be=
 valid<br>
&gt; [ 6879.549259] nouveau =A0[ =A0 VBIOS][0000:02:00.0] using image from =
PROM<br>
&gt; [ 6879.549640] nouveau =A0[ =A0 VBIOS][0000:02:00.0] BIT signature fou=
nd<br>
&gt; [ 6879.549879] nouveau =A0[ =A0 VBIOS][0000:02:00.0] version 62.92.63.=
00<br>
&gt; [ 6879.570275] nouveau =A0[ =A0 =A0 MXM][0000:02:00.0] no VBIOS data, =
nothing to do<br>
&gt; [ 6879.572488] nouveau =A0[ =A0 =A0 PFB][0000:02:00.0] RAM type: GDDR3=
<br>
&gt; [ 6879.572726] nouveau =A0[ =A0 =A0 PFB][0000:02:00.0] RAM size: 512 M=
iB<br>
&gt; [ 6879.572964] nouveau =A0[ =A0 =A0 PFB][0000:02:00.0] =A0 =A0ZCOMP: 4=
032 tags<br>
&gt; [ 6879.597652] [TTM] Zone =A0kernel: Available graphics memory: 304714=
0 kiB<br>
&gt; [ 6879.597892] [TTM] Zone =A0 dma32: Available graphics memory: 209715=
2 kiB<br>
&gt; [ 6879.598130] [TTM] Initializing pool allocator<br>
&gt; [ 6879.598367] [TTM] Initializing DMA pool allocator<br>
&gt; [ 6879.602860] nouveau =A0[ =A0 =A0 DRM] VRAM: 512 MiB<br>
&gt; [ 6879.603102] nouveau =A0[ =A0 =A0 DRM] GART: 512 MiB<br>
&gt; [ 6879.603339] nouveau =A0[ =A0 =A0 DRM] BIT BIOS found<br>
&gt; [ 6879.603575] nouveau =A0[ =A0 =A0 DRM] Bios version 62.92.63.00<br>
&gt; [ 6879.603813] nouveau =A0[ =A0 =A0 DRM] TMDS table version 2.0<br>
&gt; [ 6879.604050] nouveau =A0[ =A0 =A0 DRM] DCB version 4.0<br>
&gt; [ 6879.604287] nouveau =A0[ =A0 =A0 DRM] DCB outp 00: 02000300 0000002=
8<br>
&gt; [ 6879.604524] nouveau =A0[ =A0 =A0 DRM] DCB outp 01: 01000302 0002003=
0<br>
&gt; [ 6879.604763] nouveau =A0[ =A0 =A0 DRM] DCB outp 02: 04011310 0000002=
8<br>
&gt; [ 6879.605000] nouveau =A0[ =A0 =A0 DRM] DCB outp 03: 02011312 0002003=
0<br>
&gt; [ 6879.605238] nouveau =A0[ =A0 =A0 DRM] DCB conn 00: 00001030<br>
&gt; [ 6879.605516] nouveau =A0[ =A0 =A0 DRM] DCB conn 01: 00002130<br>
&gt; [ 6879.648012] [drm] Supports vblank timestamp caching Rev 1 (10.10.20=
10).<br>
&gt; [ 6879.648257] [drm] No driver support for vblank timestamp query.<br>
&gt; [ 6879.648708] nouveau =A0[ =A0 =A0 DRM] 1 available performance level=
(s)<br>
&gt; [ 6879.648953] nouveau =A0[ =A0 =A0 DRM] 3: core 650MHz shader 1625MHz=
 memory 1000MHz voltage 1050mV fanspeed 100%<br>
&gt; [ 6879.649391] nouveau =A0[ =A0 =A0 DRM] c: core 399MHz shader 810MHz =
memory 399MHz voltage 1050mV fanspeed 34%<br>
&gt; [ 6879.693947] nouveau =A0[ =A0 =A0 DRM] MM: using CRYPT for buffer co=
pies<br>
&gt; [ 6879.791680] nouveau =A0[ =A0 =A0 DRM] allocated 1920x1080 fb: 0x700=
00, bo ffff880018f20800<br>
&gt; [ 6879.792175] fbcon: nouveaufb (fb0) is primary device<br>
&gt; [ 6879.850216] Console: switching to colour frame buffer device 240x67=
<br>
&gt; [ 6879.897075] fb0: nouveaufb frame buffer device<br>
&gt; [ 6879.897075] drm: registered panic notifier<br>
&gt; [ 6879.897078] [drm] Initialized nouveau 1.1.0 20120801 for 0000:02:00=
.0 on minor 0<br>
&gt; I&#39;m starting glxgears here<br>
&gt; xorg hangs, with occasional mouse movement<br>
&gt; [ 6907.054696] nouveau =A0[ =A0 PFIFO][0000:02:00.0] unknown intr 0x00=
000040, ch 2<br>
&gt; pkill glxgears from fbcon<br>
&gt; [ 6963.987969] nouveau E[ =A0 15318] failed to idle channel 0xcccc0000=
<br>
&gt; xorg still hangs<br>
&gt; [ 7034.713069] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_TPDMA_2D - TP =
0 - Unknown fault at address 0020060000<br>
&gt; [ 7034.713167] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_TPDMA_2D - TP =
0 - e0c: 00000000, e18: 00000000, e1c: 00000000, e20: 00000037, e24: 0c0300=
00<br>
&gt; [ 7034.713286] nouveau =A0[ =A0PGRAPH][0000:02:00.0] =A0TRAP<br>
&gt; [ 7034.713353] nouveau E[ =A0PGRAPH][0000:02:00.0] ch 2 [0x001faf9000]=
 subc 2 class 0x502d mthd 0x060c data 0x0000000b<br>
&gt; [ 7034.713454] nouveau E[ =A0 =A0 PFB][0000:02:00.0] trapped write at =
0x0000000000 on channel 0x0001fea0 PEEPHOLE/PFIFO_WRITE/00 reason: NULL_DMA=
OBJ<br>
&gt; [ 7034.713624] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP =
0 - Unknown fault at address 0020060000<br>
&gt; [ 7034.713713] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP =
0 - e0c: 00000000, e18: 00000000, e1c: 00020000, e20: 00003b00, e24: 000300=
00<br>
&gt; [ 7034.713834] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP =
1 - Unknown fault at address 0020060000<br>
&gt; [ 7034.713921] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP =
1 - e0c: 00000000, e18: 00000000, e1c: 00020010, e20: 00003b00, e24: 000300=
00<br>
&gt; [ 7034.714043] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP =
2 - Unknown fault at address 0020060000<br>
&gt; [ 7034.714141] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP =
2 - e0c: 00000000, e18: 00000000, e1c: 00020020, e20: 00003b00, e24: 000300=
00<br>
&gt; [ 7034.714259] nouveau =A0[ =A0PGRAPH][0000:02:00.0] =A0TRAP<br>
&gt; [ 7034.714325] nouveau E[ =A0PGRAPH][0000:02:00.0] ch 2 [0x001faf9000]=
 subc 7 class 0x8297 mthd 0x15e0 data 0x00000000<br>
&gt; [ 7034.714425] nouveau E[ =A0 =A0 PFB][0000:02:00.0] trapped read at 0=
x0020060100 on channel 0x0001faf9 PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESEN=
T<br>
&gt; [ 7034.714594] nouveau E[ =A0PGRAPH][0000:02:00.0] magic set 0:<br>
&gt; [ 7034.714650] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x004089=
04: 0x74087b05<br>
&gt; [ 7034.714711] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x004089=
08: 0x00200601<br>
&gt; [ 7034.714772] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x004089=
0c: 0x40000432<br>
&gt; [ 7034.714832] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x004089=
10: 0x06000000<br>
&gt; [ 7034.714893] nouveau =A0[ =A0PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP=
0: Unhandled ustatus 0x00000003<br>
&gt; [ 7034.714971] nouveau E[ =A0PGRAPH][0000:02:00.0] magic set 1:<br>
&gt; [ 7034.715026] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x004099=
04: 0x74087b05<br>
&gt; [ 7034.715086] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x004099=
08: 0x00200601<br>
&gt; [ 7034.715146] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x004099=
0c: 0x40000432<br>
&gt; [ 7034.715207] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x004099=
10: 0x06000000<br>
&gt; [ 7034.715266] nouveau =A0[ =A0PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP=
1: Unhandled ustatus 0x00000003<br>
&gt; [ 7034.715345] nouveau E[ =A0PGRAPH][0000:02:00.0] magic set 2:<br>
&gt; [ 7034.715399] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x0040a9=
04: 0x74087b0a<br>
&gt; [ 7034.715460] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x0040a9=
08: 0x00200601<br>
&gt; [ 7034.715520] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x0040a9=
0c: 0x40000432<br>
&gt; [ 7034.715581] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x0040a9=
10: 0x06000000<br>
&gt; [ 7034.715641] nouveau =A0[ =A0PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP=
2: Unhandled ustatus 0x00000003<br>
&gt; [ 7034.715720] nouveau E[ =A0PGRAPH][0000:02:00.0] magic set 3:<br>
&gt; [ 7034.715774] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x0040b9=
04: 0x74087e05<br>
&gt; [ 7034.715836] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x0040b9=
08: 0x00200602<br>
&gt; [ 7034.715896] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x0040b9=
0c: 0x40000432<br>
&gt; [ 7034.715956] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x0040b9=
10: 0x06000000<br>
&gt; [ 7034.716017] nouveau =A0[ =A0PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP=
3: Unhandled ustatus 0x00000003<br>
&gt; [ 7034.716098] nouveau =A0[ =A0PGRAPH][0000:02:00.0] =A0TRAP<br>
&gt; [ 7034.716163] nouveau E[ =A0PGRAPH][0000:02:00.0] ch 2 [0x001faf9000]=
 subc 7 class 0x8297 mthd 0x15e0 data 0x00000000<br>
&gt; [ 7034.716262] nouveau E[ =A0 =A0 PFB][0000:02:00.0] trapped read at 0=
x0020158000 on channel 0x0001faf9 PGRAPH/DISPATCH/M2M_IN reason: PAGE_NOT_P=
RESENT<br>
&gt; [ 7034.716422] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_M2MF IN<br>
&gt; [ 7034.716497] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_M2MF 00320151 =
20156f00 00000000 04000432<br>
&gt; [ 7034.716572] nouveau =A0[ =A0PGRAPH][0000:02:00.0] =A0TRAP<br>
&gt; [ 7034.716638] nouveau E[ =A0PGRAPH][0000:02:00.0] ch 2 [0x001faf9000]=
 subc 0 class 0x5039 mthd 0x0328 data 0x00000000<br>
&gt; [ 7034.716736] nouveau E[ =A0 =A0 PFB][0000:02:00.0] trapped read at 0=
x00200fc000 on channel 0x0001faf9 PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESEN=
T<br>
&gt; [ 7034.716901] nouveau E[ =A0PGRAPH][0000:02:00.0] magic set 0:<br>
&gt; [ 7034.716956] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x004089=
04: 0x20087a01<br>
&gt; [ 7034.717017] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x004089=
08: 0x00200fc0<br>
&gt; [ 7034.717077] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x004089=
0c: 0x80000432<br>
&gt; [ 7034.717138] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x004089=
10: 0x0fc00000<br>
&gt; [ 7034.717198] nouveau =A0[ =A0PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP=
0: Unhandled ustatus 0x00000003<br>
&gt; [ 7034.717291] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_TPDMA_2D - TP =
0 - Unknown fault at address 0020104000<br>
&gt; [ 7034.717377] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_TPDMA_2D - TP =
0 - e0c: 00000000, e18: 00000000, e1c: 000000c0, e20: 00000011, e24: 0c0300=
00<br>
&gt; [ 7034.717495] nouveau =A0[ =A0PGRAPH][0000:02:00.0] =A0TRAP<br>
&gt; [ 7034.717560] nouveau E[ =A0PGRAPH][0000:02:00.0] ch 2 [0x001faf9000]=
 subc 2 class 0x502d mthd 0x08dc data 0x00000000<br>
&gt; [ 7034.717659] nouveau E[ =A0 =A0 PFB][0000:02:00.0] trapped write at =
0x0020060000 on channel 0x0001faf9 PGRAPH/PROP/DST2D reason: PAGE_NOT_PRESE=
NT<br>
&gt; [ 7034.717828] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_TPDMA_2D - TP =
0 - Unknown fault at address 0020060000<br>
&gt; [ 7034.717916] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_TPDMA_2D - TP =
0 - e0c: 00000000, e18: 00000000, e1c: 00000000, e20: 00000037, e24: 0c0300=
00<br>
&gt; [ 7034.718034] nouveau =A0[ =A0PGRAPH][0000:02:00.0] =A0TRAP<br>
&gt; [ 7034.718099] nouveau E[ =A0PGRAPH][0000:02:00.0] ch 2 [0x001faf9000]=
 subc 2 class 0x502d mthd 0x060c data 0x0000000b<br>
&gt; [ 7034.718197] nouveau E[ =A0 =A0 PFB][0000:02:00.0] trapped write at =
0x0020060000 on channel 0x0001faf9 PGRAPH/PROP/RT0 reason: PAGE_NOT_PRESENT=
<br>
&gt; [ 7034.718366] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP =
0 - Unknown fault at address 0020060000<br>
&gt; [ 7034.718454] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP =
0 - e0c: 00000000, e18: 00000000, e1c: 00020000, e20: 00003b00, e24: 000300=
00<br>
&gt; [ 7034.718574] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP =
1 - Unknown fault at address 0020060000<br>
&gt; [ 7034.718660] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP =
1 - e0c: 00000000, e18: 00000000, e1c: 00020010, e20: 00003b00, e24: 000300=
00<br>
&gt; [ 7034.718780] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP =
2 - Unknown fault at address 0020060000<br>
&gt; [ 7034.722082] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_TPDMA_RT - TP =
2 - e0c: 00000000, e18: 00000000, e1c: 00020020, e20: 00003b00, e24: 000300=
00<br>
&gt; [ 7034.725066] nouveau =A0[ =A0PGRAPH][0000:02:00.0] =A0TRAP<br>
&gt; [ 7034.725069] nouveau E[ =A0PGRAPH][0000:02:00.0] ch 2 [0x001faf9000]=
 subc 7 class 0x8297 mthd 0x15e0 data 0x00000000<br>
&gt; [ 7034.725104] nouveau E[ =A0PGRAPH][0000:02:00.0] magic set 0:<br>
&gt; [ 7034.725106] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x004089=
04: 0x74084105<br>
&gt; [ 7034.725108] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x004089=
08: 0x00200601<br>
&gt; [ 7034.725109] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x004089=
0c: 0x40000432<br>
&gt; [ 7034.725111] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x004089=
10: 0x06000000<br>
&gt; [ 7034.725113] nouveau =A0[ =A0PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP=
0: Unhandled ustatus 0x00000003<br>
&gt; [ 7034.725115] nouveau E[ =A0PGRAPH][0000:02:00.0] magic set 1:<br>
&gt; [ 7034.725116] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x004099=
04: 0x74087605<br>
&gt; [ 7034.725118] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x004099=
08: 0x00200601<br>
&gt; [ 7034.725120] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x004099=
0c: 0x40000432<br>
&gt; [ 7034.725122] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x004099=
10: 0x06000000<br>
&gt; [ 7034.725124] nouveau =A0[ =A0PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP=
1: Unhandled ustatus 0x00000003<br>
&gt; [ 7034.725125] nouveau E[ =A0PGRAPH][0000:02:00.0] magic set 2:<br>
&gt; [ 7034.725127] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x0040a9=
04: 0x7408740a<br>
&gt; [ 7034.725129] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x0040a9=
08: 0x00200601<br>
&gt; [ 7034.725131] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x0040a9=
0c: 0x40000432<br>
&gt; [ 7034.725132] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x0040a9=
10: 0x06000000<br>
&gt; [ 7034.725134] nouveau =A0[ =A0PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP=
2: Unhandled ustatus 0x00000003<br>
&gt; [ 7034.725136] nouveau E[ =A0PGRAPH][0000:02:00.0] magic set 3:<br>
&gt; [ 7034.725138] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x0040b9=
04: 0x74087b05<br>
&gt; [ 7034.725140] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x0040b9=
08: 0x00200600<br>
&gt; [ 7034.725142] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x0040b9=
0c: 0x40000432<br>
&gt; [ 7034.725144] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x0040b9=
10: 0x06000000<br>
&gt; [ 7034.725145] nouveau =A0[ =A0PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP=
3: Unhandled ustatus 0x00000003<br>
&gt; [ 7034.725151] nouveau =A0[ =A0PGRAPH][0000:02:00.0] =A0TRAP<br>
&gt; [ 7034.725153] nouveau E[ =A0PGRAPH][0000:02:00.0] ch 2 [0x001faf9000]=
 subc 7 class 0x8297 mthd 0x15e0 data 0x00000000<br>
&gt; [ 7034.725167] nouveau E[ =A0 =A0 PFB][0000:02:00.0] trapped read at 0=
x0020060100 on channel 0x0001faf9 PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESEN=
T<br>
&gt; [ 7034.725177] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_M2MF IN<br>
&gt; [ 7034.725182] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_M2MF 00320151 =
20103240 00000000 04000432<br>
&gt; [ 7034.725184] nouveau =A0[ =A0PGRAPH][0000:02:00.0] =A0TRAP<br>
&gt; [ 7034.725186] nouveau E[ =A0PGRAPH][0000:02:00.0] ch 2 [0x001faf9000]=
 subc 0 class 0x5039 mthd 0x0328 data 0x00000000<br>
&gt; [ 7034.726101] nouveau E[ =A0PGRAPH][0000:02:00.0] magic set 0:<br>
&gt; [ 7034.726103] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x004089=
04: 0x20087f01<br>
&gt; [ 7034.726105] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x004089=
08: 0x00200fc0<br>
&gt; [ 7034.726107] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x004089=
0c: 0x80000432<br>
&gt; [ 7034.726110] nouveau E[ =A0PGRAPH][0000:02:00.0] =A0 =A0 =A00x004089=
10: 0x0fc00000<br>
&gt; [ 7034.726111] nouveau =A0[ =A0PGRAPH][0000:02:00.0] TRAP_TEXTURE - TP=
0: Unhandled ustatus 0x00000003<br>
&gt; [ 7034.726130] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_TPDMA_2D - TP =
0 - Unknown fault at address 0020159000<br>
&gt; [ 7034.726132] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_TPDMA_2D - TP =
0 - e0c: 00000000, e18: 00000000, e1c: 00000000, e20: 00000011, e24: 0c0300=
00<br>
&gt; [ 7034.726140] nouveau =A0[ =A0PGRAPH][0000:02:00.0] =A0TRAP<br>
&gt; [ 7034.726142] nouveau E[ =A0PGRAPH][0000:02:00.0] ch 2 [0x001faf9000]=
 subc 2 class 0x502d mthd 0x08dc data 0x00000000<br>
&gt; [ 7034.726153] nouveau E[ =A0 =A0 PFB][0000:02:00.0] trapped write at =
0x0020159000 on channel 0x0001faf9 PGRAPH/PROP/DST2D reason: PAGE_NOT_PRESE=
NT<br>
&gt; [ 7037.703052] nouveau E[ =A0 15220] failed to idle channel 0xcccc0000=
<br>
&gt; xorg crashes<br>
&gt;<br>
&gt; another try:<br>
&gt; glxgears<br>
&gt; xorg hangs<br>
&gt; [ 7220.463528] nouveau =A0[ =A0 PFIFO][0000:02:00.0] unknown intr 0x00=
000040, ch 2<br>
&gt; pkill glxgears from fbcon<br>
&gt; [ 7286.269036] nouveau E[ =A0 15542] failed to idle channel 0xcccc0000=
<br>
&gt; xorg still hangs<br>
&gt; [ 7358.490445] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_M2MF IN<br>
&gt; [ 7358.492458] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_M2MF 00320151 =
200e5f00 00000000 04000432<br>
&gt; [ 7358.494351] nouveau =A0[ =A0PGRAPH][0000:02:00.0] =A0TRAP<br>
&gt; [ 7358.496265] nouveau E[ =A0PGRAPH][0000:02:00.0] ch 2 [0x001faf9000]=
 subc 0 class 0x5039 mthd 0x0328 data 0x00000000<br>
&gt; [ 7358.498229] nouveau E[ =A0 =A0 PFB][0000:02:00.0] trapped write at =
0x0000000000 on channel 0x0001fea0 PEEPHOLE/PFIFO_WRITE/00 reason: NULL_DMA=
OBJ<br>
&gt; [ 7358.500320] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_M2MF OUT<br>
&gt; [ 7358.502377] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_M2MF 00340241 =
203b0900 00000000 05000432<br>
&gt; [ 7358.504449] nouveau =A0[ =A0PGRAPH][0000:02:00.0] =A0TRAP<br>
&gt; [ 7358.505976] nouveau E[ =A0PGRAPH][0000:02:00.0] ch 2 [0x001faf9000]=
 subc 0 class 0x5039 mthd 0x0328 data 0x00000000<br>
&gt; [ 7361.483615] nouveau E[ =A0 15431] failed to idle channel 0xcccc0000=
<br>
&gt; xorg crashes<br>
<br>
</div></div>On another boot:<br>
[ =A0132.447094] nouveau E[ =A0 =A02776] failed to idle channel 0xcccc0000<=
br>
[ =A0160.136850] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_M2MF OUT<br>
[ =A0160.136940] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_M2MF 00340241 202=
fdb00 00000000 05000432<br>
[ =A0160.137024] nouveau =A0[ =A0PGRAPH][0000:02:00.0] =A0TRAP<br>
[ =A0160.137100] nouveau E[ =A0PGRAPH][0000:02:00.0] ch 2 [0x001faf9000] su=
bc 0 class 0x5039 mthd 0x0328 data 0x00000000<br>
[ =A0160.137208] nouveau E[ =A0 =A0 PFB][0000:02:00.0] trapped read at 0x00=
2001a020 on channel 0x0001faf9 SEMAPHORE_BG/PFIFO_READ/00 reason: PAGE_NOT_=
PRESENT<br>
[ =A0160.137388] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_M2MF IN<br>
[ =A0160.137468] nouveau E[ =A0PGRAPH][0000:02:00.0] TRAP_M2MF 00320251 203=
08d00 00000000 04000000<br>
[ =A0160.137551] nouveau =A0[ =A0PGRAPH][0000:02:00.0] =A0TRAP<br>
[ =A0160.137624] nouveau E[ =A0PGRAPH][0000:02:00.0] ch 2 [0x001faf9000] su=
bc 0 class 0x5039 mthd 0x0328 data 0x00000000<br>
[ =A0163.126736] nouveau E[ =A0 =A02650] failed to idle channel 0xcccc0000<=
br>
</blockquote></div><br>

--14dae9340883845c1304ce3cac22--

--===============1315812813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1315812813==--
