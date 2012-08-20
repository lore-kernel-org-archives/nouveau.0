From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 06/10] drm/nouveau: sparse fixes
Date: Mon, 20 Aug 2012 16:29:49 +1000
Message-ID: <20120820062949.GC2013@nisroch.redhat.com>
References: <1345410004-27729-6-git-send-email-marcin.slusarz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1345410004-27729-6-git-send-email-marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

On Sun, Aug 19, 2012 at 11:00:01PM +0200, Marcin Slusarz wrote:
> drivers/gpu/drm/nouveau/core/core/object.c:452:22: warning: non-ANSI function declaration of function 'nouveau_object_debug'
> 
> drivers/gpu/drm/nouveau/core/subdev/device/base.c:64:10: warning: Initializer entry defined twice
> drivers/gpu/drm/nouveau/core/subdev/device/base.c:73:10:   also defined here
Applied the first hunk, the second I'd already fixed in my tree.

> 
> (harmless, second init had the same value)
> 
> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/core/core/object.c        |    2 +-
>  drivers/gpu/drm/nouveau/core/subdev/device/base.c |    1 -
>  2 files changed, 1 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/core/core/object.c b/drivers/gpu/drm/nouveau/core/core/object.c
> index d94cb66..0daab62 100644
> --- a/drivers/gpu/drm/nouveau/core/core/object.c
> +++ b/drivers/gpu/drm/nouveau/core/core/object.c
> @@ -449,7 +449,7 @@ nouveau_object_dec(struct nouveau_object *object, bool suspend)
>  }
>  
>  void
> -nouveau_object_debug()
> +nouveau_object_debug(void)
>  {
>  #ifdef NOUVEAU_OBJECT_MAGIC
>  	struct nouveau_object *object;
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/device/base.c b/drivers/gpu/drm/nouveau/core/subdev/device/base.c
> index d4abca7..afc6be0 100644
> --- a/drivers/gpu/drm/nouveau/core/subdev/device/base.c
> +++ b/drivers/gpu/drm/nouveau/core/subdev/device/base.c
> @@ -70,7 +70,6 @@ static const u64 disable_map[] = {
>  	[NVDEV_SUBDEV_VM]	= NV_DEVICE_DISABLE_CORE,
>  	[NVDEV_SUBDEV_INSTMEM]	= NV_DEVICE_DISABLE_CORE,
>  	[NVDEV_SUBDEV_BAR]	= NV_DEVICE_DISABLE_CORE,
> -	[NVDEV_SUBDEV_GPIO]	= NV_DEVICE_DISABLE_CORE,
>  	[NVDEV_SUBDEV_VOLT]	= NV_DEVICE_DISABLE_CORE,
>  	[NVDEV_SUBDEV_FAN0]	= NV_DEVICE_DISABLE_CORE,
>  	[NVDEV_SUBDEV_CLOCK]	= NV_DEVICE_DISABLE_CORE,
> -- 
> 1.7.8.6
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
