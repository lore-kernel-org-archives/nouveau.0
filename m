From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nv50: fix query assertion
Date: Sun, 13 Feb 2011 20:46:43 +0100
Message-ID: <1297626403-3349-4-git-send-email-marcin.slusarz@gmail.com>
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
 src/gallium/drivers/nv50/nv50_query.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_query.c b/src/gallium/drivers/nv50/nv50_query.c
index 53f9482..f3418df 100644
--- a/src/gallium/drivers/nv50/nv50_query.c
+++ b/src/gallium/drivers/nv50/nv50_query.c
@@ -45,7 +45,7 @@ nv50_query_create(struct pipe_context *pipe, unsigned type)
 	struct nv50_query *q = CALLOC_STRUCT(nv50_query);
 	int ret;
 
-	assert (q->type == PIPE_QUERY_OCCLUSION_COUNTER);
+	assert (type == PIPE_QUERY_OCCLUSION_COUNTER);
 	q->type = type;
 
 	ret = nouveau_bo_new(dev, NOUVEAU_BO_GART | NOUVEAU_BO_MAP, 256,
-- 
1.7.4.rc3
