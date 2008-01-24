From: Roel Kluin <12o3l-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: [PATCH] more logical/bitand typos in nv10ColorMask(),
	nv10_state.c
Date: Thu, 24 Jan 2008 01:39:50 +0100
Message-ID: <4797DE56.3050900@tiscali.nl>
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

more logical/bitand typos

Signed-off-by: Roel Kluin <12o3l-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
---
diff --git a/src/mesa/drivers/dri/nouveau/nv10_state.c b/src/mesa/drivers/dri/nouveau/nv10_state.c
index 3e5bfe0..df074b6 100644
--- a/src/mesa/drivers/dri/nouveau/nv10_state.c
+++ b/src/mesa/drivers/dri/nouveau/nv10_state.c
@@ -140,7 +140,7 @@ static void nv10ColorMask(GLcontext *ctx, GLboolean rmask, GLboolean gmask,
 {
 	nouveauContextPtr nmesa = NOUVEAU_CONTEXT(ctx);
 	BEGIN_RING_CACHE(NvSub3D, NV10_TCL_PRIMITIVE_3D_COLOR_MASK, 1);
-	OUT_RING_CACHE(((amask && 0x01) << 24) | ((rmask && 0x01) << 16) | ((gmask && 0x01)<< 8) | ((bmask && 0x01) << 0));
+	OUT_RING_CACHE(((amask & 0x01) << 24) | ((rmask & 0x01) << 16) | ((gmask & 0x01)<< 8) | ((bmask & 0x01) << 0));
 }
 
 static void nv10ColorMaterial(GLcontext *ctx, GLenum face, GLenum mode)
