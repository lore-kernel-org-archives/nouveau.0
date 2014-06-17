From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH] drm/nouveau: fix oops in display destructor with
 headless cards
Date: Tue, 17 Jun 2014 15:01:48 +0200
Message-ID: <53A03C3C.5070606@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

If init doesn't run then disp->outp might not be initialized, resulting in an oops.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/base.c b/drivers/gpu/drm/nouveau/core/engine/disp/base.c
index c41f656abe64..9c38c5e40500 100644
--- a/drivers/gpu/drm/nouveau/core/engine/disp/base.c
+++ b/drivers/gpu/drm/nouveau/core/engine/disp/base.c
@@ -99,8 +99,10 @@ _nouveau_disp_dtor(struct nouveau_object *object)
 
 	nouveau_event_destroy(&disp->vblank);
 
-	list_for_each_entry_safe(outp, outt, &disp->outp, head) {
-		nouveau_object_ref(NULL, (struct nouveau_object **)&outp);
+	if (disp->outp.next) {
+		list_for_each_entry_safe(outp, outt, &disp->outp, head) {
+			nouveau_object_ref(NULL, (struct nouveau_object **)&outp);
+		}
 	}
 
 	nouveau_engine_destroy(&disp->base);
