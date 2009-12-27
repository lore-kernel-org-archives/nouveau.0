From: Krzysztof Smiechowicz <deadwood-5tc4TXWwyLM@public.gmane.org>
Subject: [PATCH 1/2] Unreference state/buffer objects
	on	context/screen destruction
Date: Sun, 27 Dec 2009 11:02:35 +0100
Message-ID: <4B3730BB.8090804@wp.pl>
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

(resending as git patch)

- unreference state objects so that buffer objects are unreferenced and
eventually destroyed
- free channel at screen's destruction

diff --git a/src/gallium/drivers/nouveau/nouveau_screen.c 
b/src/gallium/drivers/nouveau/nouveau_screen.c
index e4cf91c..be7735b 100644
--- a/src/gallium/drivers/nouveau/nouveau_screen.c
+++ b/src/gallium/drivers/nouveau/nouveau_screen.c
@@ -239,5 +239,6 @@ nouveau_screen_init(struct nouveau_screen *screen, 
struct nouveau_device *dev)
  void
  nouveau_screen_fini(struct nouveau_screen *screen)
  {
+    nouveau_channel_free(&screen->channel);
  }

diff --git a/src/gallium/drivers/nv10/nv10_screen.c 
b/src/gallium/drivers/nv10/nv10_screen.c
index ee5901e..8d4d7d7 100644
--- a/src/gallium/drivers/nv10/nv10_screen.c
+++ b/src/gallium/drivers/nv10/nv10_screen.c
@@ -116,6 +116,8 @@ nv10_screen_destroy(struct pipe_screen *pscreen)
  	nouveau_notifier_free(&screen->sync);
  	nouveau_grobj_free(&screen->celsius);

+	nouveau_screen_fini(&screen->base);
+
  	FREE(pscreen);
  }

diff --git a/src/gallium/drivers/nv20/nv20_screen.c 
b/src/gallium/drivers/nv20/nv20_screen.c
index 4eeacd1..7187f52 100644
--- a/src/gallium/drivers/nv20/nv20_screen.c
+++ b/src/gallium/drivers/nv20/nv20_screen.c
@@ -116,6 +116,8 @@ nv20_screen_destroy(struct pipe_screen *pscreen)
  	nouveau_notifier_free(&screen->sync);
  	nouveau_grobj_free(&screen->kelvin);

+	nouveau_screen_fini(&screen->base);
+
  	FREE(pscreen);
  }

