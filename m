From: Pauli Nieminen <suokkos@gmail.com>
Subject: [PATCH 3/3] libdrm: Move all noninstalled headers to noinst_HEADERS.
Date: Fri, 12 Mar 2010 14:50:35 +0200
Message-ID: <1268398235-21806-3-git-send-email-suokkos@gmail.com>
References: <1268398235-21806-1-git-send-email-suokkos@gmail.com>
	<1268398235-21806-2-git-send-email-suokkos@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.sourceforge.net>
In-Reply-To: <1268398235-21806-2-git-send-email-suokkos@gmail.com>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=dri-devel>
List-Post: <mailto:dri-devel@lists.sourceforge.net>
List-Help: <mailto:dri-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: dri-devel-bounces@lists.sourceforge.net
To: dri-devel@lists.sourceforge.net
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Cleanup make system so that all noninstalled headers are put
to noinst_HEADERS. This quarentees that header will be present
in tar ball but not installed with make install.

CC: nouveau@lists.freedesktop.org
Signed-off-by: Pauli Nieminen <suokkos@gmail.com>
---
 Makefile.am         |    6 +++---
 intel/Makefile.am   |   10 ++++++----
 nouveau/Makefile.am |    4 +++-
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/Makefile.am b/Makefile.am
index e434e1d..61da186 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -55,13 +55,13 @@ libdrm_la_SOURCES =				\
 	xf86drmHash.c				\
 	xf86drmRandom.c				\
 	xf86drmSL.c				\
-	xf86drmMode.c				\
-	libdrm_lists.h
+	xf86drmMode.c
 
 libdrmincludedir = ${includedir}
 libdrminclude_HEADERS = xf86drm.h xf86drmMode.h
 
-noinst_HEADERS = xf86atomic.h
+noinst_HEADERS = xf86atomic.h \
+	libdrm_lists.h
 
 
 EXTRA_DIST = libdrm.pc.in include/drm/*
diff --git a/intel/Makefile.am b/intel/Makefile.am
index 9add505..d56b03a 100644
--- a/intel/Makefile.am
+++ b/intel/Makefile.am
@@ -36,14 +36,16 @@ libdrm_intel_la_LIBADD = ../libdrm.la @PTHREADSTUBS_LIBS@ @CLOCK_LIB@
 
 libdrm_intel_la_SOURCES = \
 	intel_bufmgr.c \
-	intel_bufmgr_priv.h \
 	intel_bufmgr_fake.c \
 	intel_bufmgr_gem.c \
-	intel_chipset.h \
-	mm.c \
-	mm.h
+	mm.c
 
 libdrm_intelincludedir = ${includedir}
 libdrm_intelinclude_HEADERS = intel_bufmgr.h
 
+noinst_HEADERS = \
+	intel_bufmgr_priv.h \
+	intel_chipset.h \
+	mm.h
+
 pkgconfig_DATA = libdrm_intel.pc
diff --git a/nouveau/Makefile.am b/nouveau/Makefile.am
index 5d759c5..53099eb 100644
--- a/nouveau/Makefile.am
+++ b/nouveau/Makefile.am
@@ -18,7 +18,6 @@ libdrm_nouveau_la_SOURCES = \
 			    nouveau_notifier.c \
 			    nouveau_bo.c \
 			    nouveau_resource.c \
-			    nouveau_private.h \
 			    nouveau_reloc.c
 
 libdrm_nouveaucommonincludedir = ${includedir}/nouveau
@@ -38,5 +37,8 @@ libdrm_nouveauincludedir = ${includedir}/drm
 libdrm_nouveauinclude_HEADERS = \
 				nouveau_drmif.h
 
+noinst_HEADERS = \
+                 nouveau_private.h
+
 pkgconfigdir = @pkgconfigdir@
 pkgconfig_DATA = libdrm_nouveau.pc
-- 
1.6.3.3


------------------------------------------------------------------------------
Download Intel&#174; Parallel Studio Eval
Try the new software tools for yourself. Speed compiling, find bugs
proactively, and fine-tune applications for parallel performance.
See why Intel Parallel Studio got high marks during beta.
http://p.sf.net/sfu/intel-sw-dev
--
