From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: SERIALIZE command
Date: Fri, 9 Apr 2010 19:10:20 -0400
Message-ID: <t2o586c2acd1004091610o4c88fa92y26f092b57430014d@mail.gmail.com>
References: <000c01cad7f4$e7d0e6e0$b772b4a0$@is.s.u-tokyo.ac.jp>
	<201004091605.34175.koriakin@0x04.net>
	<000401cad812$e33e6ad0$a9bb4070$@is.s.u-tokyo.ac.jp>
	<201004092116.33489.koriakin@0x04.net>
	<000001cad833$005ae8d0$0110ba70$@is.s.u-tokyo.ac.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <000001cad833$005ae8d0$0110ba70$@is.s.u-tokyo.ac.jp>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Shinpei KATO <shinpei-a3aLqY3FAeqkRP3n4FtbsiGn5s73+xxf@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

2010/4/9 Shinpei KATO <shinpei-a3aLqY3FAeqkRP3n4FtbsiGn5s73+xxf@public.gmane.org>:
> Hi,
>
> Thanks again for your reply!
>
>> > I tried inserting the 0x110 commands with NvSubM2MF (subc=3D0), MvSubSw
>> > (subc=3D1), NvSub2D (subc=3D2), NvSubGdiRect (subc=3D3), NvSubImageBlit
>> (subc=3D4).
>> > As a result, I got the PFIFO_CACHE_ERROR interrupts, with respect to t=
hose
>> > with NvSubSw and NvSubImageBlit. I am really not certain what
>> > PFIFO_CACHE_ERROR indicates, but seems they do not work correctly? Wel=
l,
>> > those with NvSubM2MF, NvSub2D and NvSubGdiRect are still very helpful
>> > though.
>>
>> This is not how it works.
>>
>> The command channels on nvidia hardware are split into 8 identical so-ca=
lled
>> subchannels. The consts you're refering to are subchannel numbers.
>>
>> However, these subchannels aren't constantly bound to the same objects -
>> you
>> bind an object to a subchannel by executing command 0 with data being the
>> RAMHT handle of an object.
>>
>> The Nv* consts you're referring to are only valid in kernel, and represe=
nt
>> the
>> bindings it sets up at start. Most of them don't even apply to NV50. Als=
o,
>> NvSubSw is bound to a software object.
>
> Oops... I thought that each subchannel is always bound to the same object=
, and I was actually looking at only the kernel driver ;-)
> I have been trying to understand the behavior of GPU operations, using Ga=
llium demo applications.
> To do so, I was dumping the commands sent from the user space (Nouveau/Ga=
llium libdrm), by mapping the pushbuf to the kernel virtual address =A0in t=
he kernel driver, to see what is going on.
> I was also inserting another command in the kernel driver, like in nouvea=
u_gem_ioctl_pushbuf(), to see what happens.
> Since several Gallium demo applications seem to use the subchannels in th=
e same manner, I misunderstood that they are constantly bound to the same o=
bjects...
> I should have looked into the libdrm code in detail. Now I see them, than=
ks.
> By the way, when I was dumping the commands, I sometimes saw 0x00000000 w=
ithout any data.
> Do you have any idea what this value means? (just a NOP?)

That's probably the null object (handle=3D0, class=3D0x30). It's created
for every channel, see libdrm/nouveau_channel.c:86.

>> PFIFO_CACHE_ERROR is an error that happens when the PFIFO puller encount=
ers
>> some problems. One of the causes is submitting a command on a subchannel
>> which
>> isn't actually bound to anything, which is what happens here.
>>
>> Software objects are fake objects where you don't actually bind any obje=
ct
>> to
>> a subchannel, and instead trap the PFIFO_CACHE_ERROR this causes on comm=
and
>> submission and do something on the host side. We use this for syncing wi=
th
>> vblank on nv50. These don't support the SERIALIZE command because they're
>> not
>> real objects.
>
> So I was sending those commands with unbounded subchannels, that is why I=
 got the PFIFO_CACHE_ERROR interrupts.
>
>> Basically, there exist only 4 types of real objects you can submit comma=
nds
>> on
>> and bind to subchans:
>>
>> - m2mf [5039]: memory copies
>> - eng2d [502d]: 2d engine
>> - tesla [5097, 8297, 8397, 8597]: 3d engine
>> - turing [50c0, 85c0]: computation engine: CUDA and the like
>>
>> Very likely there are more types, using different engine than PGRAPH, but
>> we
>> don't know anything about them yet. At the very least there should be the
>> video decoding engine.
>
> Got it.
> Regarding turing, you mean that Nouveau now supports CUDA?

I think the kernel allows that object to be created, but that's all.
We don't have any userspace GPGPU library yet.
