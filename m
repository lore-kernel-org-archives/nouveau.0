From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 2/9] drm/nouveau/kms: Fix rpm leak in nouveau_connector_hotplug()
Date: Wed, 29 Jul 2020 17:36:56 -0400
Message-ID: <20200729213703.119137-3-lyude@redhat.com>
References: <20200729213703.119137-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20200729213703.119137-1-lyude@redhat.com>
Sender: stable-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Karol Herbst <kherbst@redhat.com>, open list <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

Found another one, we forget to drop the runtime PM reference we grab
here in the event of a failure. So, do that.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: 3e1a12754d4d ("drm/nouveau: Fix deadlocks in nouveau_connector_detect()")
Cc: stable@vger.kernel.org
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v4.19+
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 38e226b8cfd05..ab35153e31b72 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1188,6 +1188,9 @@ nouveau_connector_hotplug(struct nvif_notify *notify)
 	} else if (ret != 1 && ret != -EACCES) {
 		NV_WARN(drm, "HPD on %s dropped due to RPM failure: %d\n",
 			name, ret);
+
+		pm_runtime_mark_last_busy(drm->dev->dev);
+		pm_runtime_put_autosuspend(drm->dev->dev);
 		return NVIF_NOTIFY_DROP;
 	}
 
-- 
2.26.2
