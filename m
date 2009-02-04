From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH] nouveau: fix type warnings: void* arith, un/signed
Date: Wed, 4 Feb 2009 21:57:01 +0200
Message-ID: <20090204215701.7f8a6a37@daedalus.pq.iki.fi>
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
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

From fc2ca956a76db0939dc75e7909f78001973e7d64 Mon Sep 17 00:00:00 2001
From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Date: Wed, 4 Feb 2009 21:44:50 +0200
Subject: [PATCH] nouveau: fix type warnings: void* arith, un/signed

nouveau_notifier.c had two places where void* was used in arithmetic,
fixed by using char*.

nouveau_dma_wait(), nouveau_notifier_wait_status() and
nouveau_resource_alloc() had signed/unsigned comparison warnings, fixed
by changing the function parameter into an unsigned type.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---

Shall I push?
I can't push during the European day, so feel free to apply if you are in
a hurry.

 libdrm/nouveau/nouveau_dma.c      |    2 +-
 libdrm/nouveau/nouveau_dma.h      |    2 +-
 libdrm/nouveau/nouveau_notifier.c |    6 +++---
 libdrm/nouveau/nouveau_notifier.h |    2 +-
 libdrm/nouveau/nouveau_resource.c |    2 +-
 libdrm/nouveau/nouveau_resource.h |    2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/libdrm/nouveau/nouveau_dma.c b/libdrm/nouveau/nouveau_dma.c
index 2cf7d2b..c906799 100644
--- a/libdrm/nouveau/nouveau_dma.c
+++ b/libdrm/nouveau/nouveau_dma.c
@@ -87,7 +87,7 @@ nouveau_dma_channel_init(struct nouveau_channel *chan)
 } while(0)
 
 int
-nouveau_dma_wait(struct nouveau_channel *chan, int size)
+nouveau_dma_wait(struct nouveau_channel *chan, unsigned size)
 {
 	struct nouveau_channel_priv *nvchan = nouveau_channel(chan);
 	struct nouveau_dma_priv *dma = nvchan->dma;
diff --git a/libdrm/nouveau/nouveau_dma.h b/libdrm/nouveau/nouveau_dma.h
index 89b341e..38fe1d6 100644
--- a/libdrm/nouveau/nouveau_dma.h
+++ b/libdrm/nouveau/nouveau_dma.h
@@ -40,7 +40,7 @@
 #define NOUVEAU_TIME_MSEC() 0
 #define RING_SKIPS 8
 
-extern int  nouveau_dma_wait(struct nouveau_channel *chan, int size);
+extern int  nouveau_dma_wait(struct nouveau_channel *chan, unsigned size);
 extern void nouveau_dma_subc_bind(struct nouveau_grobj *);
 extern void nouveau_dma_channel_init(struct nouveau_channel *);
 extern void nouveau_dma_kickoff(struct nouveau_channel *);
diff --git a/libdrm/nouveau/nouveau_notifier.c b/libdrm/nouveau/nouveau_notifier.c
index ccfcc53..8f1d535 100644
--- a/libdrm/nouveau/nouveau_notifier.c
+++ b/libdrm/nouveau/nouveau_notifier.c
@@ -28,7 +28,7 @@
 
 #define NOTIFIER(__v)                                                          \
 	struct nouveau_notifier_priv *nvnotify = nouveau_notifier(notifier);   \
-	volatile uint32_t *__v = (void*)nvnotify->map + (id * 32)
+	volatile uint32_t *__v = (uint32_t *)((char *)nvnotify->map + (id * 32))
 
 int
 nouveau_notifier_alloc(struct nouveau_channel *chan, uint32_t handle,
@@ -57,7 +57,7 @@ nouveau_notifier_alloc(struct nouveau_channel *chan, uint32_t handle,
 		return ret;
 	}
 
-	nvnotify->map = (void *)nouveau_channel(chan)->notifier_block +
+	nvnotify->map = (char *)nouveau_channel(chan)->notifier_block +
 				nvnotify->drm.offset;
 	*notifier = &nvnotify->base;
 	return 0;
@@ -125,7 +125,7 @@ gettime(void)
 
 int
 nouveau_notifier_wait_status(struct nouveau_notifier *notifier, int id,
-			     int status, double timeout)
+			     uint32_t status, double timeout)
 {
 	NOTIFIER(n);
 	double time = 0, t_start = gettime();
diff --git a/libdrm/nouveau/nouveau_notifier.h b/libdrm/nouveau/nouveau_notifier.h
index b461142..dbc6a3b 100644
--- a/libdrm/nouveau/nouveau_notifier.h
+++ b/libdrm/nouveau/nouveau_notifier.h
@@ -57,7 +57,7 @@ uint32_t
 nouveau_notifier_return_val(struct nouveau_notifier *, int id);
 
 int
-nouveau_notifier_wait_status(struct nouveau_notifier *, int id, int status,
+nouveau_notifier_wait_status(struct nouveau_notifier *, int id, uint32_t status,
 			     double timeout);
 
 #endif
diff --git a/libdrm/nouveau/nouveau_resource.c b/libdrm/nouveau/nouveau_resource.c
index 1cd37d5..6bef756 100644
--- a/libdrm/nouveau/nouveau_resource.c
+++ b/libdrm/nouveau/nouveau_resource.c
@@ -42,7 +42,7 @@ nouveau_resource_init(struct nouveau_resource **heap,
 }
 
 int
-nouveau_resource_alloc(struct nouveau_resource *heap, int size, void *priv,
+nouveau_resource_alloc(struct nouveau_resource *heap, unsigned size, void *priv,
 		       struct nouveau_resource **res)
 {
 	struct nouveau_resource *r;
diff --git a/libdrm/nouveau/nouveau_resource.h b/libdrm/nouveau/nouveau_resource.h
index 4b373e5..988d246 100644
--- a/libdrm/nouveau/nouveau_resource.h
+++ b/libdrm/nouveau/nouveau_resource.h
@@ -39,7 +39,7 @@ nouveau_resource_init(struct nouveau_resource **heap, unsigned start,
 		      unsigned size);
 
 int
-nouveau_resource_alloc(struct nouveau_resource *heap, int size, void *priv,
+nouveau_resource_alloc(struct nouveau_resource *heap, unsigned size, void *priv,
 		       struct nouveau_resource **);
 
 void
-- 
1.6.0.6
