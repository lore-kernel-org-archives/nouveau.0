From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCHv2 3/6] drm/nouveau: Don't initialize two CRTCs on
	single head cards.
Date: Mon, 17 Aug 2009 17:24:20 +0200
Message-ID: <1250522663-18672-3-git-send-email-currojerez@riseup.net>
References: <1250522663-18672-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250522663-18672-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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
 drivers/gpu/drm/nouveau/nv04_display.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv04_display.c b/drivers/gpu/drm/nouveau/nv04_display.c
index ed16e8d..b20ab01 100644
--- a/drivers/gpu/drm/nouveau/nv04_display.c
+++ b/drivers/gpu/drm/nouveau/nv04_display.c
@@ -125,8 +125,9 @@ nv04_display_create(struct drm_device *dev)
 
 	dev->mode_config.fb_base = dev_priv->fb_phys;
 
-	for (i = 0; i < 2; i++)
-		nv04_crtc_create(dev, i);
+	nv04_crtc_create(dev, 0);
+	if (nv_two_heads(dev))
+		nv04_crtc_create(dev, 1);
 
 	for (i = 0; i < dcb->entries; i++) {
 		struct dcb_entry *dcbent = &dcb->entry[i];
-- 
1.6.3.3
