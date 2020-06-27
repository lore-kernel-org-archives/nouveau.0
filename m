From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [RFC v8 5/9] drm/nouveau/kms/nv50-: Fix disabling
 dithering
Date: Sat, 27 Jun 2020 15:46:53 -0400
Message-ID: <20200627194657.156514-6-lyude@redhat.com>
References: <20200627194657.156514-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200627194657.156514-1-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
List-Id: nouveau.vger.kernel.org

While we expose the ability to turn off hardware dithering for nouveau,
we actually make the mistake of turning it on anyway, due to
dithering_depth containing a non-zero value if our dithering depth isn't
also set to 6 bpc.

So, fix it by never enabling dithering when it's disabled.

Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/dispnv50/head.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index 8f6455697ba72..ed6819519f6d8 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
@@ -84,18 +84,20 @@ nv50_head_atomic_check_dither(struct nv50_head_atom *armh,
 {
 	u32 mode = 0x00;
 
-	if (asyc->dither.mode == DITHERING_MODE_AUTO) {
-		if (asyh->base.depth > asyh->or.bpc * 3)
-			mode = DITHERING_MODE_DYNAMIC2X2;
-	} else {
-		mode = asyc->dither.mode;
-	}
+	if (asyc->dither.mode) {
+		if (asyc->dither.mode == DITHERING_MODE_AUTO) {
+			if (asyh->base.depth > asyh->or.bpc * 3)
+				mode = DITHERING_MODE_DYNAMIC2X2;
+		} else {
+			mode = asyc->dither.mode;
+		}
 
-	if (asyc->dither.depth == DITHERING_DEPTH_AUTO) {
-		if (asyh->or.bpc >= 8)
-			mode |= DITHERING_DEPTH_8BPC;
-	} else {
-		mode |= asyc->dither.depth;
+		if (asyc->dither.depth == DITHERING_DEPTH_AUTO) {
+			if (asyh->or.bpc >= 8)
+				mode |= DITHERING_DEPTH_8BPC;
+		} else {
+			mode |= asyc->dither.depth;
+		}
 	}
 
 	asyh->dither.enable = mode;
-- 
2.26.2
