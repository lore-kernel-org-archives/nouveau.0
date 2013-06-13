From: Sven Joachim <svenjoac-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH] Link against libdrm
Date: Thu, 13 Jun 2013 20:41:53 +0200
Message-ID: <1371148913-25057-1-git-send-email-svenjoac@gmx.de>
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
Cc: 633786-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org, Sven Joachim <svenjoac-Mmb7MZpHnFY@public.gmane.org>
List-Id: nouveau.vger.kernel.org

The DDX uses symbols from libdrm but currently does not link against
it, but rather relies on indirect linkage from libdrm_nouveau.  This
could lead to insufficient dependencies in distribution packages, seen
in http://bugs.debian.org/633786.

Signed-off-by: Sven Joachim <svenjoac-Mmb7MZpHnFY@public.gmane.org>
---
 configure.ac    | 1 +
 src/Makefile.am | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/configure.ac b/configure.ac
index 6f7f870..b54b8cd 100644
--- a/configure.ac
+++ b/configure.ac
@@ -80,6 +80,7 @@ XORG_DRIVER_CHECK_EXT(DPMSExtension, xextproto)
 XORG_DRIVER_CHECK_EXT(DRI2, [dri2proto >= 2.6])
 
 # Checks for pkg-config packages
+PKG_CHECK_MODULES(LIBDRM, [libdrm >= 2.4.17])
 PKG_CHECK_MODULES(LIBDRM_NOUVEAU, [libdrm_nouveau >= 2.4.25])
 AC_SUBST(LIBDRM_NOUVEAU_CFLAGS)
 AC_SUBST(LIBDRM_NOUVEAU_LIBS)
diff --git a/src/Makefile.am b/src/Makefile.am
index f54e135..5836ead 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -23,10 +23,10 @@
 # -avoid-version prevents gratuitous .0.0.0 version numbers on the end
 # _ladir passes a dummy rpath to libtool so the thing will actually link
 # TODO: -nostdlib/-Bstatic/-lgcc platform magic, not installing the .a, etc.
-AM_CFLAGS = @XORG_CFLAGS@ @LIBUDEV_CFLAGS@ @LIBDRM_NOUVEAU_CFLAGS@
+AM_CFLAGS = @XORG_CFLAGS@ @LIBUDEV_CFLAGS@ @LIBDRM_NOUVEAU_CFLAGS@ @LIBDRM_CFLAGS@
 nouveau_drv_la_LTLIBRARIES = nouveau_drv.la
 nouveau_drv_la_LDFLAGS = -module -avoid-version @LIBDRM_NOUVEAU_LIBS@ \
-			 @LIBUDEV_LIBS@
+			 @LIBUDEV_LIBS@ @LIBDRM_LIBS@
 nouveau_drv_ladir = @moduledir@/drivers
 
 nouveau_drv_la_SOURCES = \
-- 
1.8.3.1
