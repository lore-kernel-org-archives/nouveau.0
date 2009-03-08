From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/5] nv50: wfb optimisation 2
Date: Sun,  8 Mar 2009 15:31:52 +0100
Message-ID: <1236522714-11553-3-git-send-email-madman2003@gmail.com>
References: <1236522714-11553-1-git-send-email-madman2003@gmail.com>
	<1236522714-11553-2-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1236522714-11553-2-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
 src/nouveau_exa.c |   10 ++++++----
 src/nv_type.h     |    1 +
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/src/nouveau_exa.c b/src/nouveau_exa.c
index ae6e151..c44e882 100644
--- a/src/nouveau_exa.c
+++ b/src/nouveau_exa.c
@@ -741,8 +741,8 @@ nouveau_exa_wfb_read_memory(const void *src, int size)
 	/* Now comes the decoding. */
 	offset -= (unsigned long) pPixmap->devPrivate.ptr;
 	/* Assuming dword alligned offsets. */
-	subpixel_offset = offset & ((pPixmap->drawable.bitsPerPixel >> 3) - 1);
-	offset &= ~((pPixmap->drawable.bitsPerPixel >> 3) - 1);
+	subpixel_offset = offset & (last_wfb_pNv->wfb_pixmaps[i].cpp - 1);
+	offset &= ~(last_wfb_pNv->wfb_pixmaps[i].cpp - 1);
 
 	/* Determine the coordinate first. */
 	/* Division is too expensive for large numbers, so we precalculate a multiplication factor. */
@@ -795,8 +795,8 @@ nouveau_exa_wfb_write_memory(void *dst, FbBits value, int size)
 	/* Now comes the decoding. */
 	offset -= (unsigned long) pPixmap->devPrivate.ptr;
 	/* Assuming dword alligned offsets. */
-	subpixel_offset = offset & ((pPixmap->drawable.bitsPerPixel >> 3) - 1);
-	offset &= ~((pPixmap->drawable.bitsPerPixel >> 3) - 1);
+	subpixel_offset = offset & (last_wfb_pNv->wfb_pixmaps[i].cpp - 1);
+	offset &= ~(last_wfb_pNv->wfb_pixmaps[i].cpp - 1);
 
 	/* Determine the coordinate first. */
 	/* Division is too expensive for large numbers, so we precalculate a multiplication factor. */
@@ -854,6 +854,7 @@ nouveau_exa_wfb_setup_wrap(ReadMemoryProcPtr *pRead,
 	pNv->wfb_pixmaps[i].tiled = nouveau_exa_pixmap_is_tiled(pPixmap);
 	/* Division is too expensive for large numbers, so we precalculate a multiplication factor. */
 	pNv->wfb_pixmaps[i].multiply_factor = (0xFFFFFFFF/exaGetPixmapPitch(pPixmap)) + 1;
+	pNv->wfb_pixmaps[i].cpp = (pPixmap->drawable.bitsPerPixel >> 3);
 
 	*pRead = nouveau_exa_wfb_read_memory;
 	*pWrite = nouveau_exa_wfb_write_memory;
@@ -881,6 +882,7 @@ nouveau_exa_wfb_finish_wrap(DrawablePtr pDraw)
 			pNv->wfb_pixmaps[i].used = false;
 			pNv->wfb_pixmaps[i].tiled = false;
 			pNv->wfb_pixmaps[i].multiply_factor = 0;
+			pNv->wfb_pixmaps[i].cpp = 0;
 			break;
 		}
 }
diff --git a/src/nv_type.h b/src/nv_type.h
index 0313415..78ec614 100644
--- a/src/nv_type.h
+++ b/src/nv_type.h
@@ -414,6 +414,7 @@ typedef struct _NVRec {
 		unsigned long start;
 		unsigned long end;
 		uint64_t multiply_factor;
+		uint8_t cpp;
 	} wfb_pixmaps[6];
 } NVRec;
 
-- 
1.6.2
