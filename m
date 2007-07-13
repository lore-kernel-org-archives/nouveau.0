From: Ian Romanick <idr-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Subject: NV43 + PPC64 = :(
Date: Fri, 13 Jul 2007 11:05:39 -0700
Message-ID: <4697BEF3.1020903@us.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------080702080004090900050004"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--------------080702080004090900050004
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I've been trying to get nouveau working on a Geforce 6600LE in a
dual-core G5 PowerMac system.  For various reasons, it's not working.

The first problem I encountered was the lack of virt_to_bus on 64-bit
PPC.  After talking to benh on IRC, I created the attached patch.
nouveau.ko can at least load on PPC64 now. :)

However, during X-server start up, the system hard-locks.  Since Apple
systems don't have a reset button (sigh...), I have to power-cycle the
machine.  I cannot ssh into the machine, and it's not pingable.  It's
really toast.  I've attached a log with DRM debug messages.  The bits
about "iommu_alloc failed" seem suspicious to me.

I don't have another system with an Nvidia card to test.  I'd appreciate
it if someone could test this patch on x86 or x86-64 and report results
back.  I'd like to determine if the patch is broken, just broken on
PPC64, or if something else is broken.

Thanks.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iD8DBQFGl77zX1gOwKyEAw8RAnvkAKCKh6+WmbPf2MvTXGvGzxI4RHmGnwCffuM5
1zs68V8RBjeIspiEuSA1Gp0=
=qEo1
-----END PGP SIGNATURE-----

--------------080702080004090900050004
Content-Type: text/x-patch;
 name="eliminate-virt_to_bus.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="eliminate-virt_to_bus.patch"

 shared-core/nouveau_object.c |   77 ++++++++++++++++++++----------------------
 1 files changed, 37 insertions(+), 40 deletions(-)

