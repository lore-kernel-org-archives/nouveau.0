From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: [PATCH] drm: serialize access to list of debugfs files
Date: Mon, 31 Oct 2011 18:33:57 +0100
Message-ID: <20111031173357.GA28581@joi.lan>
References: <20111030220401.GA3628@joi.lan>
	<20111031080656.GD2920@phenom.ffwll.local>
	<20111031170000.GA3415@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20111031170000.GA3415@joi.lan>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Nouveau, when configured with debugfs, creates debugfs files for every
channel, so structure holding list of files needs to be protected from
simultaneous changes by multiple threads.

Without this patch it's possible to hit kernel oops in
drm_debugfs_remove_files just by running a couple of xterms with
looped glxinfo.

Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
---
 drivers/gpu/drm/drm_debugfs.c       |   12 +++++++++---
 drivers/gpu/drm/i915/i915_debugfs.c |    5 ++++-
 include/drm/drmP.h                  |    4 +++-
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 9d2668a..d34d4fc 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -120,7 +120,10 @@ int drm_debugfs_create_files(struct drm_info_list *files, int count,
 		tmp->minor = minor;
 		tmp->dent = ent;
 		tmp->info_ent = &files[i];
-		list_add(&(tmp->list), &(minor->debugfs_nodes.list));
+
+		mutex_lock(&minor->debugfs_lock);
+		list_add(&tmp->list, &minor->debugfs_list);
+		mutex_unlock(&minor->debugfs_lock);
 	}
 	return 0;
 
@@ -148,7 +151,8 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 	char name[64];
 	int ret;
 
-	INIT_LIST_HEAD(&minor->debugfs_nodes.list);
+	INIT_LIST_HEAD(&minor->debugfs_list);
+	mutex_init(&minor->debugfs_lock);
 	sprintf(name, "%d", minor_id);
 	minor->debugfs_root = debugfs_create_dir(name, root);
 	if (!minor->debugfs_root) {
@@ -194,8 +198,9 @@ int drm_debugfs_remove_files(struct drm_info_list *files, int count,
 	struct drm_info_node *tmp;
 	int i;
 
+	mutex_lock(&minor->debugfs_lock);
 	for (i = 0; i < count; i++) {
-		list_for_each_safe(pos, q, &minor->debugfs_nodes.list) {
+		list_for_each_safe(pos, q, &minor->debugfs_list) {
 			tmp = list_entry(pos, struct drm_info_node, list);
 			if (tmp->info_ent == &files[i]) {
 				debugfs_remove(tmp->dent);
@@ -204,6 +209,7 @@ int drm_debugfs_remove_files(struct drm_info_list *files, int count,
 			}
 		}
 	}
+	mutex_unlock(&minor->debugfs_lock);
 	return 0;
 }
 EXPORT_SYMBOL(drm_debugfs_remove_files);
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 3c395a5..fdad293 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -1505,7 +1505,10 @@ drm_add_fake_info_node(struct drm_minor *minor,
 	node->minor = minor;
 	node->dent = ent;
 	node->info_ent = (void *) key;
-	list_add(&node->list, &minor->debugfs_nodes.list);
+
+	mutex_lock(&minor->debugfs_lock);
+	list_add(&node->list, &minor->debugfs_list);
+	mutex_unlock(&minor->debugfs_lock);
 
 	return 0;
 }
diff --git a/include/drm/drmP.h b/include/drm/drmP.h
index 9b7c2bb..40e9ea3 100644
--- a/include/drm/drmP.h
+++ b/include/drm/drmP.h
@@ -989,7 +989,9 @@ struct drm_minor {
 	struct proc_dir_entry *proc_root;  /**< proc directory entry */
 	struct drm_info_node proc_nodes;
 	struct dentry *debugfs_root;
-	struct drm_info_node debugfs_nodes;
+
+	struct list_head debugfs_list;
+	struct mutex debugfs_lock; /* Protects debugfs_list. */
 
 	struct drm_master *master; /* currently active master for this node */
 	struct list_head master_list;
-- 
1.7.7
