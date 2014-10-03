From: Rom Lemarchand <romlem@google.com>
Subject: Re: [RFC] Explicit synchronization for Nouveau
Date: Fri, 3 Oct 2014 14:56:00 -0700
Message-ID: <CAABpnA_r1Vu8pGtxqXO8Ufg5KMhkUy_9RPic-VActaJQyLRm_w@mail.gmail.com>
References: <1411725612-10455-1-git-send-email-lpeltonen@nvidia.com>
 <20140929074302.GB4109@phenom.ffwll.local>
 <20141001151416.GC25206@eumail.nvidia.com>
 <20141001172721.GQ12343@phenom.ffwll.local>
 <20141002145950.GA4651@eumail.nvidia.com>
 <20141002190905.GA16117@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1974862883=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20141002190905.GA16117@phenom.ffwll.local>
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
Cc: Stephen Warren <swarren@nvidia.com>, nouveau@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, James Jones <jajones@nvidia.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Greg KH <gregkh@linuxfoundation.org>, Ben Skeggs <bskeggs@redhat.com>, Colin Cross <ccross@android.com>, Dave Airlie <airlied@redhat.com>, Thierry Reding <treding@nvidia.com>, Riley Andrews <riandrews@google.com>, Ken Adams <kadams@nvidia.com>
List-Id: nouveau.vger.kernel.org

--===============1974862883==
Content-Type: multipart/alternative; boundary=001a11c3e27e6d0c1a05048bcc3c

--001a11c3e27e6d0c1a05048bcc3c
Content-Type: text/plain; charset=UTF-8

Riley (CCed) and I will be at Plumbers in a couple weeks.

There is a session on sync planned in the Android track, and of course
we'll be available to chat.

On Thu, Oct 2, 2014 at 1:44 PM, Daniel Vetter <daniel@ffwll.ch> wrote:

