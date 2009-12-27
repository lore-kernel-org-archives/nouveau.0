From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dri: Use classic mesa on the fixed pipe cards.
Date: Sun, 27 Dec 2009 10:48:27 +1000
Message-ID: <1261874907.7478.3.camel@nisroch>
References: <1261839590-3182-1-git-send-email-currojerez@riseup.net>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1261839590-3182-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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

On Sat, 2009-12-26 at 15:59 +0100, Francisco Jerez wrote:
> Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

> ---
>  src/nouveau_dri2.c |    6 +++++-
>  src/nv_dri.c       |    6 +++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/src/nouveau_dri2.c b/src/nouveau_dri2.c
> index 4bc019b..2388070 100644
> --- a/src/nouveau_dri2.c
> +++ b/src/nouveau_dri2.c
> @@ -154,8 +154,12 @@ nouveau_dri2_init(ScreenPtr pScreen)
>  		return FALSE;
>  	}
>  
> +	if (pNv->Architecture >= NV_ARCH_30)
> +		dri2.driverName = "nouveau";
> +	else
> +		dri2.driverName = "nouveau_vieux";
> +
>  	dri2.fd = nouveau_device(pNv->dev)->fd;
> -	dri2.driverName = "nouveau";
>  	dri2.deviceName = pNv->drm_device_name;
>  
>  	dri2.version = DRI2INFOREC_VERSION;
> diff --git a/src/nv_dri.c b/src/nv_dri.c
> index c053022..da27d06 100644
> --- a/src/nv_dri.c
> +++ b/src/nv_dri.c
> @@ -247,8 +247,12 @@ Bool NVDRIScreenInit(ScrnInfoPtr pScrn)
>  	drm_page_size = getpagesize();
>  	if (!(pDRIInfo = DRICreateInfoRec())) return FALSE;
>  
> +	if (pNv->Architecture >= NV_ARCH_30)
> +		pDRIInfo->clientDriverName = "nouveau";
> +	else
> +		pDRIInfo->clientDriverName = "nouveau_vieux";
> +
>  	pDRIInfo->drmDriverName              = "nouveau";
> -	pDRIInfo->clientDriverName           = "nouveau";
>  	pDRIInfo->busIdString                = DRICreatePCIBusID(pNv->PciInfo);
>  
>  	pDRIInfo->ddxDriverMajorVersion      = NV_MAJOR_VERSION;
