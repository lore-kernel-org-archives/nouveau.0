From: Lauri Peltonen <lpeltonen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC] Explicit synchronization for Nouveau
Date: Thu, 2 Oct 2014 17:59:51 +0300
Message-ID: <20141002145950.GA4651@eumail.nvidia.com>
References: <1411725612-10455-1-git-send-email-lpeltonen@nvidia.com>
 <20140929074302.GB4109@phenom.ffwll.local>
 <20141001151416.GC25206@eumail.nvidia.com>
 <20141001172721.GQ12343@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141001172721.GQ12343-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Rom Lemarchand <romlem-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, James Jones <jajones-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ken Adams <kadams-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

+Rom who seems to be presenting about mainlining android sync at linux plumbers


On Wed, Oct 01, 2014 at 05:58:52PM +0200, Maarten Lankhorst wrote:
> You could neuter implicit fences by always attaching the fences as
> shared when explicit syncing is used. This would work correctly with
> eviction, and wouldn't cause any unneeded syncing. :)

Yes, that will probably work!  So, just to reiterate that I understood you and
Daniel correctly:

- de-stage sync_fence and it's user space API (the tedious part)
- add dma-buf ioctls for extracting and attaching explicit fences
- Nouveau specific: allow flagging gem buffers for explicit sync
  - do not check pre-fences from explicitly synced buffers at submit 
  - continue to attach a shared fence after submit so that pinning and
    unmapping continue to work

Then working sets and getting rid of locking all buffers individually 
can be dealt with later as an optimization.


On Wed, Oct 01, 2014 at 07:27:21PM +0200, Daniel Vetter wrote:
> On Wed, Oct 01, 2014 at 06:14:16PM +0300, Lauri Peltonen wrote:
> > Implicit fences attached to individual buffers are one way for residency
> > management.  Do you think a working set based model could work in the DRM
> > framework?  For example, something like this:
> > 
> > - Allow user space to create "working set objects" and associate buffers with
> >   them.  If the user space doesn't want to manage working sets explicitly, it
> >   could also use an implicit default working set that contains all buffers that
> >   are mapped to the channel vm (on Android we could always use the default
> >   working set since we don't need to manage residency).  The working sets are
> >   initially marked as dirty.
> > - User space tells which working sets are referenced by each work submission.
> >   Kernel locks these working sets, pins all buffers in dirty working sets, and
> >   resets the dirty bits.  After kicking off work, kernel stores the fence to
> >   the _working sets_, and then releases the locks (if an implicit default
> >   working set is used, then this would be roughly equivalent to storing a fence
> >   to channel vm that tells "this is the last hw operation that might have
> >   touched buffers in this address space").
> > - If swapping doesn't happen, then we just need to check the working set dirty
> >   bits at each submit.
> > - When a buffer is swapped out, all working sets that refer to it need to be
> >   marked as dirty.
> > - When a buffer is swapped out or unmapped, we need to wait for the fences from
> >   all working sets that refer to the buffer.
> > 
> > Initially one might think of working sets as a mere optimization - we now need
> > to process a few working sets at every submit instead of many individual
> > buffers.  However, it makes a huge difference because of fences: fences that
> > are attached to buffers are used for implicitly synchronizing work across
> > different channels and engines.  They are in the performance critical path, and
> > we want to carefully manage them (that's the idea of explicit synchronization).
> > The working set fences, on the other hand, would only be used to guarantee that
> > we don't swap out or unmap something that the GPU might be accessing.  We never
> > need to wait for those fences (except when swapping or unmapping), so we can be
> > conservative without hurting performance.
> 
> Yeah, within the driver (i.e. for private objects which are never exported
> to dma_buf) we can recently do stuff like this. And your above idea is
> roughly one of the things we're tossing around for i915.
> 
> But the cool stuff with drm is that cmd submission is driver-specific, so
> you can just go wild with nouveau. Of course you have to coninvce the
> nouveau guys (and also have open-source users for the new interface).
> 
> For shared buffers I think we should stick with the implicit fences for a
> while simply because I'm not sure whether it's really worth the fuzz. And
> reworking all the drivers and dma-buf for some working sets is a lot of
> fuzz ;-) Like Maarten said you can mostly short-circuit the implicit
> fencing by only attaching shared fences.

Yes, I'll try to do that.


> In case you're curious: The idea is to have a 1:1 association between
> ppgtt address spaces and what you call the working set above, to implement
> the buffer svm model in ocl2. Mostly because we expect that applications
> won't get the more fine-grained buffer list right anyway. And this kind of
> gang-scheduling of working set sizes should be more efficient for the
> usual case where everything fits.

If I understood correctly, this would be exactly the same as what I called the
"default working set" above.  On Android we don't care much about finer grained
working sets either, because of UMA and no swapping.


> > > Imo de-staging the android syncpt stuff needs to happen first, before drivers
> > > can use it. Since non-staging stuff really shouldn't depend upon code from
> > > staging.
> > 
> > Fully agree.  I thought the best way towards that would be to show some driver
> > code that _would_ use it. :)
> 
> Oh, there's the usual chicken&egg where we need a full-blown prototype
> before we can start merging. Interface work on upstream is super-hard, but
> given the ridiculous backwards compat guarantees Linus expects us to keep
> up totally justified. Mistakes are really expensive. So I'm happy to see
> you charge ahead here.

Given that I'm not used to working with upstream, don't expect too much from my
"charging ahead". :)  I'm still secretly hoping that the Android guys at Google
would jump in to help, now that we seem to agree that we could de-stage
sync_fence.


