From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/7] dri1: purge the final references
Date: Sat, 16 Feb 2013 20:48:44 +0000
Message-ID: <1361047727-740-5-git-send-email-emil.l.velikov@gmail.com>
References: <1361047727-740-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1361047727-740-1-git-send-email-emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 configure.ac  | 2 +-
 src/nv_type.h | 6 ------
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/configure.ac b/configure.ac
index 7535bfe..302bd2b 100644
--- a/configure.ac
+++ b/configure.ac
@@ -71,7 +71,7 @@ PKG_CHECK_MODULES(LIBDRM_NOUVEAU, [libdrm_nouveau >= 2.4.25])
 AC_SUBST(LIBDRM_NOUVEAU_CFLAGS)
 AC_SUBST(LIBDRM_NOUVEAU_LIBS)
 
-PKG_CHECK_MODULES(XORG, [xorg-server >= 1.8] xproto fontsproto libdrm xf86driproto $REQUIRED_MODULES)
+PKG_CHECK_MODULES(XORG, [xorg-server >= 1.8] xproto fontsproto libdrm $REQUIRED_MODULES)
 PKG_CHECK_MODULES(XEXT, [xextproto >= 7.0.99.1],
 		  HAVE_XEXTPROTO_71="yes"; AC_DEFINE(HAVE_XEXTPROTO_71, 1, [xextproto 7.1 available]),
 		  HAVE_XEXTPROTO_71="no")
diff --git a/src/nv_type.h b/src/nv_type.h
index 5963cb6..fc67832 100644
--- a/src/nv_type.h
+++ b/src/nv_type.h
@@ -4,16 +4,10 @@
 #include "colormapst.h"
 #include "xf86Cursor.h"
 #include "exa.h"
-#ifdef XF86DRI
-#define _XF86DRI_SERVER_
 #include "xf86drm.h"
-#include "dri.h"
 #include <stdbool.h>
 #include <stdint.h>
 #include "xf86Crtc.h"
-#else
-#error "This driver requires a DRI-enabled X server"
-#endif
 
 #if XF86_CRTC_VERSION >= 5
 #define NOUVEAU_PIXMAP_SHARING 1
-- 
1.8.1.3
