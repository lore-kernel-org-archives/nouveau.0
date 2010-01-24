From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [mesa PATCH] nv50: fix uninitialized variable in
 nv50_revdep_reorder
Date: Mon, 25 Jan 2010 09:48:37 +1000
Message-ID: <1264376917.2460.0.camel@nisroch>
References: <20100124182759.GD2908@joi.lan>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100124182759.GD2908-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, 2010-01-24 at 19:27 +0100, Marcin Slusarz wrote:
> "unsafe" is never initialized, but used
> (found by valgrind)
Pushed, plus the other three patches you pinged on.

Ben.
> ---
>  src/gallium/drivers/nv50/nv50_program.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
> index cfe8b48..6d9ac14 100644
> --- a/src/gallium/drivers/nv50/nv50_program.c
> +++ b/src/gallium/drivers/nv50/nv50_program.c
> @@ -3275,7 +3275,7 @@ prep_inspect_insn(struct nv50_pc *pc, const struct tgsi_full_instruction *insn)
>  static unsigned
>  nv50_revdep_reorder(unsigned m[4], unsigned rdep[4])
>  {
> -	unsigned i, c, x, unsafe;
> +	unsigned i, c, x, unsafe = 0;
>  
>  	for (c = 0; c < 4; c++)
>  		m[c] = c;
