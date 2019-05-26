From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
Subject: [PATCH] drm/nouveau: fix nvif/device.h is included more than once
Date: Sun, 26 May 2019 16:36:25 +0530
Message-ID: <20190526110625.GA3143@hari-Inspiron-1545>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

remove duplicate inclusion of nvif/device.h

Issue identified by includecheck

Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 35ff0ca..cfebb14 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -127,7 +127,6 @@ nouveau_cli(struct drm_file *fpriv)
 }
 
 #include <nvif/object.h>
-#include <nvif/device.h>
 
 struct nouveau_drm {
 	struct nouveau_cli master;
-- 
2.7.4
