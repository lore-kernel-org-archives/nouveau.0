From: zhong jiang <zhongjiang@huawei.com>
Subject: [PATCH] drm: nouveau: use match_string() helper to simplify the code
Date: Fri, 14 Sep 2018 22:58:16 +0800
Message-ID: <1536937096-31093-1-git-send-email-zhongjiang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie
Cc: seanpaul@chromium.org, daniel.vetter@ffwll.ch, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

match_string() returns the index of an array for a matching string,
which can be used intead of open coded implementation.

Signed-off-by: zhong jiang <zhongjiang@huawei.com>
---
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
index 6a4ca13..053d794 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
@@ -641,17 +641,13 @@ static int nv17_tv_create_resources(struct drm_encoder *encoder,
 	struct dcb_output *dcb = nouveau_encoder(encoder)->dcb;
 	int num_tv_norms = dcb->tvconf.has_component_output ? NUM_TV_NORMS :
 							NUM_LD_TV_NORMS;
-	int i;
+	int index;
 
 	if (nouveau_tv_norm) {
-		for (i = 0; i < num_tv_norms; i++) {
-			if (!strcmp(nv17_tv_norm_names[i], nouveau_tv_norm)) {
-				tv_enc->tv_norm = i;
-				break;
-			}
-		}
-
-		if (i == num_tv_norms)
+		index = match_string(nv17_tv_norm_names, num_tv_norms, nouveau_tv_norm);
+		if (index >= 0)
+			tv_enc->tv_norm = index;
+		else
 			NV_WARN(drm, "Invalid TV norm setting \"%s\"\n",
 				nouveau_tv_norm);
 	}
-- 
1.7.12.4
