From: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
Subject: Re-enable dithering after commit
	a7b9f9e5adef276c25584e28ce9e520045ff048b
Date: Wed, 16 Jun 2010 09:38:28 +0200
Message-ID: <4C187F74.4040402@ensi-bourges.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------090309010900090001090002"
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
To: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--------------090309010900090001090002
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi everyone,

After commit a7b9f9e5adef276c25584e28ce9e520045ff048b, dithering has 
disappeared on LVDS (for those who needed it).

ThibG on IRC has bisected this behaviour to 
a7b9f9e5adef276c25584e28ce9e520045ff048b. Here is a patch that 
re-enables it.

Please comment on it.

Martin

--------------090309010900090001090002
Content-Type: text/plain;
 name="re-enable_dithering_on_less_than_24bits_lvds_v2.path"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="re-enable_dithering_on_less_than_24bits_lvds_v2.path"

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index d865707..f8cfab0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -736,7 +736,8 @@ nouveau_connector_create(struct drm_device *dev,
 	struct nouveau_connector *nv_connector = NULL;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
-	int type;
+	bool dummy, if_is_24bit = false;
+	int ret, type;
 
 	NV_DEBUG_KMS(dev, "\n");
 
@@ -823,6 +824,20 @@ nouveau_connector_create(struct drm_device *dev,
 		drm_connector_attach_property(connector, dev->mode_config.dvi_i_subconnector_property, 0);
 		drm_connector_attach_property(connector, dev->mode_config.dvi_i_select_subconnector_property, 0);
 	}
+	
+	/* Parse the LVDS table to get if it has a 24-bit link depth.
+	* If it hasn't, make use dithering to smooth shadings.
+	*/
+	if (dcb->type == DCB_CONNECTOR_LVDS) {
+		ret = nouveau_bios_parse_lvds_table(dev, 0, &dummy, &if_is_24bit);
+		if (ret) {
+			NV_ERROR(dev, "Error parsing LVDS table, disabling LVDS\n");
+			drm_connector_cleanup(connector);
+			kfree(connector);
+			return 0;
+		}
+		nv_connector->use_dithering = !if_is_24bit;
+	}
 
 	switch (dcb->type) {
 	case DCB_CONNECTOR_VGA:

--------------090309010900090001090002
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------090309010900090001090002--
