From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 08/18] dma-mapping: add a new dma_alloc_noncoherent API
Date: Tue, 15 Sep 2020 17:51:12 +0200
Message-ID: <20200915155122.1768241-9-hch@lst.de>
References: <20200915155122.1768241-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <20200915155122.1768241-1-hch-jcswGhMUV9g@public.gmane.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Sender: "iommu" <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
To: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Bogendoerfer <tsbogend-I1c7kopa9pxLokYuJOExCg@public.gmane.org>, "James E.J. Bottomley" <James.Bottomley-d9PhHud1JfjCXq6kfMZ53/egYHeGw8Jk@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Matt Porter <mporter-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, Stefan Richter <stefanr-MtYdepGKPcBMYopoZt5u/LNAH6kLmebB@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux1394-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: nouveau.vger.kernel.org

Add a new API to allocate and free memory that is guaranteed to be
addressable by a device, but which potentially is not cache coherent
for DMA.

To transfer ownership to and from the device, the existing streaming
DMA API calls dma_sync_single_for_device and dma_sync_single_for_cpu
must be used.

For now the new calls are implemented on top of dma_alloc_attrs just
like the old-noncoherent API, but once all drivers are switched to
the new API it will be replaced with a better working implementation
that is available on all architectures.

Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
---
 Documentation/core-api/dma-api.rst | 75 ++++++++++++++----------------
 include/linux/dma-mapping.h        | 12 +++++
 2 files changed, 48 insertions(+), 39 deletions(-)

diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
index 90239348b30f6f..ea0413276ddb70 100644
--- a/Documentation/core-api/dma-api.rst
+++ b/Documentation/core-api/dma-api.rst
@@ -516,48 +516,56 @@ routines, e.g.:::
 	}
 
 
-Part II - Advanced dma usage
-----------------------------
+Part II - Non-coherent DMA allocations
+--------------------------------------
 
-Warning: These pieces of the DMA API should not be used in the
-majority of cases, since they cater for unlikely corner cases that
-don't belong in usual drivers.
+These APIs allow to allocate pages in the kernel direct mapping that are
+guaranteed to be DMA addressable.  This means that unlike dma_alloc_coherent,
+virt_to_page can be called on the resulting address, and the resulting
+struct page can be used for everything a struct page is suitable for.
 
-If you don't understand how cache line coherency works between a
-processor and an I/O device, you should not be using this part of the
-API at all.
+If you don't understand how cache line coherency works between a processor and
+an I/O device, you should not be using this part of the API.
 
 ::
 
 	void *
-	dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
-			gfp_t flag, unsigned long attrs)
+	dma_alloc_noncoherent(struct device *dev, size_t size,
+			dma_addr_t *dma_handle, enum dma_data_direction dir,
+			gfp_t gfp)
 
-Identical to dma_alloc_coherent() except that when the
-DMA_ATTR_NON_CONSISTENT flags is passed in the attrs argument, the
-platform will choose to return either consistent or non-consistent memory
-as it sees fit.  By using this API, you are guaranteeing to the platform
-that you have all the correct and necessary sync points for this memory
-in the driver should it choose to return non-consistent memory.
+This routine allocates a region of <size> bytes of consistent memory.  It
+returns a pointer to the allocated region (in the processor's virtual address
+space) or NULL if the allocation failed.  The returned memory may or may not
+be in the kernels direct mapping.  Drivers must not call virt_to_page on
+the returned memory region.
 
-Note: where the platform can return consistent memory, it will
-guarantee that the sync points become nops.
+It also returns a <dma_handle> which may be cast to an unsigned integer the
+same width as the bus and given to the device as the DMA address base of
+the region.
 
-Warning:  Handling non-consistent memory is a real pain.  You should
-only use this API if you positively know your driver will be
-required to work on one of the rare (usually non-PCI) architectures
-that simply cannot make consistent memory.
+The dir parameter specified if data is read and/or written by the device,
+see dma_map_single() for details.
+
+The gfp parameter allows the caller to specify the ``GFP_`` flags (see
+kmalloc()) for the allocation, but rejects flags used to specify a memory
+zone such as GFP_DMA or GFP_HIGHMEM.
+
+Before giving the memory to the device, dma_sync_single_for_device() needs
+to be called, and before reading memory written by the device,
+dma_sync_single_for_cpu(), just like for streaming DMA mappings that are
+reused.
 
 ::
 
 	void
-	dma_free_attrs(struct device *dev, size_t size, void *cpu_addr,
-		       dma_addr_t dma_handle, unsigned long attrs)
+	dma_free_noncoherent(struct device *dev, size_t size, void *cpu_addr,
+			dma_addr_t dma_handle, enum dma_data_direction dir)
 
-Free memory allocated by the dma_alloc_attrs().  All common
-parameters must be identical to those otherwise passed to dma_free_coherent,
-and the attrs argument must be identical to the attrs passed to
-dma_alloc_attrs().
+Free a region of memory previously allocated using dma_alloc_noncoherent().
+dev, size and dma_handle and dir must all be the same as those passed into
+dma_alloc_noncoherent().  cpu_addr must be the virtual address returned by
+the dma_alloc_noncoherent().
 
 ::
 
@@ -575,17 +583,6 @@ memory or doing partial flushes.
 	into the width returned by this call.  It will also always be a power
 	of two for easy alignment.
 
-::
-
-	void
-	dma_cache_sync(struct device *dev, void *vaddr, size_t size,
-		       enum dma_data_direction direction)
-
-Do a partial sync of memory that was allocated by dma_alloc_attrs() with
-the DMA_ATTR_NON_CONSISTENT flag starting at virtual address vaddr and
-continuing on for size.  Again, you *must* observe the cache line
-boundaries when doing this.
-
 
 Part III - Debug drivers use of the DMA-API
 -------------------------------------------
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index df0bff2ea750e0..4e1de194b45cbf 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -389,6 +389,18 @@ static inline unsigned long dma_get_merge_boundary(struct device *dev)
 }
 #endif /* CONFIG_HAS_DMA */
 
+static inline void *dma_alloc_noncoherent(struct device *dev, size_t size,
+		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
+{
+	return dma_alloc_attrs(dev, size, dma_handle, gfp,
+			DMA_ATTR_NON_CONSISTENT);
+}
+static inline void dma_free_noncoherent(struct device *dev, size_t size,
+		void *vaddr, dma_addr_t dma_handle, enum dma_data_direction dir)
+{
+	dma_free_attrs(dev, size, vaddr, dma_handle, DMA_ATTR_NON_CONSISTENT);
+}
+
 static inline dma_addr_t dma_map_single_attrs(struct device *dev, void *ptr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
-- 
2.28.0
