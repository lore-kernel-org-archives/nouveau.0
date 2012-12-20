From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: fix nouveau_client allocation
	failure path
Date: Thu, 20 Dec 2012 23:37:11 +0100
Message-ID: <1356043034-25739-4-git-send-email-marcin.slusarz@gmail.com>
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

Depending on the point of failure, freed object would be returned
or memory leak would happen.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/core/client.c         | 4 +---
 drivers/gpu/drm/nouveau/core/include/core/client.h | 3 +++
 drivers/gpu/drm/nouveau/nouveau_drm.c              | 7 ++++++-
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/core/client.c b/drivers/gpu/drm/nouveau/core/core/client.c
index 762e4fc..295c221 100644
--- a/drivers/gpu/drm/nouveau/core/core/client.c
+++ b/drivers/gpu/drm/nouveau/core/core/client.c
@@ -66,10 +66,8 @@ nouveau_client_create_(const char *name, u64 devname, const char *cfg,
 
 	ret = nouveau_handle_create(nv_object(client), ~0, ~0,
 				    nv_object(client), &client->root);
-	if (ret) {
-		nouveau_namedb_destroy(&client->base);
+	if (ret)
 		return ret;
-	}
 
 	/* prevent init/fini being called, os in in charge of this */
 	atomic_set(&nv_object(client)->usecount, 2);
diff --git a/drivers/gpu/drm/nouveau/core/include/core/client.h b/drivers/gpu/drm/nouveau/core/include/core/client.h
index b8d0457..c66eac5 100644
--- a/drivers/gpu/drm/nouveau/core/include/core/client.h
+++ b/drivers/gpu/drm/nouveau/core/include/core/client.h
@@ -36,6 +36,9 @@ nouveau_client(void *obj)
 
 int  nouveau_client_create_(const char *name, u64 device, const char *cfg,
 			    const char *dbg, int, void **);
+#define nouveau_client_destroy(p)                                              \
+	nouveau_namedb_destroy(&(p)->base)
+
 int  nouveau_client_init(struct nouveau_client *);
 int  nouveau_client_fini(struct nouveau_client *, bool suspend);
 const char *nouveau_client_name(void *obj);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index ab85a89..83a38d8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -84,11 +84,16 @@ nouveau_cli_create(struct pci_dev *pdev, const char *name,
 	struct nouveau_cli *cli;
 	int ret;
 
+	*pcli = NULL;
 	ret = nouveau_client_create_(name, nouveau_name(pdev), nouveau_config,
 				     nouveau_debug, size, pcli);
 	cli = *pcli;
-	if (ret)
+	if (ret) {
+		if (cli)
+			nouveau_client_destroy(&cli->base);
+		*pcli = NULL;
 		return ret;
+	}
 
 	mutex_init(&cli->mutex);
 	return 0;
-- 
1.8.0.2