> On Thu, Oct 02, 2014 at 05:59:51PM +0300, Lauri Peltonen wrote:
> > +Rom who seems to be presenting about mainlining android sync at linux
> plumbers
>
> Also add Greg KH as fyi that we're working on de-stage one of the android
> subsystems.
>
> > On Wed, Oct 01, 2014 at 05:58:52PM +0200, Maarten Lankhorst wrote:
> > > You could neuter implicit fences by always attaching the fences as
> > > shared when explicit syncing is used. This would work correctly with
> > > eviction, and wouldn't cause any unneeded syncing. :)
> >
> > Yes, that will probably work!  So, just to reiterate that I understood
> you and
> > Daniel correctly:
> >
> > - de-stage sync_fence and it's user space API (the tedious part)
> > - add dma-buf ioctls for extracting and attaching explicit fences
> > - Nouveau specific: allow flagging gem buffers for explicit sync
> >   - do not check pre-fences from explicitly synced buffers at submit
> >   - continue to attach a shared fence after submit so that pinning and
> >     unmapping continue to work
>
>     - Have explicit in/out fences for the pushbuf ioctl is missing I
>       guess in this step?
>
> I also think we need some kind of demonstration vehicle using nouveau to
> satisfy Dave Airlie's open-source userspace requirements for new
> interfaces. Might be good to chat with him to make sure we have that
> covered (and how much needs to be there really).
>
> > Then working sets and getting rid of locking all buffers individually
> > can be dealt with later as an optimization.
>
> Yeah, sounds like a good plan.
>
> > On Wed, Oct 01, 2014 at 07:27:21PM +0200, Daniel Vetter wrote:
> > > On Wed, Oct 01, 2014 at 06:14:16PM +0300, Lauri Peltonen wrote:
> > > > Implicit fences attached to individual buffers are one way for
> residency
> > > > management.  Do you think a working set based model could work in
> the DRM
> > > > framework?  For example, something like this:
> > > >
> > > > - Allow user space to create "working set objects" and associate
> buffers with
> > > >   them.  If the user space doesn't want to manage working sets
> explicitly, it
> > > >   could also use an implicit default working set that contains all
> buffers that
> > > >   are mapped to the channel vm (on Android we could always use the
> default
> > > >   working set since we don't need to manage residency).  The working
> sets are
> > > >   initially marked as dirty.
> > > > - User space tells which working sets are referenced by each work
> submission.
> > > >   Kernel locks these working sets, pins all buffers in dirty working
> sets, and
> > > >   resets the dirty bits.  After kicking off work, kernel stores the
> fence to
> > > >   the _working sets_, and then releases the locks (if an implicit
> default
> > > >   working set is used, then this would be roughly equivalent to
> storing a fence
> > > >   to channel vm that tells "this is the last hw operation that might
> have
> > > >   touched buffers in this address space").
> > > > - If swapping doesn't happen, then we just need to check the working
> set dirty
> > > >   bits at each submit.
> > > > - When a buffer is swapped out, all working sets that refer to it
> need to be
> > > >   marked as dirty.
> > > > - When a buffer is swapped out or unmapped, we need to wait for the
> fences from
> > > >   all working sets that refer to the buffer.
> > > >
> > > > Initially one might think of working sets as a mere optimization -
> we now need
> > > > to process a few working sets at every submit instead of many
> individual
> > > > buffers.  However, it makes a huge difference because of fences:
> fences that
> > > > are attached to buffers are used for implicitly synchronizing work
> across
> > > > different channels and engines.  They are in the performance
> critical path, and
> > > > we want to carefully manage them (that's the idea of explicit
> synchronization).
> > > > The working set fences, on the other hand, would only be used to
> guarantee that
> > > > we don't swap out or unmap something that the GPU might be
> accessing.  We never
> > > > need to wait for those fences (except when swapping or unmapping),
> so we can be
> > > > conservative without hurting performance.
> > >
> > > Yeah, within the driver (i.e. for private objects which are never
> exported
> > > to dma_buf) we can recently do stuff like this. And your above idea is
> > > roughly one of the things we're tossing around for i915.
> > >
> > > But the cool stuff with drm is that cmd submission is driver-specific,
> so
> > > you can just go wild with nouveau. Of course you have to coninvce the
> > > nouveau guys (and also have open-source users for the new interface).
> > >
> > > For shared buffers I think we should stick with the implicit fences
> for a
> > > while simply because I'm not sure whether it's really worth the fuzz.
> And
> > > reworking all the drivers and dma-buf for some working sets is a lot of
> > > fuzz ;-) Like Maarten said you can mostly short-circuit the implicit
> > > fencing by only attaching shared fences.
> >
> > Yes, I'll try to do that.
> >
> >
> > > In case you're curious: The idea is to have a 1:1 association between
> > > ppgtt address spaces and what you call the working set above, to
> implement
> > > the buffer svm model in ocl2. Mostly because we expect that
> applications
> > > won't get the more fine-grained buffer list right anyway. And this
> kind of
> > > gang-scheduling of working set sizes should be more efficient for the
> > > usual case where everything fits.
> >
> > If I understood correctly, this would be exactly the same as what I
> called the
> > "default working set" above.  On Android we don't care much about finer
> grained
> > working sets either, because of UMA and no swapping.
>
> Yeah, that's pretty much the idea. Well with ocl the SVM buffer working
> set sizes are attached to an ocl context, but I don't think there'll be
> more than one of those around really (except maybe when different
> libraries all use ocl, but don't work together on the same data).
>
> > > > > Imo de-staging the android syncpt stuff needs to happen first,
> before drivers
> > > > > can use it. Since non-staging stuff really shouldn't depend upon
> code from
> > > > > staging.
> > > >
> > > > Fully agree.  I thought the best way towards that would be to show
> some driver
> > > > code that _would_ use it. :)
> > >
> > > Oh, there's the usual chicken&egg where we need a full-blown prototype
> > > before we can start merging. Interface work on upstream is super-hard,
> but
> > > given the ridiculous backwards compat guarantees Linus expects us to
> keep
> > > up totally justified. Mistakes are really expensive. So I'm happy to
> see
> > > you charge ahead here.
> >
> > Given that I'm not used to working with upstream, don't expect too much
> from my
> > "charging ahead". :)  I'm still secretly hoping that the Android guys at
> Google
> > would jump in to help, now that we seem to agree that we could de-stage
> > sync_fence.
>
> Forget that, imo the android guys are 100% absorbed with their own stuff,
> at least on the gfx side. Occasionally they pipe up with "btw this is what
> we're doing now".
>
> Also, the problem is that to actually push android stuff out of staging
> you need a use-case in upstream, which means an open-source gpu driver.
> There's not a lot of companies who have both that and ship android, and
> definitely not the nexus/android lead platforms.
>
> Display side would be easier since there's a bunch of kms drivers now
> upstream. But given that google decided to go ahead with their own adf
> instead of drm-kms that's also a non-starter.
>
> Heck, I have a hard time draggin our own android folks here at intel into
> upstream work ...
>
> > > > > I'm all for adding explicit syncing. Our plans are roughly.  - Add
> both an in
> > > > > and and out fence to execbuf to sync with other rendering and give
> userspace
> > > > > a fence back. Needs to different flags probably.
> > > > >
> > > > > - Maybe add an ioctl to dma-bufs to get at the current implicit
> fences
> > > > >   attached to them (both an exclusive and non-exclusive version).
> This
> > > > >   should help with making explicit and implicit sync work together
> nicely.
> > > > >
> > > > > - Add fence support to kms. Probably only worth it together with
> the new
> > > > >   atomic stuff. Again we need an in fence to wait for (one for each
> > > > >   buffer) and an out fence. The later can easily be implemented by
> > > > >   extending struct drm_event, which means not a single driver code
> line
> > > > >   needs to be changed for this.
> > > > >
> > > > > - For de-staging android syncpts we need to de-clutter the internal
> > > > >   interfaces and also review all the ioctls exposed. Like you say
> it
> > > > >   should be just the userspace interface for struct drm_fence.
> Also, it
> > > > >   needs testcases and preferrably manpages.
> > > >
> > > > This all sounds very similar to what we'd like to do!  Maybe we can
> move
> > > > forward with these parts, and continue to attach fences at submit
> until we have
> > > > a satisfactory solution for the pinning problem?
> > >
> > > Yeah, that's our plan for i915 too. First add explicit fences, then
> figure
> > > out whether we need to be better at neutering the implicit fences, in
> case
> > > and only where it really gets in the way.
> > >
> > > > I'd like to understand what are the concrete steps to de-stage struct
> > > > sync_fence, since that's the first thing that needs to be done.  For
> example,
> > > > what do you mean by "de-cluttering the internal interfaces"?  Just
> that we'd
> > > > move the sync_fence parts from drivers/staging/android/sync.c to,
> say,
> > > > drivers/dma-buf/sync-fence.c ?  Would we still leave a copy of the
> existing
> > > > full driver to staging/android?
> > >
> > > Yeah I guess that would be an approach. Personally I think we should
> also
> > > have basic ioctl testcase for all the ioctls exposed by syncpt fds. And
> > > reviewing the kerneldoc for the driver-internal interfaces (which
> includes
> > > removing everything that's no made obsolete by struct fence). Bonus
> points
> > > for documenting the ioctls. We could throw the test binary into libdrm
> > > maybe, there's a bunch other like it already there.
> > >
> > > I'm not sure whether/how much google has already for this.
> >
> > The simplest way to add tests is if we allow user space to create and
> trigger
> > fences.  We don't want to enable that from kernel by default, because
> that
> > opens possibilities for deadlocks (e.g. a process could deadlock a
> compositor
> > by passing a fence that it never triggers).  Android sync driver solves
> this by
> > having a separate CONFIG_SW_SYNC_USER that can be used for testing.
> >
> > Here's a simple test by Google:
> >
> https://android.googlesource.com/platform/system/core/+/master/libsync/sync_test.c
>
> Hm, usually we expose such test interfaces through debugfs - that way
> production system won't ever ship with it (since there's too many exploits
> in there, especially with secure boot). But since you need it for
> validation tests (at least for the i915 suite) it should always be there
> when you need it.
>
> Exposing this as a configurable driver in dev is imo a no-go. But we
> should be able to easily convert this into a few debugfs files, so not too
> much fuzz hopefully.
>
> > And this is their userspace wrapper lib:
> >
> https://android.googlesource.com/platform/system/core/+/master/libsync/sync.c
> >
> https://android.googlesource.com/platform/system/core/+/master/libsync/include/sync/sync.h
> >
> > Would that go to libdrm now...?
>
> Imo it would make sense. At least we kinda want to use fences outside of
> Android, and a separate library project feels like overkill.
>
> > > Aside: Will you be at XDC or linux plumbers? Either would be a perfect
> > > place to discuss plans and ideas - I'll attend both.
> >
> > I wasn't going to, but let's see.  The former is pretty soon and the
> latter is
> > sold out.  At least Andy Ritger from Nvidia is coming to XDC for sure,
> and he's
> > been involved in our internal discussions around these topics. So I
> suggest you
> > have a chat with him at least!  :)
>
> I'll definitely have a chat (and some beers) with Andy, been a while I've
> last seen him ;-)
>
> Cheers, Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
>

