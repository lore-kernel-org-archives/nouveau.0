From: "Shinpei KATO" <shinpei-a3aLqY3FAeqkRP3n4FtbsiGn5s73+xxf@public.gmane.org>
Subject: Re: Interrupt setting
Date: Sun, 14 Mar 2010 02:49:18 +0900
Message-ID: <000401cac2d5$837891e0$8a69b5a0$@is.s.u-tokyo.ac.jp>
References: <000301cac169$2a657720$7f306560$@is.s.u-tokyo.ac.jp>
	<586c2acd1003122052m37ecc1eex73f9d163031bddfd@mail.gmail.com>
	<000001cac271$8d3898b0$a7a9ca10$@is.s.u-tokyo.ac.jp>
	<ff13bc9a1003130623t2afc68abj49e3a60262f591fc@mail.gmail.com>
	<000001cac2bd$4a8f1920$dfad4b60$@is.s.u-tokyo.ac.jp>
	<ff13bc9a1003130710r4747c095jcc5044f4770e6e69@mail.gmail.com>
	<000101cac2c5$2cc38f40$864aadc0$@is.s.u-tokyo.ac.jp>
	<ff13bc9a1003130811k673d3b36r44980887f51df103@mail.gmail.com>
	<000201cac2cb$6ddb5200$4991f600$@is.s.u-tokyo.ac.jp>
	<000301cac2cc$dd168d00$9743a700$@is.s.u-tokyo.ac.jp>
	<586c2acd1003130936v1e40b996wee9f6328dfae86ef@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <586c2acd1003130936v1e40b996wee9f6328dfae86ef-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: ja
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: 'Younes Manton' <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Dear Younes,

> > Just one more thing.
> > If two commands, (1) simple DMA data copies and (2) fencing, are executed in
> > this order, it is possible to have the fence value written before completing
DMA
> > data copies, since DMA and GPU are independent, isn't is?
> 
> No, the fence value will be written after the DMA completes. There is
> no independent DMA controller on the GPU, all memory copies are done
> by the GPU and are no different than the drawing commands.

Ahh that is why I was so confused; I thought DMAC is independent ;-)
I maybe read somewhare a wrong article saying GPU operations can be overlapped
with DMA transactions...

> Here is a quick example, I copied them from
> src/gallium/drivers/nouveau/nv04_surface_2d.c and edited them slightly
> in case you want to look at it yourself:
> 
> /* Set up a 2D blit operation to copy an image with dimensions w,h
> from src_bo at sx,sy to dst_bo at dx,dy */
> MARK_RING (chan, 12, 4);
> BEGIN_RING(chan, surf2d, NV04_CONTEXT_SURFACES_2D_DMA_IMAGE_SOURCE, 2);
> OUT_RELOCo(chan, src_bo, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
> OUT_RELOCo(chan, dst_bo, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
> BEGIN_RING(chan, surf2d, NV04_CONTEXT_SURFACES_2D_FORMAT, 4);
> OUT_RING  (chan, format);
> OUT_RING  (chan, (dst_pitch << 16) | src_pitch);
> OUT_RELOCl(chan, src_bo, src->offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
> OUT_RELOCl(chan, dst_bo, dst->offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
> BEGIN_RING(chan, blit, 0x0300, 3);
> OUT_RING  (chan, (sy << 16) | sx);
> OUT_RING  (chan, (dy << 16) | dx);
> OUT_RING  (chan, ( h << 16) |  w);
> 
> /* Set up a general memory-to-memory operation to copy w*h*blocksize
> bytes from src_bo + src_offset to dst_bo + dst_offset */
> MARK_RING (chan, 3 + ((h / 2047) + 1) * 9, 2 + ((h / 2047) + 1) * 2);
> BEGIN_RING(chan, m2mf, NV04_MEMORY_TO_MEMORY_FORMAT_DMA_BUFFER_IN, 2);
> OUT_RELOCo(chan, src_bo, NOUVEAU_BO_GART | NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
> OUT_RELOCo(chan, dst_bo, NOUVEAU_BO_GART | NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
> BEGIN_RING(chan, m2mf, NV04_MEMORY_TO_MEMORY_FORMAT_OFFSET_IN, 8);
> OUT_RELOCl(chan, src_bo, src_offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_GART
> | NOUVEAU_BO_RD);
> OUT_RELOCl(chan, dst_bo, dst_offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_GART
> | NOUVEAU_BO_WR);
> OUT_RING  (chan, src_pitch);
> OUT_RING  (chan, dst_pitch);
> OUT_RING  (chan, w * util_format_get_blocksize(src->texture->format));
> OUT_RING  (chan, h);
> OUT_RING  (chan, 0x0101);
> OUT_RING  (chan, 0);
> 
> /* Set up a fill operation to fill a rectangle in dst_bo with
> coordinates dx,dy,w,h with some solid color */
> MARK_RING (chan, 16, 4);
> BEGIN_RING(chan, surf2d, NV04_CONTEXT_SURFACES_2D_DMA_IMAGE_SOURCE, 2);
> OUT_RELOCo(chan, dst_bo, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
> OUT_RELOCo(chan, dst_bo, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
> BEGIN_RING(chan, surf2d, NV04_CONTEXT_SURFACES_2D_FORMAT, 4);
> OUT_RING  (chan, cs2d_format);
> OUT_RING  (chan, (dst_pitch << 16) | dst_pitch);
> OUT_RELOCl(chan, dst_bo, dst->offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
> OUT_RELOCl(chan, dst_bo, dst->offset, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
> BEGIN_RING(chan, rect, NV04_GDI_RECTANGLE_TEXT_COLOR_FORMAT, 1);
> OUT_RING  (chan, gdirect_format);
> BEGIN_RING(chan, rect, NV04_GDI_RECTANGLE_TEXT_COLOR1_A, 1);
> OUT_RING  (chan, value);
> BEGIN_RING(chan, rect, NV04_GDI_RECTANGLE_TEXT_UNCLIPPED_RECTANGLE_POINT(0),
> 2);
> OUT_RING  (chan, (dx << 16) | dy);
> OUT_RING  (chan, ( w << 16) |  h);
> 
> /* Tell the GPU to execute all of the commands in the pushbuffer */
> /* This will cause the kernel to emit a fence with some value X after
> the last command in the pushbuffer */
> FIRE_RING(chan)
> 
> while (nvchan_rd32(chan, 0x48) != X)
> {
>      /* wait... */
> }
> 
> /* At this point we are guaranteed that all 3 operations are complete
> because the GPU will only write X into the register after it has seen
> the fence command created by FIRE_RING() and it will only see that
> command after it has seen and executed all other commands. */

I am well conviced by the example.
Coundn't understand this much by myself. Thanks!

Shinpei
