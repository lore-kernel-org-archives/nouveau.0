From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: deadlock possiblity introduced by "drm/nouveau: use
 drm_mm in preference to custom code doing the same thing"
Date: Tue, 27 Jul 2010 03:23:14 +0200
Message-ID: <20100727012314.GB3206@joi.lan>
References: <20100710232432.GA4137@joi.lan> <1278810132.2324.6.camel@nisroch>
	<20100726115933.GA2799@joi.lan> <877hkii2po.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <877hkii2po.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Jul 26, 2010 at 07:15:47PM +0200, Francisco Jerez wrote:
> Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
> 
> > On Sun, Jul 11, 2010 at 11:02:12AM +1000, Ben Skeggs wrote:
> >> On Sun, 2010-07-11 at 01:24 +0200, Marcin Slusarz wrote:
> >> > Hi
> >> > 
> >> > Patch "drm/nouveau: use drm_mm in preference to custom code doing the same thing"
> >> > in nouveau tree introduced new deadlock possibility, for which lockdep complains loudly:
> >> > 
> >> > (...)
> >> > 
> >> Hey,
> >> 
> >> Thanks for the report, I'll look at this more during the week.
> >> 
> >> > Deadlock scenario looks like this:
> >> > CPU1                                        CPU2
> >> > nouveau code calls some drm_mm.c
> >> > function which takes mm->unused_lock
> >> > 
> >> >                                             nouveau_channel_free disables irqs and takes dev_priv->context_switch_lock
> >> >                                                             calls nv50_graph_destroy_context which
> >> >                                                             (... backtrace above)
> >> >                                                             calls drm_mm_put_block which tries to take mm->unused_lock (spins)
> >> > nouveau interrupt raises
> >> > 
> >> > nouveau_irq_handler tries to take
> >> > dev_priv->context_switch_lock (spins)
> >> > 
> >> > deadlock
> >> It's important to note that the drm_mm referenced eventually by
> >> nv50_graph_destroy_context is per-channel on the card, so for the
> >> deadlock to happen it'd have to be multiple threads from a single
> >> process, one thread creating/destroying and object on the channel while
> >> another was trying to destroy the channel.
> >> 
> 
> Yeah, and that situation is impossible ATM because those functions are
> called with the BKL held.

Yeah, but BKL is on the way out of kernel.

> >> > 
> >> > Possible solutions:
> >> > - reverting "drm/nouveau: use drm_mm in preference to custom code doing the same thing"
> >> > - disabling interrupts before calling drm_mm functions - unmaintainable and still
> >> >   deadlockable in multicard setups (nouveau and eg radeon)
> >> Agreed it's unmaintainable, but, as mentioned above, the relevant locks
> >> can't be touched by radeon.
> >> 
> >> > - making mm->unused_lock HARDIRQ-safe (patch below) - simple but with slight overhead
> >> I'll look more during the week, there's other solutions to be explored.
> >
> > So, did you find other solution?
> 
> Some random ideas:
> 
>  - Make context_switch_lock HARDIRQ-unsafe. To avoid racing with the IRQ
>    handler we'd have to disable interrupt dispatch on the card before
>    taking context_switch_lock (i.e. at channel creation and destruction
>    time), and the interrupt control registers would have to be protected
>    with a IRQ safe spinlock.

Pretty heavy weight...

>  - Split the current destroy_context() hooks in two halves, the first
>    one would be in charge of the PFIFO/PGRAPH-poking tasks (e.g.
>    disable_context()), and the second one would take care of releasing
>    the allocated resources (and it wouldn't need locking).

Doable, but it might complicate this code significantly...

I didn't dig into this, but maybe adding lockdep annotation will be enough?

Marcin
