From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH 00/10] extract dp helper functions
Date: Thu, 18 Oct 2012 16:12:56 +0200
Message-ID: <CAKMK7uEWuPtw4b0hAh-aO+Ny8zBF=tzKG4FCauO7Y8ofys1ujQ@mail.gmail.com>
References: <1350548132-3037-1-git-send-email-daniel.vetter@ffwll.ch>
	<CADnq5_P_x00ZUNxo=d3NM2zxNxfPqS5inONaHY-8+MiRv7XRSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CADnq5_P_x00ZUNxo=d3NM2zxNxfPqS5inONaHY-8+MiRv7XRSA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Alex Deucher <alexdeucher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Intel Graphics Development <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, xorg-driver-ati-go0+a7rfsptAfugRpC6u6w@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Oct 18, 2012 at 3:48 PM, Alex Deucher <alexdeucher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Thu, Oct 18, 2012 at 4:15 AM, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org> wrote:
>> Hi all,
>>
>> I've frustrated myself the last few days yelling at our link training code.
>> Comparing the i915 code to radeon and nouveau I've noticed the lack of a nice
>> set of dp helper functions. So I've started to extract a few.
>>
>> There's lots more that we can do I think (link configuration selection, the i2c
>> over aux retry stuff which diverges already between i915 and radeon, maybe more
>> higher level parts of the training sequence). But there the drivers diverge
>> quite a bit (e.g. the link configuration is driver by different things in each
>> driver: coded link bw from the dp spec, link clock or required bw vs avialable
>> bw), so that's more work and probably best done when reworking these functions
>> for other reasons.
>
> In theory we could provide a helper function to do the entire link
> training in common code.  We'd just need a a couple of function
> callbacks:
>
> dp_aux_read()
> dp_aux_write()
> dp_link_train_init()
> dp_set_src_training_pattern()
> dp_link_train_fini()
>
> Obviously some drivers may want to do their own thing, so it would
> just be a helper.  Still for DP 1.2, it would be nice to have the
> option of sharing more code.

Yeah, that's one of the ideas. Although I think we should start with a
few smaller things like e.g. the bandwidth stuff or the dp aux i2c
logic. Those need a subset of the above interfaces only and are less
intrusive. And since the link training in i915 seems to be still
rather broken and it in decent flux due to hsw enabling in general, I
want to wait and see a bit first until we have the corner cases
nailed.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
