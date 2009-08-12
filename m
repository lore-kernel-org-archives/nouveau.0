From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH 05/12] drm/nouveau: Use drm_encoder_slave
 instead of drm_encoder.
Date: Wed, 12 Aug 2009 10:31:21 +0300
Message-ID: <20090812103121.330b25a2@daedalus.pq.iki.fi>
References: <1250036108-28655-1-git-send-email-currojerez@riseup.net>
	<1250036108-28655-6-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250036108-28655-6-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, 12 Aug 2009 02:15:01 +0200
Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> wrote:

> 
> Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_connector.c |    8 ++++----
>  drivers/gpu/drm/nouveau/nouveau_encoder.h   |   11 ++++++++---
>  drivers/gpu/drm/nouveau/nv04_output.c       |    8 ++++----
>  drivers/gpu/drm/nouveau/nv50_crtc.c         |    2 +-
>  drivers/gpu/drm/nouveau/nv50_dac.c          |   18 +++++++++---------
>  drivers/gpu/drm/nouveau/nv50_sor.c          |   18 +++++++++---------
>  6 files changed, 35 insertions(+), 30 deletions(-)

> diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
> index 3344e6c..d558b97 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
> @@ -27,26 +27,31 @@
>  #ifndef __NOUVEAU_OUTPUT_H__
>  #define __NOUVEAU_OUTPUT_H__
>  
> +#include "drm_encoder_slave.h"
>  #include "nouveau_drv.h"
>  
>  #define NV_DPMS_CLEARED 0x80
>  
>  struct nouveau_encoder {
> -	struct drm_encoder base;
> +	struct drm_encoder_slave base;
>  
>  	struct dcb_entry *dcb;
>  	int or;
>  
> +	struct drm_display_mode mode;
>  	int last_dpms;
>  
>  	struct nv04_output_reg restore;
>  };
> -
>  static inline struct nouveau_encoder *nouveau_encoder(struct drm_encoder *enc)
>  {
> -	return container_of(enc, struct nouveau_encoder, base);
> +	struct drm_encoder_slave *slave = to_encoder_slave(enc);
> +
> +	return container_of(slave, struct nouveau_encoder, base);
>  }
>  
> +#define to_drm_encoder(x) (&(x)->base.base)

I'd prefer static inline functions for this to make the types involved
explicit. Especially the input type.

> +
>  int nv50_sor_create(struct drm_device *dev, struct dcb_entry *entry);
>  int nv50_dac_create(struct drm_device *dev, struct dcb_entry *entry);

-- 
Pekka Paalanen
http://www.iki.fi/pq/
