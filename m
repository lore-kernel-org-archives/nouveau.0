From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [libdrm PATCH] nouveau: fix memory leak in
	nouveau_channel_free
Date: Tue, 12 Jan 2010 15:32:39 +0100
Message-ID: <20100112143239.GB2984@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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

From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [libdrm PATCH] nouveau: fix memory leak in nouveau_channel_free

---
 nouveau/nouveau_channel.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/nouveau/nouveau_channel.c b/nouveau/nouveau_channel.c
index 638aee3..14cf4c6 100644
--- a/nouveau/nouveau_channel.c
+++ b/nouveau/nouveau_channel.c
@@ -102,6 +102,7 @@ nouveau_channel_free(struct nouveau_channel **chan)
 	struct nouveau_channel_priv *nvchan;
 	struct nouveau_device_priv *nvdev;
 	struct drm_nouveau_channel_free cf;
+	int i;
 
 	if (!chan || !*chan)
 		return;
@@ -115,6 +116,9 @@ nouveau_channel_free(struct nouveau_channel **chan)
 	nouveau_bo_unmap(nvchan->notifier_bo);
 	nouveau_bo_ref(NULL, &nvchan->notifier_bo);
 
+	for (i = 0; i < nvchan->drm.nr_subchan; i++)
+		free(nvchan->base.subc[i].gr);
+
 	nouveau_grobj_free(&nvchan->base.vram);
 	nouveau_grobj_free(&nvchan->base.gart);
 	nouveau_grobj_free(&nvchan->base.nullobj);
-- 
1.6.6.rc3
