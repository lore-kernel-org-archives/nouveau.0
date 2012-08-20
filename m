From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 08/10] drm/nouveau: use
 ioread32_native/iowrite32_native for fifo control registers
Date: Mon, 20 Aug 2012 16:30:52 +1000
Message-ID: <20120820063052.GD2013@nisroch.redhat.com>
References: <1345410004-27729-8-git-send-email-marcin.slusarz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1345410004-27729-8-git-send-email-marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

On Sun, Aug 19, 2012 at 11:00:03PM +0200, Marcin Slusarz wrote:
> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> Do I miss something important why was it written this way?
Nope, you didn't.  It's a left-over from a *really* early revision of
the userspace version of the kernel module.

Thanks!

> ---
>  drivers/gpu/drm/nouveau/core/engine/fifo/base.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/base.c b/drivers/gpu/drm/nouveau/core/engine/fifo/base.c
> index 543fcaf..bbb43c6 100644
> --- a/drivers/gpu/drm/nouveau/core/engine/fifo/base.c
> +++ b/drivers/gpu/drm/nouveau/core/engine/fifo/base.c
> @@ -122,14 +122,14 @@ u32
>  _nouveau_fifo_channel_rd32(struct nouveau_object *object, u32 addr)
>  {
>  	struct nouveau_fifo_chan *chan = (void *)object;
> -	return ((volatile u32 *)chan->user)[addr / 4];
> +	return ioread32_native(chan->user + addr);
>  }
>  
>  void
>  _nouveau_fifo_channel_wr32(struct nouveau_object *object, u32 addr, u32 data)
>  {
>  	struct nouveau_fifo_chan *chan = (void *)object;
> -	((volatile u32 *)chan->user)[addr / 4] = data;
> +	iowrite32_native(data, chan->user + addr);
>  }
>  
>  static int
> -- 
> 1.7.8.6
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
