From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: [PATCH] gpu: drm: nouveau: add null check before pointer dereference
Date: Mon, 22 May 2017 14:12:37 -0500
Message-ID: <20170522191237.GA6240@embeddedgus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <garsilva@embeddedor.com>
List-Id: nouveau.vger.kernel.org

Add null check before dereferencing pointer asyc

Addresses-Coverity-ID: 1397932
Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
---
 drivers/gpu/drm/nouveau/nv50_display.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index a766324..052a60a 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -2107,7 +2107,8 @@ nv50_head_atomic_check(struct drm_crtc *crtc, struct drm_crtc_state *state)
 					asyc->set.dither = true;
 			}
 		} else {
-			asyc->set.mask = ~0;
+			if (asyc)
+				asyc->set.mask = ~0;
 			asyh->set.mask = ~0;
 		}
 
-- 
2.5.0
