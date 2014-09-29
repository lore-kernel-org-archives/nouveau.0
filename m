From: Jerome Glisse <j.glisse@gmail.com>
Subject: Re: [RFC] Explicit synchronization for Nouveau
Date: Mon, 29 Sep 2014 11:42:19 -0400
Message-ID: <20140929154217.GA2851@gmail.com>
References: <1411725612-10455-1-git-send-email-lpeltonen@nvidia.com>
 <20140929074302.GB4109@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20140929074302.GB4109@phenom.ffwll.local>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Stephen Warren <swarren@nvidia.com>, nouveau@lists.freedesktop.org, James Jones <jajones@nvidia.com>, Colin Cross <ccross@android.com>, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>, Thierry Reding <treding@nvidia.com>, Ken Adams <kadams@nvidia.com>
List-Id: nouveau.vger.kernel.org

On Mon, Sep 29, 2014 at 09:43:02AM +0200, Daniel Vetter wrote:
> On Fri, Sep 26, 2014 at 01:00:05PM +0300, Lauri Peltonen wrote:
> > =

> > Hi guys,
> > =

> > =

> > I'd like to start a new thread about explicit fence synchronization.  T=
his time
> > with a Nouveau twist. :-)
> > =

> > First, let me define what I understand by implicit/explicit sync:
> > =

> > Implicit synchronization
> > * Fences are attached to buffers
> > * Kernel manages fences automatically based on buffer read/write access
> > =

> > Explicit synchronization
> > * Fences are passed around independently
> > * Kernel takes and emits fences to/from user space when submitting work
> > =

> > Implicit synchronization is already implemented in open source drivers,=
 and
> > works well for most use cases.  I don't seek to change any of that.  My
> > proposal aims at allowing some drm drivers to operate in explicit sync =
mode to
> > get maximal performance, while still remaining fully compatible with the
> > implicit paradigm.
> =

> Yeah, pretty much what we have in mind on the i915 side too. I didn't look
> too closely at your patches, so just a few high level comments on your rfc
> here.
> =

> > I will try to explain why I think we should support the explicit model =
as well.
> > =

> > =

> > 1. Bindless graphics
> > =

> > Bindless graphics is a central concept when trying to reduce the OpenGL=
 driver
> > overhead.  The idea is that the application can bind a large set of buf=
fers to
> > the working set up front using extensions such as GL_ARB_bindless_textu=
re, and
> > they remain resident until the application releases them (note that com=
pute
> > APIs have typically similar semantics).  These working sets can be huge,
> > hundreds or even thousands of buffers, so we would like to opt out from=
 the
> > per-submit overhead of acquiring locks, waiting for fences, and storing=
 fences.
> > Automatically synchronizing these working sets in kernel will also prev=
ent
> > parallelism between channels that are sharing the working set (in fact =
sharing
> > just one buffer from the working set will cause the jobs of the two cha=
nnels to
> > be serialized).
> > =

> > 2. Evolution of graphics APIs
> > =

> > The graphics API evolution seems to be going to a direction where game =
engine
> > and middleware vendors demand more control over work submission and
> > synchronization.  We expect that this trend will continue, and more and=
 more
> > synchronization decisions will be pushed to the API level.  OpenGL and =
EGL
> > already provide good explicit command stream level synchronization prim=
itives:
> > glFenceSync and EGL_KHR_wait_sync.  Their use is also encouraged - for =
example
> > EGL_KHR_image_base spec clearly states that the application is responsi=
ble for
> > synchronizing accesses to EGLImages.  If the API that is exposed to dev=
elopers
> > gives the control over synchronization to the developer, then implicit =
waits
> > that are inserted by the kernel are unnecessary and unexpected, and can
> > severely hurt performance.  It also makes it easy for the developer to =
write
> > code that happens to work on Linux because of implicit sync, but will f=
ail on
> > other platforms.
> > =

> > 3. Suballocation
> > =

> > Using user space suballocation can help reduce the overhead when a larg=
e number
> > of small textures are used.  Synchronizing suballocated surfaces implic=
itly in
> > kernel doesn't make sense - many channels should be able to access the =
same
> > kernel-level buffer object simultaneously.
> > =

> > 4. Buffer sharing complications
> > =

> > This is not really an argument for explicit sync as such, but I'd like =
to point
> > out that sharing buffers across SoC engines is often much more complex =
than
> > just exporting and importing a dma-buf and waiting for the dma-buf fenc=
es.
> > Sometimes we need to do color format or tiling layout conversion.  Some=
times,
> > at least on Tegra, we need to decompress buffers when we pass them from=
 the GPU
> > to an engine that doesn't support framebuffer compression.  These thing=
s are
> > not uncommon, particularly when we have SoC's that combine licensed IP =
blocks
> > from different vendors.  My point is that user space is already heavily
> > involved when sharing buffers between drivers, and giving it some more =
control
> > over synchronization is not adding that much complexity.
> > =

> > =

> > Because of the above arguments, I think it makes sense to let some user=
 space
> > drm drivers opt out from implicit synchronization, while allowing them =
to still
> > remain fully compatible with the rest of the drm world that uses implic=
it
> > synchronization.  In practice, this would require three things:
> > =

