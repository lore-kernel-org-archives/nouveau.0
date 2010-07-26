From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: Re: deadlock possiblity introduced by "drm/nouveau: use drm_mm in
	preference to custom code doing the same thing"
Date: Mon, 26 Jul 2010 13:59:33 +0200
Message-ID: <20100726115933.GA2799@joi.lan>
References: <20100710232432.GA4137@joi.lan> <1278810132.2324.6.camel@nisroch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1278810132.2324.6.camel@nisroch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Ben Skeggs <skeggsb@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>
List-Id: nouveau.vger.kernel.org

On Sun, Jul 11, 2010 at 11:02:12AM +1000, Ben Skeggs wrote:
> On Sun, 2010-07-11 at 01:24 +0200, Marcin Slusarz wrote:
> > Hi
> > 
> > Patch "drm/nouveau: use drm_mm in preference to custom code doing the same thing"
> > in nouveau tree introduced new deadlock possibility, for which lockdep complains loudly:
> > 
> > (...)
> > 
> Hey,
> 
> Thanks for the report, I'll look at this more during the week.
> 
> > Deadlock scenario looks like this:
> > CPU1                                        CPU2
> > nouveau code calls some drm_mm.c
> > function which takes mm->unused_lock
> > 
> >                                             nouveau_channel_free disables irqs and takes dev_priv->context_switch_lock
> >                                                             calls nv50_graph_destroy_context which
> >                                                             (... backtrace above)
> >                                                             calls drm_mm_put_block which tries to take mm->unused_lock (spins)
> > nouveau interrupt raises
> > 
> > nouveau_irq_handler tries to take
> > dev_priv->context_switch_lock (spins)
> > 
> > deadlock
> It's important to note that the drm_mm referenced eventually by
> nv50_graph_destroy_context is per-channel on the card, so for the
> deadlock to happen it'd have to be multiple threads from a single
> process, one thread creating/destroying and object on the channel while
> another was trying to destroy the channel.
> 
> > 
> > Possible solutions:
> > - reverting "drm/nouveau: use drm_mm in preference to custom code doing the same thing"
> > - disabling interrupts before calling drm_mm functions - unmaintainable and still
> >   deadlockable in multicard setups (nouveau and eg radeon)
> Agreed it's unmaintainable, but, as mentioned above, the relevant locks
> can't be touched by radeon.
> 
> > - making mm->unused_lock HARDIRQ-safe (patch below) - simple but with slight overhead
> I'll look more during the week, there's other solutions to be explored.

So, did you find other solution?

Marcin
