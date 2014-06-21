From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] present: build only when glamor is enabled
Date: Sun, 22 Jun 2014 01:32:42 +0200
Message-ID: <20140621233242.GB22546@joi.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

nouveau_present_flip_exec references glamor_fd_from_pixmap,
which do not exist when glamor is disabled

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/nouveau_present.c | 2 +-
 src/nouveau_present.h | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/src/nouveau_present.c b/src/nouveau_present.c
index b294bbe..38f2cac 100644
--- a/src/nouveau_present.c
+++ b/src/nouveau_present.c
@@ -23,7 +23,7 @@
  */
 
 #include "nouveau_present.h"
-#ifdef DRI3
+#if defined(DRI3) && defined(HAVE_GLAMOR)
 #include "nv_include.h"
 #include "nouveau_glamor.h"
 #include "xf86drmMode.h"
diff --git a/src/nouveau_present.h b/src/nouveau_present.h
index dea19ce..958c2f7 100644
--- a/src/nouveau_present.h
+++ b/src/nouveau_present.h
@@ -4,7 +4,11 @@
 #include "xorg-server.h"
 #include "scrnintstr.h"
 
-#ifdef DRI3
+#ifdef HAVE_CONFIG_H
+#include "config.h"
+#endif
+
+#if defined(DRI3) && defined(HAVE_GLAMOR)
 #include "present.h"
 Bool nouveau_present_init(ScreenPtr pScreen);
 void nouveau_present_fini(ScreenPtr pScreen);
-- 
2.0.0
