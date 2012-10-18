From: Alex Deucher <alexdeucher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 00/10] extract dp helper functions
Date: Thu, 18 Oct 2012 09:48:45 -0400
Message-ID: <CADnq5_P_x00ZUNxo=d3NM2zxNxfPqS5inONaHY-8+MiRv7XRSA@mail.gmail.com>
References: <1350548132-3037-1-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <xorg-driver-ati-bounces+gcfxda-xorg-driver-ati=m.gmane.org-go0+a7rfsptAfugRpC6u6w@public.gmane.org>
In-Reply-To: <1350548132-3037-1-git-send-email-daniel.vetter-/w4YWyX8dFk@public.gmane.org>
List-Unsubscribe: <http://lists.x.org/mailman/options/xorg-driver-ati>,
	<mailto:xorg-driver-ati-request-go0+a7rfsptAfugRpC6u6w@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.x.org/archives/xorg-driver-ati>
List-Post: <mailto:xorg-driver-ati-go0+a7rfsptAfugRpC6u6w@public.gmane.org>
List-Help: <mailto:xorg-driver-ati-request-go0+a7rfsptAfugRpC6u6w@public.gmane.org?subject=help>
List-Subscribe: <http://lists.x.org/mailman/listinfo/xorg-driver-ati>,
	<mailto:xorg-driver-ati-request-go0+a7rfsptAfugRpC6u6w@public.gmane.org?subject=subscribe>
Sender: xorg-driver-ati-bounces+gcfxda-xorg-driver-ati=m.gmane.org-go0+a7rfsptAfugRpC6u6w@public.gmane.org
Errors-To: xorg-driver-ati-bounces+gcfxda-xorg-driver-ati=m.gmane.org-go0+a7rfsptAfugRpC6u6w@public.gmane.org
To: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Intel Graphics Development <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, xorg-driver-ati-go0+a7rfsptAfugRpC6u6w@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Oct 18, 2012 at 4:15 AM, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org> wrote:
> Hi all,
>
> I've frustrated myself the last few days yelling at our link training code.
> Comparing the i915 code to radeon and nouveau I've noticed the lack of a nice
> set of dp helper functions. So I've started to extract a few.
>
> There's lots more that we can do I think (link configuration selection, the i2c
> over aux retry stuff which diverges already between i915 and radeon, maybe more
> higher level parts of the training sequence). But there the drivers diverge
> quite a bit (e.g. the link configuration is driver by different things in each
> driver: coded link bw from the dp spec, link clock or required bw vs avialable
> bw), so that's more work and probably best done when reworking these functions
> for other reasons.

In theory we could provide a helper function to do the entire link
training in common code.  We'd just need a a couple of function
callbacks:

dp_aux_read()
dp_aux_write()
dp_link_train_init()
dp_set_src_training_pattern()
dp_link_train_fini()

Obviously some drivers may want to do their own thing, so it would
just be a helper.  Still for DP 1.2, it would be nice to have the
option of sharing more code.

>
> I've also tried to put the new helpers a bit to use in nouveau, but due to lack
> of hw that part is untested.
>
> Comments and testing highly welcome.
>
> Yours, Daniel
>
> Daniel Vetter (10):
>   drm: rename drm_dp_i2c_helper.c to drm_dp_helper.c
>   drm: dp helper: extract drm_dp_channel_eq_ok
>   drm: dp helper: extract drm_dp_clock_recovery_ok
>   drm/nouveau: use the cr_ok/chanel_eq_ok helpers
>   drm: extract helpers to compute new training values from sink request
>   drm/nouveau: use dp link train request helper
>   drm: extract dp link train delay functions from radeon
>   drm/i915: use the new dp train delay helpers
>   drm: extract dp link bw helpers
>   drm: extract drm_dp_max_lane_count helper
>
>  drivers/gpu/drm/Makefile             |   2 +-
>  drivers/gpu/drm/drm_dp_helper.c      | 328 +++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_dp_i2c_helper.c  | 208 ----------------------
>  drivers/gpu/drm/i915/intel_dp.c      |  98 ++---------
>  drivers/gpu/drm/nouveau/nouveau_dp.c |  35 +---
>  drivers/gpu/drm/radeon/atombios_dp.c | 147 ++--------------
>  drivers/gpu/drm/radeon/radeon_mode.h |   2 +-
>  include/drm/drm_dp_helper.h          |  31 ++++
>  8 files changed, 400 insertions(+), 451 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_dp_helper.c
>  delete mode 100644 drivers/gpu/drm/drm_dp_i2c_helper.c
>
> --
> 1.7.11.4
>
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
