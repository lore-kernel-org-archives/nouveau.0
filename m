From: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] drm: allow limiting the scatter list size.
Date: Tue, 18 Aug 2020 11:00:49 +0200
Message-ID: <20200818090049.qomgyyw6hif4cmah@sirius.home.kraxel.org>
References: <20200818074828.9509-1-kraxel@redhat.com>
 <20200818074828.9509-2-kraxel@redhat.com>
 <9c355d64-1a61-eb59-be80-d9fc863ddf22@amd.com>
 <20200818082703.7z6fcvoymiqow5kw@sirius.home.kraxel.org>
 <03c03129-db27-c6da-df8f-909141d2a3f7@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <03c03129-db27-c6da-df8f-909141d2a3f7-5C7GfCeVMHo@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Oleksandr Andrushchenko <oleksandr_andrushchenko-uRwfk40T5oI@public.gmane.org>, "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "open list:ARM/Rockchip SoC support" <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Russell King <linux+etnaviv-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "moderated list:DRM DRIVERS FOR XEN" <xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org>, "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:DRM DRIVERS FOR VIVANTE GPU IP" <etnaviv@l>
List-Id: nouveau.vger.kernel.org

  Hi,

> > > I'm missing an explanation why this should be useful (it certainly is).
> > virtio-gpu needs this to work properly with SEV (see patch 2/2 of this
> > series).
> 
> Yeah, that's the problem patch 2/2 never showed up here :)

The list should have everything.

Your inbox probably has 1/2 only because 2/2 doesn't touch amd code and
'git send-email' evaluates sendemail.cccmd (pointing to
get_maintainer.pl) for each patch individually.

I've found this behavior confusing at times before.  Is there some way
to send the whole series to everybody?  Or at least the cover letter?
The git-send-email manpage doesn't give a clue :(

> > Placing it in drm_device instead would indeed work for virtio-gpu, so I
> > guess you are suggesting that instead?
> 
> That is probably the best approach, yes.

Ok, I'll go that route then.

thanks,
  Gerd
