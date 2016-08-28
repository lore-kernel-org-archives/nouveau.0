From: Baoyou Xie <baoyou.xie@linaro.org>
Subject: [PATCH] fix:nouveau_display: mark symbols static where possible
Date: Sun, 28 Aug 2016 15:28:46 +0800
Message-ID: <1472369326-19561-1-git-send-email-baoyou.xie@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, arnd@linaro.org, baoyou.xie@linaro.org, xie.baoyou@zte.com.cn
List-Id: nouveau.vger.kernel.org

We get 1 warning about global functions without a declaration
in the nouveau nouveau_display driver when building with W=1:
drivers/gpu/drm/nouveau/nouveau_display.c:96:1: warning: no previous prototype for 'nouveau_display_scanoutpos_head' [-Wmissing-prototypes]

In fact, this function is only used in the file in which it is declared
and don't need a declaration, but can be made static.
so this patch marks it 'static'.

Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index afbf557..b60ee21 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -92,7 +92,7 @@ calc(int blanks, int blanke, int total, int line)
 	return line;
 }
 
-int
+static int
 nouveau_display_scanoutpos_head(struct drm_crtc *crtc, int *vpos, int *hpos,
 				ktime_t *stime, ktime_t *etime)
 {
-- 
2.7.4
