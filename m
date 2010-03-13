From: "Shinpei KATO" <shinpei-a3aLqY3FAeqkRP3n4FtbsiGn5s73+xxf@public.gmane.org>
Subject: Re: Interrupt setting
Date: Sun, 14 Mar 2010 00:52:21 +0900
Message-ID: <000101cac2c5$2cc38f40$864aadc0$@is.s.u-tokyo.ac.jp>
References: <000301cac169$2a657720$7f306560$@is.s.u-tokyo.ac.jp>	
	<000b01cac229$148be2c0$3da3a840$@is.s.u-tokyo.ac.jp>	
	<586c2acd1003121730m377d3682q9b8df00ed797d765@mail.gmail.com>	
	<000301cac24e$cf65bfb0$6e313f10$@is.s.u-tokyo.ac.jp>	
	<586c2acd1003122052m37ecc1eex73f9d163031bddfd@mail.gmail.com>	
	<000001cac271$8d3898b0$a7a9ca10$@is.s.u-tokyo.ac.jp>	
	<ff13bc9a1003130623t2afc68abj49e3a60262f591fc@mail.gmail.com>	
	<000001cac2bd$4a8f1920$dfad4b60$@is.s.u-tokyo.ac.jp>
	<ff13bc9a1003130710r4747c095jcc5044f4770e6e69@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <ff13bc9a1003130710r4747c095jcc5044f4770e6e69-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: 'Luca Barbieri' <luca.barbieri-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Dear Luca,

> > Ok, I think I was misunderstanding.
> > This means we have to tell a GPU by sending another command to increment a
> fence
> > value.
> > Finally I believe I am correct ;-)
> 
> It actually sets an arbitrary value. The relevant code is in nouveau_fence.c:
>         BEGIN_RING(chan, NvSubSw, USE_REFCNT ? 0x0050 : 0x0150, 1);
>         OUT_RING(chan, fence->sequence);
> 
> The current sequence number is read with (in the same file):
> sequence = nvchan_rd32(chan, 0x48);
> 
> (on Riva TNT/TNT2, USE_REFCNT is false, and we trigger an interrupt
> for each fence completion so we can emulate that in software)

Sorry that I did not carefully read the code; I just remembered the code doing:
	fence->sequence = ++chan->fence.sequence
This means the fence # is incremented, but does not mean the fence # executed by
a GPU is always sequential.
I should have precisely mentioned this.

> > On the other hand, this means that, for now in Nouveau, we dont have a way
> to
> > tell a GPU to notify us of a completion of a DMA transfer.
> > Maybe an interrupt from a GPU (PGRAPH_BUFFER_NOTIFY or something) is needed
> for
> > this.
> > I understand this notification is not necessary now, because DMA
transactions
> > are managed by ring buffers.
> 
> Not sure what you mean.
> In theory, once the FIFO processes the next command, all transfers
> done by the previous one should be completed.
> Note that simple DMA data copies are done with FIFO commands too (with
> m2mf aka MEMORY_TO_MEMORY_FORMAT).
> Also, all the commands before it have obviously already been fetched
> from the FIFO.

Ok, I still may be misunderstanding.
I thought that, in nouveau_gem_ioctl_pushbuf(), you transfer the buffers to a
GPU by nv50_dma_push() in case of NV50.
My assumption is that each pushbuf may include more than one command; i.e., one
pushbuf procedure may include both DMA data copy and object drawing (I used a
term "GPU operation" for drawing).
Since you create one fence object for each pushbuf, I thought that we can
synchronize only with last the command.
Not sure if my assumption is correct...

Best,
- Shinpei
