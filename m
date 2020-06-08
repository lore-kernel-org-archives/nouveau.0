From: Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>
Subject: [PATCH v5 08/13] drm/nouveau: Change debug checks to
 specifically target syslog
Date: Mon,  8 Jun 2020 17:04:58 -0400
Message-ID: <20200608210505.48519-9-sean@poorly.run>
References: <20200608210505.48519-1-sean@poorly.run>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200608210505.48519-1-sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ppaalanen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Since the logs protected by these checks specifically target syslog,
use the new drm_debug_syslog_enabled() call to avoid triggering
these prints when only trace is enabled.

Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Changes in v5:
-Added to the set
---
 drivers/gpu/drm/nouveau/dispnv50/disp.h | 4 ++--
 drivers/gpu/drm/nouveau/nouveau_drv.h   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/drm/nouveau/dispnv50/disp.h
index 696e70a6b98b..d60602db2cf0 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
@@ -85,14 +85,14 @@ extern const u64 wndwc57e_modifiers[];
 
 #define evo_mthd(p, m, s) do {						\
 	const u32 _m = (m), _s = (s);					\
-	if (drm_debug_enabled(DRM_UT_KMS))				\
+	if (drm_debug_syslog_enabled(DRM_UT_KMS))				\
 		pr_err("%04x %d %s\n", _m, _s, __func__);		\
 	*((p)++) = ((_s << 18) | _m);					\
 } while(0)
 
 #define evo_data(p, d) do {						\
 	const u32 _d = (d);						\
-	if (drm_debug_enabled(DRM_UT_KMS))				\
+	if (drm_debug_syslog_enabled(DRM_UT_KMS))				\
 		pr_err("\t%08x\n", _d);					\
 	*((p)++) = _d;							\
 } while(0)
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 2a6519737800..b916d1f456cd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -257,11 +257,11 @@ void nouveau_drm_device_remove(struct drm_device *dev);
 #define NV_INFO(drm,f,a...) NV_PRINTK(info, &(drm)->client, f, ##a)
 
 #define NV_DEBUG(drm,f,a...) do {                                              \
-	if (drm_debug_enabled(DRM_UT_DRIVER))                                  \
+	if (drm_debug_syslog_enabled(DRM_UT_DRIVER))                                  \
 		NV_PRINTK(info, &(drm)->client, f, ##a);                       \
 } while(0)
 #define NV_ATOMIC(drm,f,a...) do {                                             \
-	if (drm_debug_enabled(DRM_UT_ATOMIC))                                  \
+	if (drm_debug_syslog_enabled(DRM_UT_ATOMIC))                                  \
 		NV_PRINTK(info, &(drm)->client, f, ##a);                       \
 } while(0)
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS
