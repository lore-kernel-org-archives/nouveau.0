From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix array overflow
Date: Sun, 06 Dec 2009 16:50:49 +1000
Message-ID: <1260082249.27862.0.camel@nisroch>
References: <1260031331-8373-1-git-send-email-pq@iki.fi>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1260031331-8373-1-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, 2009-12-05 at 18:42 +0200, Pekka Paalanen wrote:
> Noticed by sparse: in nouveau_dp_link_train(), the array 'status' was
> defined as 2 bytes, yet it was accessed for 3 bytes.
> 
> Fix it by making the array size 3.
Thanks, pushed.  Though, for obvious things like this just commit
away :)

Ben.
> 
> Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_dp.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
> index a334f17..c2d6eff 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dp.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
> @@ -271,7 +271,8 @@ nouveau_dp_link_train(struct drm_encoder *encoder)
>  {
>  	struct drm_device *dev = encoder->dev;
>  	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
> -	uint8_t config[4], status[2];
> +	uint8_t config[4];
> +	uint8_t status[3];
>  	bool cr_done, cr_max_vs, eq_done;
>  	int ret = 0, i, tries, voltage;
>  
