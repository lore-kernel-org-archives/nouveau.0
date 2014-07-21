From: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] perfmon: do not forget to destroy the engine
	context
Date: Mon, 21 Jul 2014 11:59:44 +0200
Message-ID: <1405936784-1696-1-git-send-email-samuel.pitoiset@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This fixes a crash when we reload Nouveau DRM.

Signed-off-by: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 nvkm/engine/perfmon/base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/nvkm/engine/perfmon/base.c b/nvkm/engine/perfmon/base.c
index e9c5e51..7481003 100644
--- a/nvkm/engine/perfmon/base.c
+++ b/nvkm/engine/perfmon/base.c
@@ -303,6 +303,7 @@ nouveau_perfctx_dtor(struct nouveau_object *object)
 {
 	struct nouveau_perfmon *ppm = (void *)object->engine;
 	mutex_lock(&nv_subdev(ppm)->mutex);
+	nouveau_engctx_destroy(&ppm->context->base);
 	ppm->context = NULL;
 	mutex_unlock(&nv_subdev(ppm)->mutex);
 }
-- 
2.0.0
