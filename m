From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nouveau: fix undefined reference to
	acpi_lid_open
Date: Wed, 17 Feb 2010 23:04:01 +0100
Message-ID: <20100217220401.GA3258@joi.lan>
References: <1266399763-28911-1-git-send-email-daniel@caiaq.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1266399763-28911-1-git-send-email-daniel-rDUAYElUppE@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Daniel Mack <daniel-rDUAYElUppE@public.gmane.org>
Cc: dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Xavier Chantry <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, Feb 17, 2010 at 10:42:43AM +0100, Daniel Mack wrote:
> Fix the following compile time error:
> 
> drivers/built-in.o: In function `nouveau_connector_detect':
> /home/daniel/src/linux/jup/linux-2.6/drivers/gpu/drm/nouveau/nouveau_connector.c:243: undefined reference to `acpi_lid_open'
> 
> Signed-off-by: Daniel Mack <daniel-rDUAYElUppE@public.gmane.org>
> Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
> Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Cc: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
> Cc: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Xavier Chantry <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
> ---
>  drivers/gpu/drm/nouveau/nouveau_connector.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index d2f6335..c74d45d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -239,7 +239,7 @@ nouveau_connector_detect(struct drm_connector *connector)
>  	if (connector->connector_type == DRM_MODE_CONNECTOR_LVDS)
>  		nv_encoder = find_encoder_by_type(connector, OUTPUT_LVDS);
>  	if (nv_encoder && nv_connector->native_mode) {
> -#ifdef CONFIG_ACPI
> +#ifdef CONFIG_ACPI_BUTTON
>  		if (!nouveau_ignorelid && !acpi_lid_open())
>  			return connector_status_disconnected;
>  #endif
> -- 

You are fixing CONFIG_ACPI_BUTTON=m vs CONFIG_DRM_NOUVEAU=y compilation,
but breaking runtime behaviour of CONFIG_ACPI_BUTTON=m + CONFIG_DRM_NOUVEAU=m.

I think this code should be compiled when:
#if defined(CONFIG_ACPI_BUTTON) || (defined(CONFIG_ACPI_BUTTON_MODULE) && defined(CONFIG_DRM_NOUVEAU_MODULE))

Marcin
