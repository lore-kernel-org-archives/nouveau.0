From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] exa: turn WaitMarker into a NOP.
Date: Fri, 27 Feb 2009 14:43:16 +1000
Message-ID: <1235709796.3423.3.camel@localhost.localdomain>
References: <1235681723-11180-1-git-send-email-madman2003@gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1235681723-11180-1-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Thu, 2009-02-26 at 21:55 +0100, Maarten Maathuis wrote:
> - map should handle this.
It does, but we don't use prepare/finish_access() hooks to do map() on
the buffer in the non-driver-pixmaps case.  I guess we could use
prepare/finish_access() there too, it probably wouldn't hurt any.

Ben.
> ---
>  src/nouveau_exa.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/src/nouveau_exa.c b/src/nouveau_exa.c
> index b656ca7..20ad380 100644
> --- a/src/nouveau_exa.c
> +++ b/src/nouveau_exa.c
> @@ -259,7 +259,7 @@ nouveau_exa_mark_sync(ScreenPtr pScreen)
>  static void
>  nouveau_exa_wait_marker(ScreenPtr pScreen, int marker)
>  {
> -	NVSync(xf86Screens[pScreen->myNum]);
> +	return;
>  }
>  
>  static Bool
