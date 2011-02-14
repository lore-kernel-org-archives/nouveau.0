From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fix drmSetMaster error reporting
Date: Mon, 14 Feb 2011 11:28:26 +1000
Message-ID: <1297646911.2037.2.camel@nisroch>
References: <1297626403-3349-3-git-send-email-marcin.slusarz@gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1297626403-3349-3-git-send-email-marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

On Sun, 2011-02-13 at 20:46 +0100, Marcin Slusarz wrote:
> On error, drmSetMaster returns -1 and sets errno.
Pushed.

> ---
>  src/nv_driver.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/src/nv_driver.c b/src/nv_driver.c
> index 3e009fc..754739c 100644
> --- a/src/nv_driver.c
> +++ b/src/nv_driver.c
> @@ -334,7 +334,7 @@ NVEnterVT(int scrnIndex, int flags)
>  
>  	ret = drmSetMaster(nouveau_device(pNv->dev)->fd);
>  	if (ret)
> -		ErrorF("Unable to get master: %d\n", ret);
> +		ErrorF("Unable to get master: %s\n", strerror(errno));
>  
>  	if (!xf86SetDesiredModes(pScrn))
>  		return FALSE;
