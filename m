From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH 09/17] drm/radeon: use common fence
 implementation for fences
Date: Tue, 22 Jul 2014 13:46:07 +0200
Message-ID: <20140722114607.GL15237@phenom.ffwll.local>
References: <20140709093124.11354.3774.stgit@patser>
 <20140709122953.11354.46381.stgit@patser>
 <CAPM=9tyD2ZbrcGDC3hfNb7qNdzsfnyD-ZwM7G-nOgxeu5YKuSg@mail.gmail.com>
 <53CE2421.5040906@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53CE2421.5040906-5C7GfCeVMHo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>
Cc: Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "Deucher,
 Alexander" <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Jul 22, 2014 at 10:43:13AM +0200, Christian K=F6nig wrote:
> Am 22.07.2014 06:05, schrieb Dave Airlie:
> >On 9 July 2014 22:29, Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org=
> wrote:
> >>Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
> >>---
> >>  drivers/gpu/drm/radeon/radeon.h        |   15 +-
> >>  drivers/gpu/drm/radeon/radeon_device.c |   60 ++++++++-
> >>  drivers/gpu/drm/radeon/radeon_fence.c  |  223 +++++++++++++++++++++++=
+++------
> >>  3 files changed, 248 insertions(+), 50 deletions(-)
> >>
> > From what I can see this is still suffering from the problem that we
> >need to find a proper solution to,
> >
> >My summary of the issues after talking to Jerome and Ben and
> >re-reading things is:
> >
> >We really need to work out a better interface into the drivers to be
> >able to avoid random atomic entrypoints,
> =

> Which is exactly what I criticized from the very first beginning. Good to
> know that I'm not the only one thinking that this isn't such a good idea.

I guess I've lost context a bit, but which atomic entry point are we
talking about? Afaics the only one that's mandatory is the is
fence->signaled callback to check whether a fence really has been
signalled. It's used internally by the fence code to avoid spurious
wakeups. Afaik that should be doable already on any hardware. If that's
not the case then we can always track the signalled state in software and
double-check in a worker thread before updating the sw state. And wrap
this all up into a special fence class if there's more than one driver
needing this.

There is nothing else that forces callbacks from atomic contexts upon you.
You can use them if you see it fit, but really if it doesn't suit your
driver you can just ignore that part and do process based waits
everywhere.

> >I'm sure you have some ideas and I think you really need to
> >investigate them to move this thing forward,
> >even it if means some issues with android sync pts.
> =

> Actually I think that TTMs fence interface already gave quite a good hint
> how it might look like. I can only guess that this won't fit with the
> Android stuff, otherwise I can't see a good reason why we didn't stick wi=
th
> that.

Well the current plan for i915<->radeon sync from Maarten is to use these
atomic callbacks on the i915 side. So android didn't figure into this at
all. Actually with android the entire implementation is kinda the
platforms problem, the generic parts just give you a userspace interface
and some means to stack up fences.

> >but none of the two major drivers seem to want the interface as-is so
> >something needs to give
> >
> >My major question is why we need an atomic callback here at all, what
> >scenario does it cover?
> =

> Agree totally. As far as I can see all current uses of the interface are =
of
> the kind of waiting for a fence to signal.
> =

> No need for any callback from one driver into another, especially not in
> atomic context. If a driver needs such a functionality it should just sta=
rt
> up a kernel thread and do it's waiting there.
> =

> This obviously shouldn't be an obstacle for pure hardware implementations
> where one driver signals a semaphore another driver is waiting for, or a
> high signal on an interrupt line directly wired between two chips. And I
> think this is a completely different topic and not necessarily part of the
> common fence interface we should currently focus on.

It's for mixed hw/sw stuff where we want to poke the hw from the irq
context (if possible) since someone forgot the wire. At least on the i915
side it boils down to one mmio write, and it's fairly pointless to launch
a thread for that.

So I haven't dug into ttm details but from the i915 side the current stuff
and atomic semantics makes sense. Maybe we just need to wrap a bit more
insulation around ttm-based drivers.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
