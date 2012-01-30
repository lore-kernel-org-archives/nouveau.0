From: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
Subject: [PATCH] drm/nouveau/pm: Fix kernel oops when setting
	perflvl at boot-time
Date: Mon, 30 Jan 2012 10:56:06 +0100
Message-ID: <1327917366-2311-1-git-send-email-r.spliet@student.tudelft.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

CRTC needs to be initialised before nouveau_pm_trigger() is called, otherwise a NULLptr deref occurs

Signed-off-by: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_pm.c    |    3 +++
 drivers/gpu/drm/nouveau/nouveau_state.c |    4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_pm.c b/drivers/gpu/drm/nouveau/nouveau_pm.c
index 2418eea..ac7df10 100644
--- a/drivers/gpu/drm/nouveau/nouveau_pm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_pm.c
@@ -169,6 +169,9 @@ error:
 	return ret;
 }
 
+/**
+ * @pre CRTCs must be initialised
+ */
 void
 nouveau_pm_trigger(struct drm_device *dev)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index cdaf981..54e83a7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -632,8 +632,6 @@ nouveau_card_init(struct drm_device *dev)
 	if (ret)
 		goto out_ttmvram;
 
-	nouveau_pm_init(dev);
-
 	if (!dev_priv->noaccel) {
 		switch (dev_priv->card_type) {
 		case NV_04:
@@ -737,6 +735,8 @@ nouveau_card_init(struct drm_device *dev)
 	if (ret)
 		goto out_irq;
 
+	nouveau_pm_init(dev);
+
 	nouveau_backlight_init(dev);
 
 	if (dev_priv->eng[NVOBJ_ENGINE_GR]) {
-- 
1.7.7.6
