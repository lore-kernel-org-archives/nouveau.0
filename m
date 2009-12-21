From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nouveau: when nouveau_bo_map fails you except it
	to not be mapped
Date: Mon, 21 Dec 2009 16:51:54 +0100
Message-ID: <1261410714-18055-1-git-send-email-madman2003@gmail.com>
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

---
 nouveau/nouveau_bo.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/nouveau/nouveau_bo.c b/nouveau/nouveau_bo.c
index 10cc8a6..9d584a3 100644
--- a/nouveau/nouveau_bo.c
+++ b/nouveau/nouveau_bo.c
@@ -444,8 +444,10 @@ nouveau_bo_map_range(struct nouveau_bo *bo, uint32_t delta, uint32_t size,
 		if (!(flags & NOUVEAU_BO_NOSYNC)) {
 			ret = nouveau_bo_wait(bo, (flags & NOUVEAU_BO_WR),
 					      (flags & NOUVEAU_BO_NOWAIT), 0);
-			if (ret)
+			if (ret) {
+				nouveau_bo_unmap(bo);
 				return ret;
+			}
 		}
 
 		bo->map = (char *)nvbo->map + delta;
-- 
1.6.5.4