--001a11c3e27e6d0c1a05048bcc3c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Riley (CCed) and I will be at Plumbers in a couple weeks.<=
div><br></div><div>There is a session on sync planned in the Android track,=
 and of course we&#39;ll be available to chat.</div></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Thu, Oct 2, 2014 at 1:44 PM, Da=
niel Vetter <span dir=3D"ltr">&lt;<a href=3D"mailto:daniel@ffwll.ch" target=
=3D"_blank">daniel@ffwll.ch</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><span class=3D"">On Thu, Oct 02, 2014 at 05:59:51PM +0300, Lauri P=
eltonen wrote:<br>
&gt; +Rom who seems to be presenting about mainlining android sync at linux=
 plumbers<br>
<br>
</span>Also add Greg KH as fyi that we&#39;re working on de-stage one of th=
e android<br>
subsystems.<br>
<span class=3D""><br>
&gt; On Wed, Oct 01, 2014 at 05:58:52PM +0200, Maarten Lankhorst wrote:<br>
&gt; &gt; You could neuter implicit fences by always attaching the fences a=
s<br>
&gt; &gt; shared when explicit syncing is used. This would work correctly w=
ith<br>
&gt; &gt; eviction, and wouldn&#39;t cause any unneeded syncing. :)<br>
&gt;<br>
&gt; Yes, that will probably work!=C2=A0 So, just to reiterate that I under=
stood you and<br>
&gt; Daniel correctly:<br>
&gt;<br>
&gt; - de-stage sync_fence and it&#39;s user space API (the tedious part)<b=
r>
&gt; - add dma-buf ioctls for extracting and attaching explicit fences<br>
&gt; - Nouveau specific: allow flagging gem buffers for explicit sync<br>
&gt;=C2=A0 =C2=A0- do not check pre-fences from explicitly synced buffers a=
t submit<br>
&gt;=C2=A0 =C2=A0- continue to attach a shared fence after submit so that p=
inning and<br>
&gt;=C2=A0 =C2=A0 =C2=A0unmapping continue to work<br>
<br>
</span>=C2=A0 =C2=A0 - Have explicit in/out fences for the pushbuf ioctl is=
 missing I<br>
