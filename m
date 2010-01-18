From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: Re: [mesa PATCH] nv50: fix nv50_program->immd memory leak
Date: Mon, 18 Jan 2010 19:56:23 +0100
Message-ID: <4B54AED7.3030605@student.tuwien.ac.at>
References: <20100117225016.GD14113@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100117225016.GD14113-OI9uyE9O0yo@public.gmane.org>
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

On 17.01.2010 23:50, Marcin Slusarz wrote:
> ---
>  src/gallium/drivers/nv50/nv50_program.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
> index 4111d21..cfe8b48 100644
> --- a/src/gallium/drivers/nv50/nv50_program.c
> +++ b/src/gallium/drivers/nv50/nv50_program.c
> @@ -4656,6 +4656,7 @@ nv50_program_destroy(struct nv50_context *nv50, struct nv50_program *p)
>  	}
>  	p->exec_tail = NULL;
>  	p->exec_size = 0;
> +	FREE(p->immd);
>  
>  	nouveau_bo_ref(NULL, &p->bo);
>  
>   
Pushed.
