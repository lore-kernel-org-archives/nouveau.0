From: Wambui Karuga <wambui.karugax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 11/17] drm/nouveau: make
 nouveau_drm_debugfs_init() return 0
Date: Tue, 10 Mar 2020 16:31:15 +0300
Message-ID: <20200310133121.27913-12-wambui.karugax@gmail.com>
References: <20200310133121.27913-1-wambui.karugax@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200310133121.27913-1-wambui.karugax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Since 987d65d01356 (drm: debugfs: make
drm_debugfs_create_files() never fail), there is no need to ever check
for the the return value of debugfs_create_file() and
drm_debugfs_create_files(). Therefore, remove unnecessary checks and
error handling in nouveau_drm_debugfs_init() and have the function
return 0 directly.

v2: have nouveau_drm_debugfs_init() return 0 instead of void so as not
to introduce any build warnings to enable individual patch compilation.

References: https://lists.freedesktop.org/archives/dri-devel/2020-February/257183.html
Signed-off-by: Wambui Karuga <wambui.karugax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 7dfbbbc1beea..15a3d40edf02 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -222,22 +222,18 @@ nouveau_drm_debugfs_init(struct drm_minor *minor)
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
-- 
2.25.1
