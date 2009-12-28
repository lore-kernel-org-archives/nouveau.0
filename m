From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: Re: Synchronization mostly missing?
Date: Mon, 28 Dec 2009 07:55:58 +0100
Message-ID: <ff13bc9a0912272255n13e3ab3wf1c126b0341045e2@mail.gmail.com>
References: <ff13bc9a0912271941s5d465634te43213ea9df1d14f@mail.gmail.com>
	<87d41zn20v.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <87d41zn20v.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

> Can you reproduce this with your vertex buffers in VRAM instead of GART?
> (to rule out that it's a fencing issue).

Putting the vertex buffers in VRAM makes things almost perfect, but
still with rare artifacts.
In particular, the yellow arrow in dinoshade sometimes becames a
yellow polygon on the floor, which happens almost every frame if I
move the window around.
It does fix demos/engine, blender and etracer is almost perfect.

Using my sync patch fixes demos/engine and demos/dinoshade, but still
leaves artifacts in blender when moving the rectangle and artifacts in
etracer.

Putting the vertex buffers in VRAM _AND_ adding my sync patch makes
things perfect on my system.

Using sync + a delay loop before drawing makes things better but still
problematic.

Also note that both adding wbinvd in the kernel at the start of push
buffer submission, running with "nopat" and synchronizing with the
current fence in the kernel had no effect on demos/engine artifacts.

Preventing loading of intel_agp did not seem to have any effect either
(but strangely, it still listed the aperture size, not sure what's up
there).

The last test I tried was, all together:
1. My nv40_sync patch
2. 3 wbinvd followed by spinning 10000 times in the kernel at the
start of pushbuffer validation
3. Adding
BEGIN_RING(curie, NV40TCL_VTX_CACHE_INVALIDATE, 1);
OUT_RING(0);
before and after draw_elements and draw_arrays
4. Removing intel_agp

The logo on etracer's splash screen still, on some frames, flickered.
Only putting vertex buffers in VRAM fixed that.

I'm not really sure what is happening there.

It seems that there is the lack of synchronization plus some other problem.

Maybe there is indeed an on-GPU cache for AGP/PCI memory which isn't
getting flushed.
Maybe NV40TCL_VTX_CACHE_INVALIDATE should be used but not in the way I did.
I couldn't find it in renouveau traces, who did reverse engineer that?
What does that do?

Also, what happens when I remove intel_agp? Does it use PCI DMA?

BTW, it seems to me that adding the fencing mechanism I described is
necessary even if the vertices are read before the FIFO continues,
since rendering is not completed and currently I don't see anything
preventing TTM from, for instance, evicting the render buffer while it
is being rendered to.
