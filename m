From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Mesa-stable] [PATCH 2/2] nv50: zero out unbound
	samplers
Date: Sun, 31 Aug 2014 00:30:39 +0100
Message-ID: <54025E9F.507@gmail.com>
References: <1409436150-5979-1-git-send-email-imirkin@alum.mit.edu>
 <1409436150-5979-2-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1409436150-5979-2-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: "10.2 10.3" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 30/08/14 23:02, Ilia Mirkin wrote:
> Samplers are only defined up to num_samplers, so set all samplers above
> nr to NULL so that we don't try to read them again later.
> 
Would it be worth doing a similar thing with the unlocked samplers below the
nr mark ? It seems to me that we might be leaking nv50->samplers[s][i], or
perhaps I'm missing something ?

-Emil

> Tested-by: Christian Ruppert <idl0r-iOiTmaF8HRY@public.gmane.org>
> Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> Cc: "10.2 10.3" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
> ---
>  src/gallium/drivers/nouveau/nv50/nv50_state.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/src/gallium/drivers/nouveau/nv50/nv50_state.c b/src/gallium/drivers/nouveau/nv50/nv50_state.c
> index 48bc079..cf84f88 100644
> --- a/src/gallium/drivers/nouveau/nv50/nv50_state.c
> +++ b/src/gallium/drivers/nouveau/nv50/nv50_state.c
> @@ -585,9 +585,12 @@ nv50_stage_sampler_states_bind(struct nv50_context *nv50, int s,
>           nv50_screen_tsc_unlock(nv50->screen, old);
>     }
>     assert(nv50->num_samplers[s] <= PIPE_MAX_SAMPLERS);
> -   for (; i < nv50->num_samplers[s]; ++i)
> -      if (nv50->samplers[s][i])
> +   for (; i < nv50->num_samplers[s]; ++i) {
> +      if (nv50->samplers[s][i]) {
>           nv50_screen_tsc_unlock(nv50->screen, nv50->samplers[s][i]);
> +         nv50->samplers[s][i] = NULL;
> +      }
> +   }
>  
>     nv50->num_samplers[s] = nr;
>  
> 
