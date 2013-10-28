From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Trouble on kernel
Date: Mon, 28 Oct 2013 10:42:12 -0400
Message-ID: <CAKb7UvgaEqjAS7JDnQYio6DynTNk+yaDekwWPQpeEDdDDPmhpA@mail.gmail.com>
References: <526E1619.9060402@gmx.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <526E1619.9060402-RbZlAiThDcE@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Martin Kaffanke <martin.kaffanke-RbZlAiThDcE@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Oct 28, 2013 at 3:45 AM, Martin Kaffanke <martin.kaffanke-RbZlAiThDcE@public.gmane.org> wrote:
> Hi there,
>
> Sometimes my computer crashes since i use now ubuntu 13.10 with
> unity/compiz.

You're on NV4C. Do you have mesa 9.2.1 or later (or pre-9.2)? If you
have 9.2.0, there are known issues with shader compilation.

>
> dmesg tells me:
>
> [  686.209019] nouveau E[    PBUS][0000:00:0d.0] MMIO write of 0x00000000
> FAULT at 0x00b020

Odd. That's VPE. You should have one... maybe not. Nothing to worry
about though. (Especially odd that it's showing up multiple times --
are you trying to use xvmc?)

>
> and later:
>
> [ 1425.565441] nouveau E[  PGRAPH][0000:00:0d.0]  ERROR nsource: DATA_ERROR
> nstatus: BAD_ARGUMENT
> [ 1425.565462] nouveau E[  PGRAPH][0000:00:0d.0] ch 3 [0x00056000
> compiz[1970]] subc 2 class 0x0039 mthd 0x0314 data 0x031dc000

A bit more concerning:

$ lookup -a 4c -d NV01_SUBCHAN -- -v obj-class NV03_M2MF 0x0314 0x031dc000
PITCH_IN => 52281344

I'm sure that's above some limit. A pitch of 50MB... I wonder how
that's happening... If you feel like debugging, the place to look is
nv30_transfer.c (in mesa). Although I would think this would merely
cause misrendering, not crashes.

>
> So I don't really know where to start for debugging,
> if you could help me that would be great.
>
> Full dmesg output on http://ubuntuone.com/3AVhp6HT2jU26HdfguAbdV
>
> thanks,
> Martin
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
