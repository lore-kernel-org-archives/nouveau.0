From: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 08/10] drm: debugfs: remove debug directores using
	recursion.
Date: Sun,  9 Oct 2011 22:58:38 +0200
Message-ID: <1318193920-27461-9-git-send-email-maximlevitsky@gmail.com>
References: <1318193920-27461-1-git-send-email-maximlevitsky@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1318193920-27461-1-git-send-email-maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Well, I implemented a custom debugfs file for nouveau,
but found it hard to remove it cleanly due to constrains on drm debugfs api.
I implemented a hack and then surprised that other drivers (intel and radeon) have exactly same ugly hack.
So why? Just one liner does the job.
This patch shouldn't break other driver, and with it, some code (the hacks) can be removed from them now.

Signed-off-by: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/drm_debugfs.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 9d2668a..4a859a9 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -228,7 +228,7 @@ int drm_debugfs_cleanup(struct drm_minor *minor)
 
 	drm_debugfs_remove_files(drm_debugfs_list, DRM_DEBUGFS_ENTRIES, minor);
 
-	debugfs_remove(minor->debugfs_root);
+	debugfs_remove_recursive(minor->debugfs_root);
 	minor->debugfs_root = NULL;
 
 	return 0;
-- 
1.7.4.1
