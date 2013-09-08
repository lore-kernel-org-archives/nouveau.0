From: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
Subject: [PATCH] Bail in nouveau_display_resume() if there are no output available!
Date: Sun,  8 Sep 2013 23:21:04 +0200
Message-ID: <1378675264-3005-2-git-send-email-tobias.johannes.klausmann@mni.thm.de>
References: <CAKb7UviRb_ao_nB8Q3pa9ePm+yUGd8u7PDREv5wNfCheyGTZjQ@mail.gmail.com>
 <1378675264-3005-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1378675264-3005-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
Sender: linux-kernel-owner@vger.kernel.org
To: imirkin@alum.mit.edu, airlied@linux.ie
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
List-Id: nouveau.vger.kernel.org

---
 drivers/gpu/drm/nouveau/nouveau_display.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index d2712e6..a4ba734 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -452,7 +452,12 @@ void
 nouveau_display_resume(struct drm_device *dev)
 {
 	struct drm_crtc *crtc;
-	nouveau_display_init(dev);
+	int ret;
+	if (dev->mode_config.num_crtc) {
+		ret = nouveau_display_init(dev);
+		if (ret)
+			nouveau_display_destroy(dev);
+	}
 
 	/* Force CLUT to get re-loaded during modeset */
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
-- 
1.8.1.4
