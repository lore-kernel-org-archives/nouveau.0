From: "Shinpei KATO" <shinpei-a3aLqY3FAeqkRP3n4FtbsiGn5s73+xxf@public.gmane.org>
Subject: Re: SERIALIZE command
Date: Sat, 10 Apr 2010 11:05:42 +0900
Message-ID: <000001cad852$55888a50$00999ef0$@is.s.u-tokyo.ac.jp>
References: <000c01cad7f4$e7d0e6e0$b772b4a0$@is.s.u-tokyo.ac.jp>
	<201004092116.33489.koriakin@0x04.net>
	<000001cad833$005ae8d0$0110ba70$@is.s.u-tokyo.ac.jp>
	<201004100110.43995.koriakin@0x04.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <201004100110.43995.koriakin-mP9o5jsk0RY@public.gmane.org>
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

> Plain 0 in a pushbuffer is just a nop, yes. It's inserted as a placeholder
> for unused relocations sometimes.

Ok, thanks.

> The known pushbuf commands are roughly:
> 
> - bits 0-1 = 0, bits 29-31 = 0, bits 16-17 = 0: submit methods, increasing
> kind. method is in bits 2-12, subchan in 13-15, method count in 18-28.
> Subsequent <method count> words in FIFO get pushed into sequential methods
> starting from the given one.
> - bits 0-1 = 0, bits 29-31 = 1: JMP to data & 0x1ffffffc
> - bits 0-1 = 0, bits 29-31 = 2, bits 16-17 = 0: submit methods, non-increasing
> kind. method is in bits 2-12, subchan in 13-15, method count in 18-28.
> Subsequent <method count> words in FIFO get pushed into that method. [NV10+]
> - bits 0-1 = 2: CALL to data & 0xfffffffc [NV11+]
> - bits 0-1 = 0, bits 29-31 = 0, bits 16-17 = 2: RET [NV11+]
> - bits 0-1 = 0, bits 29-31 = 0, bits 16-17 = 1: conditional. disables method
> submission if bits 4-15 of this command AND contents of PFIFO reg 2058 ==
> 0.
> Used for selecting individual cards in SLI configurations for part of the
> command stream [NV40+]
> - bits 0-1 = 0, bits 29-31 = 0, bits 16-17 = 3: big non-increasing method
> submission. like the other non-increasing method submission, but method
> count
> is now taken from next word after the command and can be much larger. Used
> for
> pushing big amounts of data through the PFIFO, like nv50-style index
> buffers.
> [NV50+... I think.]
> 
> There are likely more, but I don't recall any right now.

This is very enough!

> > > PFIFO_CACHE_ERROR is an error that happens when the PFIFO puller
> > > encounters some problems. One of the causes is submitting a command
> on a
> > > subchannel which
> > > isn't actually bound to anything, which is what happens here.
> > >
> > > Software objects are fake objects where you don't actually bind any
> > > object to
> > > a subchannel, and instead trap the PFIFO_CACHE_ERROR this causes on
> > > command submission and do something on the host side. We use this for
> > > syncing with vblank on nv50. These don't support the SERIALIZE command
> > > because they're not
> > > real objects.
> >
> > So I was sending those commands with unbounded subchannels, that is why
> I
> > got the PFIFO_CACHE_ERROR interrupts.
> 
> Yup. Or maybe you sent them on out software object, and nouveau didn't
> recognise it.
> 
> As I already mentioned, there are two kinds of objects you can bind to
> subchannels... software and PGRAPH objects. There are likely more for video
> dec, but meh.
> 
> For software objects, all methods >= 0x100 cause PFIFO_CACHE_ERRORs, which
> driver can trap and emulate, or not.
> 
> For PGRAPH objects, all methods >= 0x100 are passed on to PGRAPH and are
> handled there, perhaps causing PGRAPH_ILLEGAL_MTHD error if they happen
> to not exist.

Yeah I saw both PFIFO_CACHE_ERROR and PGRAPH>ILLEGAL_MTHD while I was trying some commands ;-)
Now things are more clear to me!

> Methods < 0x100 are handled directly by the PFIFO, and are independent of
> the
> current object. There are a couple of known ones...
>
> > > Basically, there exist only 4 types of real objects you can submit
> > > commands on
> > > and bind to subchans:
> > >
> > > - m2mf [5039]: memory copies
> > > - eng2d [502d]: 2d engine
> > > - tesla [5097, 8297, 8397, 8597]: 3d engine
> > > - turing [50c0, 85c0]: computation engine: CUDA and the like
> > >
> > > Very likely there are more types, using different engine than PGRAPH,
> but
> > > we
> > > don't know anything about them yet. At the very least there should be
> the
> > > video decoding engine.
> >
> > Got it.
> > Regarding turing, you mean that Nouveau now supports CUDA?
> 
> Kernel allows you to create the relevant object, but other than that there's
> no support. You can indeed run your gpu code under nouveau if you're happy
> with writing it in nv50 machine code and submitting via the pushbuffer
> interface. Also our current memory managment is totally unfit for GPGPU
> applications and will need to be redone before there's any hope of seeing
> CUDA
> or OpenCL support in nouveau.

Ok, since I read some article saying Nouveau is not yet ready for CUDA applications, I just wondered.
Hope to see the CUDA support someday!

> Also, if you have any more questions and don't hate IRC, you can come to
> #nouveau channel on freenode. Makes it easier to answer.

Now I am in ;-)
Thank you very much for your support.

Shinpei
