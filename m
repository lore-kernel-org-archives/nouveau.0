From: =?utf-8?q?Marcin=20Ko=C5=9Bcielnicki?= <koriakin-mP9o5jsk0RY@public.gmane.org>
Subject: [PATCH] Remove nv_dripriv.h, nv_local.h
Date: Wed, 20 Jan 2010 07:46:32 +0000
Message-ID: <1263973592-26186-1-git-send-email-koriakin@0x04.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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
List-Id: nouveau.vger.kernel.org

---
 src/Makefile.am     |    2 -
 src/nouveau_local.h |   26 ++++++++++++++++
 src/nv_dripriv.h    |   21 -------------
 src/nv_include.h    |    1 -
 src/nv_local.h      |   83 ---------------------------------------------------
 src/nv_shadow.c     |    1 -
 6 files changed, 26 insertions(+), 108 deletions(-)
 delete mode 100644 src/nv_dripriv.h
 delete mode 100644 src/nv_local.h

diff --git a/src/Makefile.am b/src/Makefile.am
index f448038..b5f7c86 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -38,8 +38,6 @@ nouveau_drv_la_SOURCES = \
 			 nv_dma.h \
 			 nv_driver.c \
 			 nv_include.h \
-			 nv_dripriv.h \
-			 nv_local.h \
 			 nv_proto.h \
 			 nv_shadow.c \
 			 nv_type.h \
diff --git a/src/nouveau_local.h b/src/nouveau_local.h
index d44e2dc..a950db4 100644
--- a/src/nouveau_local.h
+++ b/src/nouveau_local.h
@@ -43,4 +43,30 @@
 
 #define NOUVEAU_ALIGN(x,bytes) (((x) + ((bytes) - 1)) & ~((bytes) - 1))
 
+static inline int log2i(int i)
+{
+	int r = 0;
+
+	if (i & 0xffff0000) {
+		i >>= 16;
+		r += 16;
+	}
+	if (i & 0x0000ff00) {
+		i >>= 8;
+		r += 8;
+	}
+	if (i & 0x000000f0) {
+		i >>= 4;
+		r += 4;
+	}
+	if (i & 0x0000000c) {
+		i >>= 2;
+		r += 2;
+	}
+	if (i & 0x00000002) {
+		r += 1;
+	}
+	return r;
+}
+
 #endif
diff --git a/src/nv_dripriv.h b/src/nv_dripriv.h
deleted file mode 100644
index 85b818c..0000000
--- a/src/nv_dripriv.h
+++ /dev/null
@@ -1,21 +0,0 @@
-#ifndef NV_DRIPRIV_H_
-#define NV_DRIPRIV_H_
-
-#include "GL/glxint.h"
-#include "xf86drm.h"
-
-extern void GlxSetVisualConfigs(int nconfigs, __GLXvisualConfig *configs,
-				void **configprivs);
-
-typedef struct {
-    /* Nothing here yet */
-    int dummy;
-} NVConfigPrivRec, *NVConfigPrivPtr;
-
-typedef struct {
-    /* Nothing here yet */
-    int dummy;
-} NVDRIContextRec, *NVDRIContextPtr;
-
-#endif
-
diff --git a/src/nv_include.h b/src/nv_include.h
index f17cf8b..ac9c9c9 100644
--- a/src/nv_include.h
+++ b/src/nv_include.h
@@ -68,7 +68,6 @@
 
 #define NV_DMA_DEBUG 0
 
-#include "nv_local.h"
 #include "nv_type.h"
 #include "nv_proto.h"
 #include "nv_dma.h"
diff --git a/src/nv_local.h b/src/nv_local.h
deleted file mode 100644
index d23c734..0000000
--- a/src/nv_local.h
+++ /dev/null
@@ -1,83 +0,0 @@
-/*
- * Copyright 1993-2003 NVIDIA, Corporation
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
- * OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
- * SOFTWARE.
- */
-
-#ifndef __NV_LOCAL_H__
-#define __NV_LOCAL_H__
-
-/*
- * This file includes any environment or machine specific values to access the
- * HW.  Put all affected includes, typdefs, etc. here so the riva_hw.* files
- * can stay generic in nature.
- */ 
-#include "compiler.h"
-#include "xf86_OSproc.h"
-
-//#define NOUVEAU_MODESET_TRACE
-#ifdef NOUVEAU_MODESET_TRACE
-#define DDXMMIOH(f, h, r, v)	ErrorF(f, h, r, v)
-#define DDXMMIOW(f, r, w)	(ErrorF(f, r, w), w)
-#else
-#define DDXMMIOH(f, h, r, v)
-#define DDXMMIOW(f, r, w)	w
-#endif
-
-/*
- * HW access macros.  These assume memory-mapped I/O, and not normal I/O space.
- */
-#define NV_WR08(p,i,d)  MMIO_OUT8((pointer)(p), (i), (d))
-#define NV_RD08(p,i)    MMIO_IN8((pointer)(p), (i))
-#define NV_WR16(p,i,d)  MMIO_OUT16((pointer)(p), (i), (d))
-#define NV_RD16(p,i)    MMIO_IN16((pointer)(p), (i))
-#define NV_WR32(p,i,d)  MMIO_OUT32((pointer)(p), (i), (d))
-#define NV_RD32(p,i)    MMIO_IN32((pointer)(p), (i))
-
-/* VGA I/O is now always done through MMIO */
-#define VGA_WR08(p,i,d) NV_WR08(p, i, DDXMMIOW("VGA_WR08 port 0x%04x val 0x%02x\n", i, d))
-#define VGA_RD08(p,i)   DDXMMIOW("VGA_RD08 port 0x%04x val 0x%02x\n", i, NV_RD08(p,i))
-
-static inline int log2i(int i)
-{
-	int r = 0;
-
-	if (i & 0xffff0000) {
-		i >>= 16;
-		r += 16;
-	}
-	if (i & 0x0000ff00) {
-		i >>= 8;
-		r += 8;
-	}
-	if (i & 0x000000f0) {
-		i >>= 4;
-		r += 4;
-	}
-	if (i & 0x0000000c) {
-		i >>= 2;
-		r += 2;
-	}
-	if (i & 0x00000002) {
-		r += 1;
-	}
-	return r;
-}
-
-#endif /* __NV_LOCAL_H__ */
diff --git a/src/nv_shadow.c b/src/nv_shadow.c
index e15051c..58a569f 100644
--- a/src/nv_shadow.c
+++ b/src/nv_shadow.c
@@ -20,7 +20,6 @@
  * SOFTWARE.
  */
 
-#include "nv_local.h"
 #include "nv_include.h"
 #include "nv_type.h"
 #include "shadowfb.h"
-- 
1.6.4.1
