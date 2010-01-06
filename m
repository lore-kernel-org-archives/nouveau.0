From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH/TESTING(all hw)/DISCUSSION] FIFO (minor)
 create and (major) destroy instabilities on nv50+
Date: Thu, 07 Jan 2010 08:17:25 +1000
Message-ID: <1262816245.2485.3.camel@nisroch>
References: <6d4bc9fc1001020736r4b17971ftb5e7c718433df181@mail.gmail.com>
	<6d4bc9fc1001041129t5ac01715oe64f3e827c01340b@mail.gmail.com>
	<1262644766.2457.4.camel@nisroch>
	<6d4bc9fc1001041454w63d62e7fk7dec9aa2922462f8@mail.gmail.com>
	<1262661641.5795.2.camel@nisroch>
	<6d4bc9fc1001050041w3cefcaacs287d6c1909c182d0@mail.gmail.com>
	<6d4bc9fc1001051319l27b5a227ua81dabb98d7a6289@mail.gmail.com>
	<6d4bc9fc1001051455y301526cwaa935e8dd1956231@mail.gmail.com>
	<6d4bc9fc1001060958q3b7d0d5dka7bcd3843584d6e2@mail.gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6d4bc9fc1001060958q3b7d0d5dka7bcd3843584d6e2-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, 2010-01-06 at 18:58 +0100, Maarten Maathuis wrote:
