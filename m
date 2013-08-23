From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: [PATCH] drm/nv50/disp: prevent false output detection on the original nv50
Date: Fri, 23 Aug 2013 18:43:42 +0100
Message-ID: <1377279822-29675-1-git-send-email-emil.l.velikov@gmail.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>
Cc: nouveau@lists.freedesktop.org, Emil Velikov <emil.l.velikov@gmail.com>, stable@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Commit ea9197cc323839ef3d5280c0453b2c622caa6bc7 effectively enabled the
use of an improved DAC detection code, but introduced a regression on
the original nv50 chipset, causing a ghost monitor to be detected.

Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=67382
Tested-by: Martin Peres <martin.peres@labri.fr>
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
Cc: <stable@vger.kernel.org> # 3.9+
---
 drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c b/drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c
index f02fd9f..15df527 100644
--- a/drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c
@@ -55,7 +55,14 @@ nv50_dac_sense(struct nv50_disp_priv *priv, int or, u32 loadval)
 	nv_wr32(priv, 0x61a00c + doff, 0x00100000 | loadval);
 	mdelay(9);
 	udelay(500);
-	nv_wr32(priv, 0x61a00c + doff, 0x80000000);
+
+	/*
+	 * The original nv50 detects a ghost monitor if we do the following
+	 * write. See fdo#67382 for more information
+	 */
+	if (nv_device(priv)->chipset != 0x50)
+		nv_wr32(priv, 0x61a00c + doff, 0x80000000);
+
 	load = (nv_rd32(priv, 0x61a00c + doff) & 0x38000000) >> 27;
 	nv_wr32(priv, 0x61a00c + doff, 0x00000000);
 	nv_mask(priv, 0x61a004 + doff, 0x807f0000, 0x80550000);
-- 
1.8.3.4
