From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: Re: Synchronization mostly missing?
Date: Mon, 28 Dec 2009 06:50:34 +0100
Message-ID: <ff13bc9a0912272150sabc6e89h4f41b4303e7404bc@mail.gmail.com>
References: <ff13bc9a0912271941s5d465634te43213ea9df1d14f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <ff13bc9a0912271941s5d465634te43213ea9df1d14f-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
List-Id: nouveau.vger.kernel.org

I figured out the registers.

There is a fence/sync mechanism which apparently triggers after
rendering is finished.
There are two ways to use it, but they trigger at the same time
(spinning in a loop on the CPU checking them, they trigger at the same
iteration or in two successive iterations).

The first is the "sync" notifier, which involves a notifier object set
at NV40TCL_DMA_NOTIFY.
When NV40TCL_NOTIFY, with argument 0, followed by NV40TCL_NOP, with
argument 0 is inserted in the ring, the notifier object will be
notified when rendering is finished.
fbcon uses this to sync rendering.
Currently the Mesa driver sets an object but does not use it.
The renouveau traces use this mechanism only in the
EXT_framebuffer_object tests.
It's not clear what the purpose of the NOP is, but it seems necessary.

The second is the fence mechanism, which involves an object set at
NV40TCL_DMA_FENCE.
When register 0x1d70 is set, the value set there will be written to
the object at the offset programmed in 0x1d6c.
The offset in 0x1d6c must be 16-byte aligned, but the GPU seems to
only write 4 bytes with the sequence number.
Nouveau does not use this currently, and sets NV40TCL_DMA_FENCE to 0.
The nVidia driver uses this often. It allocates a 4KB object and asks
the GPU to put the sequence number always at offset 0x5c0. Why it does
this rather than allocating a 16 byte object and using offset 0 is
unknown.

IMHO the fence mechanism should be implemented in the kernel along
with the current FIFO fencing, and should protect the relocated buffer
object.
