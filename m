From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] accel_common: do not initialise the flags
	twice
Date: Tue,  9 Sep 2014 15:47:31 +0100
Message-ID: <1410274052-17794-1-git-send-email-emil.l.velikov@gmail.com>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/nv_accel_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/nv_accel_common.c b/src/nv_accel_common.c
index 4484c1c..eebb0ab 100644
--- a/src/nv_accel_common.c
+++ b/src/nv_accel_common.c
@@ -37,7 +37,7 @@ nouveau_allocate_surface(ScrnInfoPtr scrn, int width, int height, int bpp,
 	Bool tiled = (usage_hint & NOUVEAU_CREATE_PIXMAP_TILED);
 	Bool shared = FALSE;
 	union nouveau_bo_config cfg = {};
-	int flags = NOUVEAU_BO_MAP | (bpp >= 8 ? NOUVEAU_BO_VRAM : 0);
+	int flags;
 	int cpp = bpp / 8, ret;
 
 #ifdef NOUVEAU_PIXMAP_SHARING
-- 
2.1.0
