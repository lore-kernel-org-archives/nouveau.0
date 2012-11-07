From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: Re: [PATCH] nouveau: Fix crash after D3
Date: Wed, 7 Nov 2012 19:48:01 +0100
Message-ID: <20121107184801.GB24379@joi.lan>
References: <1352210620-4200-1-git-send-email-daniel@quora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1352210620-4200-1-git-send-email-daniel@quora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel J Blueman <daniel@quora.org>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Tue, Nov 06, 2012 at 10:03:40PM +0800, Daniel J Blueman wrote:
> In 3.7-rc4, when starting X with the integrated GPU and suspending the discrete GPU,
> after one or more 32-bit applications are used (eg Skype) and X is stopped,
> we hit a panic.
> 
> Prevent this by testing if the fini function is valid.

It's a bit weird. Can you explain better what is going on?
Why do we try to destroy this object (with NULL fini) only when GPU is
suspended? Maybe it means we are leaking this object on normal close/destroy?
Did you test what happens when you resume nv GPU after stopping X?

> Full panic bootlog is at: http://quora.org/2012/nouveau/dmesg-crash.txt
> Xorg.log is at: http://quora.org/2012/nouveau/Xorg.0.log-crash.txt
> Kernel log after fix is at: http://quora.org/2012/nouveau/dmesg-fix.txt
> 
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> ---
>  drivers/gpu/drm/nouveau/core/core/object.c |   10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/core/core/object.c b/drivers/gpu/drm/nouveau/core/core/object.c
> index 0daab62..3da3525 100644
> --- a/drivers/gpu/drm/nouveau/core/core/object.c
> +++ b/drivers/gpu/drm/nouveau/core/core/object.c
> @@ -354,12 +354,16 @@ static int
>  nouveau_object_decf(struct nouveau_object *object)
>  {
>  	int ret;
> +	struct nouveau_ofuncs *pfuncs;
>  
>  	nv_trace(object, "stopping...\n");
>  
> -	ret = nv_ofuncs(object)->fini(object, false);
> -	if (ret)
> -		nv_warn(object, "failed fini, %d\n", ret);
> +	pfuncs = nv_ofuncs(object);
> +	if (pfuncs->fini) {
> +		ret = nv_ofuncs(object)->fini(object, false);
> +		if (ret)
> +			nv_warn(object, "failed fini, %d\n", ret);
> +	}
>  
>  	if (object->engine) {
>  		mutex_lock(&nv_subdev(object->engine)->mutex);
> -- 
> 1.7.10.4
> 
