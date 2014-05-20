From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: About Using "nVidia Open Source Driver" on MIPS
	Computer
Date: Tue, 20 May 2014 10:41:41 -0400
Message-ID: <CAKb7UviQTnLiSkax+hK+3HZZ5daq-VCwuiMmcbnSX12gvqrbRQ@mail.gmail.com>
References: <CACGcVE2hDJk3qLaAhyXFqnzvFJz3CkSGqQyNmqpH6dZs859Sqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACGcVE2hDJk3qLaAhyXFqnzvFJz3CkSGqQyNmqpH6dZs859Sqg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Zhiqiang Liu <gavin.liuzq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, May 20, 2014 at 10:33 AM, Zhiqiang Liu <gavin.liuzq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello, Gurus, recently I got a MIPS computer installed with Linux
> OS(Fedora), unfortunately there is no driver for the graphics
> card, so it cannot perform 3D acceleration. Since I happen to have a nVidia
> graphics card at hand (it is GeForce 9500GT, somewhat old), I want to apply
> this card on this computer, so my questions are:
>
> 1. Is it possible to make a nVidia graphics driver for this MIPS computer
> from current open source driver, i.e, transplant current
> X86-based driver to MIPs-based driver?

What about the current driver is x86-based? nouveau works on ppc,
should also work on mips. I'm sure there will be issues, anything
outside of x86 doesn't get a huge amount of testing...

> 2. If it is possible to do so, then what and where should I start with? what
> parts of the driver I'll have to modify? and are there any
> architecture-specific parts, e.g, parts implemented by X86 assembly language
> or something else HW dependent?

Plug it in and see if it works :) It probably won't, but it'll be
interesting to see where the failures happen. If possible, configure
your kernel for 4K pages -- non-4K page size has been an area with
problems in the past.

> 3. What skills do you think I must have to do this job? I am skillful at C
> programming in Linux, and have much experience on HW designing, should I
> grasp OpenGL for this work?
> 4. To make a workable driver with 3D acceleration, which modules' source
> codes should I download? I have downloaded a file named
> "xf86-video-nouveau-1.0.10.zip", is it right?

Nouveau is made up of several parts. First, it is a KMS driver in the
linux kernel (the module would be called 'nouveau'). If that doesn't
work, you won't be able to use any of the other pieces. Then there is
the user-space stack, which is the DDX for Xorg (xf86-video-nouveau)
and the 3D driver, which is part of mesa. Take a look at
http://nouveau.freedesktop.org/wiki/InstallNouveau/ if you plan on
building from source and don't have a lot of experience doing so.
There is nothing x86-specific in any of these bits (sure, there are a
couple of SSE2-based optimizations in the ddx and mesa drivers,
relating to video stuff, but they're completely optional and should
fall back on non-sse versions if sse isn't available).

Good luck,

  -ilia
