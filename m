From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 1/3] drm/nouveau: Fix potential memory leak in nouveau_drm_load()
Date: Wed, 22 Aug 2018 21:40:06 -0400
Message-ID: <20180823014009.21532-2-lyude@redhat.com>
References: <20180823014009.21532-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180823014009.21532-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Karol Herbst <kherbst@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

We forget to free drm in all instances of failure, and additionally also
forget to destroy the master client if the other client fails
initialization.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 5fdc1fbe2ee5..6c88ff776ff6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -538,11 +538,11 @@ nouveau_drm_load(struct drm_device *dev, unsigned long flags)
 
 	ret = nouveau_cli_init(drm, "DRM-master", &drm->master);
 	if (ret)
-		return ret;
+		goto fail_alloc;
 
 	ret = nouveau_cli_init(drm, "DRM", &drm->client);
 	if (ret)
-		return ret;
+		goto fail_master;
 
 	dev->irq_enabled = true;
 
@@ -607,7 +607,9 @@ nouveau_drm_load(struct drm_device *dev, unsigned long flags)
 fail_ttm:
 	nouveau_vga_fini(drm);
 	nouveau_cli_fini(&drm->client);
+fail_master:
 	nouveau_cli_fini(&drm->master);
+fail_alloc:
 	kfree(drm);
 	return ret;
 }
-- 
2.17.1
