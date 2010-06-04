From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: PFIFO_DMA_PUSHER + Xen + NV30 + questions.
Date: Fri, 4 Jun 2010 18:02:50 -0400
Message-ID: <AANLkTimyQzqCw1QnSNxmUvilOqaWe60twrNGo4n8BIcx@mail.gmail.com>
References: <20100604212455.GA7143@phenom.dumpdata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100604212455.GA7143-6K5HmflnPlqSPmnEAIUT9EEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Konrad Rzeszutek Wilk <konrad.wilk-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, Jun 4, 2010 at 5:24 PM, Konrad Rzeszutek Wilk
<konrad.wilk-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org> wrote:
> Hello,
>
> I am kernel engineer working on PV-OPS kernel trying to get it work in Do=
m0
> with an NVidia (NV30 right now) card.
>
> But there are issues, such as that the
> pv-ops kernel has a different understanding of memory (for details check
> out: http://wiki.xensource.com/xenwiki/XenPVOPSDRM).
>
> I've fleshed out most of them (like GART had the wrong phys addresses,
> ouch!), but the one that I am stumbling at is that I see the PFIFO_DMA_PU=
SHER,
> which I am to understand means: "Oh, the GPU obj operation you stuck on t=
he
> RAMHT/RAMIN is busted."
>
> So first of, is there a register to poke to find out which DMA operation
> it is talking about ? Or is it pretty fast - so I can surmise that:
>
> [ =A0 13.271499] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75=
 - ch0 handle=3D0x80000001
> [ =A0 13.271499] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86=
 - hash=3D0x00000088
> [ =A0 13.271499] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - i=
nsert ch0 0x00000088: h=3D0x80000001, c=3D0x80011639
> [ =A0 13.271499] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 -=
 ch0 h=3D0x8000000e gpuobj=3Dffff88000219ac00
> [ =A0 13.271499] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75=
 - ch0 handle=3D0x8000000e
> [ =A0 13.271499] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86=
 - hash=3D0x000000f0
> [ =A0 13.271499] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - i=
nsert ch0 0x000000f0: h=3D0x8000000e, c=3D0x80000004
> [ =A0 13.271499] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:679 -=
 ch0 class=3D0x003d offset=3D0x40000 size=3D0x20
> [ =A0 13.271499] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:680 -=
 access=3D0 target=3D0
> [ =A0 13.271499] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:216 - ch0=
 size=3D16 align=3D16 flags=3D0x00000006
> [ =A0 13.271499] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:224 - gpu=
obj ffff88000219ac60
> [ =A0 13.271499] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_new:241 - glo=
bal heap fallback
> [ =A0 13.271499] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_ref_add:457 -=
 ch0 h=3D0x80000006 gpuobj=3Dffff88000219ac60
> [ =A0 13.271499] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:75=
 - ch0 handle=3D0x80000006
> [ =A0 13.271499] [drm] nouveau 0000:01:00.0: nouveau_ramht_hash_handle:86=
 - hash=3D0x000000b0
> [ =A0 13.271499] [drm] nouveau 0000:01:00.0: nouveau_ramht_insert:141 - i=
nsert ch0 0x000000b0: h=3D0x80000006, c=3D0x8000163a
> [ =A0 13.271499] [drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initi=
alised FIFO 0
> [ =A0 13.760068] [drm] nouveau 0000:01:00.0: PFIFO_DMA_PUSHER - Ch 0
> [ =A0 13.271499] [drm] nouveau 0000:01:00.0: nouveau_gpuobj_dma_new:679 -=
 ch0 class=3D0x003d offset=3D0x0 size=3D0x8000000
>
> the error is for the blobs that have been inserted via _ramht_insert?
> Or should I interogate some register to find out what it thinks is
> wrong?
>
> P.S.
> 1) If you are interested in seeing the git tree and all of the hacks I've
> employed so far:
> git://git.kernel.org/pub/scm/linux/kernel/git/konrad/xen.git dev.experime=
nt.kms
> 2) A serial log on baremetal: http://darnok.org/tst004.baremetal.1
> 3) And on Xen:http://darnok.org/tst004.xen.1 where the PFIFO_DMA_PUSHER
> is the king.

It means the card started fetching unexpected garbage from the ring
buffer. Either you pointed the card at garbage instead of a sensible
buffer (nv10_fifo_create_context for nv30 IIRC) or your initial
pushbuf (submitted by nouveau_dma_init) contains garbage. Or maybe
something else, but based on your log that would be my guess.
