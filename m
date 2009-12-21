From: Krzysztof Smiechowicz <deadwood-5tc4TXWwyLM@public.gmane.org>
Subject: Re: Clean up of nv40_context->state.hw and
	nv40_screen->state
Date: Mon, 21 Dec 2009 10:57:13 +0100
Message-ID: <4B2F4679.2030306@wp.pl>
References: <4B2F251B.5070807@wp.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4B2F251B.5070807-5tc4TXWwyLM@public.gmane.org>
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

Krzysztof Smiechowicz pisze:
> Hi,
> 
> I'm trying to find a place where objects held in 
> nv40_context->state.hw[] and nv40_screen->state[] are being unreferenced 
> during pipe_context destruction.
> 
> Currently I'm observing that these objects are not unreferenced and 
> since they hold reference to buffer objects, the buffer objects 
> themselves are not unreferenced as well (for example color buffer or z 
> buffer).
> 
> In order to clean those references I applied the following changes:
> 
> Index: nv40_screen.c
> ===================================================================
> --- nv40_screen.c	(wersja 32083)
> +++ nv40_screen.c	(kopia robocza)
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
> Index: nv40_context.c
> ===================================================================
> --- nv40_context.c	(wersja 32083)
> +++ nv40_context.c	(kopia robocza)
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
> 
> 
> Is this the correct approach or did I miss where those objects are 
> unreferenced?
> 

A similar patch for nv40_fragprog:

Index: nv40_fragprog.c
===================================================================
--- nv40_fragprog.c	(wersja 32083)
+++ nv40_fragprog.c	(kopia robocza)
@@ -948,6 +948,12 @@
  nv40_fragprog_destroy(struct nv40_context *nv40,
  		      struct nv40_fragment_program *fp)
  {
+    if (fp->buffer)
+        pipe_buffer_reference(&fp->buffer, NULL);
+
+    if (fp->so)
+        so_ref(NULL, &fp->so);
+
  	if (fp->insn_len)
  		FREE(fp->insn);
  }

If this is the right direction, I can prepare a cumulative patch for 
nv30, nv40 and nv50.

Best regards,
Krzysztof