> Patch v5 remains necessary (a simple swap of pfifo and pgraph unload
> isn't enough) even on a current kernel, the change is that it's now
> possible to generate pgraph errors without locking up. Without the
> patch even nop fails in loops, while running under fbcon.
Yes, the commit fixing the ctxprog hang wasn't intended to fix the
entire problem.  I actually came across that issue while working on
something else, it just turns out to be one of the issues that effects
channel destruction too.

Adding a simple nouveau_wait_for_idle() after pgraph->fifo_access(dev,
false) is enough now to make it work *almost* all the time.  Still
something else we're not waiting for, mdelay(50) lets me run
bitscan-fail in a loop for as long as I like without issue.  I don't
really have any ideas atm of what it could be yet, but i'd *really*
rather fix it properly instead of hiding the problem away...

Ben.
> 
> Maarten.
> 
> On Tue, Jan 5, 2010 at 11:55 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Tue, Jan 5, 2010 at 10:19 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> On Tue, Jan 5, 2010 at 9:41 AM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >>> On Tue, Jan 5, 2010 at 4:20 AM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >>>> On Mon, 2010-01-04 at 23:54 +0100, Maarten Maathuis wrote:
> >>>>> I forgot to mention that you should run nop from fbcon without X
> >>>>> running for reliable lockups.
> >>>> Yup, that's what I've been doing.
> >>>>
> >>>>>
> >>>>> On Mon, Jan 4, 2010 at 11:39 PM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >>>>> > On Mon, 2010-01-04 at 20:29 +0100, Maarten Maathuis wrote:
> >>>>> >> I've narrowed it down further, the "pgraph->fifo_access" bit is still
> >>>>> >> cleanup (register 0x400500 represents pgraph fifo access), the rest
> >>>>> >> appears needed for the desired effect. The reordering of pfifo and
> >>>>> >> pgraph destroy is needed. As usual, feedback is appreciated.
> >>>>> > I played a bit yesterday and have the gr/fifoctx unload ordering swap
> >>>>> > and queued up already, as well as unconditionally waiting on a fence at
> >>>>> > channel destroy (not really needed, but served as a bit of a cleanup
> >>>>> > anyway).
> >>>>> >
> >>>>> > I'll try and look at the rest of the changes.
> >>>>> >
> >>>> Mmm OK.  The gr/fifoctx swap appears to just achieve a little extra
> >>>> delay before we hit the grctx unload, some of the other changes (the
> >>>> PGRAPH stuff in fifo channel disable specifically) work around the
> >>>> changed ordering.
> >>>>
> >>>> For an identical effect, add a nice mdelay(50) right before the
> >>>> pgraph->fifo_access(dev, false) in nouveau_channel_free()..  We have a
> >>>> race.
> >>>
> >>> So what do you propose as the preferred solution?
> >>>
> >>>>
> >>>> Ben.
> >>>>> > Ben.
> >>>>> >>
> >>>>> >> Maarten.
> >>>>> >>
> >>>>> >> On Sat, Jan 2, 2010 at 4:36 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >>>>> >> > Many people using nv50+ hardware are aware of gpu lockups when a fifo
> >>>>> >> > closes under certain conditions. Based on a mmio-trace and some trail
> >>>>> >> > and error testing i've come up with a patch that improves the
> >>>>> >> > situation on my NV96.
> >>>>> >> >
> >>>>> >> > This patch needs testing on NV50+ hardware and regression testing on
> >>>>> >> > older hardware, since i did change some of the common codepaths. This
> >>>>> >> > is very much a work in progress, and if you have anything to
> >>>>> >> > add/correct, please share it.
> >>>>> >> >
> >>>>> >> > I've also attached a 2 test apps, once is bitscan-fail from mwk, use
> >>>>> >> > it like ./bitscan-fail 0x200 to trigger PGRAPH errors. A modified
> >>>>> >> > version only emits NOPs (method 0x100) and represents the no error
> >>>>> >> > situation.
> >>>>> >> >
> >>>>> >> > For me, i can run the NOP program in loops of 10000 iterations with no
> >>>>> >> > problems (i've done so several times), the bitscan-fail survives 10000
> >>>>> >> > iterations sometimes, but can also fail after a few thousand. In
> >>>>> >> > comparison, a single run of bitscan-fail could cause a gpu lockup for
> >>>>> >> > me in the past.
> >>>>> >> >
> >>>>> >> > Please try the gallium driver, the test apps, suspend to ram. Suspend
> >>>>> >> > to ram isn't 100% reliable yet for me (this was always the case after
> >>>>> >> > strange experiments/hammering/etc), but should not regress. This goes
> >>>>> >> > for older hw as well, whatever worked should still work, but i
> >>>>> >> > wouldn't expect serious improvements there.
> >>>>> >> >
> >>>>> >> > As always, feedback is appreciated, especially since this is a touchy subject.
> >>>>> >> >
> >>>>> >> > Maarten.
> >>>>> >> >
> >>>>> >> _______________________________________________
> >>>>> >> Nouveau mailing list
> >>>>> >> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> >>>>> >> http://lists.freedesktop.org/mailman/listinfo/nouveau
> >>>>> >
> >>>>> >
> >>>>> >
> >>>>
> >>>>
> >>>>
> >>>
> >>
> >> I've isolated a small part of a mmiotrace, which is one of the few
> >> cases where bit28 of 0x40032c is unset. The end is most interesting,
> >> the beginning is just to be sure everything is there. Maybe it helps.
> >>
> >> W 4 543.049438 3 0xc6100c80 0x50001 0x0 0
> >> R 4 543.049496 3 0xc6100c80 0x50000 0x0 0
> >> R 4 543.049548 3 0xc6400500 0x10010001 0x0 0
> >> R 4 543.049596 3 0xc6400500 0x10010001 0x0 0
> >> W 4 543.049644 3 0xc6400500 0x10010000 0x0 0
> >> R 4 543.049693 3 0xc6400700 0x0 0x0 0
> >> R 4 543.049741 3 0xc6400380 0x0 0x0 0
> >> R 4 543.049797 3 0xc6400384 0x0 0x0 0
> >> R 4 543.049845 3 0xc6400388 0x0 0x0 0
> >> W 4 543.049900 3 0xc6100c80 0x1 0x0 0
> >> R 4 543.049958 3 0xc6100c80 0x0 0x0 0
> >> W 4 543.050009 3 0xc6400500 0x10010001 0x0 0
> >> W 4 543.050150 10 0xc41f04c8 0x1 0x0 0
> >> W 4 543.050175 10 0xc41f04cc 0x4 0x0 0
> >> W 4 543.050282 3 0xc6070000 0x1 0x0 0
> >> R 4 543.050358 3 0xc6070000 0x0 0x0 0
> >> R 4 543.050418 3 0xc661002c 0x370 0x0 0
> >> R 4 543.050462 3 0xc661002c 0x370 0x0 0
> >> W 4 543.050588 10 0xc41f0440 0x1 0x0 0
> >> W 4 543.050614 10 0xc41f0444 0x4 0x0 0
> >> W 4 543.050719 3 0xc6070000 0x1 0x0 0
> >> R 4 543.050793 3 0xc6070000 0x0 0x0 0
> >> W 4 543.050896 10 0xc41f03c0 0x1 0x0 0
> >> W 4 543.050922 10 0xc41f03c4 0x4 0x0 0
> >> W 4 543.051028 3 0xc6070000 0x1 0x0 0
> >> R 4 543.051101 3 0xc6070000 0x0 0x0 0
> >> W 4 543.051227 10 0xc41f05e0 0x1 0x0 0
> >> W 4 543.051253 10 0xc41f05e4 0x4 0x0 0
> >> W 4 543.051360 3 0xc6070000 0x1 0x0 0
> >> R 4 543.051434 3 0xc6070000 0x0 0x0 0
> >> W 4 543.051529 10 0xc41f0200 0x1 0x0 0
> >> W 4 543.051554 10 0xc41f0204 0x4 0x0 0
> >> W 4 543.051659 3 0xc6070000 0x1 0x0 0
> >> R 4 543.051732 3 0xc6070000 0x0 0x0 0
> >> W 4 543.051784 10 0xc439e000 0x7e 0x0 0
> >> W 4 543.051807 10 0xc439e004 0x7e 0x0 0
> >> W 4 543.051829 10 0xc439e008 0x1 0x0 0
> >> W 4 543.051851 10 0xc439e00c 0x2 0x0 0
> >> W 4 543.051926 3 0xc6070000 0x1 0x0 0
> >> R 4 543.051999 3 0xc6070000 0x0 0x0 0
> >> W 4 543.052158 3 0xc60032f4 0x1ff64 0x0 0
> >> W 4 543.052228 3 0xc60032ec 0x4 0x0 0
> >> R 4 543.052296 3 0xc60032ec 0x4 0x0 0
> >> R 4 543.052377 3 0xc6002504 0x0 0x0 0
> >> W 4 543.052451 3 0xc6002504 0x1 0x0 0
> >> R 4 543.052745 3 0xc6000100 0x0 0x0 0
> >> R 4 543.052849 3 0xc6002080 0x0 0x0 0
> >> R 4 543.053007 3 0xc6003220 0xd06191 0x0 0
> >> R 4 543.053075 3 0xc6003250 0x90000001 0x0 0
> >> R 4 543.053154 3 0xc6002504 0x11 0x0 0
> >> R 4 543.053226 3 0xc6002508 0x340 0x0 0
> >> R 4 543.053295 3 0xc6003220 0xd06191 0x0 0
> >> R 4 543.053365 3 0xc6003250 0x90000001 0x0 0
> >> R 4 543.053444 3 0xc6000200 0xdff3d113 0x0 0
> >> R 4 543.053516 3 0xc600251c 0x3f 0x0 0
> >> R 4 543.053581 3 0xc640032c 0x8001fd9a 0x0 0
> >> R 4 543.053630 3 0xc640032c 0x8001fd9a 0x0 0
> >> W 4 543.053678 3 0xc640032c 0x1fd9a 0x0 0
> >> R 4 543.053753 3 0xc60032f0 0x3 0x0 0
> >> W 4 543.053843 3 0xc60032f0 0x7f 0x0 0
> >> R 4 543.053921 3 0xc6003220 0xd06191 0x0 0
> >> W 4 543.053990 3 0xc6003220 0xd06191 0x0 0
> >> R 4 543.054054 3 0xc6002504 0x11 0x0 0
> >> W 4 543.054123 3 0xc6002504 0x10 0x0 0
> >> R 4 543.054195 3 0xc600260c 0x801fd99f 0x0 0
> >> W 4 543.054268 3 0xc600260c 0x1ff68 0x0 0
> >> W 4 543.054371 10 0xc43cdd10 0x0 0x0 0
> >> W 4 543.054393 10 0xc43cdd14 0x0 0x0 0
> >> W 4 543.054415 10 0xc43cdd18 0x0 0x0 0
> >> W 4 543.054437 10 0xc43cdd1c 0x0 0x0 0
> >> W 4 543.054460 10 0xc43cdd20 0x0 0x0 0
> >> W 4 543.054482 10 0xc43cdd24 0x0 0x0 0
> >> W 4 543.054504 10 0xc43cdd28 0x0 0x0 0
> >> W 4 543.054526 10 0xc43cdd2c 0x0 0x0 0
> >> W 4 543.054549 10 0xc43cdd30 0x0 0x0 0
> >> W 4 543.054571 10 0xc43cdd34 0x0 0x0 0
> >> W 4 543.054593 10 0xc43cdd38 0x0 0x0 0
> >> W 4 543.054616 10 0xc43cdd3c 0x0 0x0 0
> >> W 4 543.054638 10 0xc43cdd40 0x0 0x0 0
> >> W 4 543.054660 10 0xc43cdd44 0x0 0x0 0
> >> W 4 543.054823 3 0xc6070000 0x1 0x0 0
> >> R 4 543.054921 3 0xc6070000 0x0 0x0 0
> >>
> >
> > This chunk comes after it, very similar to the one before it. But i
> > forgot to add it.
> >
> > W 4 543.055001 3 0xc6100c80 0x50001 0x0 0
> > R 4 543.055059 3 0xc6100c80 0x50000 0x0 0
> > R 4 543.055111 3 0xc6400500 0x10010001 0x0 0
> > R 4 543.055159 3 0xc6400500 0x10010001 0x0 0
> > W 4 543.055207 3 0xc6400500 0x10010000 0x0 0
> > R 4 543.055256 3 0xc6400700 0x0 0x0 0
> > R 4 543.055304 3 0xc6400380 0x0 0x0 0
> > R 4 543.055352 3 0xc6400384 0x0 0x0 0
> > R 4 543.055400 3 0xc6400388 0x0 0x0 0
> > W 4 543.055454 3 0xc6100c80 0x1 0x0 0
> > R 4 543.055511 3 0xc6100c80 0x0 0x0 0
> > W 4 543.055562 3 0xc6400500 0x10010001 0x0 0
> > W 4 543.055657 3 0xc600260c 0x1ff680 0x0 0
> > W 4 543.055745 3 0xc6000140 0x1 0x0 0
> > W 4 543.055954 3 0xc6000140 0x0 0x0 0
> > W 4 543.055996 10 0xc43cdd48 0x0 0x0 0
> > W 4 543.056019 10 0xc43cdd4c 0x0 0x0 0
> > W 4 543.056041 10 0xc43cdd50 0x0 0x0 0
> > W 4 543.056064 10 0xc43cdd54 0x0 0x0 0
> > W 4 543.056167 3 0xc6070000 0x1 0x0 0
> > R 4 543.056246 3 0xc6070000 0x0 0x0 0
> >
