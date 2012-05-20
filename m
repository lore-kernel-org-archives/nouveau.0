From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 11/14] drm/nv40/fb: Blend if statement within the
	switch
Date: Mon, 21 May 2012 00:15:00 +0100
Message-ID: <1337555703-18925-12-git-send-email-emil.l.velikov@gmail.com>
References: <1337555703-18925-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1337555703-18925-1-git-send-email-emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

No functional change, just bike-shedding

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv40_fb.c |   11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv40_fb.c b/drivers/gpu/drm/nouveau/nv40_fb.c
index 879678b..4f2d436 100644
--- a/drivers/gpu/drm/nouveau/nv40_fb.c
+++ b/drivers/gpu/drm/nouveau/nv40_fb.c
@@ -107,13 +107,6 @@ nv40_fb_init(struct nouveau_device *ndev, int subdev)
 	u32 tmp;
 	int i;
 
-	if (ndev->chipset != 0x40 && ndev->chipset != 0x45) {
-		if (nv44_graph_class(ndev))
-			nv44_fb_init_gart(ndev);
-		else
-			nv40_fb_init_gart(ndev);
-	}
-
 	switch (ndev->chipset) {
 	case 0x40:
 	case 0x45:
@@ -121,6 +114,10 @@ nv40_fb_init(struct nouveau_device *ndev, int subdev)
 		nv_wr32(ndev, NV10_PFB_CLOSE_PAGE2, tmp & ~(1 << 15));
 		break;
 	default:
+		if (nv44_graph_class(ndev))
+			nv44_fb_init_gart(ndev);
+		else
+			nv40_fb_init_gart(ndev);
 		break;
 	}
 
-- 
1.7.10.2