diff --git a/shared-core/nouveau_object.c b/shared-core/nouveau_object.c
index aab2e3a..146c4f1 100644
--- a/shared-core/nouveau_object.c
+++ b/shared-core/nouveau_object.c
@@ -585,6 +585,11 @@ nouveau_gpuobj_dma_new(struct drm_device *dev, int channel, int class,
 	int ret;
 	uint32_t is_scatter_gather = 0;
 	
+	/* Total number of pages covered by the request.
+	 */
+	const unsigned int page_count = (size + PAGE_SIZE - 1) / PAGE_SIZE;
+
+
 	DRM_DEBUG("ch%d class=0x%04x offset=0x%llx size=0x%llx\n",
 		  channel, class, offset, size);
 	DRM_DEBUG("access=%d target=%d\n", access, target);
@@ -604,7 +609,7 @@ nouveau_gpuobj_dma_new(struct drm_device *dev, int channel, int class,
         }
 	
 	ret = nouveau_gpuobj_new(dev, channel,
-				 is_scatter_gather ? ((((size + PAGE_SIZE - 1) / PAGE_SIZE) << 2) + 12) : nouveau_gpuobj_class_instmem_size(dev, class),
+				 is_scatter_gather ? ((page_count << 2) + 12) : nouveau_gpuobj_class_instmem_size(dev, class),
 				 16,
 				 NVOBJ_FLAG_ZERO_ALLOC | NVOBJ_FLAG_ZERO_FREE,
 				 gpuobj);
@@ -634,9 +639,19 @@ nouveau_gpuobj_dma_new(struct drm_device *dev, int channel, int class,
 			}
 		else 
 			{
+			/* Intial page entry in the scatter-gather area that
+			 * corresponds to the base offset
+			 */
+			unsigned int idx = offset / PAGE_SIZE;
+
 			uint32_t instance_offset;
-			uint64_t bus_addr;
-			size = (uint32_t) size;
+			unsigned int i;
+
+			if ((idx + page_count) > dev->sg->pages) {
+				DRM_ERROR("Requested page range exceedes "
+					  "allocated scatter-gather range!");
+				return DRM_ERR(E2BIG);
+			}
 
 			DRM_DEBUG("Creating PCI DMA object using virtual zone starting at %#llx, size %d\n", offset, (uint32_t)size);
 	                INSTANCE_WR(*gpuobj, 0, ((1<<12) | (0<<13) |
@@ -644,52 +659,34 @@ nouveau_gpuobj_dma_new(struct drm_device *dev, int channel, int class,
                                 (access << 14) |
                                 (target << 16) |
                                 class));
-			INSTANCE_WR(*gpuobj, 1, size-1);
+			INSTANCE_WR(*gpuobj, 1, (uint32_t) size-1);
 
-			offset += dev->sg->virtual;
 
 			/*write starting at the third dword*/
 			instance_offset = 2;
  
 			/*for each PAGE, get its bus address, fill in the page table entry, and advance*/
-			while ( size > 0 ) {
-				bus_addr = vmalloc_to_page(offset);
- 				if ( ! bus_addr ) 
-					{
-					DRM_ERROR("Couldn't map virtual address %#llx to a page number\n", offset);
-					nouveau_gpuobj_del(dev, gpuobj);
-					return DRM_ERR(ENOMEM);
+			for (i = 0; i < page_count; i++) {
+				if (dev->sg->busaddr[idx] == 0) {
+					dev->sg->busaddr[idx] =
+						pci_map_page(dev->pdev,
+							     dev->sg->pagelist[idx],
+							     0,
+							     DMA_31BIT_MASK,
+							     DMA_BIDIRECTIONAL);
+
+					if (dev->sg->busaddr[idx] == 0) {
+						return DRM_ERR(ENOMEM);
 					}
-				bus_addr = (uint64_t) page_address(bus_addr);
- 				if ( ! bus_addr ) 
-					{
-					DRM_ERROR("Couldn't find page address for address %#llx\n", offset);
-					nouveau_gpuobj_del(dev, gpuobj);
-					return DRM_ERR(ENOMEM);
-					}
-				bus_addr |= (offset & ~PAGE_MASK);
-				bus_addr = virt_to_bus((void *)bus_addr);
- 				if ( ! bus_addr ) 
-					{
-					DRM_ERROR("Couldn't get bus address for %#llx\n", offset);
-					nouveau_gpuobj_del(dev, gpuobj);
-					return DRM_ERR(ENOMEM);
-					}
-
-				/*if ( bus_addr >= 1 << 32 )
-					{
-					DRM_ERROR("Bus address %#llx is over 32 bits, Nvidia cards cannot address it !\n", bus_addr);
-					nouveau_gpuobj_del(dev, gpuobj);
-					return DRM_ERR(EINVAL);
-					}*/
-				
-				frame = (uint32_t) bus_addr & ~0x00000FFF;
-				INSTANCE_WR(*gpuobj, instance_offset, frame | pte_flags);
-				offset += PAGE_SIZE;
-				instance_offset ++;
-				size -= PAGE_SIZE;
 				}
 
+				frame = (uint32_t) dev->sg->busaddr[idx];
+				INSTANCE_WR(*gpuobj, instance_offset, 
+					    frame | pte_flags);
+ 
+				idx++;
+				instance_offset ++;
+ 			}
 			}
 	} else {
 		INSTANCE_WR(*gpuobj, 0, 0x00190000 | class);

--------------080702080004090900050004
Content-Type: text/plain;
 name="messages"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="messages"

Jul 13 10:37:55 localhost kernel: [drm:drm_init] 
Jul 13 10:37:55 localhost kernel: [drm:drm_get_dev] 
Jul 13 10:37:55 localhost kernel: [drm:drm_get_head] 
Jul 13 10:37:55 localhost kernel: [drm:drm_get_head] new minor assigned 0
Jul 13 10:37:55 localhost kernel: [drm] Initialized nouveau 0.0.9 20060213 on minor 0
Jul 13 10:37:55 localhost kernel: [drm] Used old pci detect: framebuffer loaded
Jul 13 10:38:30 localhost kernel: [drm:drm_stub_open] 
Jul 13 10:38:30 localhost kernel: [drm:drm_open_helper] pid = 2841, minor = 0
Jul 13 10:38:30 localhost kernel: [drm:drm_addmap_core] offset = 0x92000000, size = 0x01000000, type = 1
Jul 13 10:38:30 localhost kernel: [drm:nouveau_init_card_mappings] regs mapped ok at 0x92000000
Jul 13 10:38:30 localhost kernel: [drm:drm_addmap_core] offset = 0x91000000, size = 0x01000000, type = 1
Jul 13 10:38:30 localhost kernel: [drm:nv04_instmem_determine_amount] RAMIN size: 1024KiB
Jul 13 10:38:30 localhost kernel: [drm:nv04_instmem_configure_fixed_tables] RAMHT offset=0x10000, size=512
Jul 13 10:38:30 localhost kernel: [drm:nv04_instmem_configure_fixed_tables] RAMRO offset=0x11200, size=512
Jul 13 10:38:30 localhost kernel: [drm:nv04_instmem_configure_fixed_tables] RAMFC offset=0x20000, size=4096
Jul 13 10:38:30 localhost kernel: [drm:nouveau_gpuobj_new_fake] offset=0x00010000 size=0x00000200 flags=0x00000003
Jul 13 10:38:30 localhost kernel: [drm:nouveau_gpuobj_new_fake] gpuobj c00000005baeb180
Jul 13 10:38:30 localhost kernel: [drm:nouveau_mem_init] Allocating sg memory for PCI DMA
Jul 13 10:38:30 localhost kernel: [drm:drm_sg_alloc] drm_sg_alloc
Jul 13 10:38:30 localhost kernel: [drm:drm_sg_alloc] sg size=4194304 pages=1024
Jul 13 10:38:30 localhost kernel: [drm:drm_sg_alloc] sg alloc handle  = d0604000
Jul 13 10:38:30 localhost kernel: [drm:drm_sg_alloc] sg alloc virtual = d000000000604000
Jul 13 10:38:30 localhost kernel: [drm:nouveau_mem_init] Available VRAM: 130048KiB
Jul 13 10:38:30 localhost kernel: [drm:nv40_graph_init] Loading context-switch voodoo
Jul 13 10:38:30 localhost kernel: [drm:nouveau_fifo_init] Setting defaults for remaining PFIFO regs
Jul 13 10:38:30 localhost kernel: [drm:drm_addmap_core] offset = 0x00000000, size = 0x00002000, type = 2
Jul 13 10:38:30 localhost kernel: [drm:drm_addmap_core] 8192 13 d00000000037c000
Jul 13 10:38:30 localhost kernel: [drm:drm_setup] 
Jul 13 10:38:30 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0406400, nr=0x00, dev 0xe200, auth=1
Jul 13 10:38:30 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0406400, nr=0x00, dev 0xe200, auth=1
Jul 13 10:38:30 localhost kernel: [drm:drm_release] open_count = 1
Jul 13 10:38:30 localhost kernel: [drm:nouveau_fifo_cleanup] clearing FIFO enables from filp
Jul 13 10:38:30 localhost kernel: [drm:drm_release] pid = 2841, device = 0xe200, open_count = 1
Jul 13 10:38:30 localhost kernel: [drm:drm_fasync] fd = -1, device = 0xe200
Jul 13 10:38:30 localhost kernel: [drm:drm_lastclose] 
Jul 13 10:38:30 localhost kernel: [drm:nouveau_gpuobj_takedown] 
Jul 13 10:38:30 localhost kernel: [drm:nouveau_gpuobj_del] gpuobj c00000005baeb180
Jul 13 10:38:30 localhost kernel: [drm:drm_lastclose] driver lastclose completed
Jul 13 10:38:30 localhost kernel: [drm:drm_lastclose] lastclose completed
Jul 13 10:38:30 localhost kernel: [drm:drm_stub_open] 
Jul 13 10:38:30 localhost kernel: [drm:drm_open_helper] pid = 2841, minor = 0
Jul 13 10:38:30 localhost kernel: [drm:drm_addmap_core] offset = 0x92000000, size = 0x01000000, type = 1
Jul 13 10:38:30 localhost kernel: [drm:nouveau_init_card_mappings] regs mapped ok at 0x92000000
Jul 13 10:38:30 localhost kernel: [drm:drm_addmap_core] offset = 0x91000000, size = 0x01000000, type = 1
Jul 13 10:38:30 localhost kernel: [drm:nv04_instmem_determine_amount] RAMIN size: 1024KiB
Jul 13 10:38:30 localhost kernel: [drm:nv04_instmem_configure_fixed_tables] RAMHT offset=0x10000, size=512
Jul 13 10:38:30 localhost kernel: [drm:nv04_instmem_configure_fixed_tables] RAMRO offset=0x11200, size=512
Jul 13 10:38:30 localhost kernel: [drm:nv04_instmem_configure_fixed_tables] RAMFC offset=0x20000, size=4096
Jul 13 10:38:30 localhost kernel: [drm:nouveau_gpuobj_new_fake] offset=0x00010000 size=0x00000200 flags=0x00000003
Jul 13 10:38:30 localhost kernel: [drm:nouveau_gpuobj_new_fake] gpuobj c00000005b7396c0
Jul 13 10:38:30 localhost kernel: [drm:nouveau_mem_init] Allocating sg memory for PCI DMA
Jul 13 10:38:30 localhost kernel: [drm:drm_sg_alloc] drm_sg_alloc
Jul 13 10:38:30 localhost kernel: [drm:drm_sg_alloc] sg size=4194304 pages=1024
Jul 13 10:38:30 localhost kernel: [drm:drm_sg_alloc] sg alloc handle  = d0604000
Jul 13 10:38:30 localhost kernel: [drm:drm_sg_alloc] sg alloc virtual = d000000000604000
Jul 13 10:38:30 localhost kernel: [drm:nouveau_mem_init] Available VRAM: 130048KiB
Jul 13 10:38:30 localhost kernel: [drm:nv40_graph_init] Loading context-switch voodoo
Jul 13 10:38:30 localhost kernel: [drm:nouveau_fifo_init] Setting defaults for remaining PFIFO regs
Jul 13 10:38:30 localhost kernel: [drm:drm_addmap_core] offset = 0x00000000, size = 0x00002000, type = 2
Jul 13 10:38:30 localhost kernel: [drm:drm_addmap_core] 8192 13 d00000000037c000
Jul 13 10:38:30 localhost kernel: [drm:drm_setup] 
Jul 13 10:38:30 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0106407, nr=0x07, dev 0xe200, auth=1
Jul 13 10:38:30 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0106401, nr=0x01, dev 0xe200, auth=1
Jul 13 10:38:30 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0106401, nr=0x01, dev 0xe200, auth=1
Jul 13 10:38:30 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0406400, nr=0x00, dev 0xe200, auth=1
Jul 13 10:38:30 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0406400, nr=0x00, dev 0xe200, auth=1
Jul 13 10:38:30 localhost kernel: [drm:drm_release] open_count = 1
Jul 13 10:38:30 localhost kernel: [drm:nouveau_fifo_cleanup] clearing FIFO enables from filp
Jul 13 10:38:30 localhost kernel: [drm:drm_release] pid = 2841, device = 0xe200, open_count = 1
Jul 13 10:38:30 localhost kernel: [drm:drm_fasync] fd = -1, device = 0xe200
Jul 13 10:38:30 localhost kernel: [drm:drm_lastclose] 
Jul 13 10:38:30 localhost kernel: [drm:nouveau_gpuobj_takedown] 
Jul 13 10:38:30 localhost kernel: [drm:nouveau_gpuobj_del] gpuobj c00000005b7396c0
Jul 13 10:38:30 localhost kernel: [drm:drm_lastclose] driver lastclose completed
Jul 13 10:38:30 localhost kernel: [drm:drm_lastclose] lastclose completed
Jul 13 10:38:31 localhost kernel: [drm:drm_stub_open] 
Jul 13 10:38:31 localhost kernel: [drm:drm_open_helper] pid = 2841, minor = 0
Jul 13 10:38:31 localhost kernel: [drm:drm_addmap_core] offset = 0x92000000, size = 0x01000000, type = 1
Jul 13 10:38:31 localhost kernel: [drm:nouveau_init_card_mappings] regs mapped ok at 0x92000000
Jul 13 10:38:31 localhost kernel: [drm:drm_addmap_core] offset = 0x91000000, size = 0x01000000, type = 1
Jul 13 10:38:31 localhost kernel: [drm:nv04_instmem_determine_amount] RAMIN size: 1024KiB
Jul 13 10:38:31 localhost kernel: [drm:nv04_instmem_configure_fixed_tables] RAMHT offset=0x10000, size=512
Jul 13 10:38:31 localhost kernel: [drm:nv04_instmem_configure_fixed_tables] RAMRO offset=0x11200, size=512
Jul 13 10:38:31 localhost kernel: [drm:nv04_instmem_configure_fixed_tables] RAMFC offset=0x20000, size=4096
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new_fake] offset=0x00010000 size=0x00000200 flags=0x00000003
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new_fake] gpuobj c0000000572cce40
Jul 13 10:38:31 localhost kernel: [drm:nouveau_mem_init] Allocating sg memory for PCI DMA
Jul 13 10:38:31 localhost kernel: [drm:drm_sg_alloc] drm_sg_alloc
Jul 13 10:38:31 localhost kernel: [drm:drm_sg_alloc] sg size=4194304 pages=1024
Jul 13 10:38:31 localhost kernel: [drm:drm_sg_alloc] sg alloc handle  = d0604000
Jul 13 10:38:31 localhost kernel: [drm:drm_sg_alloc] sg alloc virtual = d000000000604000
Jul 13 10:38:31 localhost kernel: [drm:nouveau_mem_init] Available VRAM: 130048KiB
Jul 13 10:38:31 localhost kernel: [drm:nv40_graph_init] Loading context-switch voodoo
Jul 13 10:38:31 localhost kernel: [drm:nouveau_fifo_init] Setting defaults for remaining PFIFO regs
Jul 13 10:38:31 localhost kernel: [drm:drm_addmap_core] offset = 0x00000000, size = 0x00002000, type = 2
Jul 13 10:38:31 localhost kernel: [drm:drm_addmap_core] 8192 13 d00000000037c000
Jul 13 10:38:31 localhost kernel: [drm:drm_setup] 
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0406400, nr=0x00, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0406400, nr=0x00, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:drm_release] open_count = 1
Jul 13 10:38:31 localhost kernel: [drm:nouveau_fifo_cleanup] clearing FIFO enables from filp
Jul 13 10:38:31 localhost kernel: [drm:drm_release] pid = 2841, device = 0xe200, open_count = 1
Jul 13 10:38:31 localhost kernel: [drm:drm_fasync] fd = -1, device = 0xe200
Jul 13 10:38:31 localhost kernel: [drm:drm_lastclose] 
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_takedown] 
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_del] gpuobj c0000000572cce40
Jul 13 10:38:31 localhost kernel: [drm:drm_lastclose] driver lastclose completed
Jul 13 10:38:31 localhost kernel: [drm:drm_lastclose] lastclose completed
Jul 13 10:38:31 localhost kernel: [drm:drm_stub_open] 
Jul 13 10:38:31 localhost kernel: [drm:drm_open_helper] pid = 2841, minor = 0
Jul 13 10:38:31 localhost kernel: [drm:drm_addmap_core] offset = 0x92000000, size = 0x01000000, type = 1
Jul 13 10:38:31 localhost kernel: [drm:nouveau_init_card_mappings] regs mapped ok at 0x92000000
Jul 13 10:38:31 localhost kernel: [drm:drm_addmap_core] offset = 0x91000000, size = 0x01000000, type = 1
Jul 13 10:38:31 localhost kernel: [drm:nv04_instmem_determine_amount] RAMIN size: 1024KiB
Jul 13 10:38:31 localhost kernel: [drm:nv04_instmem_configure_fixed_tables] RAMHT offset=0x10000, size=512
Jul 13 10:38:31 localhost kernel: [drm:nv04_instmem_configure_fixed_tables] RAMRO offset=0x11200, size=512
Jul 13 10:38:31 localhost kernel: [drm:nv04_instmem_configure_fixed_tables] RAMFC offset=0x20000, size=4096
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new_fake] offset=0x00010000 size=0x00000200 flags=0x00000003
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new_fake] gpuobj c00000005b7396c0
Jul 13 10:38:31 localhost kernel: [drm:nouveau_mem_init] Allocating sg memory for PCI DMA
Jul 13 10:38:31 localhost kernel: [drm:drm_sg_alloc] drm_sg_alloc
Jul 13 10:38:31 localhost kernel: [drm:drm_sg_alloc] sg size=4194304 pages=1024
Jul 13 10:38:31 localhost kernel: [drm:drm_sg_alloc] sg alloc handle  = d0604000
Jul 13 10:38:31 localhost kernel: [drm:drm_sg_alloc] sg alloc virtual = d000000000604000
Jul 13 10:38:31 localhost kernel: [drm:nouveau_mem_init] Available VRAM: 130048KiB
Jul 13 10:38:31 localhost kernel: [drm:nv40_graph_init] Loading context-switch voodoo
Jul 13 10:38:31 localhost kernel: [drm:nouveau_fifo_init] Setting defaults for remaining PFIFO regs
Jul 13 10:38:31 localhost kernel: [drm:drm_addmap_core] offset = 0x00000000, size = 0x00002000, type = 2
Jul 13 10:38:31 localhost kernel: [drm:drm_addmap_core] 8192 13 d00000000037c000
Jul 13 10:38:31 localhost kernel: [drm:drm_setup] 
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0406400, nr=0x00, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0406400, nr=0x00, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:drm_release] open_count = 1
Jul 13 10:38:31 localhost kernel: [drm:nouveau_fifo_cleanup] clearing FIFO enables from filp
Jul 13 10:38:31 localhost kernel: [drm:drm_release] pid = 2841, device = 0xe200, open_count = 1
Jul 13 10:38:31 localhost kernel: [drm:drm_fasync] fd = -1, device = 0xe200
Jul 13 10:38:31 localhost kernel: [drm:drm_lastclose] 
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_takedown] 
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_del] gpuobj c00000005b7396c0
Jul 13 10:38:31 localhost kernel: [drm:drm_lastclose] driver lastclose completed
Jul 13 10:38:31 localhost kernel: [drm:drm_lastclose] lastclose completed
Jul 13 10:38:31 localhost kernel: [drm:drm_stub_open] 
Jul 13 10:38:31 localhost kernel: [drm:drm_open_helper] pid = 2841, minor = 0
Jul 13 10:38:31 localhost kernel: [drm:drm_addmap_core] offset = 0x92000000, size = 0x01000000, type = 1
Jul 13 10:38:31 localhost kernel: [drm:nouveau_init_card_mappings] regs mapped ok at 0x92000000
Jul 13 10:38:31 localhost kernel: [drm:drm_addmap_core] offset = 0x91000000, size = 0x01000000, type = 1
Jul 13 10:38:31 localhost kernel: [drm:nv04_instmem_determine_amount] RAMIN size: 1024KiB
Jul 13 10:38:31 localhost kernel: [drm:nv04_instmem_configure_fixed_tables] RAMHT offset=0x10000, size=512
Jul 13 10:38:31 localhost kernel: [drm:nv04_instmem_configure_fixed_tables] RAMRO offset=0x11200, size=512
Jul 13 10:38:31 localhost kernel: [drm:nv04_instmem_configure_fixed_tables] RAMFC offset=0x20000, size=4096
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new_fake] offset=0x00010000 size=0x00000200 flags=0x00000003
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new_fake] gpuobj c00000005baeb180
Jul 13 10:38:31 localhost kernel: [drm:nouveau_mem_init] Allocating sg memory for PCI DMA
Jul 13 10:38:31 localhost kernel: [drm:drm_sg_alloc] drm_sg_alloc
Jul 13 10:38:31 localhost kernel: [drm:drm_sg_alloc] sg size=4194304 pages=1024
Jul 13 10:38:31 localhost kernel: [drm:drm_sg_alloc] sg alloc handle  = d0604000
Jul 13 10:38:31 localhost kernel: [drm:drm_sg_alloc] sg alloc virtual = d000000000604000
Jul 13 10:38:31 localhost kernel: [drm:nouveau_mem_init] Available VRAM: 130048KiB
Jul 13 10:38:31 localhost kernel: [drm:nv40_graph_init] Loading context-switch voodoo
Jul 13 10:38:31 localhost kernel: [drm:nouveau_fifo_init] Setting defaults for remaining PFIFO regs
Jul 13 10:38:31 localhost kernel: [drm:drm_addmap_core] offset = 0x00000000, size = 0x00002000, type = 2
Jul 13 10:38:31 localhost kernel: [drm:drm_addmap_core] 8192 13 d00000000037c000
Jul 13 10:38:31 localhost kernel: [drm:drm_setup] 
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0106407, nr=0x07, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0106401, nr=0x01, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0106401, nr=0x01, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0106407, nr=0x07, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0286415, nr=0x15, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:drm_addmap_core] offset = 0x00000000, size = 0x00002000, type = 2
Jul 13 10:38:31 localhost kernel: [drm:drm_mmap_locked] start = 0xf7fec000, end = 0xf7fee000, page offset = 0x29fff
Jul 13 10:38:31 localhost kernel: [drm:drm_vm_open_locked] 0xf7fec000,0x00002000
Jul 13 10:38:31 localhost kernel: [drm:drm_do_vm_shm_nopage] shm_nopage 0xf7fec000
Jul 13 10:38:31 localhost kernel: [drm:drm_do_vm_shm_nopage] shm_nopage 0xf7fed000
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0286415, nr=0x15, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:drm_addmap_core] offset = 0x98000000, size = 0x04000000, type = 0
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0106426, nr=0x26, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0106426, nr=0x26, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0106403, nr=0x03, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:drm_irq_by_busid] 10:0:0 => IRQ 17
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0x80086414, nr=0x14, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:drm_irq_install] drm_irq_install: irq=17
Jul 13 10:38:31 localhost kernel: [drm:nouveau_irq_preinstall] IRQ: preinst
Jul 13 10:38:31 localhost kernel: [drm:nouveau_irq_postinstall] IRQ: postinst
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0206443, nr=0x43, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:drm_addmap_core] offset = 0x98000000, size = 0x04000000, type = 0
Jul 13 10:38:31 localhost kernel: [drm] allocated 0x0
Jul 13 10:38:31 localhost kernel: [drm:drm_mmap_locked] start = 0xf2e35000, end = 0xf6e35000, page offset = 0x98000
Jul 13 10:38:31 localhost kernel: [drm:drm_mmap_locked]    Type = 0; start = 0xf2e35000, end = 0xf6e35000, offset = 0x98000000
Jul 13 10:38:31 localhost kernel: [drm:drm_vm_open_locked] 0xf2e35000,0x04000000
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0106445, nr=0x45, dev 0xe200, auth=1
Jul 13 10:38:31 localhost last message repeated 4 times
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0206443, nr=0x43, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:drm_addmap_core] offset = 0x00000000, size = 0x003c0000, type = 4
Jul 13 10:38:31 localhost kernel: [drm] allocated 0x0
Jul 13 10:38:31 localhost kernel: [drm:drm_mmap_locked] start = 0xf2a75000, end = 0xf2e35000, page offset = 0x2a000
Jul 13 10:38:31 localhost kernel: [drm:drm_vm_open_locked] 0xf2a75000,0x003c0000
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0206443, nr=0x43, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:drm_addmap_core] offset = 0x9c000000, size = 0x00010000, type = 0
Jul 13 10:38:31 localhost kernel: [drm] allocated 0x4000000
Jul 13 10:38:31 localhost kernel: [drm:drm_mmap_locked] start = 0xf2a65000, end = 0xf2a75000, page offset = 0x9c000
Jul 13 10:38:31 localhost kernel: [drm:drm_mmap_locked]    Type = 0; start = 0xf2a65000, end = 0xf2a75000, offset = 0x9c000000
Jul 13 10:38:31 localhost kernel: [drm:drm_vm_open_locked] 0xf2a65000,0x00010000
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0206443, nr=0x43, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:drm_addmap_core] offset = 0x9c010000, size = 0x00004000, type = 0
Jul 13 10:38:31 localhost kernel: [drm] allocated 0x4010000
Jul 13 10:38:31 localhost kernel: [drm:drm_mmap_locked] start = 0xf2a61000, end = 0xf2a65000, page offset = 0x9c010
Jul 13 10:38:31 localhost kernel: [drm:drm_mmap_locked]    Type = 0; start = 0xf2a61000, end = 0xf2a65000, offset = 0x9c010000
Jul 13 10:38:31 localhost kernel: [drm:drm_vm_open_locked] 0xf2a61000,0x00004000
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0106446, nr=0x46, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0286440, nr=0x40, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm] Allocating FIFO number 0
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_channel_init] ch0 vram=0xd8000001 tt=0xd8000002
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_ref_add] ch-1 h=0x00000000 gpuobj=c00000005baeb180
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_dma_new] ch0 class=0x003d offset=0x0 size=0x7f00000
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_dma_new] access=0 target=0
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] ch0 size=32 align=16 flags=0x00000006
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] gpuobj c0000000572cca40
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] global heap fallback
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_ref_add] ch0 h=0xd8000001 gpuobj=c0000000572cca40
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_hash_handle] ch0 handle=0x00000000 hash=0x000000d0
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_insert] insert ch0 0x000000d0: h=0xd8000001, c=0x00002100
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_dma_new] ch0 class=0x003d offset=0x0 size=0x400000
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_dma_new] access=0 target=8
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] ch0 size=4108 align=16 flags=0x00000006
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] gpuobj c00000005b4b2ac0
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] global heap fallback
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_dma_new] Creating PCI DMA object using virtual zone starting at 0x0, size 4194304
Jul 13 10:38:31 localhost kernel: iommu_alloc failed, tbl c000000000730d78 vaddr c000000055151000 npages 524288
Jul 13 10:38:31 localhost kernel: iommu_alloc failed, tbl c000000000730d78 vaddr c000000055152000 npages 524288
Jul 13 10:38:31 localhost kernel: iommu_alloc failed, tbl c000000000730d78 vaddr c0000000552d0000 npages 524288
Jul 13 10:38:31 localhost kernel: iommu_alloc failed, tbl c000000000730d78 vaddr c0000000552cf000 npages 524288
Jul 13 10:38:31 localhost kernel: iommu_alloc failed, tbl c000000000730d78 vaddr c0000000552ce000 npages 524288
Jul 13 10:38:31 localhost kernel: iommu_alloc failed, tbl c000000000730d78 vaddr c0000000552cd000 npages 524288
Jul 13 10:38:31 localhost kernel: iommu_alloc failed, tbl c000000000730d78 vaddr c0000000552cc000 npages 524288
Jul 13 10:38:31 localhost kernel: iommu_alloc failed, tbl c000000000730d78 vaddr c0000000552cb000 npages 524288
Jul 13 10:38:31 localhost kernel: iommu_alloc failed, tbl c000000000730d78 vaddr c0000000552ca000 npages 524288
Jul 13 10:38:31 localhost kernel: iommu_alloc failed, tbl c000000000730d78 vaddr c0000000552c9000 npages 524288
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_ref_add] ch0 h=0xd8000002 gpuobj=c00000005b4b2ac0
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_hash_handle] ch0 handle=0x00000000 hash=0x000000c8
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_insert] insert ch0 0x000000c8: h=0xd8000002, c=0x00002102
Jul 13 10:38:31 localhost kernel: [drm:drm_addmap_core] offset = 0x9c014000, size = 0x00008000, type = 0
Jul 13 10:38:31 localhost kernel: [drm] allocated 0x4014000
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_dma_new] ch0 class=0x003d offset=0x4014000 size=0x8000
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_dma_new] access=1 target=0
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] ch0 size=32 align=16 flags=0x00000006
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] gpuobj c00000005bc497c0
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] global heap fallback
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_ref_add] ch0 h=0x00000000 gpuobj=c00000005bc497c0
Jul 13 10:38:31 localhost kernel: [drm:drm_addmap_core] offset = 0x9c01c000, size = 0x00001000, type = 0
Jul 13 10:38:31 localhost kernel: [drm] allocated 0x401c000
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] ch0 size=71680 align=16 flags=0x00000002
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] gpuobj c0000000572ccbc0
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] global heap fallback
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_ref_add] ch-1 h=0x00000000 gpuobj=c0000000572ccbc0
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new_fake] offset=0x00020000 size=0x00000080 flags=0x00000006
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new_fake] gpuobj c0000000572cca80
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_ref_add] ch-1 h=0x00000000 gpuobj=c0000000572cca80
Jul 13 10:38:31 localhost kernel: [drm] nouveau_fifo_alloc: initialised FIFO 0
Jul 13 10:38:31 localhost kernel: [drm:drm_addmap_core] offset = 0x92800000, size = 0x00010000, type = 1
Jul 13 10:38:31 localhost kernel: [drm:drm_mmap_locked] start = 0xf2a59000, end = 0xf2a61000, page offset = 0x9c014
Jul 13 10:38:31 localhost kernel: [drm:drm_mmap_locked]    Type = 0; start = 0xf2a59000, end = 0xf2a61000, offset = 0x9c014000
Jul 13 10:38:31 localhost kernel: [drm:drm_vm_open_locked] 0xf2a59000,0x00008000
Jul 13 10:38:31 localhost kernel: [drm:drm_mmap_locked] start = 0xf2a49000, end = 0xf2a59000, page offset = 0x92800
Jul 13 10:38:31 localhost kernel: [drm:drm_mmap_locked]    Type = 1; start = 0xf2a49000, end = 0xf2a59000, offset = 0x92800000
Jul 13 10:38:31 localhost kernel: [drm:drm_vm_open_locked] 0xf2a49000,0x00010000
Jul 13 10:38:31 localhost kernel: [drm:drm_mmap_locked] start = 0xf2a48000, end = 0xf2a49000, page offset = 0x9c01c
Jul 13 10:38:31 localhost kernel: [drm:drm_mmap_locked]    Type = 0; start = 0xf2a48000, end = 0xf2a49000, offset = 0x9c01c000
Jul 13 10:38:31 localhost kernel: [drm:drm_vm_open_locked] 0xf2a48000,0x00001000
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0x800c6441, nr=0x41, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_gr_new] ch0 class=0x0030
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] ch0 size=32 align=16 flags=0x00000006
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] gpuobj c000000001ead440
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] global heap fallback
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_ref_add] ch0 h=0x00000000 gpuobj=c000000001ead440
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_hash_handle] ch0 handle=0x00000000 hash=0x00000000
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_insert] insert ch0 0x00000000: h=0x00000000, c=0x00103385
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0106442, nr=0x42, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_dma_new] ch0 class=0x003d offset=0x401c000 size=0x20
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_dma_new] access=0 target=0
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] ch0 size=32 align=16 flags=0x00000006
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] gpuobj c00000005e989480
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] global heap fallback
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_ref_add] ch0 h=0xd8000003 gpuobj=c00000005e989480
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_hash_handle] ch0 handle=0x00000000 hash=0x000000c0
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_insert] insert ch0 0x000000c0: h=0xd8000003, c=0x00003387
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0x800c6441, nr=0x41, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_gr_new] ch0 class=0x0062
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] ch0 size=32 align=16 flags=0x00000006
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] gpuobj c00000000ff5d900
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] global heap fallback
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_ref_add] ch0 h=0x80000010 gpuobj=c00000000ff5d900
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_hash_handle] ch0 handle=0x00000000 hash=0x00000000
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_insert] collision ch0 0x00000000: h=0x00000000
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_insert] insert ch0 0x00000008: h=0x80000010, c=0x00103389
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0x800c6441, nr=0x41, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_gr_new] ch0 class=0x0044
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] ch0 size=32 align=16 flags=0x00000006
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] gpuobj c00000005be24c40
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] global heap fallback
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_ref_add] ch0 h=0x80000012 gpuobj=c00000005be24c40
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_hash_handle] ch0 handle=0x00000000 hash=0x00000010
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_insert] insert ch0 0x00000010: h=0x80000012, c=0x0010338b
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0x800c6441, nr=0x41, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_gr_new] ch0 class=0x0043
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] ch0 size=32 align=16 flags=0x00000006
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] gpuobj c000000001ead880
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] global heap fallback
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_ref_add] ch0 h=0x80000011 gpuobj=c000000001ead880
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_hash_handle] ch0 handle=0x00000000 hash=0x00000008
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_insert] collision ch0 0x00000008: h=0x80000010
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_insert] collision ch0 0x00000010: h=0x80000012
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_insert] insert ch0 0x00000018: h=0x80000011, c=0x0010338d
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0x800c6441, nr=0x41, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_gr_new] ch0 class=0x004a
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] ch0 size=32 align=16 flags=0x00000006
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] gpuobj c000000002771b40
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] global heap fallback
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_ref_add] ch0 h=0x80000016 gpuobj=c000000002771b40
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_hash_handle] ch0 handle=0x00000000 hash=0x00000030
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_insert] insert ch0 0x00000030: h=0x80000016, c=0x0010338f
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0x800c6441, nr=0x41, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_gr_new] ch0 class=0x009f
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] ch0 size=32 align=16 flags=0x00000006
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] gpuobj c00000000fd462c0
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] global heap fallback
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_ref_add] ch0 h=0x80000015 gpuobj=c00000000fd462c0
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_hash_handle] ch0 handle=0x00000000 hash=0x00000028
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_insert] insert ch0 0x00000028: h=0x80000015, c=0x00103391
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0x800c6441, nr=0x41, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_gr_new] ch0 class=0x3089
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] ch0 size=32 align=16 flags=0x00000006
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] gpuobj c00000000ff5d440
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] global heap fallback
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_ref_add] ch0 h=0x80000017 gpuobj=c00000000ff5d440
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_hash_handle] ch0 handle=0x00000000 hash=0x00000038
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_insert] insert ch0 0x00000038: h=0x80000017, c=0x00103393
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0x800c6441, nr=0x41, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_gr_new] ch0 class=0x0019
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] ch0 size=32 align=16 flags=0x00000006
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] gpuobj c00000005eedae40
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] global heap fallback
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_ref_add] ch0 h=0x80000013 gpuobj=c00000005eedae40
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_hash_handle] ch0 handle=0x00000000 hash=0x00000018
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_insert] collision ch0 0x00000018: h=0x80000011
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_insert] insert ch0 0x00000020: h=0x80000013, c=0x00103395
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0x800c6441, nr=0x41, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_gr_new] ch0 class=0x005c
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] ch0 size=32 align=16 flags=0x00000006
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] gpuobj c00000005b739640
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] global heap fallback
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_ref_add] ch0 h=0x80000014 gpuobj=c00000005b739640
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_hash_handle] ch0 handle=0x00000000 hash=0x00000020
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_insert] collision ch0 0x00000020: h=0x80000013
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_insert] collision ch0 0x00000028: h=0x80000015
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_insert] collision ch0 0x00000030: h=0x80000016
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_insert] collision ch0 0x00000038: h=0x80000017
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_insert] insert ch0 0x00000040: h=0x80000014, c=0x00103397
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0x800c6441, nr=0x41, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_gr_new] ch0 class=0x0039
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] ch0 size=32 align=16 flags=0x00000006
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] gpuobj c00000005ee23340
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] global heap fallback
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_ref_add] ch0 h=0x80000018 gpuobj=c00000005ee23340
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_hash_handle] ch0 handle=0x00000000 hash=0x00000040
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_insert] collision ch0 0x00000040: h=0x80000014
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_insert] insert ch0 0x00000048: h=0x80000018, c=0x00103399
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0x800c6441, nr=0x41, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_gr_new] ch0 class=0x4097
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] ch0 size=32 align=16 flags=0x00000006
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] gpuobj c000000057e84180
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_new] global heap fallback
Jul 13 10:38:31 localhost kernel: [drm:nouveau_gpuobj_ref_add] ch0 h=0x80000019 gpuobj=c000000057e84180
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_hash_handle] ch0 handle=0x00000000 hash=0x00000048
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_insert] collision ch0 0x00000048: h=0x80000018
Jul 13 10:38:31 localhost kernel: [drm:nouveau_ramht_insert] insert ch0 0x00000050: h=0x80000019, c=0x0010339b
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0086420, nr=0x20, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:drm_addctx] 1
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0x80086422, nr=0x22, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0x8008642a, nr=0x2a, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:drm_lock] 1 (pid 2841) requests lock (0x00000000), flags = 0x00000000
Jul 13 10:38:31 localhost kernel: [drm:drm_lock] 1 has lock
Jul 13 10:38:31 localhost kernel: [drm:drm_fasync] fd = 7, device = 0xe200
Jul 13 10:38:31 localhost kernel: [drm:drm_stub_open] 
Jul 13 10:38:31 localhost kernel: [drm:drm_open_helper] pid = 2841, minor = 0
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0406400, nr=0x00, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0406400, nr=0x00, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:drm_release] open_count = 2
Jul 13 10:38:31 localhost kernel: [drm:nouveau_fifo_cleanup] clearing FIFO enables from filp
Jul 13 10:38:31 localhost kernel: [drm:drm_release] pid = 2841, device = 0xe200, open_count = 2
Jul 13 10:38:31 localhost kernel: [drm:drm_fasync] fd = -1, device = 0xe200
Jul 13 10:38:31 localhost kernel: [drm:drm_stub_open] 
Jul 13 10:38:31 localhost kernel: [drm:drm_open_helper] pid = 2841, minor = 0
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0106407, nr=0x07, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] ret = fffffff3
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0106401, nr=0x01, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0106401, nr=0x01, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0x40046402, nr=0x02, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:drm_add_magic] 1
Jul 13 10:38:31 localhost kernel: [drm:drm_getmagic] 1
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0406400, nr=0x00, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0xc0406400, nr=0x00, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:drm_ioctl] pid=2841, cmd=0x80046411, nr=0x11, dev 0xe200, auth=1
Jul 13 10:38:31 localhost kernel: [drm:drm_authmagic] 1
Jul 13 10:38:31 localhost kernel: [drm:drm_remove_magic] 1
Jul 13 10:38:31 localhost kernel: [drm:drm_release] open_count = 2
Jul 13 10:38:31 localhost kernel: [drm:nouveau_fifo_cleanup] clearing FIFO enables from filp
Jul 13 10:38:31 localhost kernel: [drm:drm_release] pid = 2841, device = 0xe200, open_count = 2
Jul 13 10:38:31 localhost kernel: [drm:drm_fasync] fd = -1, device = 0xe200
Jul 13 10:38:33 localhost kernel: [drm:drm_do_vm_sg_nopage] 

--------------080702080004090900050004
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------080702080004090900050004--
