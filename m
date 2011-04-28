From: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/2] reclocking stability improvements
Date: Thu, 28 Apr 2011 19:58:02 +0300
Message-ID: <1304009882.9935.7.camel@maxim-laptop>
References: <1303948692-22455-1-git-send-email-martin.peres@free.fr>
	<1303986746.6092.6.camel@maxim-laptop> <4DB94C4F.3000801@free.fr>
	<1303991011.6092.9.camel@maxim-laptop>  <op.vunmefj57cbmmg@emo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <op.vunmefj57cbmmg@emo>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Thu, 2011-04-28 at 16:24 +0100, Emil Velikov wrote:
> On Thu, 28 Apr 2011 12:43:31 +0100, Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
> > Martin, one more thing, this is my observations regarding clocks I
> > finished today:
> >
> >
> > clock = (ref * N / M) >> (P & 0x7)
> >
> > first line is blob, second nouveau
> >
> > level0:
> >                          P         NNMM
> >     0x4008 - memory - 0018e200 00002505   = 1           = 01.0000
> >                       80016400 00002505   = 37 / 5 / 2  = 03.7000
> >
> >     0x4020 - shader - 80010000 00000b01   = 11 / 1 / 2  = 05.5000
> >                       80020000 00001b02   = 27 / 2 / 4  = 03.3750
> >
> >     0x4028 - core   - a0120000 00001b04   = 27 / 4 / 4  = 01.6875
> >                       a0020000 00001b04   = 27 / 4 / 4  = 01.6875
> >
> >     0x4030 - unk_05 - a0120000 00000b02   = 11 / 2 / 4  = 01.3750
> >                       80020000 00001b04   = 27 / 4 / 4  = 01.6875
> >
> > level1:
> >
> >     0x4008 - memory - 809ae400 00002505   = 37 / 5 / 4  = 01.8500
> >                       80026400 00002505   = 37 / 5 / 4  = 01.8500
> >    0x4020 - shader - 80000000 00000b01   = 11 / 1 / 1  = 11.0000
> >                       80010000 00000b01   = 11 / 1 / 2  = 05.5000
> >    0x4028 - core   - a0090000 00000b02   = 11 / 2 / 1  = 05.5000
> >                       a0010000 00000b02   = 11 / 2 / 1  = 05.5000
> >
> >     0x4030 - unk_05 - a0120000 00000b02   = 11 / 2 / 4  = 01.3750
> >                       80010000 00000b02   = 11 / 2 / 2  = 05.5000
> >
> > level2:
> >
> >     0x4008 - memory - 8059e400 00002505   = 37 / 5 / 2  = 03.7000
> >                       80016400 00002505   = 37 / 5 / 2  = 03.7000
> >
> >     0x4020 - shader - 80000000 00000b01   = 11 / 1 / 1  = 11.0000
> >                       80000000 00001002   = 16 / 2 / 1  = 08.0000
> >
> >     0x4028 - core   - a0090000 00001002   = 16 / 2 / 2  = 04.0000
> >                       a0010000 00001002   = 16 / 2 / 2  = 04.0000
> >
> >     0x4030 - unk_05 - a0120000 00000b02   = 11 / 2 / 4  = 01.3750
> >                       80010000 00001202   = 18 / 2 / 2  = 06.0000
> >
> >
> > Clocks are very different and we seems to overclock hard the unk_05 PLL
> > And shader PLL is underclocked always, so another way to boost performance?
> > (it didn't seem to affect perfomace much here, but yet...)
> >
> >
> 
> Maxim most likely you are tired of hearing this, but the shader PLL in many
> cases is disabled(-ish)
> Either by nv_wr32(dev, (nv_rd32(dev, 0x4020) & ~0x80000000)), or by the
> 0xc040 register (don't remember the exact bit)
> Whereas for the unk_05 the logic of the blob has been changed in it's recent
> versions - i.e. blob v195.xx the numbers(P/M/N) where the same as the nouveau
> 
> Cheers
> Emil (xexaxo)

I sure didn't know about register 0xC040, but I know about bit 31
(0x80000000) and took it into account. It isn't set only for memory
clock in perf level 0 by the blob.

Also clocking seems not to be the major power problem, there is
something else.
(see my post about observed power consumption).

My gut feeling is that blob can decrease number of running shader cores,
and in nouveau all are running anyway.



Interesting fact is that GPU temperatures rise to very high levels
(~75C) even while doing CPU only work (like compiling kernel for
example).


-- 
Best regards,
        Maxim Levitsky

Visit my blog: http://maximlevitsky.wordpress.com
Warning: Above blog contains rants.
