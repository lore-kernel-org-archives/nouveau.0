From: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
Subject: [PATCH 10/11] drm/nvc0/fb: Take lock in nvc0_ram_put()
Date: Fri, 19 Jul 2013 23:59:12 +0200
Message-ID: <1374271152-27949-1-git-send-email-r.spliet@student.tudelft.nl>
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
To: Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Kernel panic caused by list corruption in ltcg seems to indicate a concurrency issue. Take mutex of pfb like nv50_ram_put() to eliminate concurrency.

V2: Separate critical section into separate function, avoid taking the lock twice on NVC0

Signed-off-by: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/subdev/fb/priv.h    |  2 +-
 drivers/gpu/drm/nouveau/core/subdev/fb/ramnv50.c | 22 ++++++++++++++--------
 drivers/gpu/drm/nouveau/core/subdev/fb/ramnvc0.c | 14 +++++++++++---
 3 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/priv.h b/drivers/gpu/drm/nouveau/core/subdev/fb/priv.h
index 6c974dd..db9d6dd 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/priv.h
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/priv.h
@@ -81,7 +81,7 @@ void nv44_fb_tile_prog(struct nouveau_fb *, int, struct nouveau_fb_tile *);
 void nv46_fb_tile_init(struct nouveau_fb *, int i, u32 addr, u32 size,
 		       u32 pitch, u32 flags, struct nouveau_fb_tile *);
 
-void nv50_ram_put(struct nouveau_fb *, struct nouveau_mem **);
+void __nv50_ram_put(struct nouveau_fb *, struct nouveau_mem *);
 extern int nv50_fb_memtype[0x80];
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnv50.c b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnv50.c
index af5aa7e..903baff 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnv50.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnv50.c
@@ -27,17 +27,10 @@
 #include "priv.h"
 
 void
-nv50_ram_put(struct nouveau_fb *pfb, struct nouveau_mem **pmem)
+__nv50_ram_put(struct nouveau_fb *pfb, struct nouveau_mem *mem)
 {
 	struct nouveau_mm_node *this;
-	struct nouveau_mem *mem;
 
-	mem = *pmem;
-	*pmem = NULL;
-	if (unlikely(mem == NULL))
-		return;
-
-	mutex_lock(&pfb->base.mutex);
 	while (!list_empty(&mem->regions)) {
 		this = list_first_entry(&mem->regions, typeof(*this), rl_entry);
 
@@ -46,6 +39,19 @@ nv50_ram_put(struct nouveau_fb *pfb, struct nouveau_mem **pmem)
 	}
 
 	nouveau_mm_free(&pfb->tags, &mem->tag);
+}
+
+void
+nv50_ram_put(struct nouveau_fb *pfb, struct nouveau_mem **pmem)
+{
+	struct nouveau_mem *mem = *pmem;
+
+	*pmem = NULL;
+	if (unlikely(mem == NULL))
+		return;
+
+	mutex_lock(&pfb->base.mutex);
+	__nv50_ram_put(pfb, mem);
 	mutex_unlock(&pfb->base.mutex);
 
 	kfree(mem);
diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnvc0.c b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnvc0.c
index 9c3634a..cf97c4d 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnvc0.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnvc0.c
@@ -33,11 +33,19 @@ void
 nvc0_ram_put(struct nouveau_fb *pfb, struct nouveau_mem **pmem)
 {
 	struct nouveau_ltcg *ltcg = nouveau_ltcg(pfb);
+	struct nouveau_mem *mem = *pmem;
 
-	if ((*pmem)->tag)
-		ltcg->tags_free(ltcg, &(*pmem)->tag);
+	*pmem = NULL;
+	if (unlikely(mem == NULL))
+		return;
 
-	nv50_ram_put(pfb, pmem);
+	mutex_lock(&pfb->base.mutex);
+	if (mem->tag)
+		ltcg->tags_free(ltcg, &mem->tag);
+	__nv50_ram_put(pfb, mem);
+	mutex_unlock(&pfb->base.mutex);
+
+	kfree(mem);
 }
 
 int
-- 
1.8.3.1
