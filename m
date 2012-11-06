From: Daniel J Blueman <daniel@quora.org>
Subject: [PATCH] nouveau: Fix crash after D3
Date: Tue,  6 Nov 2012 22:03:40 +0800
Message-ID: <1352210620-4200-1-git-send-email-daniel@quora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>
Cc: Marcin Slusarz <marcin.slusarz@gmail.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, Daniel J Blueman <daniel@quora.org>
List-Id: nouveau.vger.kernel.org

In 3.7-rc4, when starting X with the integrated GPU and suspending the discrete GPU,
after one or more 32-bit applications are used (eg Skype) and X is stopped,
we hit a panic.

Prevent this by testing if the fini function is valid.

Full panic bootlog is at: http://quora.org/2012/nouveau/dmesg-crash.txt
Xorg.log is at: http://quora.org/2012/nouveau/Xorg.0.log-crash.txt
Kernel log after fix is at: http://quora.org/2012/nouveau/dmesg-fix.txt

Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
 drivers/gpu/drm/nouveau/core/core/object.c |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/core/object.c b/drivers/gpu/drm/nouveau/core/core/object.c
index 0daab62..3da3525 100644
--- a/drivers/gpu/drm/nouveau/core/core/object.c
+++ b/drivers/gpu/drm/nouveau/core/core/object.c
@@ -354,12 +354,16 @@ static int
 nouveau_object_decf(struct nouveau_object *object)
 {
 	int ret;
+	struct nouveau_ofuncs *pfuncs;
 
 	nv_trace(object, "stopping...\n");
 
-	ret = nv_ofuncs(object)->fini(object, false);
-	if (ret)
-		nv_warn(object, "failed fini, %d\n", ret);
+	pfuncs = nv_ofuncs(object);
+	if (pfuncs->fini) {
+		ret = nv_ofuncs(object)->fini(object, false);
+		if (ret)
+			nv_warn(object, "failed fini, %d\n", ret);
+	}
 
 	if (object->engine) {
 		mutex_lock(&nv_subdev(object->engine)->mutex);
-- 
1.7.10.4
