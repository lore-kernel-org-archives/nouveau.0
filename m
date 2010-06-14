From: Konrad Rzeszutek Wilk <konrad.wilk-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: NV30 (FX 5200 Ultra) OUT_RINGp and initial four GEM
	objects are	mapped to the GART instead of System RAM - is
	that proper?
Date: Mon, 14 Jun 2010 11:28:10 -0400
Message-ID: <20100614152810.GA27867@phenom.dumpdata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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


I am trying to figure out why the ttm_bo_vm_fault is stitching pages from the
GART instead of the pages allocated via DRM_NOUVEAU_GEM_NEW. And also why
OUR_RINGp is writing 16, 256 and 512 bytes of zero filled data *1 in the GART?

Perhaps I should mention that I know _why_ it is taking the pages from the GART
and giving them to the userland - but I don't know if that is correct way of
doing it. Let me explain the steps to lead to this:

0). KMS kicks in, allocates two bo pools: VRAM (io offset f0000000), and the
    TT (io offset  ec000000). The  ec000000 is the GART:

[    3.871709] intel_845_configure: ec000000
[    3.881255] agpgart-intel 0000:00:00.0: AGP aperture is 64M @ 0xec000000

1). Xorg starts calls the NvInitDma which ends up calling nouveau_channel_alloc
    which does DRM_NOUVEAU_CHANNEL_ALLOC ioctl.

2). Kernel nouveau driver function nouveau_channel_alloc gets called. During
    its execution it:

    a). creates a chan->pushbuf (64kB), which is done by the TTM layer using
	page_alloc.  The TTM layer allocates 16 4K pages from System RAM, and
	binds them to the GART.

    b) nouveau_channel_pushbuf_ctxdma_init is called which fills
       the PRAMIN with four entries: the first having a dma adjust of zero,
	the second with the size-1, then third and fourth with frame ec000000.
	The target bit is set for AGP.

    b)  Then we map the chan->pushbuf_bo:

           ret = nouveau_bo_map(chan->pushbuf_bo);

     The nouveau_bo_kmap calls ttm_bo_kmap which checks the ttm_bo_pci_offset
     which looks at the 'struct ttm_mem_type_manager' pool for this pool (which
     is the TT) and calls 'ttm_mem_reg_is_pci' to confirm whether this is a PCI
     memory or System RAM. Well, the logic here determines that this is a PCI
     memory and we end up ioremapping the first 16 pages of the GART??

3). That ioctl is done. Xorg driver makes a couple of other ioctls, ends up
    in  nouveau_pushbuf_init_call, invokes the DRM_NOUVEAU_GEM_PUSHBUF ioctl.
    Then sets up four bo objects doing four DRM_NOUVEAU_GEM_NEW ioctls.

    Then nouveau_pushbuf_space picks the second (not the first), of those
    allocated objects and mmaps it. That triggers the kernel 'ttm_bo_mmap'
    function which happily sets up the proper VMA.

4). Then 'NVAccelCommonInit' is called which ends up calling 
    'NVAccelInitContextSurfaces' function that tries to write to the
     second of the above mentioned objects. That triggers the ttm_bo_vm_fault
     which:

    a). Determines that since the offset is within the TT pool, and that pool
      is a PCI device it sets the io_base to ec00000 and with an offset of
      0x24000 (don't know yet why that offset value). Then it attaches to the
      VMA the PFN for the 0xec024 and returns it to the userspace.

   b). The NVAccelInitContNVAccelInitContextSurfaceextSurface writes to the
      GART values that look like they belong somewhere else? Specifically:

 58         BEGIN_RING(chan, surf2d, NV04_CONTEXT_SURFACES_2D_DMA_NOTIFY, 1);
 59         OUT_RING  (chan, chan->nullobj->handle);
 60         BEGIN_RING(chan, surf2d,
 61                    NV04_CONTEXT_SURFACES_2D_DMA_IMAGE_SOURCE, 2);
 62         OUT_RING  (chan, pNv->chan->vram->handle);
 63         OUT_RING  (chan, pNv->chan->vram->handle);

	look like normal graphics objects.

 5). Is that correct? It really looks like the kernel code ttm_bo_pci_offset is
     using the wrong logic to figure it out? I tried for fun to add code
     that would return false if the mem->mem_type == TTM_PL_TT but that caused
     the whole driver to not work.

