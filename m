From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH 2/2] nv30/nv40: allocate a bigger block for queries
Date: Mon, 18 Jan 2010 01:18:04 +0100
Message-ID: <1263773884-21961-2-git-send-email-luca@luca-barbieri.com>
References: <1263773884-21961-1-git-send-email-luca@luca-barbieri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1263773884-21961-1-git-send-email-luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
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
Cc: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This patch allocates a bigger chunk of memory to store queries in,
increasing the (hidden) outstanding query limit from 32 to 125.

It also tries to make use of a 16KB notifier block if the kernel
supports that.

The blob supports 1024 queries due to their 16KB query block and
16-byte rather than 32-byte sized queries.
---
 src/gallium/drivers/nv30/nv30_screen.c |   13 +++++++++----
 src/gallium/drivers/nv40/nv40_screen.c |   13 ++++++++++---
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/src/gallium/drivers/nv30/nv30_screen.c b/src/gallium/drivers/nv30/nv30_screen.c
index 2cd5d12..0f26d39 100644
--- a/src/gallium/drivers/nv30/nv30_screen.c
+++ b/src/gallium/drivers/nv30/nv30_screen.c
@@ -238,22 +238,27 @@ nv30_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	}
 
 	/* Query objects */
-	ret = nouveau_notifier_alloc(chan, 0xbeef0302, 32, &screen->query);
+	unsigned query_sizes[] = {(16384 - 3 * 32) / 32, 15 * 1024 / 32, (4096 - 32 * 3) / 32, 3 * 1024 / 32, 2 * 1024 / 32, 1024 / 32};
+	for(i = 0; i < sizeof(query_sizes) / sizeof(query_sizes[0]); ++i)
+	{
+		ret = nouveau_notifier_alloc(chan, 0xbeef0302, query_sizes[i], &screen->query);
+		if(!ret)
+			break;
+	}
+
 	if (ret) {
 		NOUVEAU_ERR("Error initialising query objects: %d\n", ret);
 		nv30_screen_destroy(pscreen);
 		return NULL;
 	}
 
-	ret = nouveau_resource_init(&screen->query_heap, 0, 32);
+	nouveau_resource_init(&screen->query_heap, 0, query_sizes[i]);
 	if (ret) {
 		NOUVEAU_ERR("Error initialising query object heap: %d\n", ret);
 		nv30_screen_destroy(pscreen);
 		return NULL;
 	}
 
-	LIST_INITHEAD(&screen->query_list);
-
 	/* Vtxprog resources */
 	if (nouveau_resource_init(&screen->vp_exec_heap, 0, 256) ||
 	    nouveau_resource_init(&screen->vp_data_heap, 0, 256)) {
diff --git a/src/gallium/drivers/nv40/nv40_screen.c b/src/gallium/drivers/nv40/nv40_screen.c
index a8c14f9..4264d18 100644
--- a/src/gallium/drivers/nv40/nv40_screen.c
+++ b/src/gallium/drivers/nv40/nv40_screen.c
@@ -161,7 +161,7 @@ nv40_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	struct pipe_screen *pscreen;
 	struct nouveau_stateobj *so;
 	unsigned curie_class = 0;
-	int ret;
+	int ret, i;
 
 	if (!screen)
 		return NULL;
@@ -223,14 +223,21 @@ nv40_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	}
 
 	/* Query objects */
-	ret = nouveau_notifier_alloc(chan, 0xbeef0302, 32, &screen->query);
+	unsigned query_sizes[] = {(16384 - 3 * 32) / 32, 15 * 1024 / 32, (4096 - 32 * 3) / 32, 3 * 1024 / 32, 2 * 1024 / 32, 1024 / 32};
+	for(i = 0; i < sizeof(query_sizes) / sizeof(query_sizes[0]); ++i)
+	{
+		ret = nouveau_notifier_alloc(chan, 0xbeef0302, query_sizes[i], &screen->query);
+		if(!ret)
+			break;
+	}
+
 	if (ret) {
 		NOUVEAU_ERR("Error initialising query objects: %d\n", ret);
 		nv40_screen_destroy(pscreen);
 		return NULL;
 	}
 
-	nouveau_resource_init(&screen->query_heap, 0, 32);
+	nouveau_resource_init(&screen->query_heap, 0, query_sizes[i]);
 	if (ret) {
 		NOUVEAU_ERR("Error initialising query object heap: %d\n", ret);
 		nv40_screen_destroy(pscreen);
-- 
1.6.3.3
