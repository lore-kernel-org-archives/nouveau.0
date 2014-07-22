From: Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>
Subject: Re: [PATCH 09/17] drm/radeon: use common fence
 implementation for fences
Date: Tue, 22 Jul 2014 12:14:35 -0700
Message-ID: <20140722121435.6bd093d0@jbarnes-desktop>
References: <20140709093124.11354.3774.stgit@patser>
 <20140709122953.11354.46381.stgit@patser>
 <CAPM=9tyD2ZbrcGDC3hfNb7qNdzsfnyD-ZwM7G-nOgxeu5YKuSg@mail.gmail.com>
 <53CE2421.5040906@amd.com>
 <20140722114607.GL15237@phenom.ffwll.local>
 <20140722115737.GN15237@phenom.ffwll.local>
 <53CE56ED.4040109@vodafone.de> <53CE6FB0.90500@canonical.com>
 <53CE7410.3090603@amd.com> <53CE74B5.3000201@canonical.com>
 <53CE77B4.6020801@amd.com>
 <CAKMK7uESXrDtCov8whOTsffg6eZdibF4qaTFaCubM=mnhN=gNQ@mail.gmail.com>
 <CADnq5_Moy78A5JfDM0LME6_-48PW72DJpYYvEthQ5b=_amU8KQ@mail.gmail.com>
 <CAKMK7uGtfUTU=VwSnF07jncJsH1Ckie2m1FCjct60Yz88uE3cg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKMK7uGtfUTU=VwSnF07jncJsH1Ckie2m1FCjct60Yz88uE3cg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "Deucher,
 Alexander" <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alex Deucher <alexdeucher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Christian =?UTF-8?B?S8O2bmln?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, 22 Jul 2014 17:48:18 +0200
Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org> wrote:

> On Tue, Jul 22, 2014 at 5:42 PM, Alex Deucher <alexdeucher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> Fence-based syncing between userspace queues submitted stuff through
> >> doorbells and anything submitted by the general simply wont work.
> >> Which is why I think the doorbell is a stupid interface since I just
> >> don't see cameras and v4l devices implementing all that complexity to
> >> get a pure userspace side sync solution.
> >>
> >
> > Like it or not this is what a lot of application writers want (look at
> > mantle and metal and similar new APIs or android synpts).  Having
> > queues and fences in userspace allows the application to structure
> > things to best fit their own task graphs.  The app can decide how to
> > deal with dependencies and synchronization explicitly instead of
> > blocking the queues in the kernel for everyone.  Anyway, this is
> > getting off topic.
> 
> Well there's explicit fences as used in opencl and android syncpts. My
> plan is actually to support that in i915 using Maarten's struct fence
> stuff (and there's just a very trivial patch for the android stuff in
> merging needed to get there). What doesn't work is fences created
> behind the kernel's back purely in userspace by giving shared memory
> locations special meaning. Those get the kernel completely out of the
> picture (as opposed to android syncpts, which just make sync
> explicit).
> 
> I guess long-term we might need something like gpu futexes to make
> that pure userspace syncing integrate a bit better, but imo that's (at
> least for now) out of scope. For fences here I have the goal of one

Yeah, with a little kernel help you could have a mostly kernel
independent sync mechanism using just shared mem in userspace.  The
kernel would just need to signal any interested clients when something
happened (even if it didn't know what) and let userspace sort out the
rest.  I think that would be a nice thing to provide at some point, as
it could allow for some fine grained CPU/GPU algorithms that use
lightweight synchronization with and without busy looping on the CPU
side.

But all of that is definitely a lower priority than getting explicit
fencing exported to userspace to work right, both for intra-driver
sync and inter-driver sync.

> internally representation used by both implicit syncing (dma-buf on
> classic linux, e.g. prime) and explicit fencing on android or opencl
> or something like that.
> 
> We don't have the code yet ready, but that's the direction i915 will
> move towards for the near future. Jesse is working on some patches
> already.

Yeah I'd like to get some feedback from Maarten on my bits so I can get
them ready for upstream.  I still need to add documentation and tests,
but I'd like to make sure the interfaces and internals get acked first.

Thanks,
-- 
Jesse Barnes, Intel Open Source Technology Center
