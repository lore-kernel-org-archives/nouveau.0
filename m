From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v4 2/8] drm/nouveau: Enable polling even if we have runtime PM
Date: Wed,  1 Aug 2018 17:14:52 -0400
Message-ID: <20180801211459.7731-3-lyude@redhat.com>
References: <20180801211459.7731-1-lyude@redhat.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180801211459.7731-1-lyude@redhat.com>
Sender: stable-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Lukas Wunner <lukas@wunner.de>, Peter Ujfalusi <peter.ujfalusi@ti.com>, stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Having runtime PM makes no difference on whether or not we want polling,
and it's now safe to just enable polling unconditionally in drm_load()
thanks to d61a5c106351 ("drm/nouveau: Fix deadlock on runtime suspend")

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Lukas Wunner <lukas@wunner.de>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 5fdc1fbe2ee5..ee2546db09c9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -592,10 +592,11 @@ nouveau_drm_load(struct drm_device *dev, unsigned long flags)
 		pm_runtime_allow(dev->dev);
 		pm_runtime_mark_last_busy(dev->dev);
 		pm_runtime_put(dev->dev);
-	} else {
-		/* enable polling for external displays */
-		drm_kms_helper_poll_enable(dev);
 	}
+
+	/* enable polling for connectors without hpd */
+	drm_kms_helper_poll_enable(dev);
+
 	return 0;
 
 fail_dispinit:
-- 
2.17.1
