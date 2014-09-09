From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] accel_common: use scanout variable over
	checking the usage_hint every time
Date: Tue,  9 Sep 2014 15:47:32 +0100
Message-ID: <1410274052-17794-2-git-send-email-emil.l.velikov@gmail.com>
References: <1410274052-17794-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1410274052-17794-1-git-send-email-emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/nv_accel_common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/nv_accel_common.c b/src/nv_accel_common.c
index eebb0ab..a2557e0 100644
--- a/src/nv_accel_common.c
+++ b/src/nv_accel_common.c
@@ -91,7 +91,7 @@ nouveau_allocate_surface(ScrnInfoPtr scrn, int width, int height, int bpp,
 
 			if (usage_hint & NOUVEAU_CREATE_PIXMAP_ZETA)
 				cfg.nv50.memtype = (bpp == 16) ? 0x16c : 0x128;
-			else if (usage_hint & NOUVEAU_CREATE_PIXMAP_SCANOUT)
+			else if (scanout)
 				cfg.nv50.memtype = (bpp == 16) ? 0x070 : 0x07a;
 			else
 				cfg.nv50.memtype = 0x070;
@@ -117,7 +117,7 @@ nouveau_allocate_surface(ScrnInfoPtr scrn, int width, int height, int bpp,
 			cfg.nv04.surf_flags |= NV04_BO_ZETA;
 	}
 
-	if (usage_hint & NOUVEAU_CREATE_PIXMAP_SCANOUT)
+	if (scanout)
 		flags |= NOUVEAU_BO_CONTIG;
 
 	ret = nouveau_bo_new(pNv->dev, flags, 0, *pitch * height, &cfg, bo);
-- 
2.1.0
