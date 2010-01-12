From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [libdrm PATCH 1/4] nouveau: add nouveau_resource_destroy
Date: Tue, 12 Jan 2010 15:31:28 +0100
Message-ID: <20100112143128.GA2984@joi.lan>
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
Subject: [libdrm PATCH] nouveau: add nouveau_resource_destroy

---
 nouveau/nouveau_resource.c |    9 +++++++++
 nouveau/nouveau_resource.h |    3 +++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/nouveau/nouveau_resource.c b/nouveau/nouveau_resource.c
index 6bef756..7acaf7d 100644
--- a/nouveau/nouveau_resource.c
+++ b/nouveau/nouveau_resource.c
@@ -41,6 +41,15 @@ nouveau_resource_init(struct nouveau_resource **heap,
 	return 0;
 }
 
+void
+nouveau_resource_destroy(struct nouveau_resource **heap)
+{
+	if (!*heap)
+		return;
+	free(*heap);
+	*heap = NULL;
+}
+
 int
 nouveau_resource_alloc(struct nouveau_resource *heap, unsigned size, void *priv,
 		       struct nouveau_resource **res)
diff --git a/nouveau/nouveau_resource.h b/nouveau/nouveau_resource.h
index 988d246..b760dfb 100644
--- a/nouveau/nouveau_resource.h
+++ b/nouveau/nouveau_resource.h
@@ -38,6 +38,9 @@ int
 nouveau_resource_init(struct nouveau_resource **heap, unsigned start,
 		      unsigned size);
 
+void
+nouveau_resource_destroy(struct nouveau_resource **heap);
+
 int
 nouveau_resource_alloc(struct nouveau_resource *heap, unsigned size, void *priv,
 		       struct nouveau_resource **);
-- 
1.6.6.rc3
