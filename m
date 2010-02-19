From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] drm/nouveau: Unmap pushbuf BOs when we're
 done with them.
Date: Fri, 19 Feb 2010 15:05:45 +1000
Message-ID: <1266555945.27450.0.camel@araqiel>
References: <1266551950-5766-1-git-send-email-currojerez@riseup.net>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1266551950-5766-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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

On Fri, 2010-02-19 at 04:59 +0100, Francisco Jerez wrote:
> If you're especially unlucky BOs would move around and their kmaps
> would end up pointing to something else in GART, then ioctl_pushbuf()
> would use the kmaps again corrupting textures or other pushbufs (the
> most noticeable symptom was a PFIFO_DMA_PUSHER from time to time).
Oops, I actually was doing that at some point.  Not sure where it
disappeared to :)

Thanks, pushed along with 2/2.
Ben.
> 
> Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_gem.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index fb6d87b..ec6da5c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -243,6 +243,8 @@ validate_fini_list(struct list_head *list, struct nouveau_fence *fence)
>  			nouveau_fence_unref((void *)&prev_fence);
>  		}
>  
> +		ttm_bo_kunmap(&nvbo->kmap);
> +
>  		list_del(&nvbo->entry);
>  		nvbo->reserved_by = NULL;
>  		ttm_bo_unreserve(&nvbo->bo);