=C2=A0 =C2=A0 =C2=A0 guess in this step?<br>
<br>
I also think we need some kind of demonstration vehicle using nouveau to<br=
>
satisfy Dave Airlie&#39;s open-source userspace requirements for new<br>
interfaces. Might be good to chat with him to make sure we have that<br>
covered (and how much needs to be there really).<br>
<span class=3D""><br>
&gt; Then working sets and getting rid of locking all buffers individually<=
br>
&gt; can be dealt with later as an optimization.<br>
<br>
</span>Yeah, sounds like a good plan.<br>
<div><div class=3D"h5"><br>
&gt; On Wed, Oct 01, 2014 at 07:27:21PM +0200, Daniel Vetter wrote:<br>
&gt; &gt; On Wed, Oct 01, 2014 at 06:14:16PM +0300, Lauri Peltonen wrote:<b=
r>
&gt; &gt; &gt; Implicit fences attached to individual buffers are one way f=
or residency<br>
&gt; &gt; &gt; management.=C2=A0 Do you think a working set based model cou=
ld work in the DRM<br>
&gt; &gt; &gt; framework?=C2=A0 For example, something like this:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; - Allow user space to create &quot;working set objects&quot;=
 and associate buffers with<br>
&gt; &gt; &gt;=C2=A0 =C2=A0them.=C2=A0 If the user space doesn&#39;t want t=
o manage working sets explicitly, it<br>
&gt; &gt; &gt;=C2=A0 =C2=A0could also use an implicit default working set t=
hat contains all buffers that<br>
&gt; &gt; &gt;=C2=A0 =C2=A0are mapped to the channel vm (on Android we coul=
d always use the default<br>
&gt; &gt; &gt;=C2=A0 =C2=A0working set since we don&#39;t need to manage re=
sidency).=C2=A0 The working sets are<br>
&gt; &gt; &gt;=C2=A0 =C2=A0initially marked as dirty.<br>
&gt; &gt; &gt; - User space tells which working sets are referenced by each=
 work submission.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0Kernel locks these working sets, pins all buffer=
