From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 5/7] nouveau: mandate dri2 build
Date: Sat, 16 Feb 2013 20:48:45 +0000
Message-ID: <1361047727-740-6-git-send-email-emil.l.velikov@gmail.com>
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

Building nouveau without dri2 is just silly

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 configure.ac       |  1 +
 src/nouveau_dri2.c | 16 ++--------------
 2 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/configure.ac b/configure.ac
index 302bd2b..ad5a2ea 100644
--- a/configure.ac
+++ b/configure.ac
@@ -72,6 +72,7 @@ AC_SUBST(LIBDRM_NOUVEAU_CFLAGS)
 AC_SUBST(LIBDRM_NOUVEAU_LIBS)
 
 PKG_CHECK_MODULES(XORG, [xorg-server >= 1.8] xproto fontsproto libdrm $REQUIRED_MODULES)
+PKG_CHECK_MODULES(DRI2, [dri2proto >= 2.6])
 PKG_CHECK_MODULES(XEXT, [xextproto >= 7.0.99.1],
 		  HAVE_XEXTPROTO_71="yes"; AC_DEFINE(HAVE_XEXTPROTO_71, 1, [xextproto 7.1 available]),
 		  HAVE_XEXTPROTO_71="no")
diff --git a/src/nouveau_dri2.c b/src/nouveau_dri2.c
index e462a86..9e09038 100644
--- a/src/nouveau_dri2.c
+++ b/src/nouveau_dri2.c
@@ -7,9 +7,10 @@
 #include "nv_include.h"
 #ifdef DRI2
 #include "dri2.h"
+#else
+#error "This driver requires a DRI2-enabled X server"
 #endif
 
-#if defined(DRI2) && DRI2INFOREC_VERSION >= 3
 struct nouveau_dri2_buffer {
 	DRI2BufferRec base;
 	PixmapPtr ppix;
@@ -814,16 +815,3 @@ nouveau_dri2_fini(ScreenPtr pScreen)
 {
 	DRI2CloseScreen(pScreen);
 }
-#else
-Bool
-nouveau_dri2_init(ScreenPtr pScreen)
-{
-	return TRUE;
-}
-
-void
-nouveau_dri2_fini(ScreenPtr pScreen)
-{
-}
-#endif
-
-- 
1.8.1.3
