From: Bernhard Steidl <BernhardSteidl-Mmb7MZpHnFY@public.gmane.org>
Subject: [Patch] tiny patch to DDX/nv_local.h
Date: Thu, 24 May 2007 21:00:04 +0200
Message-ID: <20070524210004.7e42bd29.BernhardSteidl@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="Multipart=_Thu__24_May_2007_21_00_04_+0200_1RhW25o4jRU3RHai"
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


--Multipart=_Thu__24_May_2007_21_00_04_+0200_1RhW25o4jRU3RHai
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

- - added comments
- - changed variable names p,i,d to more intuitively understandable base,offset,value
- - added brackets around arguments in macros
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iD8DBQFGVeCrNkW11CB5VakRAllGAJ0SzrmGr4ieknWtjmGrGTu9C9XGrACeIQqL
ao0QVVFNBb/6I7gypBd+U70=
=J+Gw
-----END PGP SIGNATURE-----

--Multipart=_Thu__24_May_2007_21_00_04_+0200_1RhW25o4jRU3RHai
Content-Type: text/x-patch;
 name="0001-add-comments-to-nv_local.h.patch"
Content-Disposition: attachment;
 filename="0001-add-comments-to-nv_local.h.patch"
Content-Transfer-Encoding: 7bit

From 18eb0086c60ee86fb1e5e3404e99b7b68720a7ec Mon Sep 17 00:00:00 2001
From: Bernhard Steidl <BernhardSteidl-Mmb7MZpHnFY@public.gmane.org>
Date: Thu, 24 May 2007 19:39:18 +0200
Subject: [PATCH] add comments to nv_local.h

- added comments
- changed variable names p,i,d to more intuitively understandable base,offset,value
- added brackets around arguments in macros
---
 src/nv_local.h |   32 +++++++++++++++++++-------------
 1 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/src/nv_local.h b/src/nv_local.h
index 5a74ee2..d0a89c7 100644
--- a/src/nv_local.h
+++ b/src/nv_local.h
@@ -43,7 +43,7 @@
 
 /*
  * This file includes any environment or machine specific values to access the
- * HW.  Put all affected includes, typdefs, etc. here so the riva_hw.* files
+ * HW.  Put all affected includes, typdefs, etc. here so the nv_hw.* files
  * can stay generic in nature.
  */ 
 #include "compiler.h"
@@ -52,16 +52,16 @@
 /*
  * HW access macros.  These assume memory-mapped I/O, and not normal I/O space.
  */
-#define NV_WR08(p,i,d)  MMIO_OUT8((pointer)(p), (i), (d))
-#define NV_RD08(p,i)    MMIO_IN8((pointer)(p), (i))
-#define NV_WR16(p,i,d)  MMIO_OUT16((pointer)(p), (i), (d))
-#define NV_RD16(p,i)    MMIO_IN16((pointer)(p), (i))
-#define NV_WR32(p,i,d)  MMIO_OUT32((pointer)(p), (i), (d))
-#define NV_RD32(p,i)    MMIO_IN32((pointer)(p), (i))
+#define NV_WR08(base,offset,value) MMIO_OUT8((pointer)(base), (offset), (value))
+#define NV_RD08(base,offset)	   MMIO_IN8((pointer)(base), (offset))
+#define NV_WR16(base,offset,value) MMIO_OUT16((pointer)(base), (offset), (value))
+#define NV_RD16(base,offset)	   MMIO_IN16((pointer)(base), (offset))
+#define NV_WR32(base,offset,value) MMIO_OUT32((pointer)(base), (offset), (value))
+#define NV_RD32(base,offset)	   MMIO_IN32((pointer)(base), (offset))
 
 /* VGA I/O is now always done through MMIO */
-#define VGA_WR08(p,i,d) NV_WR08(p,i,d)
-#define VGA_RD08(p,i)   NV_RD08(p,i)
+#define VGA_WR08(base,offset,value)	NV_WR08(base,offset,value)
+#define VGA_RD08(base,offset)		NV_RD08(base,offset)
 
 #if defined(__i386__)
 #define _NV_FENCE() outb(0x3D0, 0);
@@ -69,15 +69,21 @@
 #define _NV_FENCE() mem_barrier();
 #endif
 
+/* READ_GET returns the location in the push buffer (FIFO) the gpu is
+ * currently reading from
+ */
+#define READ_GET(pNv) (((pNv)->FIFO[0x0011] - (pNv)->fifo.put_base) >> 2)
 
-#define READ_GET(pNv) (((pNv)->FIFO[0x0011] - pNv->fifo.put_base) >> 2)
+/* WRITE_PUT tells the gpu that there's valid commands in the push buffer
+ * (FIFO) up until offset "data"
+ */
 #if NV_DMA_DEBUG == 1
 #define WRITE_PUT(pNv, data) {       \
   volatile CARD8 scratch;            \
   _NV_FENCE()                        \
   scratch = ((char*)(pNv)->FB->map)[0];       \
-  (pNv)->FIFO[0x0010] = ((data) << 2) + pNv->fifo.put_base; \
-	xf86DrvMsg(0, X_INFO, "WRITE_PUT: 0x%08x\n", ((data) << 2) + pNv->fifo.put_base); \
+  (pNv)->FIFO[0x0010] = ((data) << 2) + (pNv)->fifo.put_base; \
+	xf86DrvMsg(0, X_INFO, "WRITE_PUT: 0x%08x\n", ((data) << 2) + (pNv)->fifo.put_base); \
   mem_barrier();                     \
 }
 #else
@@ -85,7 +91,7 @@
   volatile CARD8 scratch;            \
   _NV_FENCE()                        \
   scratch = ((char*)(pNv)->FB->map)[0];       \
-  (pNv)->FIFO[0x0010] = ((data) << 2) + pNv->fifo.put_base; \
+  (pNv)->FIFO[0x0010] = ((data) << 2) + (pNv)->fifo.put_base; \
   mem_barrier();                     \
 }
 #endif
-- 
1.5.0.7


--Multipart=_Thu__24_May_2007_21_00_04_+0200_1RhW25o4jRU3RHai
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--Multipart=_Thu__24_May_2007_21_00_04_+0200_1RhW25o4jRU3RHai--
