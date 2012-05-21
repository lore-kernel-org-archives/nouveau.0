From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 03/14] drm/nouveau/device: Simplify init,
 fini fuction
Date: Mon, 21 May 2012 16:27:06 +1000
Message-ID: <20120521062706.GB10508@nisroch.bne.redhat.com>
References: <1337555703-18925-1-git-send-email-emil.l.velikov@gmail.com>
	<1337555703-18925-4-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1337555703-18925-4-git-send-email-emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, May 21, 2012 at 12:14:52AM +0100, Emil Velikov wrote:
> Removes unnecessary goto statement
I dropped these changes from this patch for the moment, I might want them yet.

> fini subdevices before destroying them
I took this hunk, and reworded the commit message to match.

> 
> Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_device.c |   26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_device.c b/drivers/gpu/drm/nouveau/nouveau_device.c
> index 9cc21d1..38ed71a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_device.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_device.c
> @@ -55,13 +55,13 @@ nouveau_device_init(struct nouveau_device *ndev)
>  
>  	for (i = 0; i < NVDEV_SUBDEV_NR; i++) {
>  		ret = nouveau_subdev_init(ndev, i, 0);
> -		if (ret)
> -			goto error;
> +		if (ret) {
> +			for (--i; i >= 0; i--)
> +				nouveau_subdev_fini(ndev, i, false);
> +			break;
> +		}
>  	}
>  
> -error:
> -	for (--i; ret && i >= 0; i--)
> -		nouveau_subdev_fini(ndev, i, false);
>  	return ret;
>  }
>  
> @@ -72,13 +72,13 @@ nouveau_device_fini(struct nouveau_device *ndev, bool suspend)
>  
>  	for (i = NVDEV_SUBDEV_NR - 1; i >= 0; i--) {
>  		ret = nouveau_subdev_fini(ndev, i, suspend);
> -		if (ret)
> -			goto error;
> +		if (ret) {
> +			for (--i; i >= 0; i--)
> +				nouveau_subdev_init(ndev, i, 0);
> +			break;
> +		}
>  	}
>  
> -error:
> -	for (--i; ret && i >= 0; i--)
> -		nouveau_subdev_init(ndev, i, 0);
>  	return ret;
>  }
>  
> @@ -96,6 +96,7 @@ nouveau_device_create(struct nouveau_device *ndev)
>  {
>  	int disable = nouveau_noaccel;
>  	int ret = 0;
> +	int i;
>  
>  	/* mask out any engines that are known not to work as they should,
>  	 * these can be overridden by the user
> @@ -553,7 +554,10 @@ nouveau_device_create(struct nouveau_device *ndev)
>  		break;
>  	}
>  
> -	if (ret)
> +	if (ret) {
> +		for (i = NVDEV_SUBDEV_NR - 1; i >= 0; i--)
> +			nouveau_subdev_fini(ndev, i, false);
>  		nouveau_device_destroy(ndev);
> +	}
>  	return ret;
>  }
> -- 
> 1.7.10.2
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
