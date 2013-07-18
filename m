From: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
Subject: [PATCH 10/11] drm/nvc0/fb: Take lock in nvc0_ram_put()
Date: Thu, 18 Jul 2013 13:58:42 +0200
Message-ID: <1374148722-2835-1-git-send-email-r.spliet@student.tudelft.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Kernel panic caused by list corruption in ltcg seems to indicate a concurrency issue. Take mutex of pfb like nv50_ram_put() to eliminate concurrency.

Signed-off-by: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/subdev/fb/ramnvc0.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnvc0.c b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnvc0.c
index 9c3634a..abe0b61 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnvc0.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnvc0.c
@@ -33,11 +33,18 @@ void
 nvc0_ram_put(struct nouveau_fb *pfb, struct nouveau_mem **pmem)
 {
 	struct nouveau_ltcg *ltcg = nouveau_ltcg(pfb);
+	struct nouveau_mem *mem = *pmem;
 
-	if ((*pmem)->tag)
-		ltcg->tags_free(ltcg, &(*pmem)->tag);
+	*pmem = NULL;
+	if(unlikely(mem == NULL))
+		return;
 
-	nv50_ram_put(pfb, pmem);
+	mutex_lock(&pfb->base.mutex);
+	if (mem->tag)
+		ltcg->tags_free(ltcg, &mem->tag);
+	mutex_unlock(&pfb->base.mutex);
+
+	nv50_ram_put(pfb, &mem);
 }
 
 int
-- 
1.8.3.1
