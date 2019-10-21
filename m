From: Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: [PATCH] drm/nouveau: Fix memory leak in nouveau_bo_alloc
Date: Mon, 21 Oct 2019 16:14:48 -0500
Message-ID: <20191021211449.9104-1-navid.emamdoost@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: emamd001@umn.edu, kjlu@umn.edu, smccaman@umn.edu, Navid Emamdoost <navid.emamdoost@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

In the implementation of nouveau_bo_alloc() if it fails to determine the
target page size via pi, then the allocated memory for nvbo should be
released.

Fixes: 019cbd4a4feb ("drm/nouveau: Initialize GEM object before TTM object")
Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index f8015e0318d7..18857cf44068 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -276,8 +276,10 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 flags,
 			break;
 	}
 
-	if (WARN_ON(pi < 0))
+	if (WARN_ON(pi < 0)) {
+		kfree(nvbo);
 		return ERR_PTR(-EINVAL);
+	}
 
 	/* Disable compression if suitable settings couldn't be found. */
 	if (nvbo->comp && !vmm->page[pi].comp) {
-- 
2.17.1
