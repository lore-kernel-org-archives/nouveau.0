From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 02/23] drm/amdgpu: Convert to struct
 drm_crtc_helper_funcs.get_scanout_position()
Date: Fri, 10 Jan 2020 10:21:06 +0100
Message-ID: <20200110092127.27847-3-tzimmermann@suse.de>
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

The callback struct drm_driver.get_scanout_position() is deprecated in
favor of struct drm_crtc_helper_funcs.get_scanout_position(). Convert
amdgpu over.

Signed-off-by: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c       | 12 ++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c           | 11 -----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h          |  5 +++++
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c            |  1 +
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c            |  1 +
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c             |  1 +
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c             |  1 +
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c          |  1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 ++-
 9 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 4e699071d144..a1e769d4417d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -914,3 +914,15 @@ int amdgpu_display_crtc_idx_to_irq_type(struct amdgpu_device *adev, int crtc)
 		return AMDGPU_CRTC_IRQ_NONE;
 	}
 }
+
+bool amdgpu_crtc_get_scanout_position(struct drm_crtc *crtc,
+			bool in_vblank_irq, int *vpos,
+			int *hpos, ktime_t *stime, ktime_t *etime,
+			const struct drm_display_mode *mode)
+{
+	struct drm_device *dev = crtc->dev;
+	unsigned int pipe = crtc->index;
+
+	return amdgpu_display_get_crtc_scanoutpos(dev, pipe, 0, vpos, hpos,
+						  stime, etime, mode);
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 3f6f14ce1511..0749285dd1c7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1367,16 +1367,6 @@ int amdgpu_file_to_fpriv(struct file *filp, struct amdgpu_fpriv **fpriv)
 	return 0;
 }
 
-static bool
-amdgpu_get_crtc_scanout_position(struct drm_device *dev, unsigned int pipe,
-				 bool in_vblank_irq, int *vpos, int *hpos,
-				 ktime_t *stime, ktime_t *etime,
-				 const struct drm_display_mode *mode)
-{
-	return amdgpu_display_get_crtc_scanoutpos(dev, pipe, 0, vpos, hpos,
-						  stime, etime, mode);
-}
-
 static struct drm_driver kms_driver = {
 	.driver_features =
 	    DRIVER_USE_AGP | DRIVER_ATOMIC |
@@ -1391,7 +1381,6 @@ static struct drm_driver kms_driver = {
 	.enable_vblank = amdgpu_enable_vblank_kms,
 	.disable_vblank = amdgpu_disable_vblank_kms,
 	.get_vblank_timestamp = drm_calc_vbltimestamp_from_scanoutpos,
-	.get_scanout_position = amdgpu_get_crtc_scanout_position,
 	.irq_handler = amdgpu_irq_handler,
 	.ioctls = amdgpu_ioctls_kms,
 	.gem_free_object_unlocked = amdgpu_gem_object_free,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index eb9975f4decb..37ba07e2feb5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -612,6 +612,11 @@ void amdgpu_panel_mode_fixup(struct drm_encoder *encoder,
 			     struct drm_display_mode *adjusted_mode);
 int amdgpu_display_crtc_idx_to_irq_type(struct amdgpu_device *adev, int crtc);
 
+bool amdgpu_crtc_get_scanout_position(struct drm_crtc *crtc,
+			bool in_vblank_irq, int *vpos,
+			int *hpos, ktime_t *stime, ktime_t *etime,
+			const struct drm_display_mode *mode);
+
 /* fbdev layer */
 int amdgpu_fbdev_init(struct amdgpu_device *adev);
 void amdgpu_fbdev_fini(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index 40d2ac723dd6..bdc1e0f036d4 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -2685,6 +2685,7 @@ static const struct drm_crtc_helper_funcs dce_v10_0_crtc_helper_funcs = {
 	.prepare = dce_v10_0_crtc_prepare,
 	.commit = dce_v10_0_crtc_commit,
 	.disable = dce_v10_0_crtc_disable,
+	.get_scanout_position = amdgpu_crtc_get_scanout_position,
 };
 
 static int dce_v10_0_crtc_init(struct amdgpu_device *adev, int index)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index 898ef72d423c..0319da5f7bf9 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -2793,6 +2793,7 @@ static const struct drm_crtc_helper_funcs dce_v11_0_crtc_helper_funcs = {
 	.prepare = dce_v11_0_crtc_prepare,
 	.commit = dce_v11_0_crtc_commit,
 	.disable = dce_v11_0_crtc_disable,
+	.get_scanout_position = amdgpu_crtc_get_scanout_position,
 };
 
 static int dce_v11_0_crtc_init(struct amdgpu_device *adev, int index)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index db15a112becc..78642c3b14fc 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -2575,6 +2575,7 @@ static const struct drm_crtc_helper_funcs dce_v6_0_crtc_helper_funcs = {
 	.prepare = dce_v6_0_crtc_prepare,
 	.commit = dce_v6_0_crtc_commit,
 	.disable = dce_v6_0_crtc_disable,
+	.get_scanout_position = amdgpu_crtc_get_scanout_position,
 };
 
 static int dce_v6_0_crtc_init(struct amdgpu_device *adev, int index)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index f06c9022c1fd..1e8d4975435a 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -2593,6 +2593,7 @@ static const struct drm_crtc_helper_funcs dce_v8_0_crtc_helper_funcs = {
 	.prepare = dce_v8_0_crtc_prepare,
 	.commit = dce_v8_0_crtc_commit,
 	.disable = dce_v8_0_crtc_disable,
+	.get_scanout_position = amdgpu_crtc_get_scanout_position,
 };
 
 static int dce_v8_0_crtc_init(struct amdgpu_device *adev, int index)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
index e4f94863332c..4b2f915aba47 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
@@ -218,6 +218,7 @@ static const struct drm_crtc_helper_funcs dce_virtual_crtc_helper_funcs = {
 	.prepare = dce_virtual_crtc_prepare,
 	.commit = dce_virtual_crtc_commit,
 	.disable = dce_virtual_crtc_disable,
+	.get_scanout_position = amdgpu_crtc_get_scanout_position,
 };
 
 static int dce_virtual_crtc_init(struct amdgpu_device *adev, int index)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index f2db400a3920..39c5cf242c1b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4821,7 +4821,8 @@ static bool dm_crtc_helper_mode_fixup(struct drm_crtc *crtc,
 static const struct drm_crtc_helper_funcs amdgpu_dm_crtc_helper_funcs = {
 	.disable = dm_crtc_helper_disable,
 	.atomic_check = dm_crtc_helper_atomic_check,
-	.mode_fixup = dm_crtc_helper_mode_fixup
+	.mode_fixup = dm_crtc_helper_mode_fixup,
+	.get_scanout_position = amdgpu_crtc_get_scanout_position,
 };
 
 static void dm_encoder_helper_disable(struct drm_encoder *encoder)
-- 
2.24.1