s in dirty working sets, and<br>
&gt; &gt; &gt;=C2=A0 =C2=A0resets the dirty bits.=C2=A0 After kicking off w=
ork, kernel stores the fence to<br>
&gt; &gt; &gt;=C2=A0 =C2=A0the _working sets_, and then releases the locks =
(if an implicit default<br>
&gt; &gt; &gt;=C2=A0 =C2=A0working set is used, then this would be roughly =
equivalent to storing a fence<br>
&gt; &gt; &gt;=C2=A0 =C2=A0to channel vm that tells &quot;this is the last =
hw operation that might have<br>
&gt; &gt; &gt;=C2=A0 =C2=A0touched buffers in this address space&quot;).<br=
>
&gt; &gt; &gt; - If swapping doesn&#39;t happen, then we just need to check=
 the working set dirty<br>
&gt; &gt; &gt;=C2=A0 =C2=A0bits at each submit.<br>
&gt; &gt; &gt; - When a buffer is swapped out, all working sets that refer =
to it need to be<br>
&gt; &gt; &gt;=C2=A0 =C2=A0marked as dirty.<br>
&gt; &gt; &gt; - When a buffer is swapped out or unmapped, we need to wait =
for the fences from<br>
&gt; &gt; &gt;=C2=A0 =C2=A0all working sets that refer to the buffer.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Initially one might think of working sets as a mere optimiza=
tion - we now need<br>
&gt; &gt; &gt; to process a few working sets at every submit instead of man=
y individual<br>
&gt; &gt; &gt; buffers.=C2=A0 However, it makes a huge difference because o=
f fences: fences that<br>
&gt; &gt; &gt; are attached to buffers are used for implicitly synchronizin=
g work across<br>
&gt; &gt; &gt; different channels and engines.=C2=A0 They are in the perfor=
mance critical path, and<br>
&gt; &gt; &gt; we want to carefully manage them (that&#39;s the idea of exp=
licit synchronization).<br>
&gt; &gt; &gt; The working set fences, on the other hand, would only be use=
d to guarantee that<br>
&gt; &gt; &gt; we don&#39;t swap out or unmap something that the GPU might =
be accessing.=C2=A0 We never<br>
&gt; &gt; &gt; need to wait for those fences (except when swapping or unmap=
ping), so we can be<br>
&gt; &gt; &gt; conservative without hurting performance.<br>
&gt; &gt;<br>
&gt; &gt; Yeah, within the driver (i.e. for private objects which are never=
 exported<br>
&gt; &gt; to dma_buf) we can recently do stuff like this. And your above id=
ea is<br>
&gt; &gt; roughly one of the things we&#39;re tossing around for i915.<br>
&gt; &gt;<br>
&gt; &gt; But the cool stuff with drm is that cmd submission is driver-spec=
ific, so<br>
&gt; &gt; you can just go wild with nouveau. Of course you have to coninvce=
 the<br>
