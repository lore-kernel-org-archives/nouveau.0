From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 2/7] drm/nouveau: fix backlight mask on ppc
	powerbook
Date: Thu,  5 Sep 2013 04:45:01 -0400
Message-ID: <1378370706-18599-2-git-send-email-imirkin@alum.mit.edu>
References: <1378370706-18599-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1378370706-18599-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This code was originally moved to using nv_mask by d31e078d84. This
should not have any actual effect since the mask isn't applied to the
value.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

Not even compile-tested, but the change should be fairly self-evident.

 drivers/gpu/drm/nouveau/dispnv04/dfp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/dfp.c b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
index 93dd23ff..caf464d 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/dfp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
@@ -493,7 +493,7 @@ static void nv04_dfp_update_backlight(struct drm_encoder *encoder, int mode)
 	if (dev->pci_device == 0x0174 || dev->pci_device == 0x0179 ||
 	    dev->pci_device == 0x0189 || dev->pci_device == 0x0329) {
 		if (mode == DRM_MODE_DPMS_ON) {
-			nv_mask(device, NV_PBUS_DEBUG_DUALHEAD_CTL, 0, 1 << 31);
+			nv_mask(device, NV_PBUS_DEBUG_DUALHEAD_CTL, 1 << 31, 1 << 31);
 			nv_mask(device, NV_PCRTC_GPIO_EXT, 3, 1);
 		} else {
 			nv_mask(device, NV_PBUS_DEBUG_DUALHEAD_CTL, 1 << 31, 0);
-- 
1.8.1.5
