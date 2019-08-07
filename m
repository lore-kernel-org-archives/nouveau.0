From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v2 1/2] drm/nouveau/dispnv04: Remove runtime PM
Date: Wed,  7 Aug 2019 19:47:05 -0400
Message-ID: <20190807234709.6076-2-lyude@redhat.com>
References: <20190807234709.6076-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807234709.6076-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Originally when trying to fix the issue of runtime PM references with
non-blocking CRTCs on nv50, I ended up stumbling on this code when
trying to remove nouveau_drm->have_disp_power_ref, and attempted to fix
it to remove the dependency on have_disp_power_ref. However, Ilia Mirkin
pointed out that this code is actually completely useless, as pre-nv50
never had runtime PM support in the first place! Go figure.

So, since it's useless just get rid of it. Note that since the only
thing nouveau_crtc_set_config() was doing was grabbing a runtime PM ref,
calling drm_crtc_helper_set_config() then dropping the ref; we can just
remove the function entirely and just call drm_crtc_helper_set_config()
directly.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c | 51 +------------------------
 1 file changed, 1 insertion(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index f22f01020625..050eb5b7dd13 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -22,8 +22,6 @@
  * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  * DEALINGS IN THE SOFTWARE.
  */
-#include <linux/pm_runtime.h>
-
 #include <drm/drmP.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_plane_helper.h>
@@ -1031,53 +1029,6 @@ nv04_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
 	return 0;
 }
 
-static int
-nouveau_crtc_set_config(struct drm_mode_set *set,
-			struct drm_modeset_acquire_ctx *ctx)
-{
-	struct drm_device *dev;
-	struct nouveau_drm *drm;
-	int ret;
-	struct drm_crtc *crtc;
-	bool active = false;
-	if (!set || !set->crtc)
-		return -EINVAL;
-
-	dev = set->crtc->dev;
-
-	/* get a pm reference here */
-	ret = pm_runtime_get_sync(dev->dev);
-	if (ret < 0 && ret != -EACCES)
-		return ret;
-
-	ret = drm_crtc_helper_set_config(set, ctx);
-
-	drm = nouveau_drm(dev);
-
-	/* if we get here with no crtcs active then we can drop a reference */
-	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
-		if (crtc->enabled)
-			active = true;
-	}
-
-	pm_runtime_mark_last_busy(dev->dev);
-	/* if we have active crtcs and we don't have a power ref,
-	   take the current one */
-	if (active && !drm->have_disp_power_ref) {
-		drm->have_disp_power_ref = true;
-		return ret;
-	}
-	/* if we have no active crtcs, then drop the power ref
-	   we got before */
-	if (!active && drm->have_disp_power_ref) {
-		pm_runtime_put_autosuspend(dev->dev);
-		drm->have_disp_power_ref = false;
-	}
-	/* drop the power reference we got coming in here */
-	pm_runtime_put_autosuspend(dev->dev);
-	return ret;
-}
-
 struct nv04_page_flip_state {
 	struct list_head head;
 	struct drm_pending_vblank_event *event;
@@ -1293,7 +1244,7 @@ static const struct drm_crtc_funcs nv04_crtc_funcs = {
 	.cursor_set = nv04_crtc_cursor_set,
 	.cursor_move = nv04_crtc_cursor_move,
 	.gamma_set = nv_crtc_gamma_set,
-	.set_config = nouveau_crtc_set_config,
+	.set_config = drm_crtc_helper_set_config,
 	.page_flip = nv04_crtc_page_flip,
 	.destroy = nv_crtc_destroy,
 };
-- 
2.21.0
