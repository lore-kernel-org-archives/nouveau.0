From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 3/3] drm/nouveau: Remove useless poll_enable() call in drm_load()
Date: Mon, 13 Aug 2018 15:22:31 -0400
Message-ID: <20180813192231.28861-4-lyude@redhat.com>
References: <20180813192231.28861-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180813192231.28861-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Lukas Wunner <lukas@wunner.de>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Again, this doesn't do anything. drm_kms_helper_poll_enable() will have
already been called in nouveau_display_init()

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Karol Herbst <karolherbst@gmail.com>
Cc: Lukas Wunner <lukas@wunner.de>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 5fdc1fbe2ee5..04f704b77a3c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -592,10 +592,8 @@ nouveau_drm_load(struct drm_device *dev, unsigned long flags)
 		pm_runtime_allow(dev->dev);
 		pm_runtime_mark_last_busy(dev->dev);
 		pm_runtime_put(dev->dev);
-	} else {
-		/* enable polling for external displays */
-		drm_kms_helper_poll_enable(dev);
 	}
+
 	return 0;
 
 fail_dispinit:
-- 
2.17.1