&gt; &gt; nouveau guys (and also have open-source users for the new interfa=
ce).<br>
&gt; &gt;<br>
&gt; &gt; For shared buffers I think we should stick with the implicit fenc=
es for a<br>
&gt; &gt; while simply because I&#39;m not sure whether it&#39;s really wor=
th the fuzz. And<br>
&gt; &gt; reworking all the drivers and dma-buf for some working sets is a =
lot of<br>
&gt; &gt; fuzz ;-) Like Maarten said you can mostly short-circuit the impli=
cit<br>
&gt; &gt; fencing by only attaching shared fences.<br>
&gt;<br>
&gt; Yes, I&#39;ll try to do that.<br>
&gt;<br>
&gt;<br>
&gt; &gt; In case you&#39;re curious: The idea is to have a 1:1 association=
 between<br>
&gt; &gt; ppgtt address spaces and what you call the working set above, to =
implement<br>
&gt; &gt; the buffer svm model in ocl2. Mostly because we expect that appli=
cations<br>
&gt; &gt; won&#39;t get the more fine-grained buffer list right anyway. And=
 this kind of<br>
&gt; &gt; gang-scheduling of working set sizes should be more efficient for=
 the<br>
&gt; &gt; usual case where everything fits.<br>
&gt;<br>
&gt; If I understood correctly, this would be exactly the same as what I ca=
lled the<br>
&gt; &quot;default working set&quot; above.=C2=A0 On Android we don&#39;t c=
are much about finer grained<br>
&gt; working sets either, because of UMA and no swapping.<br>
<br>
</div></div>Yeah, that&#39;s pretty much the idea. Well with ocl the SVM bu=
ffer working<br>
set sizes are attached to an ocl context, but I don&#39;t think there&#39;l=
l be<br>
more than one of those around really (except maybe when different<br>
libraries all use ocl, but don&#39;t work together on the same data).<br>
<span class=3D""><br>
&gt; &gt; &gt; &gt; Imo de-staging the android syncpt stuff needs to happen=
 first, before drivers<br>
&gt; &gt; &gt; &gt; can use it. Since non-staging stuff really shouldn&#39;=
t depend upon code from<br>
&gt; &gt; &gt; &gt; staging.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Fully agree.=C2=A0 I thought the best way towards that would=
 be to show some driver<br>
&gt; &gt; &gt; code that _would_ use it. :)<br>
&gt; &gt;<br>
&gt; &gt; Oh, there&#39;s the usual chicken&amp;egg where we need a full-bl=
own prototype<br>
&gt; &gt; before we can start merging. Interface work on upstream is super-=
hard, but<br>
&gt; &gt; given the ridiculous backwards compat guarantees Linus expects us=
 to keep<br>
&gt; &gt; up totally justified. Mistakes are really expensive. So I&#39;m h=
appy to see<br>
&gt; &gt; you charge ahead here.<br>
&gt;<br>
&gt; Given that I&#39;m not used to working with upstream, don&#39;t expect=
 too much from my<br>
