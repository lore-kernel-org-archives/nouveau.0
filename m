From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 09/23] drm: Remove struct
 drm_driver.get_scanout_position()
Date: Fri, 10 Jan 2020 10:21:13 +0100
Message-ID: <20200110092127.27847-10-tzimmermann@suse.de>
References: <20200110092127.27847-1-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200110092127.27847-1-tzimmermann-l3A5Bk7waGM@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, alexander.deucher-5C7GfCeVMHo@public.gmane.org, christian.koenig-5C7GfCeVMHo@public.gmane.org, David1.Zhou-5C7GfCeVMHo@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, patrik.r.jakobsson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, vincent.abriou-qxv4g6HH51o@public.gmane.org, yannick.fertre-qxv4g6HH51o@public.gmane.org, philippe.cornu-qxv4g6HH51o@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, rodrigosiqueiramelo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hamohammed.sa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-graphics-maintainer-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org, thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, harry.wentland-5C7GfCeVMHo@public.gmane.org, sunpeng.li-5C7GfCeVMHo@public.gmane.org, jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

All users of struct drm_driver.get_scanout_position() have been
covnerted to the respective CRTC helper function. Remove the callback
from struct drm_driver.

Signed-off-by: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
---
 drivers/gpu/drm/drm_vblank.c | 13 ++-------
 include/drm/drm_drv.h        | 52 ------------------------------------
 2 files changed, 2 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index c12f0b333e14..b84065911d69 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -633,8 +633,7 @@ bool drm_calc_vbltimestamp_from_scanoutpos(struct drm_device *dev,
 	}
 
 	/* Scanout position query not supported? Should not happen. */
-	if (!dev->driver->get_scanout_position ||
-	    !crtc->helper_private->get_scanout_position) {
+	if (!crtc->helper_private->get_scanout_position) {
 		DRM_ERROR("Called from CRTC w/o get_scanout_position()!?\n");
 		return false;
 	}
@@ -666,17 +665,9 @@ bool drm_calc_vbltimestamp_from_scanoutpos(struct drm_device *dev,
 		 * Get vertical and horizontal scanout position vpos, hpos,
 		 * and bounding timestamps stime, etime, pre/post query.
 		 */
-		if (crtc->helper_private->get_scanout_position) {
-			vbl_status =
-				crtc->helper_private->get_scanout_position(
+		vbl_status = crtc->helper_private->get_scanout_position(
 					crtc, in_vblank_irq, &vpos, &hpos,
 					&stime, &etime, mode);
-		} else {
-			vbl_status =
-				dev->driver->get_scanout_position(
-					dev, pipe, in_vblank_irq, &vpos,
-					&hpos, &stime, &etime, mode);
-		}
 
 		/* Return as no-op if scanout query unsupported or failed. */
 		if (!vbl_status) {
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index d0049e5786fc..b704e252f3b2 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -318,58 +318,6 @@ struct drm_driver {
 	 */
 	void (*disable_vblank) (struct drm_device *dev, unsigned int pipe);
 
-	/**
-	 * @get_scanout_position:
-	 *
-	 * Called by vblank timestamping code.
-	 *
-	 * Returns the current display scanout position from a crtc, and an
-	 * optional accurate ktime_get() timestamp of when position was
-	 * measured. Note that this is a helper callback which is only used if a
-	 * driver uses drm_calc_vbltimestamp_from_scanoutpos() for the
-	 * @get_vblank_timestamp callback.
-	 *
-	 * Parameters:
-	 *
-	 * dev:
-	 *     DRM device.
-	 * pipe:
-	 *     Id of the crtc to query.
-	 * in_vblank_irq:
-	 *     True when called from drm_crtc_handle_vblank().  Some drivers
-	 *     need to apply some workarounds for gpu-specific vblank irq quirks
-	 *     if flag is set.
-	 * vpos:
-	 *     Target location for current vertical scanout position.
-	 * hpos:
-	 *     Target location for current horizontal scanout position.
-	 * stime:
-	 *     Target location for timestamp taken immediately before
-	 *     scanout position query. Can be NULL to skip timestamp.
-	 * etime:
-	 *     Target location for timestamp taken immediately after
-	 *     scanout position query. Can be NULL to skip timestamp.
-	 * mode:
-	 *     Current display timings.
-	 *
-	 * Returns vpos as a positive number while in active scanout area.
-	 * Returns vpos as a negative number inside vblank, counting the number
-	 * of scanlines to go until end of vblank, e.g., -1 means "one scanline
-	 * until start of active scanout / end of vblank."
-	 *
-	 * Returns:
-	 *
-	 * True on success, false if a reliable scanout position counter could
-	 * not be read out.
-	 *
-	 * This is deprecated and should not be used by new drivers.
-	 * Use &drm_crtc_helper_funcs.get_scanout_position instead.
-	 */
-	bool (*get_scanout_position) (struct drm_device *dev, unsigned int pipe,
-				      bool in_vblank_irq, int *vpos, int *hpos,
-				      ktime_t *stime, ktime_t *etime,
-				      const struct drm_display_mode *mode);
-
 	/**
 	 * @get_vblank_timestamp:
 	 *
-- 
2.24.1
