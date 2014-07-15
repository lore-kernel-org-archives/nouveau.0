From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] graph/nve4: do not crash if no power device
	present
Date: Tue, 15 Jul 2014 10:36:11 +0900
Message-ID: <1405388171-2629-1-git-send-email-acourbot@nvidia.com>
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
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Detect and workaround the absence of a power device so chips that do not
feature one (e.g. GK20A) can still use this driver.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 nvkm/engine/graph/nve4.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/nvkm/engine/graph/nve4.c b/nvkm/engine/graph/nve4.c
index 1ba6666da4e5..fb9cb929320d 100644
--- a/nvkm/engine/graph/nve4.c
+++ b/nvkm/engine/graph/nve4.c
@@ -203,7 +203,8 @@ nve4_graph_init(struct nouveau_object *object)
 	int gpc, tpc, rop;
 	int ret, i;
 
-	ppwr->pgob(ppwr, false);
+	if (ppwr)
+		ppwr->pgob(ppwr, false);
 
 	ret = nouveau_graph_init(&priv->base);
 	if (ret)
-- 
2.0.1
