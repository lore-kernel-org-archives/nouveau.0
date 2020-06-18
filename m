From: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH] drm/noveau: fix reference count leak in
 nv50_disp_atomic_commit
Date: Thu, 18 Jun 2020 11:18:25 -0400
Message-ID: <0b1c1a07b6589e91701a1815400a56b66c5f480d.camel@redhat.com>
References: <20200614012920.121567-1-pakki001@umn.edu>
Reply-To: lyude@redhat.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200614012920.121567-1-pakki001@umn.edu>
Sender: linux-kernel-owner@vger.kernel.org
To: Aditya Pakki <pakki001@umn.edu>
Cc: kjlu@umn.edu, wu000273@umn.edu, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, Takashi Iwai <tiwai@suse.de>, James Jones <jajones@nvidia.com>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Sat, 2020-06-13 at 20:29 -0500, Aditya Pakki wrote:
> nv50_disp_atomic_commit() calls calls pm_runtime_get_sync and in turn
> increments the reference count. In case of failure, decrement the
> ref count before returning the error.
> 
> Signed-off-by: Aditya Pakki <pakki001@umn.edu>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index d472942102f5..b4039907f0d6 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -2157,8 +2157,10 @@ nv50_disp_atomic_commit(struct drm_device *dev,
>  	int ret, i;
>  
>  	ret = pm_runtime_get_sync(dev->dev);
> -	if (ret < 0 && ret != -EACCES)
> +	if (ret < 0 && ret != -EACCES) {
> +		pm_runtime_put_autosuspend(dev->dev);

s/noveau/nouveau/ in the commit title, but other than that:

Reviewed-by: Lyude Paul <lyude@redhat.com>

>  		return ret;
> +	}
>  
>  	ret = drm_atomic_helper_setup_commit(state, nonblock);
>  	if (ret)
