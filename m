From: Yisheng Xie <xieyisheng1@huawei.com>
Subject: [PATCH 21/33] drm/nouveau: use match_string() helper
Date: Mon, 21 May 2018 19:57:58 +0800
Message-ID: <1526903890-35761-22-git-send-email-xieyisheng1@huawei.com>
References: <1526903890-35761-1-git-send-email-xieyisheng1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526903890-35761-1-git-send-email-xieyisheng1@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Yisheng Xie <xieyisheng1@huawei.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

match_string() returns the index of an array for a matching string,
which can be used intead of open coded variant.

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Yisheng Xie <xieyisheng1@huawei.com>
---
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
index 6d99f11..a6b4c4a 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
@@ -644,14 +644,11 @@ static int nv17_tv_create_resources(struct drm_encoder *encoder,
 	int i;
 
 	if (nouveau_tv_norm) {
-		for (i = 0; i < num_tv_norms; i++) {
-			if (!strcmp(nv17_tv_norm_names[i], nouveau_tv_norm)) {
-				tv_enc->tv_norm = i;
-				break;
-			}
-		}
-
-		if (i == num_tv_norms)
+		i = match_string(nv17_tv_norm_names,
+				 num_tv_norms, nouveau_tv_norm);
+		if (i >= 0)
+			tv_enc->tv_norm = i;
+		else
 			NV_WARN(drm, "Invalid TV norm setting \"%s\"\n",
 				nouveau_tv_norm);
 	}
-- 
1.7.12.4
