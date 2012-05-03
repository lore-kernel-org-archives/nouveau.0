From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nv50: fix crash in NV50SyncToVBlank
Date: Thu, 3 May 2012 15:08:56 +0200
Message-ID: <20120503130856.GA8541@joi.lan>
References: <20120415010821.GA797@joi.lan>
 <20120415114642.GA2838@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120415114642.GA2838-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, Apr 15, 2012 at 01:46:42PM +0200, Marcin Slusarz wrote:
> Regression from "WIP: port to new libdrm".
> ---
>  src/nv50_accel.c |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/src/nv50_accel.c b/src/nv50_accel.c
> index 66d6cb8..7c640f2 100644
> --- a/src/nv50_accel.c
> +++ b/src/nv50_accel.c
> @@ -44,6 +44,9 @@ NV50SyncToVBlank(PixmapPtr ppix, BoxPtr box)
>  	if (!crtcs)
>  		return;
>  
> +	if (!PUSH_SPACE(push, 10))
> +		return;
> +
>  	BEGIN_NV04(push, SUBC_NVSW(0x0060), 2);
>  	PUSH_DATA (push, pNv->vblank_sem->handle);
>  	PUSH_DATA (push, 0);
> -- 

Nobody uses "sync to vblank"? It's crashy as hell without this patch...

Marcin
