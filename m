From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/4] drm/nouveau: prepare for reporting channel
	owner
Date: Sun,  9 Dec 2012 15:45:21 +0100
Message-ID: <1355064322-23025-3-git-send-email-marcin.slusarz@gmail.com>
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

- record channel owner process name
- add some helpers for accessing this information
- let nouveau_enum hold additional value (will be needed in the next patch)

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/core/client.c         | 10 ++++++++++
 drivers/gpu/drm/nouveau/core/core/enum.c           |  3 ++-
 drivers/gpu/drm/nouveau/core/engine/fifo/base.c    | 15 +++++++++++++++
 drivers/gpu/drm/nouveau/core/include/core/client.h |  3 ++-
 drivers/gpu/drm/nouveau/core/include/core/enum.h   |  3 ++-
 drivers/gpu/drm/nouveau/core/include/engine/fifo.h |  2 ++
 drivers/gpu/drm/nouveau/nouveau_drm.c              |  5 +++--
 7 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/core/client.c b/drivers/gpu/drm/nouveau/core/core/client.c
index c617f04..0d15696 100644
--- a/drivers/gpu/drm/nouveau/core/core/client.c
+++ b/drivers/gpu/drm/nouveau/core/core/client.c
@@ -101,3 +101,13 @@ nouveau_client_fini(struct nouveau_client *client, bool suspend)
 	nv_debug(client, "%s completed with %d\n", name[suspend], ret);
 	return ret;
 }
+
+const char *
+nouveau_client_name(void *obj)
+{
+	const char *client_name = "unk";
+	struct nouveau_client *client = nouveau_client(obj);
+	if (client)
+		client_name = client->name;
+	return client_name;
+}
diff --git a/drivers/gpu/drm/nouveau/core/core/enum.c b/drivers/gpu/drm/nouveau/core/core/enum.c
index 148f91f..dd43479 100644
--- a/drivers/gpu/drm/nouveau/core/core/enum.c
+++ b/drivers/gpu/drm/nouveau/core/core/enum.c
@@ -40,7 +40,7 @@ nouveau_enum_find(const struct nouveau_enum *en, u32 value)
 	return NULL;
 }
 
-void
+const struct nouveau_enum *
 nouveau_enum_print(const struct nouveau_enum *en, u32 value)
 {
 	en = nouveau_enum_find(en, value);
@@ -48,6 +48,7 @@ nouveau_enum_print(const struct nouveau_enum *en, u32 value)
 		pr_cont("%s", en->name);
 	else
 		pr_cont("(unknown enum 0x%08x)", value);
+	return en;
 }
 
 void
diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/base.c b/drivers/gpu/drm/nouveau/core/engine/fifo/base.c
index a7f41f8..6ea18e4 100644
--- a/drivers/gpu/drm/nouveau/core/engine/fifo/base.c
+++ b/drivers/gpu/drm/nouveau/core/engine/fifo/base.c
@@ -22,6 +22,7 @@
  * Authors: Ben Skeggs
  */
 
+#include <core/client.h>
 #include <core/object.h>
 #include <core/handle.h>
 #include <core/class.h>
@@ -146,6 +147,20 @@ nouveau_fifo_chid(struct nouveau_fifo *priv, struct nouveau_object *object)
 	return -1;
 }
 
+const char *
+nouveau_client_name_for_fifo_chid(struct nouveau_fifo *fifo, u32 chid)
+{
+	struct nouveau_fifo_chan *chan = NULL;
+	unsigned long flags;
+
+	spin_lock_irqsave(&fifo->lock, flags);
+	if (chid >= fifo->min && chid <= fifo->max)
+		chan = (void *)fifo->channel[chid];
+	spin_unlock_irqrestore(&fifo->lock, flags);
+
+	return nouveau_client_name(chan);
+}
+
 void
 nouveau_fifo_destroy(struct nouveau_fifo *priv)
 {
diff --git a/drivers/gpu/drm/nouveau/core/include/core/client.h b/drivers/gpu/drm/nouveau/core/include/core/client.h
index 0193532..b8d0457 100644
--- a/drivers/gpu/drm/nouveau/core/include/core/client.h
+++ b/drivers/gpu/drm/nouveau/core/include/core/client.h
@@ -7,7 +7,7 @@ struct nouveau_client {
 	struct nouveau_namedb base;
 	struct nouveau_handle *root;
 	struct nouveau_object *device;
-	char name[16];
+	char name[32];
 	u32 debug;
 	struct nouveau_vm *vm;
 };
@@ -38,5 +38,6 @@ int  nouveau_client_create_(const char *name, u64 device, const char *cfg,
 			    const char *dbg, int, void **);
 int  nouveau_client_init(struct nouveau_client *);
 int  nouveau_client_fini(struct nouveau_client *, bool suspend);
+const char *nouveau_client_name(void *obj);
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/core/include/core/enum.h b/drivers/gpu/drm/nouveau/core/include/core/enum.h
index e7b1e18..4fc62bb 100644
--- a/drivers/gpu/drm/nouveau/core/include/core/enum.h
+++ b/drivers/gpu/drm/nouveau/core/include/core/enum.h
@@ -5,12 +5,13 @@ struct nouveau_enum {
 	u32 value;
 	const char *name;
 	const void *data;
+	u32 data2;
 };
 
 const struct nouveau_enum *
 nouveau_enum_find(const struct nouveau_enum *, u32 value);
 
-void
+const struct nouveau_enum *
 nouveau_enum_print(const struct nouveau_enum *en, u32 value);
 
 struct nouveau_bitfield {
diff --git a/drivers/gpu/drm/nouveau/core/include/engine/fifo.h b/drivers/gpu/drm/nouveau/core/include/engine/fifo.h
index 039bd19..f4f4149 100644
--- a/drivers/gpu/drm/nouveau/core/include/engine/fifo.h
+++ b/drivers/gpu/drm/nouveau/core/include/engine/fifo.h
@@ -92,6 +92,8 @@ int nouveau_fifo_create_(struct nouveau_object *, struct nouveau_object *,
 			 struct nouveau_oclass *, int min, int max,
 			 int size, void **);
 void nouveau_fifo_destroy(struct nouveau_fifo *);
+const char *
+nouveau_client_name_for_fifo_chid(struct nouveau_fifo *fifo, u32 chid);
 
 #define _nouveau_fifo_init _nouveau_engine_init
 #define _nouveau_fifo_fini _nouveau_engine_fini
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 38e9a08..a50362e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -539,10 +539,11 @@ nouveau_drm_open(struct drm_device *dev, struct drm_file *fpriv)
 	struct pci_dev *pdev = dev->pdev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_cli *cli;
-	char name[16];
+	char name[32], tmpname[TASK_COMM_LEN];
 	int ret;
 
-	snprintf(name, sizeof(name), "%d", pid_nr(fpriv->pid));
+	get_task_comm(tmpname, current);
+	snprintf(name, sizeof(name), "%s[%d]", tmpname, pid_nr(fpriv->pid));
 
 	ret = nouveau_cli_create(pdev, name, sizeof(*cli), (void **)&cli);
 	if (ret)
-- 
1.7.12