&gt; &quot;charging ahead&quot;. :)=C2=A0 I&#39;m still secretly hoping tha=
t the Android guys at Google<br>
&gt; would jump in to help, now that we seem to agree that we could de-stag=
e<br>
&gt; sync_fence.<br>
<br>
</span>Forget that, imo the android guys are 100% absorbed with their own s=
tuff,<br>
at least on the gfx side. Occasionally they pipe up with &quot;btw this is =
what<br>
we&#39;re doing now&quot;.<br>
<br>
Also, the problem is that to actually push android stuff out of staging<br>
you need a use-case in upstream, which means an open-source gpu driver.<br>
There&#39;s not a lot of companies who have both that and ship android, and=
<br>
definitely not the nexus/android lead platforms.<br>
<br>
Display side would be easier since there&#39;s a bunch of kms drivers now<b=
r>
upstream. But given that google decided to go ahead with their own adf<br>
instead of drm-kms that&#39;s also a non-starter.<br>
<br>
Heck, I have a hard time draggin our own android folks here at intel into<b=
r>
upstream work ...<br>
<div><div class=3D"h5"><br>
&gt; &gt; &gt; &gt; I&#39;m all for adding explicit syncing. Our plans are =
roughly.=C2=A0 - Add both an in<br>
&gt; &gt; &gt; &gt; and and out fence to execbuf to sync with other renderi=
ng and give userspace<br>
&gt; &gt; &gt; &gt; a fence back. Needs to different flags probably.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; - Maybe add an ioctl to dma-bufs to get at the current =
implicit fences<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0attached to them (both an exclusive and non=
-exclusive version). This<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0should help with making explicit and implic=
it sync work together nicely.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; - Add fence support to kms. Probably only worth it toge=
ther with the new<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0atomic stuff. Again we need an in fence to =
wait for (one for each<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0buffer) and an out fence. The later can eas=
ily be implemented by<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0extending struct drm_event, which means not=
 a single driver code line<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0needs to be changed for this.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; - For de-staging android syncpts we need to de-clutter =
