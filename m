From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC] Explicit synchronization for Nouveau
Date: Wed, 1 Oct 2014 19:27:21 +0200
Message-ID: <20141001172721.GQ12343@phenom.ffwll.local>
References: <1411725612-10455-1-git-send-email-lpeltonen@nvidia.com>
 <20140929074302.GB4109@phenom.ffwll.local>
 <20141001151416.GC25206@eumail.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20141001151416.GC25206@eumail.nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Lauri Peltonen <lpeltonen@nvidia.com>
Cc: Stephen Warren <swarren@nvidia.com>, nouveau@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, James Jones <jajones@nvidia.com>, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, Colin Cross <ccross@android.com>, Dave Airlie <airlied@redhat.com>, Thierry Reding <treding@nvidia.com>, Ken Adams <kadams@nvidia.com>
List-Id: nouveau.vger.kernel.org

On Wed, Oct 01, 2014 at 06:14:16PM +0300, Lauri Peltonen wrote:
> Thanks Daniel for your input!
> =

> On Mon, Sep 29, 2014 at 09:43:02AM +0200, Daniel Vetter wrote:
> > On Fri, Sep 26, 2014 at 01:00:05PM +0300, Lauri Peltonen wrote:
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
> =

> Implicit fences attached to individual buffers are one way for residency
> management.  Do you think a working set based model could work in the DRM
> framework?  For example, something like this:
> =

> - Allow user space to create "working set objects" and associate buffers =
with
>   them.  If the user space doesn't want to manage working sets explicitly=
, it
>   could also use an implicit default working set that contains all buffer=
s that
>   are mapped to the channel vm (on Android we could always use the default
>   working set since we don't need to manage residency).  The working sets=
 are
>   initially marked as dirty.
> - User space tells which working sets are referenced by each work submiss=
ion.
>   Kernel locks these working sets, pins all buffers in dirty working sets=
, and
>   resets the dirty bits.  After kicking off work, kernel stores the fence=
 to
>   the _working sets_, and then releases the locks (if an implicit default
>   working set is used, then this would be roughly equivalent to storing a=
 fence
>   to channel vm that tells "this is the last hw operation that might have
>   touched buffers in this address space").
> - If swapping doesn't happen, then we just need to check the working set =
dirty
>   bits at each submit.
> - When a buffer is swapped out, all working sets that refer to it need to=
 be
>   marked as dirty.
> - When a buffer is swapped out or unmapped, we need to wait for the fence=
s from
>   all working sets that refer to the buffer.
> =

> Initially one might think of working sets as a mere optimization - we now=
 need
> to process a few working sets at every submit instead of many individual
> buffers.  However, it makes a huge difference because of fences: fences t=
hat
> are attached to buffers are used for implicitly synchronizing work across
> different channels and engines.  They are in the performance critical pat=
h, and
> we want to carefully manage them (that's the idea of explicit synchroniza=
tion).
> The working set fences, on the other hand, would only be used to guarante=
e that
> we don't swap out or unmap something that the GPU might be accessing.  We=
 never
> need to wait for those fences (except when swapping or unmapping), so we =
can be
> conservative without hurting performance.

Yeah, within the driver (i.e. for private objects which are never exported
to dma_buf) we can recently do stuff like this. And your above idea is
roughly one of the things we're tossing around for i915.

But the cool stuff with drm is that cmd submission is driver-specific, so
you can just go wild with nouveau. Of course you have to coninvce the
nouveau guys (and also have open-source users for the new interface).

For shared buffers I think we should stick with the implicit fences for a
while simply because I'm not sure whether it's really worth the fuzz. And
reworking all the drivers and dma-buf for some working sets is a lot of
fuzz ;-) Like Maarten said you can mostly short-circuit the implicit
fencing by only attaching shared fences.

In case you're curious: The idea is to have a 1:1 association between
ppgtt address spaces and what you call the working set above, to implement
the buffer svm model in ocl2. Mostly because we expect that applications
won't get the more fine-grained buffer list right anyway. And this kind of
gang-scheduling of working set sizes should be more efficient for the
usual case where everything fits.

> > Imo de-staging the android syncpt stuff needs to happen first, before d=
rivers
> > can use it. Since non-staging stuff really shouldn't depend upon code f=
rom
> > staging.
> =

> Fully agree.  I thought the best way towards that would be to show some d=
river
> code that _would_ use it. :)

Oh, there's the usual chicken&egg where we need a full-blown prototype
before we can start merging. Interface work on upstream is super-hard, but
given the ridiculous backwards compat guarantees Linus expects us to keep
up totally justified. Mistakes are really expensive. So I'm happy to see
you charge ahead here.

> > I'm all for adding explicit syncing. Our plans are roughly.  - Add both=
 an in
> > and and out fence to execbuf to sync with other rendering and give user=
space
> > a fence back. Needs to different flags probably.
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
> =

> This all sounds very similar to what we'd like to do!  Maybe we can move
> forward with these parts, and continue to attach fences at submit until w=
e have
> a satisfactory solution for the pinning problem?

Yeah, that's our plan for i915 too. First add explicit fences, then figure
out whether we need to be better at neutering the implicit fences, in case
and only where it really gets in the way.

> I'd like to understand what are the concrete steps to de-stage struct
> sync_fence, since that's the first thing that needs to be done.  For exam=
ple,
> what do you mean by "de-cluttering the internal interfaces"?  Just that w=
e'd
> move the sync_fence parts from drivers/staging/android/sync.c to, say,
> drivers/dma-buf/sync-fence.c ?  Would we still leave a copy of the existi=
ng
> full driver to staging/android?

Yeah I guess that would be an approach. Personally I think we should also
have basic ioctl testcase for all the ioctls exposed by syncpt fds. And
reviewing the kerneldoc for the driver-internal interfaces (which includes
removing everything that's no made obsolete by struct fence). Bonus points
for documenting the ioctls. We could throw the test binary into libdrm
maybe, there's a bunch other like it already there.

I'm not sure whether/how much google has already for this.

Aside: Will you be at XDC or linux plumbers? Either would be a perfect
place to discuss plans and ideas - I'll attend both.

Cheers, Daniel=A7
-- =

Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
