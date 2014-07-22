From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH 09/17] drm/radeon: use common fence
 implementation for fences
Date: Tue, 22 Jul 2014 13:57:37 +0200
Message-ID: <20140722115737.GN15237@phenom.ffwll.local>
References: <20140709093124.11354.3774.stgit@patser>
 <20140709122953.11354.46381.stgit@patser>
 <CAPM=9tyD2ZbrcGDC3hfNb7qNdzsfnyD-ZwM7G-nOgxeu5YKuSg@mail.gmail.com>
 <53CE2421.5040906@amd.com>
 <20140722114607.GL15237@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140722114607.GL15237-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Deucher, Alexander" <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Jul 22, 2014 at 01:46:07PM +0200, Daniel Vetter wrote:
> On Tue, Jul 22, 2014 at 10:43:13AM +0200, Christian K=F6nig wrote:
> > Am 22.07.2014 06:05, schrieb Dave Airlie:
> > >On 9 July 2014 22:29, Maarten Lankhorst <maarten.lankhorst@canonical.c=
om> wrote:
> > >>Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
> > >>---
> > >>  drivers/gpu/drm/radeon/radeon.h        |   15 +-
> > >>  drivers/gpu/drm/radeon/radeon_device.c |   60 ++++++++-
> > >>  drivers/gpu/drm/radeon/radeon_fence.c  |  223 +++++++++++++++++++++=
+++++------
> > >>  3 files changed, 248 insertions(+), 50 deletions(-)
> > >>
> > > From what I can see this is still suffering from the problem that we
> > >need to find a proper solution to,
> > >
> > >My summary of the issues after talking to Jerome and Ben and
> > >re-reading things is:
> > >
> > >We really need to work out a better interface into the drivers to be
> > >able to avoid random atomic entrypoints,
> > =

> > Which is exactly what I criticized from the very first beginning. Good =
to
> > know that I'm not the only one thinking that this isn't such a good ide=
a.
> =

> I guess I've lost context a bit, but which atomic entry point are we
> talking about? Afaics the only one that's mandatory is the is
> fence->signaled callback to check whether a fence really has been
> signalled. It's used internally by the fence code to avoid spurious
> wakeups. Afaik that should be doable already on any hardware. If that's
> not the case then we can always track the signalled state in software and
> double-check in a worker thread before updating the sw state. And wrap
> this all up into a special fence class if there's more than one driver
> needing this.

One thing I've forgotten: The i915 scheduler that's floating around runs
its bottom half from irq context. So I really want to be able to check
fence state from irq context and I also want to make it possible
(possible! not mandatory) to register callbacks which are run from any
context asap after the fence is signalled.

If the radeon hw/driver doesn't want to cope with that complexity we can
fully insolate it with the sw tracked fence state if you don't like
Maarten's radeon implementation. But forcing everyone to forgoe this just
because you don't like it and don't want to use it in radeon doesn't sound
right.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
