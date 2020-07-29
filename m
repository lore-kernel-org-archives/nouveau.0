From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 1/9] drm/nouveau/kms: Handle -EINPROGRESS in nouveau_connector_hotplug()
Date: Wed, 29 Jul 2020 17:36:55 -0400
Message-ID: <20200729213703.119137-2-lyude@redhat.com>
References: <20200729213703.119137-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20200729213703.119137-1-lyude@redhat.com>
Sender: stable-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Karol Herbst <kherbst@redhat.com>, open list <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

Looks like that we forgot to handle -EINPROGRESS being returned by
pm_runtime_get(), which can happen if multiple callers try to
asynchronously resume the GPU before it wakes up. This is perfectly
normal and OK, so fix this by treating -EINPROGRESS as success.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: 3e1a12754d4d ("drm/nouveau: Fix deadlocks in nouveau_connector_detect()")
Cc: stable@vger.kernel.org
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v4.19+
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 7674025a4bfe8..38e226b8cfd05 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1173,7 +1173,7 @@ nouveau_connector_hotplug(struct nvif_notify *notify)
 	}
 
 	ret = pm_runtime_get(drm->dev->dev);
-	if (ret == 0) {
+	if (ret == 0 || ret == -EINPROGRESS) {
 		/* We can't block here if there's a pending PM request
 		 * running, as we'll deadlock nouveau_display_fini() when it
 		 * calls nvif_put() on our nvif_notify struct. So, simply
-- 
2.26.2
