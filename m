From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH 4.19 092/190] drm/nouveau: Dont WARN_ON VCPI allocation failures
Date: Fri, 13 Sep 2019 09:33:36 -0400
Message-ID: <CAKb7UviY0sjFUc6QqjU4eKxm2b-osKoJNO2CSP9HmQ5AdORgkw@mail.gmail.com>
References: <20190913130559.669563815@linuxfoundation.org> <20190913130606.981926197@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190913130606.981926197@linuxfoundation.org>
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Sasha Levin <sashal@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, nouveau <nouveau@lists.freedesktop.org>, "# 3.9+" <stable@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

Hi Greg,

This feels like it's missing a From: line.

commit b513a18cf1d705bd04efd91c417e79e4938be093
Author: Lyude Paul <lyude@redhat.com>
Date:   Mon Jan 28 16:03:50 2019 -0500

    drm/nouveau: Don't WARN_ON VCPI allocation failures

Is this an artifact of your notification-of-patches process and I
never noticed before, or was the patch ingested incorrectly?

Cheers,

  -ilia

On Fri, Sep 13, 2019 at 9:16 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> [ Upstream commit b513a18cf1d705bd04efd91c417e79e4938be093 ]
>
> This is much louder then we want. VCPI allocation failures are quite
> normal, since they will happen if any part of the modesetting process is
> interrupted by removing the DP MST topology in question. So just print a
> debugging message on VCPI failures instead.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: f479c0ba4a17 ("drm/nouveau/kms/nv50: initial support for DP 1.2 multi-stream")
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v4.10+
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index f889d41a281fa..5e01bfb69d7a3 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -759,7 +759,8 @@ nv50_msto_enable(struct drm_encoder *encoder)
>
>         slots = drm_dp_find_vcpi_slots(&mstm->mgr, mstc->pbn);
>         r = drm_dp_mst_allocate_vcpi(&mstm->mgr, mstc->port, mstc->pbn, slots);
> -       WARN_ON(!r);
> +       if (!r)
> +               DRM_DEBUG_KMS("Failed to allocate VCPI\n");
>
>         if (!mstm->links++)
>                 nv50_outp_acquire(mstm->outp);
> --
> 2.20.1
>
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
