From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH] nv20-nv40: Add support for two sided color
Date: Thu, 14 Jan 2010 07:29:06 +0100
Message-ID: <1263450546-6024-1-git-send-email-luca@luca-barbieri.com>
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
Cc: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This patch adds support for two-sided vertex color to NV20, NV30 and NV40.
When set, the COLOR0/1 fs inputs on back faces will be wired to vs outputs BCOLOR0/1.
This makes OpenGL two sided lighting work, which can be tested with progs/demos/projtex.

This is already supported on NV50 and seems to be unsupported on NV04 and NV10.

The following defines need to be added to nouveau_class.h:

In renouveau.xml, for both NV30 and NV40:
<reg32 offset="0x142c" name="VERTEX_TWO_SIDE_ENABLE" type="boolean"/>

Tested on NV40 only.
---
 src/gallium/drivers/nv20/nv20_state.c      |    3 ++-
 src/gallium/drivers/nv20/nv20_state.h      |    2 ++
 src/gallium/drivers/nv20/nv20_state_emit.c |    3 +++
 src/gallium/drivers/nv30/nv30_state.c      |    6 ++++--
 src/gallium/drivers/nv40/nv40_state.c      |    8 ++++++--
 5 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/src/gallium/drivers/nv20/nv20_state.c b/src/gallium/drivers/nv20/nv20_state.c
index 3a82e63..a8a33b2 100644
--- a/src/gallium/drivers/nv20/nv20_state.c
+++ b/src/gallium/drivers/nv20/nv20_state.c
@@ -234,7 +234,6 @@ nv20_rasterizer_state_create(struct pipe_context *pipe,
 	int i;
 
 	/*XXX: ignored:
-	 * 	light_twoside
 	 * 	offset_cw/ccw -nohw
 	 * 	scissor
 	 * 	point_smooth -nohw
@@ -301,6 +300,8 @@ nv20_rasterizer_state_create(struct pipe_context *pipe,
 	} else {
 		rs->point_sprite = 0;
 	}
+	
+	rs->light_twoside = cso->light_twoside;
 
 	return (void *)rs;
 }
diff --git a/src/gallium/drivers/nv20/nv20_state.h b/src/gallium/drivers/nv20/nv20_state.h
index dde4106..b8b0366 100644
--- a/src/gallium/drivers/nv20/nv20_state.h
+++ b/src/gallium/drivers/nv20/nv20_state.h
@@ -39,6 +39,8 @@ struct nv20_rasterizer_state {
 	uint32_t cull_face_en;
 
 	uint32_t point_sprite;
+	
+	uint32_t light_twoside;
 
 	const struct pipe_rasterizer_state *templ;
 };
diff --git a/src/gallium/drivers/nv20/nv20_state_emit.c b/src/gallium/drivers/nv20/nv20_state_emit.c
index 6bbd1fd..a916788 100644
--- a/src/gallium/drivers/nv20/nv20_state_emit.c
+++ b/src/gallium/drivers/nv20/nv20_state_emit.c
@@ -68,6 +68,9 @@ static void nv20_state_emit_rast(struct nv20_context* nv20)
 
 	BEGIN_RING(chan, kelvin, NV20TCL_CULL_FACE_ENABLE, 1);
 	OUT_RING  (chan, r->cull_face_en);
+
+        BEGIN_RING(chan, kelvin, NV20TCL_LIGHT_MODEL_TWO_SIDE_ENABLE, 1);
+        OUT_RING  (chan, r->light_twoside);
 }
 
 static void nv20_state_emit_dsa(struct nv20_context* nv20)
diff --git a/src/gallium/drivers/nv30/nv30_state.c b/src/gallium/drivers/nv30/nv30_state.c
index a80dfb0..ab45199 100644
--- a/src/gallium/drivers/nv30/nv30_state.c
+++ b/src/gallium/drivers/nv30/nv30_state.c
@@ -300,11 +300,10 @@ nv30_rasterizer_state_create(struct pipe_context *pipe,
 {
 	struct nv30_context *nv30 = nv30_context(pipe);
 	struct nv30_rasterizer_state *rsso = CALLOC(1, sizeof(*rsso));
-	struct nouveau_stateobj *so = so_new(9, 19, 0);
+	struct nouveau_stateobj *so = so_new(10, 20, 0);
 	struct nouveau_grobj *rankine = nv30->screen->rankine;
 
 	/*XXX: ignored:
-	 * 	light_twoside
 	 * 	point_smooth -nohw
 	 * 	multisample
 	 */
@@ -313,6 +312,9 @@ nv30_rasterizer_state_create(struct pipe_context *pipe,
 	so_data  (so, cso->flatshade ? NV34TCL_SHADE_MODEL_FLAT :
 				       NV34TCL_SHADE_MODEL_SMOOTH);
 
+        so_method(so, rankine, NV34TCL_VERTEX_TWO_SIDE_ENABLE, 1);
+        so_data  (so, cso->light_twoside);
+        
 	so_method(so, rankine, NV34TCL_LINE_WIDTH, 2);
 	so_data  (so, (unsigned char)(cso->line_width * 8.0) & 0xff);
 	so_data  (so, cso->line_smooth ? 1 : 0);
diff --git a/src/gallium/drivers/nv40/nv40_state.c b/src/gallium/drivers/nv40/nv40_state.c
index 4e3a61f..395f7aa 100644
--- a/src/gallium/drivers/nv40/nv40_state.c
+++ b/src/gallium/drivers/nv40/nv40_state.c
@@ -310,11 +310,10 @@ nv40_rasterizer_state_create(struct pipe_context *pipe,
 {
 	struct nv40_context *nv40 = nv40_context(pipe);
 	struct nv40_rasterizer_state *rsso = CALLOC(1, sizeof(*rsso));
-	struct nouveau_stateobj *so = so_new(8, 18, 0);
+	struct nouveau_stateobj *so = so_new(10, 20, 0);
 	struct nouveau_grobj *curie = nv40->screen->curie;
 
 	/*XXX: ignored:
-	 * 	light_twoside
 	 * 	point_smooth -nohw
 	 * 	multisample
 	 */
@@ -323,6 +322,11 @@ nv40_rasterizer_state_create(struct pipe_context *pipe,
 	so_data  (so, cso->flatshade ? NV40TCL_SHADE_MODEL_FLAT :
 				       NV40TCL_SHADE_MODEL_SMOOTH);
 
+        /* the blob also sets 0x1428 to 0 in the same block.
+	    Its purpose is unclear and it does not seem to have any discernible effects. */
+        so_method(so, curie, NV40TCL_VERTEX_TWO_SIDE_ENABLE, 1);
+        so_data  (so, cso->light_twoside);
+
 	so_method(so, curie, NV40TCL_LINE_WIDTH, 2);
 	so_data  (so, (unsigned char)(cso->line_width * 8.0) & 0xff);
 	so_data  (so, cso->line_smooth ? 1 : 0);
-- 
1.6.3.3
