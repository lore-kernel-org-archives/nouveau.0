From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH 06/12] drm/nouveau: Prepare the connector code
 for TV-out.
Date: Wed, 12 Aug 2009 10:36:40 +0300
Message-ID: <20090812103640.17c1fc17@daedalus.pq.iki.fi>
References: <1250036108-28655-1-git-send-email-currojerez@riseup.net>
	<1250036108-28655-7-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250036108-28655-7-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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

On Wed, 12 Aug 2009 02:15:02 +0200
Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> wrote:

> 
> Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_connector.c |  198 +++++++++++++--------------
>  drivers/gpu/drm/nouveau/nv50_sor.c          |   14 --
>  2 files changed, 97 insertions(+), 115 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index 54d5e58..d49282e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -34,8 +34,10 @@
>  #include "nouveau_connector.h"
>  #include "nouveau_hw.h"
>  
> +#define get_slave_funcs(nv_encoder) (to_encoder_slave(to_drm_encoder(nv_encoder))->slave_funcs)

Again, add type safety, please. It works also as documentation.

> +
>  static struct nouveau_encoder *
> -nouveau_connector_encoder_get(struct drm_connector *connector, int type)
> +find_encoder_by_type(struct drm_connector *connector, int type)
>  {
>  	struct drm_device *dev = connector->dev;
>  	struct nouveau_encoder *nv_encoder;

-- 
Pekka Paalanen
http://www.iki.fi/pq/
