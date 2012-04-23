From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/5] drm: add optional per device rwsem for
	all ioctls
Date: Mon, 23 Apr 2012 19:20:35 +0200
Message-ID: <20120423172035.GB2886@joi.lan>
References: <1335133112-8008-1-git-send-email-marcin.slusarz@gmail.com>
	<20120423075148.GC4935@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120423075148.GC4935-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Apr 23, 2012 at 09:51:48AM +0200, Daniel Vetter wrote:
> On Mon, Apr 23, 2012 at 12:18:28AM +0200, Marcin Slusarz wrote:
> > Nouveau, in normal circumstances, does not need device lock for every ioctl,
> > but incoming "gpu reset" code needs exclusive access to the device.
> > This commit adds drm_driver flag which turns on read lock ioctl encapsulation.
> > 
> > Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Why can't we just move this down to nouveau driver code?

I can't wrap drm core ioctls this way and adding locks at driver entry points
would be at best unmaintainable, at worst - impossible (some of them are
probably called in atomic context).

> I really hate adding random stuff to drm core that other drivers can't opt
> out of - all the dri1 nightmares are made of these essentially.

It's enabled only when driver requested it. I'm not sure what dri1 nightmares
you are talking about - I wasn't involved in dri1. Can you elaborate?

> And radeon
> and i915 seem to be able to reset without adding anything to drm core.

Both radeon and i915 take per-device locks (radeon_device->cs_mutex for radeon,
drm_device->struct_mutex for i915), which nouveau does not need. They might be
bottlenecks some day.

> So why can't nouveau do the same? Also, if this is indeed necessary and we
> add this as some mandatory core infrastructure, it's not good enough: In
> i915 we go to great lengths to ensure that all processes waiting for gpu
> reset are still interruptible, in case the gpu reset dies unexpectedly
> (which happens), so this would need to be improved.

Well, I don't like non-interruptability of rwsems too, but I don't see any
other locking primitive which is both interruptible and have read-write
semantics. I was hoping someone would point me at one.

How gpu reset can "die unexpectedly"?

Marcin
