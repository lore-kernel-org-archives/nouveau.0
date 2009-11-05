From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH] nv10: Fix build for the last nouveau_class.h
	changes.
Date: Thu,  5 Nov 2009 19:07:19 +0100
Message-ID: <1257444439-23024-1-git-send-email-currojerez@riseup.net>
References: <87y6mkrguh.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <87y6mkrguh.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 src/gallium/drivers/nv10/nv10_context.c   |    2 +-
 src/gallium/drivers/nv10/nv10_prim_vbuf.c |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/src/gallium/drivers/nv10/nv10_context.c b/src/gallium/drivers/nv10/nv10_context.c
index 933176f..65a22b1 100644
--- a/src/gallium/drivers/nv10/nv10_context.c
+++ b/src/gallium/drivers/nv10/nv10_context.c
@@ -243,7 +243,7 @@ static void nv10_init_hwctx(struct nv10_context *nv10)
 	OUT_RING  (0.0);
 	OUT_RINGf  (16777216.0);
 
-	BEGIN_RING(celsius, NV10TCL_VIEWPORT_SCALE_X, 4);
+	BEGIN_RING(celsius, NV10TCL_VIEWPORT_TRANSLATE_X, 4);
 	OUT_RINGf  (-2048.0);
 	OUT_RINGf  (-2048.0);
 	OUT_RINGf  (16777215.0 * 0.5);
diff --git a/src/gallium/drivers/nv10/nv10_prim_vbuf.c b/src/gallium/drivers/nv10/nv10_prim_vbuf.c
index 1806d5f..7ba9777 100644
--- a/src/gallium/drivers/nv10/nv10_prim_vbuf.c
+++ b/src/gallium/drivers/nv10/nv10_prim_vbuf.c
@@ -69,9 +69,9 @@ void nv10_vtxbuf_bind( struct nv10_context* nv10 )
 {
 	int i;
 	for(i = 0; i < 8; i++) {
-		BEGIN_RING(celsius, NV10TCL_VERTEX_ARRAY_ATTRIB_OFFSET(i), 1);
+		BEGIN_RING(celsius, NV10TCL_VTXBUF_ADDRESS(i), 1);
 		OUT_RING(0/*nv10->vtxbuf*/);
-		BEGIN_RING(celsius, NV10TCL_VERTEX_ARRAY_ATTRIB_FORMAT(i) ,1);
+		BEGIN_RING(celsius, NV10TCL_VTXFMT(i), 1);
 		OUT_RING(0/*XXX*/);
 	}
 }
-- 
1.6.4.4
