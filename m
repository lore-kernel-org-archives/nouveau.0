From: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v4 2/8] drm/nouveau: Enable polling even if we have
 runtime PM
Date: Thu, 2 Aug 2018 21:14:05 +0200
Message-ID: <20180802191405.GB6180@wunner.de>
References: <20180801211459.7731-1-lyude@redhat.com>
 <20180801211459.7731-3-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180801211459.7731-3-lyude@redhat.com>
Sender: stable-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org, Peter Ujfalusi <peter.ujfalusi@ti.com>, stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Wed, Aug 01, 2018 at 05:14:52PM -0400, Lyude Paul wrote:
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -592,10 +592,11 @@ nouveau_drm_load(struct drm_device *dev, unsigned long flags)
>  		pm_runtime_allow(dev->dev);
>  		pm_runtime_mark_last_busy(dev->dev);
>  		pm_runtime_put(dev->dev);
> -	} else {
> -		/* enable polling for external displays */
> -		drm_kms_helper_poll_enable(dev);
>  	}
> +
> +	/* enable polling for connectors without hpd */
> +	drm_kms_helper_poll_enable(dev);
> +

I'm wondering why drm_kms_helper_poll_enable() is called here at all.
Does the invocation in nouveau_display_init() not suffice?  Can there
be a situation when nouveau_display_init() is not called despite there
being connectors that need to be polled?

Thanks,

Lukas
