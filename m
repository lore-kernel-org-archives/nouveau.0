From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: make cursor_set implementation
 consistent with other drivers
Date: Sun, 1 May 2011 23:49:04 +0200
Message-ID: <20110501214904.GA6742@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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

When xorg state tracker wants to hide the cursor it calls set_cursor
with NULL buffer_handle and size=0x0, but nouveau refuses to hide it
because size is not 64x64... which is a bit odd. Both radeon and intel
check buffer_handle before validating size of cursor, so make nouveau
implementation consistent with them.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv04_crtc.c |    6 +++---
 drivers/gpu/drm/nouveau/nv50_crtc.c |    6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv04_crtc.c b/drivers/gpu/drm/nouveau/nv04_crtc.c
index cc3cd17..3c78bc8 100644
--- a/drivers/gpu/drm/nouveau/nv04_crtc.c
+++ b/drivers/gpu/drm/nouveau/nv04_crtc.c
@@ -943,14 +943,14 @@ nv04_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 	struct drm_gem_object *gem;
 	int ret = 0;
 
-	if (width != 64 || height != 64)
-		return -EINVAL;
-
 	if (!buffer_handle) {
 		nv_crtc->cursor.hide(nv_crtc, true);
 		return 0;
 	}
 
+	if (width != 64 || height != 64)
+		return -EINVAL;
+
 	gem = drm_gem_object_lookup(dev, file_priv, buffer_handle);
 	if (!gem)
 		return -ENOENT;
diff --git a/drivers/gpu/drm/nouveau/nv50_crtc.c b/drivers/gpu/drm/nouveau/nv50_crtc.c
index e900a51..75ad2dc 100644
--- a/drivers/gpu/drm/nouveau/nv50_crtc.c
+++ b/drivers/gpu/drm/nouveau/nv50_crtc.c
@@ -349,14 +349,14 @@ nv50_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 	struct drm_gem_object *gem;
 	int ret = 0, i;
 
-	if (width != 64 || height != 64)
-		return -EINVAL;
-
 	if (!buffer_handle) {
 		nv_crtc->cursor.hide(nv_crtc, true);
 		return 0;
 	}
 
+	if (width != 64 || height != 64)
+		return -EINVAL;
+
 	gem = drm_gem_object_lookup(dev, file_priv, buffer_handle);
 	if (!gem)
 		return -ENOENT;
-- 
1.7.4.1
