From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
Subject: [PATCH] drm/nouveau/dispnv04: subdev/bios.h is included more than
 once
Date: Sun, 26 May 2019 16:29:36 +0530
Message-ID: <20190526105935.GA2983@hari-Inspiron-1545>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Hariprasad Kelam <hariprasad.kelam@gmail.com>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

remove duplicate inclusion of subdev/bios.h

Issue identified by includecheck

Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
---
 drivers/gpu/drm/nouveau/dispnv04/disp.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.h b/drivers/gpu/drm/nouveau/dispnv04/disp.h
index c6ed20a..195d899 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv04/disp.h
@@ -161,7 +161,6 @@ nv_match_device(struct drm_device *dev, unsigned device,
 		dev->pdev->subsystem_device == sub_device;
 }
 
-#include <subdev/bios.h>
 #include <subdev/bios/init.h>
 
 static inline void
-- 
2.7.4
