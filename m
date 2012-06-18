From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] nouveau/exa: unref bo if map failed
Date: Tue, 19 Jun 2012 00:28:59 +0200
Message-ID: <1340058540-12607-1-git-send-email-madman2003@gmail.com>
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

Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/nouveau_exa.c |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/src/nouveau_exa.c b/src/nouveau_exa.c
index 55dce99..c51a799 100644
--- a/src/nouveau_exa.c
+++ b/src/nouveau_exa.c
@@ -175,11 +175,15 @@ nouveau_exa_scratch(NVPtr pNv, int size, struct nouveau_bo **pbo, int *off)
 		ret = nouveau_bo_new(pNv->dev, NOUVEAU_BO_GART | NOUVEAU_BO_MAP,
 				     0, NOUVEAU_ALIGN(size, 1 * 1024 * 1024),
 				     NULL, &bo);
-		if (ret == 0)
-			ret = nouveau_bo_map(bo, NOUVEAU_BO_RDWR, pNv->client);
 		if (ret != 0)
 			return ret;
 
+		ret = nouveau_bo_map(bo, NOUVEAU_BO_RDWR, pNv->client);
+		if (ret != 0) {
+			nouveau_bo_ref(NULL, &bo);
+			return ret;
+		}
+
 		nouveau_bo_ref(bo, &pNv->transfer);
 		pNv->transfer_offset = 0;
 	}
-- 
1.7.8.6
