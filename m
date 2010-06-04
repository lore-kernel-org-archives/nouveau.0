From: Konrad Rzeszutek Wilk <konrad.wilk-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: PFIFO_DMA_PUSHER  + Xen + NV30 + questions.
Date: Fri, 4 Jun 2010 17:24:55 -0400
Message-ID: <20100604212455.GA7143@phenom.dumpdata.com>
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

Hello,

I am kernel engineer working on PV-OPS kernel trying to get it work in Dom0
with an NVidia (NV30 right now) card.

But there are issues, such as that the
pv-ops kernel has a different understanding of memory (for details check
out: http://wiki.xensource.com/xenwiki/XenPVOPSDRM).

I've fleshed out most of them (like GART had the wrong phys addresses,
ouch!), but the one that I am stumbling at is that I see the PFIFO_DMA_PUSHER,
which I am to understand means: "Oh, the GPU obj operation you stuck on the
RAMHT/RAMIN is busted."

So first of, is there a register to poke to find out which DMA operation
it is talking about ? Or is it pretty fast - so I can surmise that:

[   13.271499] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 - ch0 handle=0x80000001
[   13.271499] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 - hash=0x00000088
[   13.271499] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - insert ch0 0x00000088: h=0x80000001, c=0x80011639
[   13.271499] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - ch0 h=0x8000000e gpuobj=ffff88000219ac00
[   13.271499] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 - ch0 handle=0x8000000e
[   13.271499] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 - hash=0x000000f0
[   13.271499] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - insert ch0 0x000000f0: h=0x8000000e, c=0x80000004
[   13.271499] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:679 - ch0 class=0x003d offset=0x40000 size=0x20
[   13.271499] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:680 - access=0 target=0
[   13.271499] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch0 size=16 align=16 flags=0x00000006
[   13.271499] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpuobj ffff88000219ac60
[   13.271499] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - global heap fallback
[   13.271499] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 - ch0 h=0x80000006 gpuobj=ffff88000219ac60
[   13.271499] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75 - ch0 handle=0x80000006
[   13.271499] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86 - hash=0x000000b0
[   13.271499] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - insert ch0 0x000000b0: h=0x80000006, c=0x8000163a
[   13.271499] [drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 0
[   13.760068] [drm] nouveau 0000:01:00.0: PFIFO_DMA_PUSHER - Ch 0
[   13.271499] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:679 - ch0 class=0x003d offset=0x0 size=0x8000000

the error is for the blobs that have been inserted via _ramht_insert?
Or should I interogate some register to find out what it thinks is
wrong?

P.S.
1) If you are interested in seeing the git tree and all of the hacks I've
employed so far:
git://git.kernel.org/pub/scm/linux/kernel/git/konrad/xen.git dev.experiment.kms
2) A serial log on baremetal: http://darnok.org/tst004.baremetal.1
3) And on Xen:http://darnok.org/tst004.xen.1 where the PFIFO_DMA_PUSHER
is the king.
