From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/5] drm: add optional per device rwsem for all ioctls
Date: Mon, 23 Apr 2012 19:42:22 +0200
Message-ID: <20120423174222.GL4935@phenom.ffwll.local>
References: <1335133112-8008-1-git-send-email-marcin.slusarz@gmail.com>
	<20120423075148.GC4935@phenom.ffwll.local>
	<20120423172035.GB2886@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20120423172035.GB2886@joi.lan>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Marcin Slusarz <marcin.slusarz@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Mon, Apr 23, 2012 at 07:20:35PM +0200, Marcin Slusarz wrote:
> On Mon, Apr 23, 2012 at 09:51:48AM +0200, Daniel Vetter wrote:
> > On Mon, Apr 23, 2012 at 12:18:28AM +0200, Marcin Slusarz wrote:
> > > Nouveau, in normal circumstances, does not need device lock for every ioctl,
> > > but incoming "gpu reset" code needs exclusive access to the device.
> > > This commit adds drm_driver flag which turns on read lock ioctl encapsulation.
> > > 
> > > Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
> > 
> > Why can't we just move this down to nouveau driver code?
> 
> I can't wrap drm core ioctls this way and adding locks at driver entry points
> would be at best unmaintainable, at worst - impossible (some of them are
> probably called in atomic context).

Well, not necessarily at ioctl entry, but before you touch stuff that the
gpu reset can change. That has the problem that you get stuck in a bad
place sometimes, but i915 solves that by bailing out and restarting the
ioctl.

> > I really hate adding random stuff to drm core that other drivers can't opt
> > out of - all the dri1 nightmares are made of these essentially.
> 
> It's enabled only when driver requested it. I'm not sure what dri1 nightmares
> you are talking about - I wasn't involved in dri1. Can you elaborate?

Generally sprinkling all these little bits and pieces in drm core that one
driver uses, and only one. If you ever try to refactor things, these bits
and pieces tend to get horribly in the way. E.g. I'm trying to fix up
teardown around lastclose and driver unload, but tons of dri1 features get
in the way (most of them used only by 1 or 2 drivers).

Now your lock is only enabled for nouveau, but the code is still there for
everyone. Which essentially reduces everyone else's abitility to changes
things, because they have to ensure that they don't break a strange
invariant that nouveau (and only nouveau) relies upon. I've tried to
remove some old code in the lastclose paths from drm core and move it into
driver lastclose callbacks which looked pretty innoncent.

It all blew up in actual testing.

So given that i915 and radeon can both deal with this in the driver
specific code I'd really prefer if nouveau could, too.

> > And radeon
> > and i915 seem to be able to reset without adding anything to drm core.
> 
> Both radeon and i915 take per-device locks (radeon_device->cs_mutex for radeon,
> drm_device->struct_mutex for i915), which nouveau does not need. They might be
> bottlenecks some day.

Yeah, we're working on that ;-)

> > So why can't nouveau do the same? Also, if this is indeed necessary and we
> > add this as some mandatory core infrastructure, it's not good enough: In
> > i915 we go to great lengths to ensure that all processes waiting for gpu
> > reset are still interruptible, in case the gpu reset dies unexpectedly
> > (which happens), so this would need to be improved.
> 
> Well, I don't like non-interruptability of rwsems too, but I don't see any
> other locking primitive which is both interruptible and have read-write
> semantics. I was hoping someone would point me at one.

One thing to look into if you really want low overhead is sleepable rcu.
But as I've said above, my main gripe is not with the overhead at runtime,
but just with adding stuff to core for random driver corner-cases.

> How gpu reset can "die unexpectedly"?

Bugs in the not-so-well-tested code and plainly totally screwed-up hw ;-)

Cheers, Daniel
-- 
Daniel Vetter
Mail: daniel@ffwll.ch
Mobile: +41 (0)79 365 57 48
