From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: [PATCH] drm/nvd0/disp: mask off high 16 bit of negative
	cursor x-coordinate
Date: Thu, 26 Jul 2012 20:53:19 +0200
Message-ID: <1343328799-9372-1-git-send-email-e0425955@student.tuwien.ac.at>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

---
 drivers/gpu/drm/nouveau/nvd0_display.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvd0_display.c b/drivers/gpu/drm/nouveau/nvd0_display.c
index c486d3c..c50b075 100644
--- a/drivers/gpu/drm/nouveau/nvd0_display.c
+++ b/drivers/gpu/drm/nouveau/nvd0_display.c
@@ -790,7 +790,7 @@ nvd0_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 	int ch = EVO_CURS(nv_crtc->index);
 
-	evo_piow(crtc->dev, ch, 0x0084, (y << 16) | x);
+	evo_piow(crtc->dev, ch, 0x0084, (y << 16) | (x & 0xffff));
 	evo_piow(crtc->dev, ch, 0x0080, 0x00000000);
 	return 0;
 }
-- 
1.7.3.4
