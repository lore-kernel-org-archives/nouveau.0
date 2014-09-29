From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [RFC] Explicit synchronization for Nouveau
Date: Mon, 29 Sep 2014 19:20:07 +0200
Message-ID: <20140929172007.GA24667@phenom.ffwll.local>
References: <1411725612-10455-1-git-send-email-lpeltonen@nvidia.com>
 <20140929074302.GB4109@phenom.ffwll.local>
 <20140929154217.GA2851@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140929154217.GA2851-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Jerome Glisse <j.glisse-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, James Jones <jajones-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ken Adams <kadams-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Sep 29, 2014 at 11:42:19AM -0400, Jerome Glisse wrote:
> On Mon, Sep 29, 2014 at 09:43:02AM +0200, Daniel Vetter wrote:
> > On Fri, Sep 26, 2014 at 01:00:05PM +0300, Lauri Peltonen wrote:
> > > =

> > > Hi guys,
> > > =

> > > =

> > > I'd like to start a new thread about explicit fence synchronization. =
 This time
> > > with a Nouveau twist. :-)
> > > =

> > > First, let me define what I understand by implicit/explicit sync:
> > > =

> > > Implicit synchronization
> > > * Fences are attached to buffers
> > > * Kernel manages fences automatically based on buffer read/write acce=
ss
> > > =

> > > Explicit synchronization
> > > * Fences are passed around independently
> > > * Kernel takes and emits fences to/from user space when submitting wo=
rk
> > > =

> > > Implicit synchronization is already implemented in open source driver=
s, and
> > > works well for most use cases.  I don't seek to change any of that.  =
My
> > > proposal aims at allowing some drm drivers to operate in explicit syn=
c mode to
> > > get maximal performance, while still remaining fully compatible with =
the
> > > implicit paradigm.
> > =

> > Yeah, pretty much what we have in mind on the i915 side too. I didn't l=
ook
> > too closely at your patches, so just a few high level comments on your =
rfc
> > here.
> > =

> > > I will try to explain why I think we should support the explicit mode=
l as well.
> > > =

> > > =

> > > 1. Bindless graphics
> > > =

> > > Bindless graphics is a central concept when trying to reduce the Open=
GL driver
> > > overhead.  The idea is that the application can bind a large set of b=
uffers to
> > > the working set up front using extensions such as GL_ARB_bindless_tex=
ture, and
> > > they remain resident until the application releases them (note that c=
ompute
> > > APIs have typically similar semantics).  These working sets can be hu=
ge,
> > > hundreds or even thousands of buffers, so we would like to opt out fr=
om the
> > > per-submit overhead of acquiring locks, waiting for fences, and stori=
ng fences.
> > > Automatically synchronizing these working sets in kernel will also pr=
event
> > > parallelism between channels that are sharing the working set (in fac=
t sharing
> > > just one buffer from the working set will cause the jobs of the two c=
hannels to
> > > be serialized).
> > > =

> > > 2. Evolution of graphics APIs
> > > =

> > > The graphics API evolution seems to be going to a direction where gam=
e engine
> > > and middleware vendors demand more control over work submission and
> > > synchronization.  We expect that this trend will continue, and more a=
nd more
> > > synchronization decisions will be pushed to the API level.  OpenGL an=
d EGL
> > > already provide good explicit command stream level synchronization pr=
imitives:
> > > glFenceSync and EGL_KHR_wait_sync.  Their use is also encouraged - fo=
r example
> > > EGL_KHR_image_base spec clearly states that the application is respon=
sible for
> > > synchronizing accesses to EGLImages.  If the API that is exposed to d=
evelopers
> > > gives the control over synchronization to the developer, then implici=
t waits
> > > that are inserted by the kernel are unnecessary and unexpected, and c=
an
> > > severely hurt performance.  It also makes it easy for the developer t=
o write
> > > code that happens to work on Linux because of implicit sync, but will=
 fail on
> > > other platforms.
> > > =

> > > 3. Suballocation
> > > =

> > > Using user space suballocation can help reduce the overhead when a la=
rge number
> > > of small textures are used.  Synchronizing suballocated surfaces impl=
icitly in
> > > kernel doesn't make sense - many channels should be able to access th=
e same
> > > kernel-level buffer object simultaneously.
> > > =

> > > 4. Buffer sharing complications
> > > =

> > > This is not really an argument for explicit sync as such, but I'd lik=
e to point
> > > out that sharing buffers across SoC engines is often much more comple=
x than
> > > just exporting and importing a dma-buf and waiting for the dma-buf fe=
nces.
> > > Sometimes we need to do color format or tiling layout conversion.  So=
metimes,
> > > at least on Tegra, we need to decompress buffers when we pass them fr=
om the GPU
> > > to an engine that doesn't support framebuffer compression.  These thi=
ngs are
> > > not uncommon, particularly when we have SoC's that combine licensed I=
P blocks
> > > from different vendors.  My point is that user space is already heavi=
ly
> > > involved when sharing buffers between drivers, and giving it some mor=
e control
> > > over synchronization is not adding that much complexity.
> > > =

> > > =

> > > Because of the above arguments, I think it makes sense to let some us=
er space
> > > drm drivers opt out from implicit synchronization, while allowing the=
m to still
> > > remain fully compatible with the rest of the drm world that uses impl=
icit
> > > synchronization.  In practice, this would require three things:
> > > =

> > > (1) Support passing fences (that are not tied to buffer objects) betw=
een kernel
> > >     and user space.
> > > =

> > > (2) Stop automatically storing fences to the buffers that user space =
wants to
> > >     synchronize explicitly.
> > =

