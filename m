From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 2/2] drm/nouveau: Add size to vbios.rom file in debugfs
Date: Wed, 19 Sep 2018 13:13:52 -0400
Message-ID: <20180919171353.29648-3-lyude@redhat.com>
References: <20180919171353.29648-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180919171353.29648-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

With this, nvbios /sys/kernel/debug/dri/*/vbios.rom now works!

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 7379c20584a2..88a52f6b39fe 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -220,8 +220,9 @@ static const struct nouveau_debugfs_files {
 int
 nouveau_drm_debugfs_init(struct drm_minor *minor)
 {
+	struct nouveau_drm *drm = nouveau_drm(minor->dev);
 	struct dentry *dentry;
-	int i;
+	int i, ret;
 
 	for (i = 0; i < ARRAY_SIZE(nouveau_debugfs_files); i++) {
 		dentry = debugfs_create_file(nouveau_debugfs_files[i].name,
@@ -232,9 +233,23 @@ nouveau_drm_debugfs_init(struct drm_minor *minor)
 			return -ENOMEM;
 	}
 
-	return drm_debugfs_create_files(nouveau_debugfs_list,
-					NOUVEAU_DEBUGFS_ENTRIES,
-					minor->debugfs_root, minor);
+	ret = drm_debugfs_create_files(nouveau_debugfs_list,
+				       NOUVEAU_DEBUGFS_ENTRIES,
+				       minor->debugfs_root, minor);
+	if (ret)
+		return ret;
+
+	/* Set the size of the vbios since we know it, and it's confusing to
+	 * userspace if it wants to seek() but the file has a length of 0
+	 */
+	dentry = debugfs_lookup("vbios.rom", minor->debugfs_root);
+	if (!dentry)
+		return 0;
+
+	d_inode(dentry)->i_size = drm->vbios.length;
+	dput(dentry);
+
+	return 0;
 }
 
 int
-- 
2.17.1
