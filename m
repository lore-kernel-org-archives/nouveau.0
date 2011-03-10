From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: fix oops on unload with disabled
	LVDS panel
Date: Thu, 10 Mar 2011 22:43:25 +0100
Message-ID: <20110310214325.GA18211@joi.lan>
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
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Fixes: https://bugs.freedesktop.org/show_bug.cgi?id=35135
BUG: unable to handle kernel NULL pointer dereference at 000002d8
IP: [<f83694af>] nv04_dfp_restore+0x7f/0xd0 [nouveau]
(...)
Call Trace:
 [<f8372208>] nv04_display_destroy+0xa8/0x140 [nouveau]
 [<f830344a>] nouveau_unload+0x2a/0x160 [nouveau]
 [<f80d98fb>] drm_put_dev+0xbb/0x1b0 [drm]
 [<f8301025>] nouveau_pci_remove+0x15/0x20 [nouveau]
 [<c1292ad4>] pci_device_remove+0x44/0xf0
 [<c13339d1>] __device_release_driver+0x51/0xb0
 [<c133401f>] driver_detach+0x8f/0xa0
 [<c13338a3>] bus_remove_driver+0x63/0xa0
 [<c13340a9>] driver_unregister+0x49/0x80
 [<c1182f84>] ? sysfs_remove_file+0x14/0x20
 [<c1292bb2>] pci_unregister_driver+0x32/0x90
 [<c109b1da>] ? __stop_machine+0x5a/0x70
 [<f80d3f93>] drm_exit+0x83/0x90 [drm]
 [<f837875d>] nouveau_exit+0x1b/0x8be [nouveau]
 [<c1087b5b>] sys_delete_module+0x13b/0x1f0
 [<c1104c3e>] ? do_munmap+0x1fe/0x280
 [<c1104780>] ? arch_unmap_area_topdown+0x0/0x20
 [<c15096f4>] syscall_call+0x7/0xb

Reported-by: Francesco Marella <francesco.marella-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Tested-by: Francesco Marella <francesco.marella-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv04_dfp.c |   20 +++++++++++++++-----
 1 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv04_dfp.c b/drivers/gpu/drm/nouveau/nv04_dfp.c
index c82db37..b985ab3 100644
--- a/drivers/gpu/drm/nouveau/nv04_dfp.c
+++ b/drivers/gpu/drm/nouveau/nv04_dfp.c
@@ -579,15 +579,24 @@ static void nv04_dfp_restore(struct drm_encoder *encoder)
 	struct drm_device *dev = encoder->dev;
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	int head = nv_encoder->restore.head;
+	struct nouveau_connector *connector;
+	struct drm_display_mode *native_mode;
 
 	if (nv_encoder->dcb->type == OUTPUT_LVDS) {
-		struct drm_display_mode *native_mode = nouveau_encoder_connector_get(nv_encoder)->native_mode;
-		if (native_mode)
-			call_lvds_script(dev, nv_encoder->dcb, head, LVDS_PANEL_ON,
-					 native_mode->clock);
-		else
+		connector = nouveau_encoder_connector_get(nv_encoder);
+		if (!connector) {
+			NV_ERROR(dev, "No connector for LVDS encoder. Skipping restore.\n");
+			goto out;
+		}
+
+		native_mode = connector->native_mode;
+		if (!native_mode) {
 			NV_ERROR(dev, "Not restoring LVDS without native mode\n");
+			goto out;
+		}
 
+		call_lvds_script(dev, nv_encoder->dcb, head, LVDS_PANEL_ON,
+					native_mode->clock);
 	} else if (nv_encoder->dcb->type == OUTPUT_TMDS) {
 		int clock = nouveau_hw_pllvals_to_clk
 					(&dev_priv->saved_reg.crtc_reg[head].pllvals);
@@ -595,6 +604,7 @@ static void nv04_dfp_restore(struct drm_encoder *encoder)
 		run_tmds_table(dev, nv_encoder->dcb, head, clock);
 	}
 
+out:
 	nv_encoder->last_dpms = NV_DPMS_CLEARED;
 }
 
-- 
1.7.4.rc3