The machine I've is an Asus P5PE-VM with a nVidia Corporation NV34
[GeForce FX 5200 Ultra].  The kernel I used was 2.6.34-rc7, but I've also tried
2.6.35-rc2, which does the same thing (except that the offset is way higher: 0x1044000
instead of 0x24000).

[1]*: OK, not all zero filled. I saw this:

[  109.283494] OUT_RINGp: Copied to ffffc90000d492b4 (sz:432) (->ec0092b4, PTE:100000ec009477, PROT:10000000000477)
[  109.283512] GART: ffffc90000d492b4: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000  ................................
[  109.283530] GART: ffffc90000d492d4: 00000000 00000000 00000000 00000000 00000000 00fe0000 0000001c 38000000  ...............................8
[  109.283547] GART: ffffc90000d492f4: 00000000 007c1800 0000fc0c 001c18e0 0c006630 00000000 00180000 00000000  ......|.........0f..............
[  109.283564] GART: ffffc90000d49314: 1800c638 60000066 18000c18 000c0062 00000000 00001800 78000000 66300006  8...f..`....b..............x..0f
[  109.283582] GART: ffffc90000d49334: 00600000 680c000c dc7c3c7c 7cdc0078 7c787c18 0618007c 78663000 3c386cc3  ..`....h|<|.x..|.|x||....0fx.l8<
[  109.283600] GART: ffffc90000d49354: c6780c7c 0c76c66c 18c67600 c6c60cc6 003c1800 c30c7c30 c66c1876 ccfe680c  |.x.l.v..v........<.0|..v.l..h..
[  109.283617] GART: ffffc90000d49374: 007c66c6 fe18fe66 00fe607c 30000618 66c37c6c 0cfecc18 c6ccc060 6000cc60  .f|.f...|`.....0l|.f....`...`..`
[  109.283635] GART: ffffc90000d49394: ccc018c0 1800c038 66300006 1866dbcc 600cc0cc 60c6ccc0 c06000cc 0cccc018  ....8.....0f..f....`...`..`.....
[  109.283654] GART: ffffc90000d493b4: 061800c0 cc663000 cc1866db c6600cc0 cc60c6cc 18c66000 c6c6ccc6 00c61800  .....0f..f....`...`..`..........
[  109.283673] GART: ffffc90000d493d4: ffcc6618 c6cc1866 767cf018 0076f07c 7c3c7cf0 007c7c76 0c007c7e e66676e6  .f..f.....|v|.v..|<|v||.~|...vf.
[  109.283691] GART: ffffc90000d493f4: 307c763c 00000000 00000000 00000000 00000000 00000000 00000000 00000000  <v|0............................
[  109.283708] GART: ffffc90000d49414: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000  ................................
[  109.283725] GART: ffffc90000d49434: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000  ................................
[  109.283740] GART: ffffc90000d49454: 00000000 00000000 00000000 00000000  ................

and this:

[  109.836757] OUT_RINGp: Copied to ffffc90000d49a64 (sz:224) (->ec009a64, PTE:100000ec009477, PROT:10000000000477)
[  109.836771] GART: ffffc90000d49a64: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 7c100010  ...............................|
[  109.836786] GART: ffffc90000d49a84: 38000c7c 00180000 00300000 1cc6c630 00001800 00000018 c6300030 18003cc6  |..8......0.0...........0.0..<..
[  109.836800] GART: ffffc90000d49aa4: 00000000 7cfc0018 6ccecefc 767c1800 0018dc38 de30c630 1800ccde 6618ccc6  .......|...l..|v8...0.0........f
[  109.836815] GART: ffffc90000d49ac4: 60300000 fef6f630 ccc61800 00006618 e6303830 18000ce6 6618ccc6 0c300000  ..0`0........f..080........f..0.
[  109.836829] GART: ffffc90000d49ae4: 0cc6c630 ccc61800 00186618 c636c636 18000cc6 6618ccc6 7c1c0018 1e7c7c1c  0........f..6.6........f...|.||.
[  109.836844] GART: ffffc90000d49b04: 7c7c3c00 0000663c 00000000 00000000 00000c00 00000000 00000000 cc000000  .<||<f..........................
[  109.836857] GART: ffffc90000d49b24: 00000000 00000000 00000000 00007800 00000000 00000000 00000000 00000000  .............x..................

but all the 99999 other times it was zero filled.

[2]: Baremetal log: http://darnok.org/tst004.2.6.35-rc2.baremetal.log
