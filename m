From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 1/2] drm/nouveau: Add strap_peek to debugfs
Date: Wed, 19 Sep 2018 13:13:51 -0400
Message-ID: <20180919171353.29648-2-lyude@redhat.com>
References: <20180919171353.29648-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180919171353.29648-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Since we already expose the vbios.rom file here, why not also expose the
strap_peek?

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 9109b69cd052..7379c20584a2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -46,6 +46,26 @@ nouveau_debugfs_vbios_image(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int
+nouveau_debugfs_strap_peek(struct seq_file *m, void *data)
+{
+	struct drm_info_node *node = m->private;
+	struct nouveau_drm *drm = nouveau_drm(node->minor->dev);
+	int ret;
+
+	ret = pm_runtime_get_sync(drm->dev->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
+
+	seq_printf(m, "0x%08x\n",
+		   nvif_rd32(&drm->client.device.object, 0x101000));
+
+	pm_runtime_mark_last_busy(drm->dev->dev);
+	pm_runtime_put_autosuspend(drm->dev->dev);
+
+	return 0;
+}
+
 static int
 nouveau_debugfs_pstate_get(struct seq_file *m, void *data)
 {
@@ -185,7 +205,8 @@ static const struct file_operations nouveau_pstate_fops = {
 };
 
 static struct drm_info_list nouveau_debugfs_list[] = {
-	{ "vbios.rom", nouveau_debugfs_vbios_image, 0, NULL },
+	{ "vbios.rom",  nouveau_debugfs_vbios_image, 0, NULL },
+	{ "strap_peek", nouveau_debugfs_strap_peek, 0, NULL },
 };
 #define NOUVEAU_DEBUGFS_ENTRIES ARRAY_SIZE(nouveau_debugfs_list)
 
-- 
2.17.1
