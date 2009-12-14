From: =?utf-8?q?Marcin=20Ko=C5=9Bcielnicki?= <koriakin-mP9o5jsk0RY@public.gmane.org>
Subject: [PATCH 2/2] drm/nv04: Fix NV04 set_operation software
	method.
Date: Mon, 14 Dec 2009 20:38:17 +0000
Message-ID: <1260823097-1246-1-git-send-email-koriakin@0x04.net>
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

---
 drivers/gpu/drm/nouveau/nv04_graph.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv04_graph.c b/drivers/gpu/drm/nouveau/nv04_graph.c
index 396ee92..d561d77 100644
--- a/drivers/gpu/drm/nouveau/nv04_graph.c
+++ b/drivers/gpu/drm/nouveau/nv04_graph.c
@@ -543,7 +543,7 @@ nv04_graph_mthd_set_operation(struct nouveau_channel *chan, int grclass,
 
 	nv_wi32(dev, instance, tmp);
 	nv_wr32(dev, NV04_PGRAPH_CTX_SWITCH1, tmp);
-	nv_wr32(dev, NV04_PGRAPH_CTX_CACHE1 + subc, tmp);
+	nv_wr32(dev, NV04_PGRAPH_CTX_CACHE1 + (subc<<2), tmp);
 	return 0;
 }
 
-- 
1.6.5.6
