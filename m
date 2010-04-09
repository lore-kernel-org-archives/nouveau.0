From: "Shinpei KATO" <shinpei-a3aLqY3FAeqkRP3n4FtbsiGn5s73+xxf@public.gmane.org>
Subject: Re: SERIALIZE command
Date: Sat, 10 Apr 2010 07:21:25 +0900
Message-ID: <000001cad833$005ae8d0$0110ba70$@is.s.u-tokyo.ac.jp>
References: <000c01cad7f4$e7d0e6e0$b772b4a0$@is.s.u-tokyo.ac.jp>
	<201004091605.34175.koriakin@0x04.net>
	<000401cad812$e33e6ad0$a9bb4070$@is.s.u-tokyo.ac.jp>
	<201004092116.33489.koriakin@0x04.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <201004092116.33489.koriakin-mP9o5jsk0RY@public.gmane.org>
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
To: =?utf-8?Q?'Marcin_Ko=C5=9Bcielnicki'?= <koriakin-mP9o5jsk0RY@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi,

Thanks again for your reply!

> > I tried inserting the 0x110 commands with NvSubM2MF (subc=0), MvSubSw
> > (subc=1), NvSub2D (subc=2), NvSubGdiRect (subc=3), NvSubImageBlit
> (subc=4).
> > As a result, I got the PFIFO_CACHE_ERROR interrupts, with respect to those
> > with NvSubSw and NvSubImageBlit. I am really not certain what
> > PFIFO_CACHE_ERROR indicates, but seems they do not work correctly? Well,
> > those with NvSubM2MF, NvSub2D and NvSubGdiRect are still very helpful
> > though.
> 
> This is not how it works.
> 
> The command channels on nvidia hardware are split into 8 identical so-called
> subchannels. The consts you're refering to are subchannel numbers.
> 
> However, these subchannels aren't constantly bound to the same objects -
> you
> bind an object to a subchannel by executing command 0 with data being the
> RAMHT handle of an object.
> 
> The Nv* consts you're referring to are only valid in kernel, and represent
> the
> bindings it sets up at start. Most of them don't even apply to NV50. Also,
> NvSubSw is bound to a software object.

Oops... I thought that each subchannel is always bound to the same object, and I was actually looking at only the kernel driver ;-)
I have been trying to understand the behavior of GPU operations, using Gallium demo applications.
To do so, I was dumping the commands sent from the user space (Nouveau/Gallium libdrm), by mapping the pushbuf to the kernel virtual address  in the kernel driver, to see what is going on.
I was also inserting another command in the kernel driver, like in nouveau_gem_ioctl_pushbuf(), to see what happens. 
Since several Gallium demo applications seem to use the subchannels in the same manner, I misunderstood that they are constantly bound to the same objects... 
I should have looked into the libdrm code in detail. Now I see them, thanks.
By the way, when I was dumping the commands, I sometimes saw 0x00000000 without any data.
Do you have any idea what this value means? (just a NOP?)

> PFIFO_CACHE_ERROR is an error that happens when the PFIFO puller encounters
> some problems. One of the causes is submitting a command on a subchannel
> which
> isn't actually bound to anything, which is what happens here.
> 
> Software objects are fake objects where you don't actually bind any object
> to
> a subchannel, and instead trap the PFIFO_CACHE_ERROR this causes on command
> submission and do something on the host side. We use this for syncing with
> vblank on nv50. These don't support the SERIALIZE command because they're
> not
> real objects.

So I was sending those commands with unbounded subchannels, that is why I got the PFIFO_CACHE_ERROR interrupts.

> Basically, there exist only 4 types of real objects you can submit commands
> on
> and bind to subchans:
> 
> - m2mf [5039]: memory copies
> - eng2d [502d]: 2d engine
> - tesla [5097, 8297, 8397, 8597]: 3d engine
> - turing [50c0, 85c0]: computation engine: CUDA and the like
> 
> Very likely there are more types, using different engine than PGRAPH, but
> we
> don't know anything about them yet. At the very least there should be the
> video decoding engine.

Got it.
Regarding turing, you mean that Nouveau now supports CUDA?

Thanks,
- Shinpei
