From: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/dp_mst: add missed nv50_outp_release in nv50_msto_disable
Date: Thu, 12 Dec 2019 10:14:25 +0200
Message-ID: <8736dq2c66.fsf@intel.com>
References: <20191206075321.18239-1-hslester96@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191206075321.18239-1-hslester96@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Fri, 06 Dec 2019, Chuhong Yuan <hslester96@gmail.com> wrote:
> nv50_msto_disable() does not call nv50_outp_release() to match
> nv50_outp_acquire() like other disable().
> Add the missed call to fix it.

The subject prefix "drm/dp_mst" implies drm core change, but this is
about nouveau. Please fix.

BR,
Jani.

>
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 549486f1d937..84e1417355cc 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -862,8 +862,10 @@ nv50_msto_disable(struct drm_encoder *encoder)
>  
>  	mstm->outp->update(mstm->outp, msto->head->base.index, NULL, 0, 0);
>  	mstm->modified = true;
> -	if (!--mstm->links)
> +	if (!--mstm->links) {
>  		mstm->disabled = true;
> +		nv50_outp_release(mstm->outp);
> +	}
>  	msto->disabled = true;
>  }

-- 
Jani Nikula, Intel Open Source Graphics Center
