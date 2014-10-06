From: Lauri Peltonen <lpeltonen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC] Explicit synchronization for Nouveau
Date: Mon, 6 Oct 2014 15:25:40 +0300
Message-ID: <20141006122540.GA7974@eumail.nvidia.com>
References: <1411725612-10455-1-git-send-email-lpeltonen@nvidia.com>
 <20140929074302.GB4109@phenom.ffwll.local>
 <20141001151416.GC25206@eumail.nvidia.com>
 <20141001172721.GQ12343@phenom.ffwll.local>
 <20141002145950.GA4651@eumail.nvidia.com>
 <20141002190905.GA16117@phenom.ffwll.local>
 <CAABpnA_r1Vu8pGtxqXO8Ufg5KMhkUy_9RPic-VActaJQyLRm_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAABpnA_r1Vu8pGtxqXO8Ufg5KMhkUy_9RPic-VActaJQyLRm_w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Rom Lemarchand <romlem-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, James Jones <jajones-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Greg Hackmann <ghackmann-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Riley Andrews <riandrews-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ken Adams <kadams-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Oct 02, 2014 at 10:44:05PM +0200, Daniel Vetter wrote:
> On Thu, Oct 02, 2014 at 05:59:51PM +0300, Lauri Peltonen wrote:
> > Yes, that will probably work!  So, just to reiterate that I understood you and
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

Yes, I was missing that. :)


> I also think we need some kind of demonstration vehicle using nouveau to
> satisfy Dave Airlie's open-source userspace requirements for new
> interfaces. Might be good to chat with him to make sure we have that
> covered (and how much needs to be there really).

Agreed.


> Also, the problem is that to actually push android stuff out of staging
> you need a use-case in upstream, which means an open-source gpu driver.
> There's not a lot of companies who have both that and ship android, and
> definitely not the nexus/android lead platforms.
> 
> Display side would be easier since there's a bunch of kms drivers now
> upstream. But given that google decided to go ahead with their own adf
> instead of drm-kms that's also a non-starter.

Hmm..  Maybe we could use TegraDRM on the display side..  That and Nouveau
would already be two upstream drivers that support explicit sync on Tegra K1.

Also, if we bring sync fd's out of staging, one idea would be to add support
for EGL_ANDROID_native_fence_sync in mesa, along with some tests.  That would
demonstrate converting between sync fd's and EGLSync objects.


> Hm, usually we expose such test interfaces through debugfs - that way
> production system won't ever ship with it (since there's too many exploits in
> there, especially with secure boot). But since you need it for validation
> tests (at least for the i915 suite) it should always be there when you need
> it.
> 
> Exposing this as a configurable driver in dev is imo a no-go. But we
> should be able to easily convert this into a few debugfs files, so not too
> much fuzz hopefully.

Good idea!


> > > Aside: Will you be at XDC or linux plumbers? Either would be a perfect
> > > place to discuss plans and ideas - I'll attend both.
> > 
> > I wasn't going to, but let's see.  The former is pretty soon and the latter is
> > sold out.  At least Andy Ritger from Nvidia is coming to XDC for sure, and he's
> > been involved in our internal discussions around these topics. So I suggest you
> > have a chat with him at least!  :)
> 
> I'll definitely have a chat (and some beers) with Andy, been a while I've
> last seen him ;-)

Change of plans, I'll attend XDC, so see you there!  I'll even give a short
talk about explicit sync to get some discussions going. :)


Thanks, 
Lauri
