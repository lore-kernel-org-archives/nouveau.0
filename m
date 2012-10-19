From: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Subject: Re: [PATCH] dri2: Fix potential race and crash for swap
	at next vblank.
Date: Fri, 19 Oct 2012 22:04:01 +0200
Message-ID: <5081B231.3090507@tuebingen.mpg.de>
References: <1349766419-2647-1-git-send-email-mario.kleiner@tuebingen.mpg.de>
	<1349766419-2647-2-git-send-email-mario.kleiner@tuebingen.mpg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1349766419-2647-2-git-send-email-mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
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
Cc: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Ping :)
-mario

On 09.10.12 09:06, Mario Kleiner wrote:
> This fixes a potential race + crash that wasn't properly
> handled by commit 248de8cdbd6d0bc062633b49896fa4791148cd3b
> and happened at least on one users machine.
>
> That commit wrongly assumed no special action would be needed
> for swaps at next vblank while triple-buffering is enabled on
> XOrg server 1.12 or later.
>
> Closer inspection of the x-server main dispatch loop shows
> it is possible that the client manages to get the server
> to dispatch a new DRI2GetBuffersWithFormat() call before
> the server calls the vblank event handler and executes
> the nouveau_dri2_finish_swap() routine. Such a race would
> cause a crash, as described in above commit.
>
> This commit handles the "swap at next vblank" case by
> calling nouveau_dri2_finish_swap() immediately without
> the roundtrip (queue vblank_event -> kernel -> deliver event
> -> x-server processes event -> nouveau vblank event handler),
> before control gets returned to the client.
>
> This avoids the race while retaining triple-buffering. As
> a bonus, time-critical swaps at next vblank get processed
> without roundtrip delay, increasing the chance of not
> skipping a frame due to vblank miss while sync to vblank is
> on.
>
> Thanks to Anssi for reporting this problem on the nouveau
> mailing list at 12th July 2012 and for testing this patch.
>
> Reported-by: Anssi Hannula <anssi.hannula-X3B1VOXEql0@public.gmane.org>
> Tested-by: Anssi Hannula <anssi.hannula-X3B1VOXEql0@public.gmane.org>
> Signed-off-by: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
> ---
>   src/nouveau_dri2.c |   51 ++++++++++++++++++++++++++++++++++++++-------------
>   1 file changed, 38 insertions(+), 13 deletions(-)
>
> diff --git a/src/nouveau_dri2.c b/src/nouveau_dri2.c
> index 71cff26..bf69505 100644
> --- a/src/nouveau_dri2.c
> +++ b/src/nouveau_dri2.c
> @@ -479,6 +479,7 @@ nouveau_dri2_schedule_swap(ClientPtr client, DrawablePtr draw,
>   {
>   	struct nouveau_dri2_vblank_state *s;
>   	CARD64 current_msc, expect_msc;
> +	CARD64 current_ust;
>   	int ret;
>
>   	/* Initialize a swap structure */
> @@ -490,9 +491,9 @@ nouveau_dri2_schedule_swap(ClientPtr client, DrawablePtr draw,
>   		{ SWAP, client, draw->id, dst, src, func, data, 0 };
>
>   	if (can_sync_to_vblank(draw)) {
> -		/* Get current sequence */
> +		/* Get current sequence and vblank time*/
>   		ret = nouveau_wait_vblank(draw, DRM_VBLANK_RELATIVE, 0,
> -					  &current_msc, NULL, NULL);
> +					  &current_msc, &current_ust, NULL);
>   		if (ret)
>   			goto fail;
>
> @@ -512,24 +513,48 @@ nouveau_dri2_schedule_swap(ClientPtr client, DrawablePtr draw,
>   		if (*target_msc == 0)
>   			*target_msc = 1;
>
> +		/* Swap at next possible vblank requested? */
> +		if (current_msc >= *target_msc - 1) {
> +			/* Special case: Need to swap at next vblank.
> +			 * Schedule swap immediately, bypassing the kernel
> +			 * vblank event mechanism to avoid a dangerous race
> +			 * between the client and the x-server vblank event
> +			 * dispatch in the main x-server dispatch loop when
> +			 * the swap_limit is set to 2 for triple-buffering.
> +			 *
> +			 * This also optimizes for the common case of swap
> +			 * at next vblank, avoiding vblank dispatch delay.
> +			 */
> +			s->frame = 1 + ((unsigned int) current_msc & 0xffffffff);
> +			*target_msc = 1 + current_msc;
> +			nouveau_dri2_finish_swap(draw, current_msc,
> +						 (unsigned int) (current_ust / 1000000),
> +						 (unsigned int) (current_ust % 1000000),
> +						 s);
> +			return TRUE;
> +		}
> +
> +		/* This is a swap in the future, ie. the vblank event will
> +		 * only get dispatched at least 2 vblanks into the future.
> +		 */
> +
>   #if DRI2INFOREC_VERSION >= 6
> -		/* Is this a swap in the future, ie. the vblank event will
> -		 * not be immediately dispatched, but only at a future vblank?
> -		 * If so, we need to temporarily lower the swaplimit to 1, so
> -		 * that DRI2GetBuffersWithFormat() requests from the client get
> +		/* On XOrg 1.12+ we need to temporarily lower the swaplimit to 1,
> +		 * so that DRI2GetBuffersWithFormat() requests from the client get
>   		 * deferred in the x-server until the vblank event has been
>   		 * dispatched to us and nouveau_dri2_finish_swap() is done. If
>   		 * we wouldn't do this, DRI2GetBuffersWithFormat() would operate
>   		 * on wrong (pre-swap) buffers, and cause a segfault later on in
> -		 * nouveau_dri2_finish_swap(). Our vblank event handler restores
> +		 * nouveau_dri2_finish_swap(). Our vblank event handler will restore
>   		 * the old swaplimit immediately after nouveau_dri2_finish_swap()
> -		 * is done, so we still get 1 video refresh cycle worth of
> -		 * triple-buffering. For a swap at next vblank, dispatch of the
> -		 * vblank event happens immediately, so there isn't any need
> -		 * for this lowered swaplimit.
> +		 * is done, so we still get 1 video refresh cycle worth of triple-
> +		 * buffering, because the client can start rendering again 1 cycle
> +		 * before the pending swap is completed.
> +		 *
> +		 * The same race would happen for the "swap at next vblank" case,
> +		 * but the special case "swap immediately" code above prevents this.
>   		 */
> -		if (current_msc < *target_msc - 1)
> -			DRI2SwapLimit(draw, 1);
> +		DRI2SwapLimit(draw, 1);
>   #endif
>
>   		/* Request a vblank event one frame before the target */
>
