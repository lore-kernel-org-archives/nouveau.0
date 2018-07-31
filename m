From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH] drm/nouveau: Fix potential memory access error in nouveau_debugfs_pstate_get()
Date: Mon, 30 Jul 2018 21:03:47 -0400
Message-ID: <20180731010347.21921-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Karol Herbst <karolherbst@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

nouveau_debugfs(drm) will never be NULL, because we're taking the value
of the potentially null device pointer and adding to it so it isn't 0x0.
So, check if drm is NULL instead.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Karol Herbst <karolherbst@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 963a4dba8213..d83313c02913 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -50,13 +50,14 @@ static int
 nouveau_debugfs_pstate_get(struct seq_file *m, void *data)
 {
 	struct drm_device *drm = m->private;
-	struct nouveau_debugfs *debugfs = nouveau_debugfs(drm);
+	struct nouveau_debugfs *debugfs;
 	struct nvif_object *ctrl = &debugfs->ctrl;
 	struct nvif_control_pstate_info_v0 info = {};
 	int ret, i;
 
-	if (!debugfs)
+	if (!drm)
 		return -ENODEV;
+	debugfs = nouveau_debugfs(drm);
 
 	ret = nvif_mthd(ctrl, NVIF_CONTROL_PSTATE_INFO, &info, sizeof(info));
 	if (ret)
-- 
2.17.1