> > > I'm all for adding explicit syncing. Our plans are roughly.  - Add both an in
> > > and and out fence to execbuf to sync with other rendering and give userspace
> > > a fence back. Needs to different flags probably.
> > > 
> > > - Maybe add an ioctl to dma-bufs to get at the current implicit fences
> > >   attached to them (both an exclusive and non-exclusive version). This
> > >   should help with making explicit and implicit sync work together nicely.
> > > 
> > > - Add fence support to kms. Probably only worth it together with the new
> > >   atomic stuff. Again we need an in fence to wait for (one for each
> > >   buffer) and an out fence. The later can easily be implemented by
> > >   extending struct drm_event, which means not a single driver code line
> > >   needs to be changed for this.
> > > 
> > > - For de-staging android syncpts we need to de-clutter the internal
> > >   interfaces and also review all the ioctls exposed. Like you say it
> > >   should be just the userspace interface for struct drm_fence. Also, it
> > >   needs testcases and preferrably manpages.
> > 
> > This all sounds very similar to what we'd like to do!  Maybe we can move
> > forward with these parts, and continue to attach fences at submit until we have
> > a satisfactory solution for the pinning problem?
> 
> Yeah, that's our plan for i915 too. First add explicit fences, then figure
> out whether we need to be better at neutering the implicit fences, in case
> and only where it really gets in the way.
> 
> > I'd like to understand what are the concrete steps to de-stage struct
> > sync_fence, since that's the first thing that needs to be done.  For example,
> > what do you mean by "de-cluttering the internal interfaces"?  Just that we'd
> > move the sync_fence parts from drivers/staging/android/sync.c to, say,
> > drivers/dma-buf/sync-fence.c ?  Would we still leave a copy of the existing
> > full driver to staging/android?
> 
> Yeah I guess that would be an approach. Personally I think we should also
> have basic ioctl testcase for all the ioctls exposed by syncpt fds. And
> reviewing the kerneldoc for the driver-internal interfaces (which includes
> removing everything that's no made obsolete by struct fence). Bonus points
> for documenting the ioctls. We could throw the test binary into libdrm
> maybe, there's a bunch other like it already there.
> 
> I'm not sure whether/how much google has already for this.

The simplest way to add tests is if we allow user space to create and trigger
fences.  We don't want to enable that from kernel by default, because that
opens possibilities for deadlocks (e.g. a process could deadlock a compositor
by passing a fence that it never triggers).  Android sync driver solves this by
having a separate CONFIG_SW_SYNC_USER that can be used for testing.

Here's a simple test by Google:
https://android.googlesource.com/platform/system/core/+/master/libsync/sync_test.c

And this is their userspace wrapper lib:
https://android.googlesource.com/platform/system/core/+/master/libsync/sync.c
https://android.googlesource.com/platform/system/core/+/master/libsync/include/sync/sync.h

Would that go to libdrm now...?


> Aside: Will you be at XDC or linux plumbers? Either would be a perfect
> place to discuss plans and ideas - I'll attend both.

I wasn't going to, but let's see.  The former is pretty soon and the latter is
sold out.  At least Andy Ritger from Nvidia is coming to XDC for sure, and he's
been involved in our internal discussions around these topics. So I suggest you
have a chat with him at least!  :)


Thanks,
Lauri
