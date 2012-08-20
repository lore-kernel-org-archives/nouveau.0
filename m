From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] nouveau Macbook EDID fix upstreaming...
Date: Mon, 20 Aug 2012 14:02:38 +1000
Message-ID: <20120820040237.GA3207@nisroch.redhat.com>
References: <CAMVG2ssDVjwm2Fp6gBTKg2=MqWMDoO1_FpqoXOnskz5W58Unkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMVG2ssDVjwm2Fp6gBTKg2=MqWMDoO1_FpqoXOnskz5W58Unkg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel J Blueman <daniel@quora.org>
Cc: Ryan Bourgeois <bluedragonx@gmail.com>, Dave Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Fri, Aug 17, 2012 at 04:33:25PM +0800, Daniel J Blueman wrote:
> It looks like Ryan's Nouveau patch [1,2] to get the I2C working for
> EDID (thus modelines) is crucial for avoiding the Nvidia binary
> drivers on MacbookPro 2012s.
> 
> Any plans/chance for it to be upstreamed to eg 3.6-rc3?
Not at this stage, no.  I don't believe this is likely to be the correct fix.  I should have access to one of the new mbp systems in the near future and I'll investigate it further then.

Cheers,
Ben.

> 
> Many thanks,
>   Daniel
> 
> --- [1]
> 
> diff -urNp a/drivers/gpu/drm/nouveau/nouveau_bios.c
> b/drivers/gpu/drm/nouveau/nouveau_bios.c
> --- a/drivers/gpu/drm/nouveau/nouveau_bios.c	2012-07-08 22:48:05.589828510 -0500
> +++ b/drivers/gpu/drm/nouveau/nouveau_bios.c	2012-07-15 00:28:18.578864693 -0500
> @@ -6461,6 +6461,9 @@ nouveau_run_vbios_init(struct drm_device
>  		}
>  	}
> 
> +	if (!bios->execute)
> +		nouveau_gpio_reset(dev);
> +
>  	return ret;
>  }
> 
> [2] https://bugs.freedesktop.org/show_bug.cgi?id=51971
> -- 
> Daniel J Blueman
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
