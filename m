From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 02/10] drm/nouveau: add nv_printk_enabled
Date: Sun, 19 Aug 2012 22:59:57 +0200
Message-ID: <1345410004-27729-2-git-send-email-marcin.slusarz@gmail.com>
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

Add helper function which returns whether nv_printk would print anything
for desired object / level.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/core/printk.c         |   15 +++++++++++++++
 drivers/gpu/drm/nouveau/core/include/core/printk.h |    6 ++++++
 2 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/core/printk.c b/drivers/gpu/drm/nouveau/core/core/printk.c
index 134dd6d..019c93a 100644
--- a/drivers/gpu/drm/nouveau/core/core/printk.c
+++ b/drivers/gpu/drm/nouveau/core/core/printk.c
@@ -27,6 +27,21 @@
 #include <core/subdev.h>
 #include <core/printk.h>
 
+bool nv_printk_enabled_(struct nouveau_object *object, int level)
+{
+	if (object && !nv_iclass(object, NV_CLIENT_CLASS)) {
+		struct nouveau_object *subdev = object;
+
+		if (object->engine)
+			subdev = object->engine;
+
+		return level <= nv_subdev(subdev)->debug;
+	} else if (object && nv_iclass(object, NV_CLIENT_CLASS))
+		return level <= nv_client(object)->debug;
+	else
+		return true;
+}
+
 void
 nv_printk_(struct nouveau_object *object, const char *pfx, int level,
 	   const char *fmt, ...)
diff --git a/drivers/gpu/drm/nouveau/core/include/core/printk.h b/drivers/gpu/drm/nouveau/core/include/core/printk.h
index 9e0b04c..7deeae2 100644
--- a/drivers/gpu/drm/nouveau/core/include/core/printk.h
+++ b/drivers/gpu/drm/nouveau/core/include/core/printk.h
@@ -17,11 +17,17 @@ struct nouveau_object;
 
 void nv_printk_(struct nouveau_object *, const char *, int, const char *, ...);
 
+bool nv_printk_enabled_(struct nouveau_object *object, int level);
+
 #define nv_printk(o,l,f,a...) do {                                             \
 	if (NV_DBG_##l <= CONFIG_NOUVEAU_DEBUG)                                \
 		nv_printk_(nv_object(o), NV_PRINTK_##l, NV_DBG_##l, f, ##a);   \
 } while(0)
 
+#define nv_printk_enabled(o, l) \
+	((NV_DBG_##l <= CONFIG_NOUVEAU_DEBUG) && \
+			nv_printk_enabled_(nv_object(o), NV_DBG_##l))
+
 #define nv_fatal(o,f,a...) nv_printk((o), FATAL, f, ##a)
 #define nv_error(o,f,a...) nv_printk((o), ERROR, f, ##a)
 #define nv_warn(o,f,a...) nv_printk((o), WARN, f, ##a)
-- 
1.7.8.6
