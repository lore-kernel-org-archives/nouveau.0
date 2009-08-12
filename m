From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 03/12] drm/nouveau: Fix a lock up at NVSetOwner
	with nv11.
Date: Wed, 12 Aug 2009 02:14:59 +0200
Message-ID: <1250036108-28655-4-git-send-email-currojerez@riseup.net>
References: <1250036108-28655-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250036108-28655-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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

It seems it was only locking up in the context of
nouveau_hw_save_vga_fonts, when it actually did something (because
the console wasn't already in graphics mode).

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_hw.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_hw.c b/drivers/gpu/drm/nouveau/nouveau_hw.c
index 6f55f55..d270d6f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_hw.c
+++ b/drivers/gpu/drm/nouveau/nouveau_hw.c
@@ -87,8 +87,17 @@ NVSetOwner(struct drm_device *dev, int owner)
 	if (owner == 1)
 		owner *= 3;
 
+	if (dev_priv->chipset == 0x11) {
+		/* This might seem stupid, but the blob does it and
+		 * omitting it often locks the system up.
+		 */
+		NVReadVgaCrtc(dev, 0, NV_CIO_SR_LOCK_INDEX);
+		NVReadVgaCrtc(dev, 1, NV_CIO_SR_LOCK_INDEX);
+	}
+
 	/* CR44 is always changed on CRTC0 */
 	NVWriteVgaCrtc(dev, 0, NV_CIO_CRE_44, owner);
+
 	if (dev_priv->chipset == 0x11) {	/* set me harder */
 		NVWriteVgaCrtc(dev, 0, NV_CIO_CRE_2E, owner);
 		NVWriteVgaCrtc(dev, 0, NV_CIO_CRE_2E, owner);
-- 
1.6.3.3