the internal<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0interfaces and also review all the ioctls e=
xposed. Like you say it<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0should be just the userspace interface for =
struct drm_fence. Also, it<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0needs testcases and preferrably manpages.<b=
r>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This all sounds very similar to what we&#39;d like to do!=C2=
=A0 Maybe we can move<br>
&gt; &gt; &gt; forward with these parts, and continue to attach fences at s=
ubmit until we have<br>
&gt; &gt; &gt; a satisfactory solution for the pinning problem?<br>
&gt; &gt;<br>
&gt; &gt; Yeah, that&#39;s our plan for i915 too. First add explicit fences=
, then figure<br>
&gt; &gt; out whether we need to be better at neutering the implicit fences=
, in case<br>
&gt; &gt; and only where it really gets in the way.<br>
&gt; &gt;<br>
&gt; &gt; &gt; I&#39;d like to understand what are the concrete steps to de=
-stage struct<br>
&gt; &gt; &gt; sync_fence, since that&#39;s the first thing that needs to b=
e done.=C2=A0 For example,<br>
&gt; &gt; &gt; what do you mean by &quot;de-cluttering the internal interfa=
ces&quot;?=C2=A0 Just that we&#39;d<br>
&gt; &gt; &gt; move the sync_fence parts from drivers/staging/android/sync.=
c to, say,<br>
&gt; &gt; &gt; drivers/dma-buf/sync-fence.c ?=C2=A0 Would we still leave a =
copy of the existing<br>
&gt; &gt; &gt; full driver to staging/android?<br>
&gt; &gt;<br>
&gt; &gt; Yeah I guess that would be an approach. Personally I think we sho=
uld also<br>
&gt; &gt; have basic ioctl testcase for all the ioctls exposed by syncpt fd=
s. And<br>
&gt; &gt; reviewing the kerneldoc for the driver-internal interfaces (which=
 includes<br>
&gt; &gt; removing everything that&#39;s no made obsolete by struct fence).=
 Bonus points<br>
&gt; &gt; for documenting the ioctls. We could throw the test binary into l=
ibdrm<br>
&gt; &gt; maybe, there&#39;s a bunch other like it already there.<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m not sure whether/how much google has already for this.<br=
>
&gt;<br>
&gt; The simplest way to add tests is if we allow user space to create and =
trigger<br>
&gt; fences.=C2=A0 We don&#39;t want to enable that from kernel by default,=
 because that<br>
&gt; opens possibilities for deadlocks (e.g. a process could deadlock a com=
positor<br>
&gt; by passing a fence that it never triggers).=C2=A0 Android sync driver =
solves this by<br>
&gt; having a separate CONFIG_SW_SYNC_USER that can be used for testing.<br=
>
&gt;<br>
&gt; Here&#39;s a simple test by Google:<br>
&gt; <a href=3D"https://android.googlesource.com/platform/system/core/+/mas=
ter/libsync/sync_test.c" target=3D"_blank">https://android.googlesource.com=
/platform/system/core/+/master/libsync/sync_test.c</a><br>
<br>
</div></div>Hm, usually we expose such test interfaces through debugfs - th=
at way<br>
production system won&#39;t ever ship with it (since there&#39;s too many e=
xploits<br>
in there, especially with secure boot). But since you need it for<br>
validation tests (at least for the i915 suite) it should always be there<br=
>
when you need it.<br>
<br>
Exposing this as a configurable driver in dev is imo a no-go. But we<br>
should be able to easily convert this into a few debugfs files, so not too<=
br>
much fuzz hopefully.<br>
<span class=3D""><br>
&gt; And this is their userspace wrapper lib:<br>
&gt; <a href=3D"https://android.googlesource.com/platform/system/core/+/mas=
ter/libsync/sync.c" target=3D"_blank">https://android.googlesource.com/plat=
form/system/core/+/master/libsync/sync.c</a><br>
&gt; <a href=3D"https://android.googlesource.com/platform/system/core/+/mas=
ter/libsync/include/sync/sync.h" target=3D"_blank">https://android.googleso=
urce.com/platform/system/core/+/master/libsync/include/sync/sync.h</a><br>
&gt;<br>
&gt; Would that go to libdrm now...?<br>
<br>
</span>Imo it would make sense. At least we kinda want to use fences outsid=
e of<br>
Android, and a separate library project feels like overkill.<br>
<span class=3D""><br>
&gt; &gt; Aside: Will you be at XDC or linux plumbers? Either would be a pe=
rfect<br>
&gt; &gt; place to discuss plans and ideas - I&#39;ll attend both.<br>
&gt;<br>
&gt; I wasn&#39;t going to, but let&#39;s see.=C2=A0 The former is pretty s=
oon and the latter is<br>
&gt; sold out.=C2=A0 At least Andy Ritger from Nvidia is coming to XDC for =
sure, and he&#39;s<br>
&gt; been involved in our internal discussions around these topics. So I su=
ggest you<br>
&gt; have a chat with him at least!=C2=A0 :)<br>
<br>
</span>I&#39;ll definitely have a chat (and some beers) with Andy, been a w=
hile I&#39;ve<br>
last seen him ;-)<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
Cheers, Daniel<br>
--<br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"tel:%2B41%20%280%29%2079%20365%2057%2048" value=3D"+41793655748"=
>+41 (0) 79 365 57 48</a>=C2=A0- <a href=3D"http://blog.ffwll.ch" target=3D=
"_blank">http://blog.ffwll.ch</a><br>
</div></div></blockquote></div><br></div>

--001a11c3e27e6d0c1a05048bcc3c--

--===============1974862883==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1974862883==--
