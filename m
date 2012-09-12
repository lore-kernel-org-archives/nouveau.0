From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: add default debug level override
Date: Thu, 13 Sep 2012 00:50:06 +0200
Message-ID: <20120912225006.GC8067@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Useful when we don't know which subsystem is failing.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/core/option.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/core/core/option.c b/drivers/gpu/drm/nouveau/core/core/option.c
index 62a432e..fde06b0 100644
--- a/drivers/gpu/drm/nouveau/core/core/option.c
+++ b/drivers/gpu/drm/nouveau/core/core/option.c
@@ -22,9 +22,16 @@
  * Authors: Ben Skeggs
  */
 
+#include <linux/module.h>
 #include <core/option.h>
 #include <core/debug.h>
 
+MODULE_PARM_DESC(debug_level, "nv_printk level (0-"
+		__stringify(CONFIG_NOUVEAU_DEBUG) ", default "
+		__stringify(CONFIG_NOUVEAU_DEBUG_DEFAULT) ")");
+static int nouveau_debug_level = CONFIG_NOUVEAU_DEBUG_DEFAULT;
+module_param_named(debug_level, nouveau_debug_level, int, 0400);
+
 /* compares unterminated string 'str' with zero-terminated string 'cmp' */
 static inline int
 strncasecmpz(const char *str, const char *cmp, size_t len)
@@ -86,7 +93,7 @@ nouveau_boolopt(const char *optstr, const char *opt, bool value)
 int
 nouveau_dbgopt(const char *optstr, const char *sub)
 {
-	int mode = 1, level = CONFIG_NOUVEAU_DEBUG_DEFAULT;
+	int mode = 1, level = nouveau_debug_level;
 
 	while (optstr) {
 		int len = strcspn(optstr, ",=");
-- 
1.7.12
