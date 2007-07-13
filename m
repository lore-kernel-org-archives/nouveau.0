From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: NV43 + PPC64 = :(
Date: Sat, 14 Jul 2007 08:35:33 +1000
Message-ID: <1184366133.6059.255.camel@localhost.localdomain>
References: <4697BEF3.1020903@us.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4697BEF3.1020903-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ian Romanick <idr-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


> However, during X-server start up, the system hard-locks.  Since Apple
> systems don't have a reset button (sigh...), I have to power-cycle the
> machine.  I cannot ssh into the machine, and it's not pingable.  It's
> really toast.  I've attached a log with DRM debug messages.  The bits
> about "iommu_alloc failed" seem suspicious to me.

Yup, that means the dma-mapping failed. What are you trying to map ? I
see a lot of attempts at mapping 524288 pages which looks very wrong to
me. The G5 is an iommu space configured to 2GB so I doubt it would run
out that easily, I suspect you are not passing the wrong page count to
pci_map_* or you are not terminating your sg list properly.

> I don't have another system with an Nvidia card to test.  I'd appreciate
> it if someone could test this patch on x86 or x86-64 and report results
> back.  I'd like to determine if the patch is broken, just broken on
> PPC64, or if something else is broken.

The use of virt_to_bus is generally broken, so nouveau needs to be
adapted to use DMA mappings.

Looking at the patch...

+                                       dev->sg->busaddr[idx] =
+                                               pci_map_page(dev->pdev,
+                                                            dev->sg->pagelist[idx],
+                                                            0,
+                                                            DMA_31BIT_MASK,
+                                                            DMA_BIDIRECTIONAL);
+
+                                       if (dev->sg->busaddr[idx] == 0) {
+                                               return DRM_ERR(ENOMEM);

The above error checking is incorrect. You need to use dma_mapping_error()
on the resulting bus address to check for errors. (0 is a valid DMA
address actually, we use ~0 to indicate errors).

Also, you are passing "DMA_31BIT_MASK" to the "size" argument of
dma_map_page() which is what's causing the error in the fist place :-) If
you are mapping one page, you should pass PAGE_SIZE there.

If you have constraints for those to be in the 31 bits space, you need to
set those with your device DMA mask (but on the G5, iommu allocs are always
in 31 bits space anyway so you are safe there).

Also, if you're building an sglist, you shouldn't have to call dma_map_page
for every page. Just fill an sglist and call pci_map_sg(). The iommu code will
do virtual merging, that is, it will potentially return less entries than
what you passed in, as it will attempt to virtually merge the pages in
the DMA space (thus allowing you to create smaller scatter/gather list in
your HW, which is generally more efficient).

Cheers,
Ben.
