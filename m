From: Krzysztof Smiechowicz <deadwood-5tc4TXWwyLM@public.gmane.org>
Subject: Clean up of nv40_context->state.hw and nv40_screen->state
Date: Mon, 21 Dec 2009 08:34:51 +0100
Message-ID: <4B2F251B.5070807@wp.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

I'm trying to find a place where objects held in 
nv40_context->state.hw[] and nv40_screen->state[] are being unreferenced 
during pipe_context destruction.

Currently I'm observing that these objects are not unreferenced and 
since they hold reference to buffer objects, the buffer objects 
themselves are not unreferenced as well (for example color buffer or z 
buffer).

In order to clean those references I applied the following changes:

Index: nv40_screen.c
===================================================================
--- nv40_screen.c	(wersja 32083)
+++ nv40_screen.c	(kopia robocza)
@@ -140,7 +140,13 @@
  nv40_screen_destroy(struct pipe_screen *pscreen)
  {
  	struct nv40_screen *screen = nv40_screen(pscreen);
+    unsigned i;

+    for (i = 0; i < NV40_STATE_MAX; i++) {
+        if (screen->state[i])
+            so_ref(NULL, &screen->state[i]);
+    }
+
  	nouveau_resource_free(&screen->vp_exec_heap);
  	nouveau_resource_free(&screen->vp_data_heap);
  	nouveau_resource_free(&screen->query_heap);
Index: nv40_context.c
===================================================================
--- nv40_context.c	(wersja 32083)
+++ nv40_context.c	(kopia robocza)
@@ -25,7 +25,13 @@
  nv40_destroy(struct pipe_context *pipe)
  {
  	struct nv40_context *nv40 = nv40_context(pipe);
+    unsigned i;

+    for (i = 0; i < NV40_STATE_MAX; i++) {
+        if (nv40->state.hw[i])
+            so_ref(NULL, &nv40->state.hw[i]);
+    }
+
  	if (nv40->draw)
  		draw_destroy(nv40->draw);
  	FREE(nv40);


Is this the correct approach or did I miss where those objects are 
unreferenced?

Best regards,
Krzysztof