> > (1) Support passing fences (that are not tied to buffer objects) betwee=
n kernel
> >     and user space.
> > =

> > (2) Stop automatically storing fences to the buffers that user space wa=
nts to
> >     synchronize explicitly.
> =

> The problem with this approach is that you then need hw faulting to make
> sure the memory is there. Implicit fences aren't just used for syncing,
> but also to make sure that the gpu still has access to the buffer as long
> as it needs it. So you need at least a non-exclusive fence attached for
> each command submission.
> =

> Of course on Android you don't have swap (would kill the puny mmc within
> seconds) and you don't care for letting userspace pin most of memory for
> gfx. So you'll get away with no fences at all. But for upstream I don't
> see a good solution unfortunately. Ideas very much welcome.

Well i am gonna repeat myself. But yes you can do explicit without associat=
ing
fence (at least no struct alloc) just associate a unique per command stream
number and have it be global ie irrespective of different execution pipeline
your hw have.

For non scheduling GPU, today generation roughly, you keep buffer on lru and
you know you can not evict buffer to swap for those that have an active id
(hw did not yet write the sequence number back). You update the lru with ea=
ch
command stream ioctl.

For binding to GPU GART you can do that as a preamble to the command stream
which most hardware (AMD, Intel, NVidia) should be able to do.

For VRAM you have several choice that depends on how you want to manage VRA=
M.
For instance you might want to use it more like a cache and have each comma=
nd
stream preamble with a bunch of copy to VRAM and posibly bunch of post copy
back to RAM. Or you can hold to current scheme but buffer move now becomes
preamble to command stream (ie buffer move are scheduled as a preamble to
command stream).


So i do not see what you would consider rocket science about this ?

Cheers,
J=E9r=F4me

> =

> > (3) Allow user space to attach an explicit fence to dma-buf when export=
ing to
> >     another driver that uses implicit sync.
> > =

> > There are still some open issues beyond these.  For example, can we skip
> > acquiring the ww mutex for explicitly synchronized buffers?  I think we=
 could
> > eventually, at least on unified memory systems where we don't need to m=
igrate
> > between heaps (our downstream Tegra GPU driver does not lock any buffer=
s at
> > submit, it just grabs refcounts for hw).  Another quirk is that now Nou=
veau
> > waits on the buffer fences when closing the gem object to ensure that it
> > doesn't unmap too early.  We need to rework that for explicit sync, but=
 that
> > shouldn't be difficult.
> =

> See above, but you can't avoid to attach fences as long as we still use a
> buffer-object based gfx memory management model. At least afaics. Which
> means you need the ordering guarantees imposed by ww mutexes to ensure
> that the oddball implicit ordered client can't deadlock the kernel's
> memory management code.
> =

> > I have written a prototype that demonstrates (1) by adding explicit syn=
c fd
> > support to Nouveau.  It's not a lot of code, because I only use a relat=
ively
> > small subset of the android sync driver functionality.  Thanks to Maart=
en's
> > rewrite, all I need to do is to allow creating a sync_fence from a drm =
fence in
> > order to pass it to user space.  I don't need to use sync_pt or sync_ti=
meline,
> > or fill in sync_timeline_ops.
> > =

> > I can see why the upstream has been reluctant to de-stage the android s=
ync
> > driver in its current form, since (even though it now builds on struct =
fence)
> > it still duplicates some of the drm fence concepts.  I'd like to think =
that my
> > patches only use the parts of the android sync driver that genuinely are
> > missing from the drm fence model: allowing user space to operate on fen=
ce
> > objects that are independent of buffer objects.
> =

> Imo de-staging the android syncpt stuff needs to happen first, before
> drivers can use it. Since non-staging stuff really shouldn't depend upon
> code from staging.
> =

> > The last two patches are mocks that show how (2) and (3) might work out=
.  I
> > haven't done any testing with them yet.  Before going any further, I'd =
like to
> > get your feedback.  Can you see the benefits of explicit sync as an alt=
ernative
> > synchronization model?  Do you think we could use the android sync_fenc=
e for
> > passing fences between user space?  Or did you have something else in m=
ind for
> > explicit sync in the drm world?
> =

> I'm all for adding explicit syncing. Our plans are roughly.
> - Add both an in and and out fence to execbuf to sync with other rendering
>   and give userspace a fence back. Needs to different flags probably.
> =

> - Maybe add an ioctl to dma-bufs to get at the current implicit fences
>   attached to them (both an exclusive and non-exclusive version). This
>   should help with making explicit and implicit sync work together nicely.
> =

> - Add fence support to kms. Probably only worth it together with the new
>   atomic stuff. Again we need an in fence to wait for (one for each
>   buffer) and an out fence. The later can easily be implemented by
>   extending struct drm_event, which means not a single driver code line
>   needs to be changed for this.
> =

> - For de-staging android syncpts we need to de-clutter the internal
>   interfaces and also review all the ioctls exposed. Like you say it
>   should be just the userspace interface for struct drm_fence. Also, it
>   needs testcases and preferrably manpages.
> =

> Unfortunately it looks like Intel won't do this all for you due to a bunch
> of hilarious internal reasons :( At least not anytime soon.
> =

> Cheers, Daniel
> -- =

> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
