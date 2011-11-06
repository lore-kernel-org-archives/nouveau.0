From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] add missing return in nv50_accel_init failure path
Date: Sun,  6 Nov 2011 20:32:08 +0100
Message-ID: <1320607930-21794-6-git-send-email-marcin.slusarz@gmail.com>
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
 src/nv50_accel.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/src/nv50_accel.c b/src/nv50_accel.c
index d6c7528..ca06d8a 100644
--- a/src/nv50_accel.c
+++ b/src/nv50_accel.c
@@ -102,6 +102,7 @@ NVAccelInitNV50TCL(ScrnInfoPtr pScrn)
 					   &pNv->vblank_sem)) {
 			nouveau_grobj_free(&pNv->NvSW);
 			nouveau_grobj_free(&pNv->Nv3D);
+			return FALSE;
 		}
 
 		if (nouveau_bo_new(pNv->dev, NOUVEAU_BO_VRAM, 0, 65536,
-- 
1.7.7
