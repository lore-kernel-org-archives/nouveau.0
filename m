From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 6/9] drm/nouveau/kms: Use pm_runtime_put_autosuspend() in hpd_work
Date: Wed, 29 Jul 2020 17:37:00 -0400
Message-ID: <20200729213703.119137-7-lyude@redhat.com>
References: <20200729213703.119137-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200729213703.119137-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "open list:DRM DRIVER FOR NVIDIA
        GEFORCE/QUADRO GPUS" <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

Again, we don't have any need to suspend the device synchronously here,
and doing so could in theory lead to a deadlock (although it's unlikely
since we've called pm_runtime_mark_last_busy() before-hand).

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 63c58f12458c9..cdc5a2200f95e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -444,7 +444,7 @@ nouveau_display_hpd_work(struct work_struct *work)
 	drm_helper_hpd_irq_event(drm->dev);
 
 	pm_runtime_mark_last_busy(drm->dev->dev);
-	pm_runtime_put_sync(drm->dev->dev);
+	pm_runtime_put_autosuspend(drm->dev->dev);
 }
 
 #ifdef CONFIG_ACPI
-- 
2.26.2
