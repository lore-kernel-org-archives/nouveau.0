From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nv50: rename INVALID_QUERY_OR_TEXTURE
 error to INVALID_OPERATION
Date: Fri, 15 Jun 2012 10:17:35 +1000
Message-ID: <20120615001735.GA2245@nisroch.redhat.com>
References: <20120614215808.GA21795@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120614215808.GA21795-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Thu, Jun 14, 2012 at 11:58:08PM +0200, Marcin Slusarz wrote:
> Current name is misleading, because this error can be triggered by other
> conditions, like changing STRMOUT parameter without disabling STRMOUT first.
> 
Applied, thanks.

> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nv50_graph.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nv50_graph.c b/drivers/gpu/drm/nouveau/nv50_graph.c
> index 0289a96..0fd1117 100644
> --- a/drivers/gpu/drm/nouveau/nv50_graph.c
> +++ b/drivers/gpu/drm/nouveau/nv50_graph.c
> @@ -299,7 +299,7 @@ static struct nouveau_bitfield nv50_graph_trap_ccache[] = {
>  
>  /* There must be a *lot* of these. Will take some time to gather them up. */
>  struct nouveau_enum nv50_data_error_names[] = {
> -	{ 0x00000003, "INVALID_QUERY_OR_TEXTURE", NULL },
> +	{ 0x00000003, "INVALID_OPERATION", NULL },
>  	{ 0x00000004, "INVALID_VALUE", NULL },
>  	{ 0x00000005, "INVALID_ENUM", NULL },
>  	{ 0x00000008, "INVALID_OBJECT", NULL },
> -- 
> 1.7.8.6
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
