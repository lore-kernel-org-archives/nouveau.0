From: Wambui Karuga <wambui.karugax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 09/21] drm/nouveau: remove checks for return value
 of debugfs functions
Date: Thu, 27 Feb 2020 15:02:20 +0300
Message-ID: <20200227120232.19413-10-wambui.karugax@gmail.com>
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200227120232.19413-1-wambui.karugax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: daniel-/w4YWyX8dFk@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Since 987d65d01356 (drm: debugfs: make
drm_debugfs_create_files() never fail), there is no need to ever check
for the the return value of debugfs_create_file() and
drm_debugfs_create_files(). Therefore, remove unnecessary checks and
error handling in nouveau_drm_debugfs_init.

These changes also enable nouveau_drm_debugfs_init() to be declared
as void.

Signed-off-by: Wambui Karuga <wambui.karugax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 26 +++++++++--------------
 drivers/gpu/drm/nouveau/nouveau_debugfs.h |  5 ++---
 2 files changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 7dfbbbc1beea..63cb5e432f8a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -217,39 +217,33 @@ static const struct nouveau_debugfs_files {
 	{"pstate", &nouveau_pstate_fops},
 };
 
-int
+void
 nouveau_drm_debugfs_init(struct drm_minor *minor)
 {
 	struct nouveau_drm *drm = nouveau_drm(minor->dev);
 	struct dentry *dentry;
-	int i, ret;
+	int i;
 
 	for (i = 0; i < ARRAY_SIZE(nouveau_debugfs_files); i++) {
-		dentry = debugfs_create_file(nouveau_debugfs_files[i].name,
-					     S_IRUGO | S_IWUSR,
-					     minor->debugfs_root, minor->dev,
-					     nouveau_debugfs_files[i].fops);
-		if (!dentry)
-			return -ENOMEM;
+		debugfs_create_file(nouveau_debugfs_files[i].name,
+				    S_IRUGO | S_IWUSR,
+				    minor->debugfs_root, minor->dev,
+				    nouveau_debugfs_files[i].fops);
 	}
 
-	ret = drm_debugfs_create_files(nouveau_debugfs_list,
-				       NOUVEAU_DEBUGFS_ENTRIES,
-				       minor->debugfs_root, minor);
-	if (ret)
-		return ret;
+	drm_debugfs_create_files(nouveau_debugfs_list,
+				 NOUVEAU_DEBUGFS_ENTRIES,
+				 minor->debugfs_root, minor);
 
 	/* Set the size of the vbios since we know it, and it's confusing to
 	 * userspace if it wants to seek() but the file has a length of 0
 	 */
 	dentry = debugfs_lookup("vbios.rom", minor->debugfs_root);
 	if (!dentry)
-		return 0;
+		return;
 
 	d_inode(dentry)->i_size = drm->vbios.length;
 	dput(dentry);
-
-	return 0;
 }
 
 int
diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.h b/drivers/gpu/drm/nouveau/nouveau_debugfs.h
index 8909c010e8ea..ccb842d9da87 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.h
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.h
@@ -18,14 +18,13 @@ nouveau_debugfs(struct drm_device *dev)
 	return nouveau_drm(dev)->debugfs;
 }
 
-extern int  nouveau_drm_debugfs_init(struct drm_minor *);
+extern void nouveau_drm_debugfs_init(struct drm_minor *);
 extern int  nouveau_debugfs_init(struct nouveau_drm *);
 extern void nouveau_debugfs_fini(struct nouveau_drm *);
 #else
-static inline int
+static inline void
 nouveau_drm_debugfs_init(struct drm_minor *minor)
 {
-       return 0;
 }
 
 static inline int
-- 
2.25.0
