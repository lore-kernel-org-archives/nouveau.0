From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: Re: Synchronization mostly missing?
Date: Mon, 28 Dec 2009 14:53:36 +0100
Message-ID: <ff13bc9a0912280553y37ef3177o5fc4430a204b9166@mail.gmail.com>
References: <ff13bc9a0912271941s5d465634te43213ea9df1d14f@mail.gmail.com>
	<87d41zn20v.fsf@riseup.net>
	<ff13bc9a0912272255n13e3ab3wf1c126b0341045e2@mail.gmail.com>
	<586c2acd0912272315o4e2858b5gffd76b24ad741ee9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <586c2acd0912272315o4e2858b5gffd76b24ad741ee9-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

It looks like there are two bugs.

One seems related to some kind of cache of GART memory which does not
get flushed, causes significant corruption and is worked around by
putting buffers in VRAM.
For some reason, adding syncing instead of putting buffers of VRAM
does seem to greatly reduce the symptoms of this bug and fully removes
them for some programs, for not for all.

However, there is another one, which is still present with buffers in
VRAM but is eliminated if I add syncing with the DMA_FENCE mechanism
at the end of draw_arrays and draw_elements. This one may be more
widely reproducible.

Try running two or more copies of mesa/progs/demos/dinoshade, all visible.
Do you see a flashing yellow region on the floor?
I do. If I add NV40_TCL_NOTIFY or DMA_FENCE based synchronization, the
problem disappears.
This also happens if you move around the window, presumably due to the X server.

It seems that M2MF/FIFO-based fencing does indeed work for our
purposes, but only if there is a single application running.
If there are multiple applications, then the 3D engine DMA_FENCE-based
mechanism somehow waits more and keeps working while FIFO/M2MF-based
fencing fails.

I'm not sure why this is the case though.
Using nVidia ctxprogs has no effect.

Another things that comes to mind (purely speculative) is that the
FIFO synchronization may be due to the fact that the GPU component
that reads from the FIFO is the same one that reads the vertices or
other data and it prioritizes that over reading commands, but having
multiple contexts makes that no longer be the case.
