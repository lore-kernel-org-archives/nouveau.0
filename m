From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 3/3] drm/nouveau: Add a module parameter to set
	the default TV norm.
Date: Sat, 22 Aug 2009 02:11:28 +0200
Message-ID: <1250899888-7945-3-git-send-email-currojerez@riseup.net>
References: <1250899888-7945-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250899888-7945-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drv.c |    4 ++++
 drivers/gpu/drm/nouveau/nouveau_drv.h |    1 +
 drivers/gpu/drm/nouveau/nv17_tv.c     |   20 +++++++++++++++++---
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.c b/drivers/gpu/drm/nouveau/nouveau_drv.c
index 7d2a032..a39a70b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.c
@@ -57,6 +57,10 @@ MODULE_PARM_DESC(uscript_tmds, "TMDS output script table ID (>=GeForce 8)");
 int nouveau_uscript_tmds = -1;
 module_param_named(uscript_tmds, nouveau_uscript_tmds, int, 0400);
 
+MODULE_PARM_DESC(tv_norm, "Default TV norm");
+char *nouveau_tv_norm = NULL;
+module_param_named(tv_norm, nouveau_tv_norm, charp, 0400);
+
 int nouveau_fbpercrtc = 0;
 #if 0
 module_param_named(fbpercrtc, nouveau_fbpercrtc, int, 0400);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 73c80de..2fa379a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -621,6 +621,7 @@ extern int nouveau_uscript_lvds;
 extern int nouveau_uscript_tmds;
 extern int nouveau_vram_pushbuf;
 extern int nouveau_fbpercrtc;
+extern char *nouveau_tv_norm;
 
 /* nouveau_state.c */
 extern void nouveau_preclose(struct drm_device *dev, struct drm_file *);
diff --git a/drivers/gpu/drm/nouveau/nv17_tv.c b/drivers/gpu/drm/nouveau/nv17_tv.c
index 9d8e678..631a4cf 100644
--- a/drivers/gpu/drm/nouveau/nv17_tv.c
+++ b/drivers/gpu/drm/nouveau/nv17_tv.c
@@ -479,10 +479,24 @@ static int nv17_tv_create_resources(struct drm_encoder *encoder,
 	struct drm_mode_config *conf = &dev->mode_config;
 	struct nv17_tv_encoder *tv_enc = to_tv_enc(encoder);
 	struct dcb_entry *dcb = nouveau_encoder(encoder)->dcb;
+	int num_tv_norms = dcb->tvconf.has_component_output? NUM_TV_NORMS
+		: NUM_LD_TV_NORMS;
+	int i;
+
+	if (nouveau_tv_norm) {
+		for (i = 0; i < num_tv_norms; i++) {
+			if (!strcmp(nv17_tv_norm_names[i], nouveau_tv_norm)) {
+				tv_enc->tv_norm = i;
+				break;
+			}
+		}
+
+		if (i == num_tv_norms)
+			NV_WARN(dev, "Invalid TV norm setting \"%s\"\n",
+				nouveau_tv_norm);
+	}
 
-	drm_mode_create_tv_properties(dev,
-				      dcb->tvconf.has_component_output? NUM_TV_NORMS
-				      : NUM_LD_TV_NORMS, nv17_tv_norm_names);
+	drm_mode_create_tv_properties(dev, num_tv_norms, nv17_tv_norm_names);
 
 	drm_connector_attach_property(connector, conf->tv_select_subconnector_property,
 				      tv_enc->select_subconnector);
-- 
1.6.3.3
