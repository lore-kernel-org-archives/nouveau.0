From: David Archuleta Jr <darchuletajr@gmail.com>
Subject: [PATCH] drivers: drm: nouveau: Fix brace coding style error
Date: Thu, 22 Sep 2016 17:34:38 -0700
Message-ID: <20160923003438.11138-1-darchuletajr@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, David Archuleta Jr <darchuletajr@gmail.com>
List-Id: nouveau.vger.kernel.org

Fixed a coding style issue. Else should follow brace.

Signed-off-by: David Archuleta Jr. <darchuletajr@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index afbf557..0d39e17 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -851,8 +851,7 @@ nouveau_finish_page_flip(struct nouveau_channel *chan,
 			/* Give up ownership of vblank for page-flipped crtc */
 			drm_crtc_vblank_put(s->crtc);
 		}
-	}
-	else {
+	} else {
 		/* Give up ownership of vblank for page-flipped crtc */
 		drm_crtc_vblank_put(s->crtc);
 	}
-- 
2.10.0
