From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH] libdrm/nouveau: Support nested bo mapping
Date: Sun, 17 Jan 2010 22:26:20 +0100
Message-ID: <1263763580-7333-1-git-send-email-luca@luca-barbieri.com>
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

Most Gallium drivers support nested mapping by using a reference count.
We don't, and swtnl fallback triggers an error due to this.

This patch adds this support in libdrm.
---
 nouveau/nouveau_bo.c      |    8 +++++++-
 nouveau/nouveau_private.h |    1 +
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/nouveau/nouveau_bo.c b/nouveau/nouveau_bo.c
index 10cc8a6..c1a9843 100644
--- a/nouveau/nouveau_bo.c
+++ b/nouveau/nouveau_bo.c
@@ -417,9 +417,12 @@ nouveau_bo_map_range(struct nouveau_bo *bo, uint32_t delta, uint32_t size,
 	struct nouveau_bo_priv *nvbo = nouveau_bo(bo);
 	int ret;
 
-	if (!nvbo || bo->map)
+	if (!nvbo)
 		return -EINVAL;
 
+	if(nvbo->map_count++)
+		return 0;
+
 	if (!nouveau_bo_allocated(nvbo)) {
 		if (nvbo->flags & (NOUVEAU_BO_VRAM | NOUVEAU_BO_GART)) {
 			ret = nouveau_bo_kalloc(nvbo, NULL);
@@ -470,6 +473,9 @@ nouveau_bo_unmap(struct nouveau_bo *bo)
 {
 	struct nouveau_bo_priv *nvbo = nouveau_bo(bo);
 
+	if(--nvbo->map_count)
+		return 0;
+
 	if (bo->map && !nvbo->sysmem) {
 		struct nouveau_device_priv *nvdev = nouveau_device(bo->device);
 		struct drm_nouveau_gem_cpu_fini req;
diff --git a/nouveau/nouveau_private.h b/nouveau/nouveau_private.h
index 39758d1..512bc1e 100644
--- a/nouveau/nouveau_private.h
+++ b/nouveau/nouveau_private.h
@@ -115,6 +115,7 @@ struct nouveau_bo_priv {
 	drm_handle_t handle;
 	uint64_t map_handle;
 	void *map;
+	unsigned map_count;
 
 	/* Last known information from kernel on buffer status */
 	int pinned;
-- 
1.6.3.3
