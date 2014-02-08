From: Daniel J Blueman <daniel-JCXMqzvhRcvYtjvyW6yDsg@public.gmane.org>
Subject: Re: nouveau graphical corruption in 3.13.2
Date: Sat, 8 Feb 2014 23:38:11 +0800
Message-ID: <CAMVG2stJPQhdmhVDJY8a93xjAWUtNptBbTv=KhAswBNfE+ECYA@mail.gmail.com>
References: <CAMVG2suzT1vphjHAUFCsbVBsd22U69jzQaKVwnEyGLBu6eGOSw@mail.gmail.com>
	<CAKb7Uvh8jPNcXAfVYkdC3y0wQ7icc52Cid_fN5bpvdBf12KPag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7Uvh8jPNcXAfVYkdC3y0wQ7icc52Cid_fN5bpvdBf12KPag-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 8 February 2014 16:33, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> On Sat, Feb 8, 2014 at 2:58 AM, Daniel J Blueman <daniel-JCXMqzvhRcvYtjvyW6yDsg@public.gmane.org> wrote:
>> Hi guys,
>>
>> With a GeForce 320M GPU running linux 3.13.2 and Xorg 1.15.0, I'm
>> seeing significant graphical corruption and later unrecoverable GPU
>> lockup, accompanied by thousands of ILLEGAL_MTHD or related kernel
>> messages [1]. I see similar issues on 3.12 also.
>>
>> Is there any debugging or testing I can do to help diagnose this?
>
> Is this new? i.e. was there a kernel where it all worked well?
>
> You get caught by the new disable logic in 3.13 that looks at a
> register to figure out what engines have been disabled:
>
> [    6.306005] nouveau W[    PCE0][0000:04:00.0] disabled, PCE0=1 to enable
>
> Perhaps it's actually there and we have incorrect information about
> the feature disable register -- you can force-enable it with
> nouveau.config=PCE0=1 if you like. Although this logic is new in 3.13,
> so if you also saw the issue in 3.12, that's probably not the cause.
> (Also, the in-kernel logic falls back to M2MF, and so does the DDX,
> and I don't see any usage in mesa, so even _if_ it's incorrectly
> disabled, I doubt this would be your issue.)
>
> Another thing that's new in 3.13 is MSI -- you can disable it with
> nouveau.config=NvMSI=0.
>
> There's only one currently-open bug about NVAF:
> https://bugs.freedesktop.org/show_bug.cgi?id=60150 -- unfortunately
> the bug filer wasn't very specific about the issues. But it might be
> worth trying an ancient kernel (e.g. pre-3.7 -- there was a big
> rewrite in 3.7, or even one of those 3.2-based franken-kernels that
> distros maintained.) I suppose if you were to boot with
> nouveau.noaccel=1 your problems would go away, but so would any 2d/3d
> accel.
>
> [   85.751375] nouveau E[   PFIFO][0000:04:00.0] DMA_PUSHER - ch 3
> [Xorg[919]] get 0x0020022a4c put 0x0020023140 ib_get 0x00000391 ib_put
> 0x000003c2 state 0x8000e6a8 (err: INVALID_CMD) push 0x00400040
>
> I've seen this kind of error before, on many different card types, and
> have _no clue_ how it happens -- at no point is that command actually
> written to the ring (I think). After that happens, it looks like
> things get a little upset, and basically nothing works again. When
> I've seen it before things tend to recover, but I guess they don't
> have to.
>
> I wouldn't be surprised if this was some sort of issue in the fifo
> context switch code (which I'm most unfamiliar with, but others know
> more). It has all sorts of chipset-specific stuff, and chances are
> nvaf wasn't well-represented when all those were made. Assuming there
> isn't an earlier working version of nouveau, one avenue is to do a
> mmiotrace (https://wiki.ubuntu.com/X/MMIOTracing) of the blob starting
> X and running e.g. glxgears. Then one would have to look at what
> ctxprog it uploads and reconcile that with nouveau's somehow. (But
> perhaps this is entirely wrong and nouveau's ctxprogs are fine.)

Superb writeup! Indeed, booting with nouveau.config=PCI0=1 didn't help
as you deduced, nor did nouveau.config=NvMSI=0.

Interestingly, there was graphical failure booting 3.6.11, even
nvidia-current fails to initialise, but these two issues could be due
to running the Xorg stack in Ubuntu 14.04 pre-release. Using
nouveau.noaccel=1 works great for the first X session, but after
logging out, lightdm and the next session experiences this consistent
screen corruption:

http://quora.org/nouveau-corruption.jpg

Changing to other resolutions except 1280x800 (native panel
resolution), there is no corruption, but the corruption is
consistently there when changing back to 1280x800. What would be good
to look out for to help diagnose this?

Obviously noaccel is a very useful and important fallback. For the
accelerated case, I'll wait until the Nvidia blob works in Ubuntu
14.04, then employ MMIO tracing and follow up with the differences I
find.

Many thanks,
  Daniel
-- 
Daniel J Blueman