diff --git a/src/gallium/drivers/nv30/nv30_context.c 
b/src/gallium/drivers/nv30/nv30_context.c
index 46a821a..4bf4d81 100644
--- a/src/gallium/drivers/nv30/nv30_context.c
+++ b/src/gallium/drivers/nv30/nv30_context.c
@@ -25,6 +25,12 @@ static void
  nv30_destroy(struct pipe_context *pipe)
  {
  	struct nv30_context *nv30 = nv30_context(pipe);
+    unsigned i;
+
+    for (i = 0; i < NV30_STATE_MAX; i++) {
+        if (nv30->state.hw[i])
+            so_ref(NULL, &nv30->state.hw[i]);
+    }

  	if (nv30->draw)
  		draw_destroy(nv30->draw);
diff --git a/src/gallium/drivers/nv30/nv30_fragprog.c 
b/src/gallium/drivers/nv30/nv30_fragprog.c
index 40965a9..bf1c314 100644
--- a/src/gallium/drivers/nv30/nv30_fragprog.c
+++ b/src/gallium/drivers/nv30/nv30_fragprog.c
@@ -870,6 +870,12 @@ void
  nv30_fragprog_destroy(struct nv30_context *nv30,
  		      struct nv30_fragment_program *fp)
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
diff --git a/src/gallium/drivers/nv30/nv30_screen.c 
b/src/gallium/drivers/nv30/nv30_screen.c
index 7cd3690..e17e1ab 100644
--- a/src/gallium/drivers/nv30/nv30_screen.c
+++ b/src/gallium/drivers/nv30/nv30_screen.c
@@ -156,6 +156,12 @@ static void
  nv30_screen_destroy(struct pipe_screen *pscreen)
  {
  	struct nv30_screen *screen = nv30_screen(pscreen);
+    unsigned i;
+
+    for (i = 0; i < NV30_STATE_MAX; i++) {
+        if (screen->state[i])
+            so_ref(NULL, &screen->state[i]);
+    }

  	nouveau_resource_free(&screen->vp_exec_heap);
  	nouveau_resource_free(&screen->vp_data_heap);
@@ -164,6 +170,8 @@ nv30_screen_destroy(struct pipe_screen *pscreen)
  	nouveau_notifier_free(&screen->sync);
  	nouveau_grobj_free(&screen->rankine);

+	nouveau_screen_fini(&screen->base);
+	
  	FREE(pscreen);
  }

diff --git a/src/gallium/drivers/nv40/nv40_context.c 
b/src/gallium/drivers/nv40/nv40_context.c
index eb9cce4..d668f31 100644
--- a/src/gallium/drivers/nv40/nv40_context.c
+++ b/src/gallium/drivers/nv40/nv40_context.c
@@ -25,6 +25,12 @@ static void
  nv40_destroy(struct pipe_context *pipe)
  {
  	struct nv40_context *nv40 = nv40_context(pipe);
+    unsigned i;
+
+    for (i = 0; i < NV40_STATE_MAX; i++) {
+        if (nv40->state.hw[i])
+            so_ref(NULL, &nv40->state.hw[i]);
+    }

  	if (nv40->draw)
  		draw_destroy(nv40->draw);
diff --git a/src/gallium/drivers/nv40/nv40_fragprog.c 
b/src/gallium/drivers/nv40/nv40_fragprog.c
index 1bf1672..52ba888 100644
--- a/src/gallium/drivers/nv40/nv40_fragprog.c
+++ b/src/gallium/drivers/nv40/nv40_fragprog.c
@@ -948,6 +948,12 @@ void
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
diff --git a/src/gallium/drivers/nv40/nv40_screen.c 
b/src/gallium/drivers/nv40/nv40_screen.c
index bd13dfd..bbe7509 100644
--- a/src/gallium/drivers/nv40/nv40_screen.c
+++ b/src/gallium/drivers/nv40/nv40_screen.c
@@ -140,6 +140,12 @@ static void
  nv40_screen_destroy(struct pipe_screen *pscreen)
  {
  	struct nv40_screen *screen = nv40_screen(pscreen);
+    unsigned i;
+
+    for (i = 0; i < NV40_STATE_MAX; i++) {
+        if (screen->state[i])
+            so_ref(NULL, &screen->state[i]);
+    }

  	nouveau_resource_free(&screen->vp_exec_heap);
  	nouveau_resource_free(&screen->vp_data_heap);
diff --git a/src/gallium/drivers/nv50/nv50_context.c 
b/src/gallium/drivers/nv50/nv50_context.c
index d21b80e..1739a4c 100644
--- a/src/gallium/drivers/nv50/nv50_context.c
+++ b/src/gallium/drivers/nv50/nv50_context.c
@@ -43,6 +43,39 @@ nv50_destroy(struct pipe_context *pipe)
  {
  	struct nv50_context *nv50 = nv50_context(pipe);

+	if (nv50->state.fb)
+	    so_ref(NULL, &nv50->state.fb);
+	if (nv50->state.blend)
+	    so_ref(NULL, &nv50->state.blend);
+	if (nv50->state.blend_colour)
+	    so_ref(NULL, &nv50->state.blend_colour);
+	if (nv50->state.zsa)
+	    so_ref(NULL, &nv50->state.zsa);
+	if (nv50->state.rast)
+	    so_ref(NULL, &nv50->state.rast);
+	if (nv50->state.stipple)
+	    so_ref(NULL, &nv50->state.stipple);
+	if (nv50->state.scissor)
+	    so_ref(NULL, &nv50->state.scissor);
+	if (nv50->state.viewport)
+	    so_ref(NULL, &nv50->state.viewport);
+	if (nv50->state.tsc_upload)
+	    so_ref(NULL, &nv50->state.tsc_upload);
+	if (nv50->state.tic_upload)
+	    so_ref(NULL, &nv50->state.tic_upload);
+	if (nv50->state.vertprog)
+	    so_ref(NULL, &nv50->state.vertprog);
+	if (nv50->state.fragprog)
+	    so_ref(NULL, &nv50->state.fragprog);
+	if (nv50->state.programs)
+	    so_ref(NULL, &nv50->state.programs);
+	if (nv50->state.vtxfmt)
+	    so_ref(NULL, &nv50->state.vtxfmt);
+	if (nv50->state.vtxbuf)
+	    so_ref(NULL, &nv50->state.vtxbuf);
+	if (nv50->state.vtxattr)
+	    so_ref(NULL, &nv50->state.vtxattr);
+
  	draw_destroy(nv50->draw);
  	FREE(nv50);
  }
diff --git a/src/gallium/drivers/nv50/nv50_screen.c 
b/src/gallium/drivers/nv50/nv50_screen.c
index 5a1efd3..9a74025 100644
--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -165,6 +165,21 @@ static void
  nv50_screen_destroy(struct pipe_screen *pscreen)
  {
  	struct nv50_screen *screen = nv50_screen(pscreen);
+    unsigned i;
+
+    for (i = 0; i < 2; i++) {
+        if (screen->constbuf_parm[i])
+            nouveau_bo_ref(NULL, &screen->constbuf_parm[i]);
+    }
+
+    if (screen->constbuf_misc[0])
+        nouveau_bo_ref(NULL, &screen->constbuf_misc[0]);
+    if (screen->tic)
+        nouveau_bo_ref(NULL, &screen->tic);
+    if (screen->tsc)
+        nouveau_bo_ref(NULL, &screen->tsc);
+    if (screen->static_init)
+        so_ref(NULL, &screen->static_init);

  	nouveau_notifier_free(&screen->sync);
  	nouveau_grobj_free(&screen->tesla);
