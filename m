From: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH] drm/nouveau/bios: downgrade absence of tmds table to
 info from an error
Date: Tue, 04 Jun 2019 14:07:33 -0400
Message-ID: <47b602c0a07ad5e945ab4bc706b2bf3154ea3196.camel@redhat.com>
References: <20190602120727.4001-1-rhyskidd@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190602120727.4001-1-rhyskidd@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhys Kidd <rhyskidd@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, Karol Herbst <kherbst@redhat.com>, Ilia Mirkin <imirkin@alum.mit.edu>
List-Id: nouveau.vger.kernel.org

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Sun, 2019-06-02 at 22:07 +1000, Rhys Kidd wrote:
> Absence of a TMDS Info Table is common on Optimus setups where the NVIDIA
> gpu is not connected directly to any outputs.
> 
> Reporting an error in this scenario is too harsh. Accordingly, change the
> error message to an info message.
> 
> By default the error message also causes a boot flicker for these sytems.
> 
> Signed-off-by: Rhys Kidd <rhyskidd@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_bios.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c
> b/drivers/gpu/drm/nouveau/nouveau_bios.c
> index 66bf2aff4a3e..bdfadc63204a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bios.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
> @@ -935,7 +935,7 @@ static int parse_bit_tmds_tbl_entry(struct drm_device
> *dev, struct nvbios *bios,
>  
>  	tmdstableptr = ROM16(bios->data[bitentry->offset]);
>  	if (!tmdstableptr) {
> -		NV_ERROR(drm, "Pointer to TMDS table invalid\n");
> +		NV_INFO(drm, "Pointer to TMDS table not found\n");
>  		return -EINVAL;
>  	}
>  
-- 
Cheers,
	Lyude Paul
