From: "Shinpei KATO" <shinpei-a3aLqY3FAeqkRP3n4FtbsiGn5s73+xxf@public.gmane.org>
Subject: Re: SERIALIZE command
Date: Sat, 10 Apr 2010 08:43:35 +0900
Message-ID: <000001cad83e$7a5abf60$6f103e20$@is.s.u-tokyo.ac.jp>
References: <000c01cad7f4$e7d0e6e0$b772b4a0$@is.s.u-tokyo.ac.jp>
	<201004091605.34175.koriakin@0x04.net>
	<000401cad812$e33e6ad0$a9bb4070$@is.s.u-tokyo.ac.jp>
	<201004092116.33489.koriakin@0x04.net>
	<000001cad833$005ae8d0$0110ba70$@is.s.u-tokyo.ac.jp>
	<t2o586c2acd1004091610o4c88fa92y26f092b57430014d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <t2o586c2acd1004091610o4c88fa92y26f092b57430014d-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

> > By the way, when I was dumping the commands, I sometimes saw 0x00000000
> without any data.
> > Do you have any idea what this value means? (just a NOP?)
> 
> That's probably the null object (handle=0, class=0x30). It's created
> for every channel, see libdrm/nouveau_channel.c:86.

Do we write data (0x00000000) to the pushbuf (chan->cur) when we create an
object?.
Because I see that mostly every pushbuf flush, by the pushbuf_flush()
function, includes multiple 0x00000000 values, which are not written through
BEGIN_RING().
I am not certain who writes these values to the pushbuf.
They may be written through OUT_RING(), but I am sure that they are not
following any header data written through BEGIN_RING().
Do you think it is possible that someone just writes 0x00000000 to the
pushbuf?
FYI, I am dumping the pushbuf in such a way that (1) outputs the data A
(packet header) at the start address of the pushbuf, (2) gets the size X by
(A >> 18 & 0x3fff), (3) skips the address by X * 32, and (4) outputs the
data again.

> >> - m2mf [5039]: memory copies
> >> - eng2d [502d]: 2d engine
> >> - tesla [5097, 8297, 8397, 8597]: 3d engine
> >> - turing [50c0, 85c0]: computation engine: CUDA and the like
> >>
> >> Very likely there are more types, using different engine than PGRAPH,
> but
> >> we
> >> don't know anything about them yet. At the very least there should be
> the
> >> video decoding engine.
> >
> > Got it.
> > Regarding turing, you mean that Nouveau now supports CUDA?
> 
> I think the kernel allows that object to be created, but that's all.
> We don't have any userspace GPGPU library yet.

Ok. Well, it is wonderful if Nouveau supports CUDA in the user space someday
;-)

Thanks,
- Shinpei
