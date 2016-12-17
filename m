From: Kees Cook <keescook@chromium.org>
Subject: [PATCH] drm/nouveau: use designated initializers
Date: Fri, 16 Dec 2016 17:04:42 -0800
Message-ID: <20161217010442.GA140619@beast>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Prepare to mark sensitive kernel structures for randomization by making
sure they're using designated initializers. These were identified during
allyesconfig builds of x86, arm, and arm64, with most initializer fixes
extracted from grsecurity.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/nouveau/nouveau_ttm.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index a6dbe8258040..ec4668a41e01 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -107,10 +107,10 @@ nouveau_vram_manager_new(struct ttm_mem_type_manager *man,
 }
 
 const struct ttm_mem_type_manager_func nouveau_vram_manager = {
-	nouveau_vram_manager_init,
-	nouveau_vram_manager_fini,
-	nouveau_vram_manager_new,
-	nouveau_vram_manager_del,
+	.init = nouveau_vram_manager_init,
+	.takedown = nouveau_vram_manager_fini,
+	.get_node = nouveau_vram_manager_new,
+	.put_node = nouveau_vram_manager_del,
 };
 
 static int
@@ -184,11 +184,11 @@ nouveau_gart_manager_debug(struct ttm_mem_type_manager *man, const char *prefix)
 }
 
 const struct ttm_mem_type_manager_func nouveau_gart_manager = {
-	nouveau_gart_manager_init,
-	nouveau_gart_manager_fini,
-	nouveau_gart_manager_new,
-	nouveau_gart_manager_del,
-	nouveau_gart_manager_debug
+	.init = nouveau_gart_manager_init,
+	.takedown = nouveau_gart_manager_fini,
+	.get_node = nouveau_gart_manager_new,
+	.put_node = nouveau_gart_manager_del,
+	.debug = nouveau_gart_manager_debug
 };
 
 /*XXX*/
@@ -257,11 +257,11 @@ nv04_gart_manager_debug(struct ttm_mem_type_manager *man, const char *prefix)
 }
 
 const struct ttm_mem_type_manager_func nv04_gart_manager = {
-	nv04_gart_manager_init,
-	nv04_gart_manager_fini,
-	nv04_gart_manager_new,
-	nv04_gart_manager_del,
-	nv04_gart_manager_debug
+	.init = nv04_gart_manager_init,
+	.takedown = nv04_gart_manager_fini,
+	.get_node = nv04_gart_manager_new,
+	.put_node = nv04_gart_manager_del,
+	.debug = nv04_gart_manager_debug
 };
 
 int
-- 
2.7.4


-- 
Kees Cook
Nexus Security