> > The problem with this approach is that you then need hw faulting to make
> > sure the memory is there. Implicit fences aren't just used for syncing,
> > but also to make sure that the gpu still has access to the buffer as lo=
ng
> > as it needs it. So you need at least a non-exclusive fence attached for
> > each command submission.
> > =

> > Of course on Android you don't have swap (would kill the puny mmc within
> > seconds) and you don't care for letting userspace pin most of memory for
> > gfx. So you'll get away with no fences at all. But for upstream I don't
> > see a good solution unfortunately. Ideas very much welcome.
> =

> Well i am gonna repeat myself. But yes you can do explicit without associ=
ating
> fence (at least no struct alloc) just associate a unique per command stre=
am
> number and have it be global ie irrespective of different execution pipel=
ine
> your hw have.
> =

> For non scheduling GPU, today generation roughly, you keep buffer on lru =
and
> you know you can not evict buffer to swap for those that have an active id
> (hw did not yet write the sequence number back). You update the lru with =
each
> command stream ioctl.
> =

> For binding to GPU GART you can do that as a preamble to the command stre=
am
> which most hardware (AMD, Intel, NVidia) should be able to do.
> =

> For VRAM you have several choice that depends on how you want to manage V=
RAM.
> For instance you might want to use it more like a cache and have each com=
mand
> stream preamble with a bunch of copy to VRAM and posibly bunch of post co=
py
> back to RAM. Or you can hold to current scheme but buffer move now becomes
> preamble to command stream (ie buffer move are scheduled as a preamble to
> command stream).
> =

> =

> So i do not see what you would consider rocket science about this ?

You just implement fences with a seqno value. Indeed not rocket science
;-)

Cheers, Daniel

> =

> Cheers,
> J=E9r=F4me
> =

> > =

> > > (3) Allow user space to attach an explicit fence to dma-buf when expo=
rting to
> > >     another driver that uses implicit sync.
> > > =

> > > There are still some open issues beyond these.  For example, can we s=
kip
> > > acquiring the ww mutex for explicitly synchronized buffers?  I think =
we could
> > > eventually, at least on unified memory systems where we don't need to=
 migrate
> > > between heaps (our downstream Tegra GPU driver does not lock any buff=
ers at
> > > submit, it just grabs refcounts for hw).  Another quirk is that now N=
ouveau
> > > waits on the buffer fences when closing the gem object to ensure that=
 it
> > > doesn't unmap too early.  We need to rework that for explicit sync, b=
ut that
> > > shouldn't be difficult.
> > =

> > See above, but you can't avoid to attach fences as long as we still use=
 a
> > buffer-object based gfx memory management model. At least afaics. Which
> > means you need the ordering guarantees imposed by ww mutexes to ensure
> > that the oddball implicit ordered client can't deadlock the kernel's
> > memory management code.
> > =

> > > I have written a prototype that demonstrates (1) by adding explicit s=
ync fd
> > > support to Nouveau.  It's not a lot of code, because I only use a rel=
atively
> > > small subset of the android sync driver functionality.  Thanks to Maa=
rten's
> > > rewrite, all I need to do is to allow creating a sync_fence from a dr=
m fence in
> > > order to pass it to user space.  I don't need to use sync_pt or sync_=
timeline,
> > > or fill in sync_timeline_ops.
> > > =

> > > I can see why the upstream has been reluctant to de-stage the android=
 sync
> > > driver in its current form, since (even though it now builds on struc=
t fence)
> > > it still duplicates some of the drm fence concepts.  I'd like to thin=
k that my
> > > patches only use the parts of the android sync driver that genuinely =
are
> > > missing from the drm fence model: allowing user space to operate on f=
ence
> > > objects that are independent of buffer objects.
> > =

> > Imo de-staging the android syncpt stuff needs to happen first, before
> > drivers can use it. Since non-staging stuff really shouldn't depend upon
> > code from staging.
> > =

> > > The last two patches are mocks that show how (2) and (3) might work o=
ut.  I
> > > haven't done any testing with them yet.  Before going any further, I'=
d like to
> > > get your feedback.  Can you see the benefits of explicit sync as an a=
lternative
> > > synchronization model?  Do you think we could use the android sync_fe=
nce for
> > > passing fences between user space?  Or did you have something else in=
 mind for
> > > explicit sync in the drm world?
> > =

> > I'm all for adding explicit syncing. Our plans are roughly.
> > - Add both an in and and out fence to execbuf to sync with other render=
ing
> >   and give userspace a fence back. Needs to different flags probably.
> > =

> > - Maybe add an ioctl to dma-bufs to get at the current implicit fences
> >   attached to them (both an exclusive and non-exclusive version). This
> >   should help with making explicit and implicit sync work together nice=
ly.
> > =

> > - Add fence support to kms. Probably only worth it together with the new
> >   atomic stuff. Again we need an in fence to wait for (one for each
> >   buffer) and an out fence. The later can easily be implemented by
> >   extending struct drm_event, which means not a single driver code line
> >   needs to be changed for this.
> > =

> > - For de-staging android syncpts we need to de-clutter the internal
> >   interfaces and also review all the ioctls exposed. Like you say it
> >   should be just the userspace interface for struct drm_fence. Also, it
> >   needs testcases and preferrably manpages.
> > =

> > Unfortunately it looks like Intel won't do this all for you due to a bu=
nch
> > of hilarious internal reasons :( At least not anytime soon.
> > =

> > Cheers, Daniel
> > -- =

> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > +41 (0) 79 365 57 48 - http://blog.ffwll.ch
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > http://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
