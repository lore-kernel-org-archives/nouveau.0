From: Krzysztof Smiechowicz <deadwood-5tc4TXWwyLM@public.gmane.org>
Subject: Re: [PATCH 1/2] Unreference state/buffer objects
 on	context/screen destruction
Date: Thu, 24 Dec 2009 09:23:14 +0100
Message-ID: <4B3324F2.5020206@wp.pl>
References: <4B2F81F6.1010105@wp.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4B2F81F6.1010105-5tc4TXWwyLM@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi,

Any feedback on those patches? If they are ok, please commit them as I 
don't have access to either of repositories.

Best regards,
Krzysztof


Krzysztof Smiechowicz pisze:
> - unreference state objects so that buffer objects are unreferenced and 
> eventually destroyed
> - free channel at screen's destruction
> 
> Index: nv50/nv50_screen.c
> ===================================================================
> --- nv50/nv50_screen.c	(wersja 32083)
> +++ nv50/nv50_screen.c	(kopia robocza)
> @@ -162,7 +162,22 @@
>   nv50_screen_destroy(struct pipe_screen *pscreen)
>   {
>   	struct nv50_screen *screen = nv50_screen(pscreen);
> +    unsigned i;
> 
> +    for (i = 0; i < 2; i++) {
> +        if (screen->constbuf_parm[i])
> +            nouveau_bo_ref(NULL, &screen->constbuf_parm[i]);
> +    }
> +
> +    if (screen->constbuf_misc[0])
> +        nouveau_bo_ref(NULL, &screen->constbuf_misc[0]);
> +    if (screen->tic)
> +        nouveau_bo_ref(NULL, &screen->tic);
> +    if (screen->tsc)
> +        nouveau_bo_ref(NULL, &screen->tsc);
> +    if (screen->static_init)
> +        so_ref(NULL, &screen->static_init);
> +
>   	nouveau_notifier_free(&screen->sync);
>   	nouveau_grobj_free(&screen->tesla);
>   	nouveau_grobj_free(&screen->eng2d);
> Index: nv50/nv50_context.c
> ===================================================================
> --- nv50/nv50_context.c	(wersja 32083)
> +++ nv50/nv50_context.c	(kopia robocza)
> @@ -43,6 +43,39 @@
>   {
>   	struct nv50_context *nv50 = nv50_context(pipe);
> 
> +	if (nv50->state.fb)
> +	    so_ref(NULL, &nv50->state.fb);
> +	if (nv50->state.blend)
> +	    so_ref(NULL, &nv50->state.blend);
> +	if (nv50->state.blend_colour)
> +	    so_ref(NULL, &nv50->state.blend_colour);
> +	if (nv50->state.zsa)
> +	    so_ref(NULL, &nv50->state.zsa);
> +	if (nv50->state.rast)
> +	    so_ref(NULL, &nv50->state.rast);
> +	if (nv50->state.stipple)
> +	    so_ref(NULL, &nv50->state.stipple);
> +	if (nv50->state.scissor)
> +	    so_ref(NULL, &nv50->state.scissor);
> +	if (nv50->state.viewport)
> +	    so_ref(NULL, &nv50->state.viewport);
> +	if (nv50->state.tsc_upload)
> +	    so_ref(NULL, &nv50->state.tsc_upload);
> +	if (nv50->state.tic_upload)
> +	    so_ref(NULL, &nv50->state.tic_upload);
> +	if (nv50->state.vertprog)
> +	    so_ref(NULL, &nv50->state.vertprog);
> +	if (nv50->state.fragprog)
> +	    so_ref(NULL, &nv50->state.fragprog);
> +	if (nv50->state.programs)
> +	    so_ref(NULL, &nv50->state.programs);
> +	if (nv50->state.vtxfmt)
> +	    so_ref(NULL, &nv50->state.vtxfmt);
> +	if (nv50->state.vtxbuf)
> +	    so_ref(NULL, &nv50->state.vtxbuf);
> +	if (nv50->state.vtxattr)
> +	    so_ref(NULL, &nv50->state.vtxattr);
> +
>   	draw_destroy(nv50->draw);
>   	FREE(nv50);
>   }
> Index: nv40/nv40_screen.c
> ===================================================================
> --- nv40/nv40_screen.c	(wersja 32083)
> +++ nv40/nv40_screen.c	(kopia robocza)
> @@ -140,7 +140,13 @@
>   nv40_screen_destroy(struct pipe_screen *pscreen)
>   {
>   	struct nv40_screen *screen = nv40_screen(pscreen);
> +    unsigned i;
> 
> +    for (i = 0; i < NV40_STATE_MAX; i++) {
> +        if (screen->state[i])
> +            so_ref(NULL, &screen->state[i]);
> +    }
> +
>   	nouveau_resource_free(&screen->vp_exec_heap);
>   	nouveau_resource_free(&screen->vp_data_heap);
>   	nouveau_resource_free(&screen->query_heap);
> Index: nv40/nv40_fragprog.c
> ===================================================================
> --- nv40/nv40_fragprog.c	(wersja 32083)
> +++ nv40/nv40_fragprog.c	(kopia robocza)
> @@ -948,6 +948,12 @@
>   nv40_fragprog_destroy(struct nv40_context *nv40,
>   		      struct nv40_fragment_program *fp)
>   {
> +    if (fp->buffer)
> +        pipe_buffer_reference(&fp->buffer, NULL);
> +
> +    if (fp->so)
> +        so_ref(NULL, &fp->so);
> +
>   	if (fp->insn_len)
>   		FREE(fp->insn);
>   }
> Index: nv40/nv40_context.c
> ===================================================================
> --- nv40/nv40_context.c	(wersja 32083)
> +++ nv40/nv40_context.c	(kopia robocza)
> @@ -25,7 +25,13 @@
>   nv40_destroy(struct pipe_context *pipe)
>   {
>   	struct nv40_context *nv40 = nv40_context(pipe);
> +    unsigned i;
> 
> +    for (i = 0; i < NV40_STATE_MAX; i++) {
> +        if (nv40->state.hw[i])
> +            so_ref(NULL, &nv40->state.hw[i]);
> +    }
> +
>   	if (nv40->draw)
>   		draw_destroy(nv40->draw);
>   	FREE(nv40);
> Index: nv30/nv30_screen.c
> ===================================================================
> --- nv30/nv30_screen.c	(wersja 32083)
> +++ nv30/nv30_screen.c	(kopia robocza)
> @@ -153,7 +153,13 @@
>   nv30_screen_destroy(struct pipe_screen *pscreen)
>   {
>   	struct nv30_screen *screen = nv30_screen(pscreen);
> +    unsigned i;
> 
> +    for (i = 0; i < NV30_STATE_MAX; i++) {
> +        if (screen->state[i])
> +            so_ref(NULL, &screen->state[i]);
> +    }
> +
>   	nouveau_resource_free(&screen->vp_exec_heap);
>   	nouveau_resource_free(&screen->vp_data_heap);
>   	nouveau_resource_free(&screen->query_heap);
> @@ -161,6 +167,8 @@
>   	nouveau_notifier_free(&screen->sync);
>   	nouveau_grobj_free(&screen->rankine);
> 
> +	nouveau_screen_fini(&screen->base);
> +	
>   	FREE(pscreen);
>   }
> 
> Index: nv30/nv30_fragprog.c
> ===================================================================
> --- nv30/nv30_fragprog.c	(wersja 32083)
> +++ nv30/nv30_fragprog.c	(kopia robocza)
> @@ -870,6 +870,12 @@
>   nv30_fragprog_destroy(struct nv30_context *nv30,
>   		      struct nv30_fragment_program *fp)
>   {
> +    if (fp->buffer)
> +        pipe_buffer_reference(&fp->buffer, NULL);
> +
> +    if (fp->so)
> +        so_ref(NULL, &fp->so);
> +
>   	if (fp->insn_len)
>   		FREE(fp->insn);
>   }
> Index: nv30/nv30_context.c
> ===================================================================
> --- nv30/nv30_context.c	(wersja 32083)
> +++ nv30/nv30_context.c	(kopia robocza)
> @@ -25,7 +25,13 @@
>   nv30_destroy(struct pipe_context *pipe)
>   {
>   	struct nv30_context *nv30 = nv30_context(pipe);
> +    unsigned i;
> 
> +    for (i = 0; i < NV30_STATE_MAX; i++) {
> +        if (nv30->state.hw[i])
> +            so_ref(NULL, &nv30->state.hw[i]);
> +    }
> +
>   	if (nv30->draw)
>   		draw_destroy(nv30->draw);
>   	FREE(nv30);
> Index: nv20/nv20_screen.c
> ===================================================================
> --- nv20/nv20_screen.c	(wersja 32083)
> +++ nv20/nv20_screen.c	(kopia robocza)
> @@ -116,6 +116,8 @@
>   	nouveau_notifier_free(&screen->sync);
>   	nouveau_grobj_free(&screen->kelvin);
> 
> +	nouveau_screen_fini(&screen->base);
> +
>   	FREE(pscreen);
>   }
> 
> Index: nv10/nv10_screen.c
> ===================================================================
> --- nv10/nv10_screen.c	(wersja 32083)
> +++ nv10/nv10_screen.c	(kopia robocza)
> @@ -116,6 +116,8 @@
>   	nouveau_notifier_free(&screen->sync);
>   	nouveau_grobj_free(&screen->celsius);
> 
> +	nouveau_screen_fini(&screen->base);
> +
>   	FREE(pscreen);
>   }
> 
> Index: nouveau/nouveau_screen.c
> ===================================================================
> --- nouveau/nouveau_screen.c	(wersja 31964)
> +++ nouveau/nouveau_screen.c	(kopia robocza)
> @@ -239,5 +239,6 @@
>   void
>   nouveau_screen_fini(struct nouveau_screen *screen)
>   {
> +    nouveau_channel_free(&screen->channel);
>   }
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
> 
> 
