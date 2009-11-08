From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] drm/nv10: Keep the lower bits of
 PGRAPH_CTX_USER during context switches.
Date: Mon, 09 Nov 2009 08:19:54 +1000
Message-ID: <1257718794.2216.2.camel@nisroch>
References: <1257520314-16605-1-git-send-email-currojerez@riseup.net>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1257520314-16605-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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

On Fri, 2009-11-06 at 16:11 +0100, Francisco Jerez wrote:
> Before this patch they were being reset to zero on every context
> switch instead of leaving the saved value, causing some context
> switching weirdness (the most serious symptom was the memory manager
> corrupting the BOs it migrated because of a malfunctioning M2MF).
> 
> Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Reviewed-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

> ---
>  drivers/gpu/drm/nouveau/nv10_graph.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nv10_graph.c b/drivers/gpu/drm/nouveau/nv10_graph.c
> index cf5c9c4..6bf6804 100644
> --- a/drivers/gpu/drm/nouveau/nv10_graph.c
> +++ b/drivers/gpu/drm/nouveau/nv10_graph.c
> @@ -673,7 +673,8 @@ int nv10_graph_load_context(struct nouveau_channel *chan)
>  	nv10_graph_load_pipe(chan);
>  
>  	nv_wr32(dev, NV10_PGRAPH_CTX_CONTROL, 0x10010100);
> -	nv_wr32(dev, NV10_PGRAPH_CTX_USER, chan->id << 24);
> +	tmp = nv_rd32(dev, NV10_PGRAPH_CTX_USER);
> +	nv_wr32(dev, NV10_PGRAPH_CTX_USER, (tmp & 0xffffff) | chan->id << 24);
>  	tmp = nv_rd32(dev, NV10_PGRAPH_FFINTFC_ST2);
>  	nv_wr32(dev, NV10_PGRAPH_FFINTFC_ST2, tmp & 0xcfffffff);
>  	return 0;
