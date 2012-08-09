From: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
Subject: [PATCH] drm/nouveau/nv50: Reclock when memory was stolen
Date: Fri, 10 Aug 2012 00:03:07 +0200
Message-ID: <1344549787-4922-2-git-send-email-r.spliet@student.tudelft.nl>
References: <1344549787-4922-1-git-send-email-r.spliet@student.tudelft.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1344549787-4922-1-git-send-email-r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c |  2 +-
 drivers/gpu/drm/nouveau/nv50_pm.c             |  3 ++-
 drivers/gpu/drm/nouveau/nva3_pm.c             | 11 ++++++++---
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c b/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c
index eaf18fb..0c43d74 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c
@@ -235,7 +235,7 @@ nv50_fb_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 		ret = nouveau_mm_init(&priv->base.vram, rsvd_head, size, 1);
 		if (ret)
 			return ret;
-
+		priv->base.ram.type = NV_MEM_TYPE_STOLEN;
 		priv->base.ram.stolen = (u64)nv_rd32(priv, 0x100e10) << 12;
 		break;
 	default:
diff --git a/drivers/gpu/drm/nouveau/nv50_pm.c b/drivers/gpu/drm/nouveau/nv50_pm.c
index 0036c8c..3a41829 100644
--- a/drivers/gpu/drm/nouveau/nv50_pm.c
+++ b/drivers/gpu/drm/nouveau/nv50_pm.c
@@ -608,6 +608,7 @@ nv50_pm_clocks_pre(struct drm_device *dev, struct nouveau_pm_level *perflvl)
 {
 	struct nouveau_device *device = nouveau_dev(dev);
 	struct nouveau_drm *drm = nouveau_drm(dev);
+	struct nouveau_fb *pfb = nouveau_fb(device);
 	struct nv50_pm_state *info;
 	struct hwsq_ucode *hwsq;
 	struct nvbios_pll pll;
@@ -627,7 +628,7 @@ nv50_pm_clocks_pre(struct drm_device *dev, struct nouveau_pm_level *perflvl)
 	/* memory: build hwsq ucode which we'll use to reclock memory.
 	 *         use pcie refclock if possible, otherwise use mpll */
 	info->mclk_hwsq.len = 0;
-	if (perflvl->memory) {
+	if (perflvl->memory && pfb->ram.type > NV_MEM_TYPE_STOLEN) {
 		ret = calc_mclk(dev, perflvl, info);
 		if (ret)
 			goto error;
diff --git a/drivers/gpu/drm/nouveau/nva3_pm.c b/drivers/gpu/drm/nouveau/nva3_pm.c
index 3f69e46..8906e98c 100644
--- a/drivers/gpu/drm/nouveau/nva3_pm.c
+++ b/drivers/gpu/drm/nouveau/nva3_pm.c
@@ -274,9 +274,12 @@ void *
 nva3_pm_clocks_pre(struct drm_device *dev, struct nouveau_pm_level *perflvl)
 {
 	struct nva3_pm_state *info;
+	struct nouveau_device *device = nouveau_dev(dev);
+	struct nouveau_fb *pfb = nouveau_fb(device);
 	u8 ramcfg_cnt;
 	int ret;
 
+
 	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return ERR_PTR(-ENOMEM);
@@ -289,9 +292,11 @@ nva3_pm_clocks_pre(struct drm_device *dev, struct nouveau_pm_level *perflvl)
 	if (ret < 0)
 		goto out;
 
-	ret = calc_clk(dev, 0x12, 0x4000, perflvl->memory, &info->mclk);
-	if (ret < 0)
-		goto out;
+	if(pfb->ram.type > NV_MEM_TYPE_STOLEN) {
+		ret = calc_clk(dev, 0x12, 0x4000, perflvl->memory, &info->mclk);
+		if (ret < 0)
+			goto out;
+	}
 
 	ret = calc_clk(dev, 0x20, 0x0000, perflvl->unka0, &info->unka0);
 	if (ret < 0)
-- 
1.7.11.2
