From: "Shinpei KATO" <shinpei-a3aLqY3FAeqkRP3n4FtbsiGn5s73+xxf@public.gmane.org>
Subject: Re: Interrupt setting
Date: Sat, 13 Mar 2010 14:53:45 +0900
Message-ID: <000001cac271$8d3898b0$a7a9ca10$@is.s.u-tokyo.ac.jp>
References: <000301cac169$2a657720$7f306560$@is.s.u-tokyo.ac.jp>
	<000b01cac229$148be2c0$3da3a840$@is.s.u-tokyo.ac.jp>
	<586c2acd1003121730m377d3682q9b8df00ed797d765@mail.gmail.com>
	<000301cac24e$cf65bfb0$6e313f10$@is.s.u-tokyo.ac.jp>
	<586c2acd1003122052m37ecc1eex73f9d163031bddfd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <586c2acd1003122052m37ecc1eex73f9d163031bddfd-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

I appreciate your VERY helpful explanation!
Things are now more clear to me.

> >> Nouveau doesn't really make use of interrupts so you wont see them
> >> while running OpenGL. In general we make use of fences to signal when
> >> things of interest have occured. Is there something particular you're
> >> trying to accomplish or is this just a learning exercise?
> >
> > I have been using Nouveau for a research purpose, though it has been just a
> > month.
> > So I can say both something particular and a learning exercise.
> > I have tried understanding the behavir of fences, but a bit hard to catch up
> > the execution flow.
> >
> > To my understanding, for instance every time pushbuf ioctl is called, you
> > create a fence object.
> > Does this make a caller process to wait for a completion of a GPU command?
> > I inserted printk()s in nouveau_fence_wait(), but the process does not seem
> > sleeping.
> 
> I'm not the expert on these things so some of this may be incorrect.
> If so I hope someone will correct me...
> 
> We create a fence for every pushbuf, so when that fence is signalled
> we know that every command in the pushbuf has completed. Each fence
> has a sequence number which is simply an integer. So after the first
> pushbuf we will emit a fence with sequence #0, then 1, and so on. As
> the GPU is processing pushbufs it will write the sequence # of each
> fence it encounters in a register. By reading this register we know
> which commands are completed.

So a GPU itself updates the sequence # of each fence in a specific register, and we can let the Nouveau driver wait for a target
value to be written.
Do you know when the value is actually written?
If it is written when a "DMA transfer" is done, we dont know exactly when the corresponding GPU operation is finished.
Do you think it is possible to wait for a completion of a "GPU operation"?

> We use this mechanism when synchronization is required instead of
> interrupts. For example in the OpenGL driver if you issue a draw
> command referring to texture A that draw command will be in some
> pushbuf B. If you then attempt to write to texture A with the CPU
> immediately after, the OpenGL driver will check if texture A is
> referenced in a pending draw command and if so will flush the
> associated pushbuf, which results in a fence being emitted. The OpenGL
> driver will then attempt to map the texture. The kernel module will
> wait until that fence is signalled before allowing the OpenGL driver
> to map it so that synchronization is maintained, otherwise the CPU
> might alter the contents of the texture before the previous draw
> command was even seen by the GPU.

I see, so we need to explicitly call a synchronization function, something like nouveau_fence_wait(), to wait for a completion of a
GPU command.
I have been just checking default procedures with a single instance of an OpenGL app..., that is why I haven't seen a effect, but
now I understand the way!

> > I am also wondering if current GPUs can be set up to generate interrupts
> > when GPU commands are done.
> > My guess is that NV_MEMORY_TO_MEMORY_FORMAT_NOTIFY is to generate interrupts
> > when DMA transfers are done.
> > Am I misunderstanding?
> 
> There's another similar mechanism that the GPU supports, which is a
> notifier/semaphore. With this you can specify a memory location and a
> value and attach it to a specific command. The GPU will write the
> value to the memory location after that command completes and you can
> use the CPU to check it. You can also request that an interrupt be
> generated. This is independent of the pushbuf sequence numbering and
> is intended for more precise control. I don't know if we have any
> example code using a notifier that you can look at unfortunately, but
> it should be possible to generate an interrupt or write to a notifier
> after using M2MF to copy some memory like you said.

Fortunately, in an old version of Nouveau, I found a code in nouveau_fence_emit() that generates an interrupt with a notifier.
I copied and tried it, and it worked!
But, I am not sure if this is a notification for a completion of a GPU operation or a DMA transfer...

Best,
- Shinpei
