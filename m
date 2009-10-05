From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 1/3] drm/nouveau: Ignore DCB I2C indices for
	on-chip TV-out.
Date: Mon,  5 Oct 2009 04:37:04 +0200
Message-ID: <1254710226-26139-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

The nv31m in bug 23212 claims its TV-out and LVDS are in the same
connector. Ignore it completely as it's otherwise useless.

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bios.c |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index 195ecb3..01ef97e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -5259,6 +5259,17 @@ fixup_legacy_connector(struct nvbios *bios)
 		if (dcb->entry[i].i2c_index == 0xf)
 			continue;
 
+		/*
+		 * Ignore the I2C index for on-chip TV-out, as there
+		 * are cards with bogus values (nv31m in bug 23212),
+		 * and it's otherwise useless.
+		 */
+		if (dcb->entry[i].type == OUTPUT_TV &&
+		    dcb->entry[i].location == DCB_LOC_ON_CHIP) {
+			dcb->entry[i].i2c_index = 0xf;
+			continue;
+		}
+
 		dcb->entry[i].connector = dcb->entry[i].i2c_index;
 		if (dcb->entry[i].connector > high)
 			high = dcb->entry[i].connector;
-- 
1.6.3.3
