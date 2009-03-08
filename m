From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/5] nv50: wfb optimisation 1
Date: Sun,  8 Mar 2009 15:31:51 +0100
Message-ID: <1236522714-11553-2-git-send-email-madman2003@gmail.com>
References: <1236522714-11553-1-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1236522714-11553-1-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
 src/nouveau_exa.c |   17 +++++++++++++----
 src/nv_type.h     |    1 +
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/src/nouveau_exa.c b/src/nouveau_exa.c
index 074a226..ae6e151 100644
--- a/src/nouveau_exa.c
+++ b/src/nouveau_exa.c
@@ -717,7 +717,9 @@ static NVPtr last_wfb_pNv = NULL;
 static FbBits
 nouveau_exa_wfb_read_memory(const void *src, int size)
 {
-	int i, line_x, line_y, tile_x, tile_y, subtile_x, subtile_y;
+	int i;
+	uint32_t tile_x, tile_y, subtile_x, subtile_y;
+	uint64_t line_x, line_y;
 	unsigned long offset = (unsigned long) src, subpixel_offset;
 	PixmapPtr pPixmap = NULL;
 	FbBits bits = 0;
@@ -743,7 +745,8 @@ nouveau_exa_wfb_read_memory(const void *src, int size)
 	offset &= ~((pPixmap->drawable.bitsPerPixel >> 3) - 1);
 
 	/* Determine the coordinate first. */
-	line_y = offset/LINEAR_PITCH;
+	/* Division is too expensive for large numbers, so we precalculate a multiplication factor. */
+	line_y = (offset * last_wfb_pNv->wfb_pixmaps[i].multiply_factor) >> 32;
 	line_x = offset - line_y * LINEAR_PITCH;
 	tile_x = line_x/TILE_PITCH;
 	tile_y = line_y/TILE_HEIGHT;
@@ -765,7 +768,9 @@ nouveau_exa_wfb_read_memory(const void *src, int size)
 static void
 nouveau_exa_wfb_write_memory(void *dst, FbBits value, int size)
 {
-	int i, line_x, line_y, tile_x, tile_y, subtile_x, subtile_y;
+	int i;
+	uint32_t tile_x, tile_y, subtile_x, subtile_y;
+	uint64_t line_x, line_y;
 	unsigned long offset = (unsigned long) dst, subpixel_offset;
 	PixmapPtr pPixmap = NULL;
 	void *new_dst;
@@ -794,7 +799,8 @@ nouveau_exa_wfb_write_memory(void *dst, FbBits value, int size)
 	offset &= ~((pPixmap->drawable.bitsPerPixel >> 3) - 1);
 
 	/* Determine the coordinate first. */
-	line_y = offset/LINEAR_PITCH;
+	/* Division is too expensive for large numbers, so we precalculate a multiplication factor. */
+	line_y = (offset * last_wfb_pNv->wfb_pixmaps[i].multiply_factor) >> 32;
 	line_x = offset - line_y * LINEAR_PITCH;
 	tile_x = line_x/TILE_PITCH;
 	tile_y = line_y/TILE_HEIGHT;
@@ -846,6 +852,8 @@ nouveau_exa_wfb_setup_wrap(ReadMemoryProcPtr *pRead,
 	pNv->wfb_pixmaps[i].end = pNv->wfb_pixmaps[i].start + exaGetPixmapPitch(pPixmap) * ((pPixmap->drawable.height + 3) & ~3);
 	pNv->wfb_pixmaps[i].used = true;
 	pNv->wfb_pixmaps[i].tiled = nouveau_exa_pixmap_is_tiled(pPixmap);
+	/* Division is too expensive for large numbers, so we precalculate a multiplication factor. */
+	pNv->wfb_pixmaps[i].multiply_factor = (0xFFFFFFFF/exaGetPixmapPitch(pPixmap)) + 1;
 
 	*pRead = nouveau_exa_wfb_read_memory;
 	*pWrite = nouveau_exa_wfb_write_memory;
@@ -872,6 +880,7 @@ nouveau_exa_wfb_finish_wrap(DrawablePtr pDraw)
 			pNv->wfb_pixmaps[i].end = 0;
 			pNv->wfb_pixmaps[i].used = false;
 			pNv->wfb_pixmaps[i].tiled = false;
+			pNv->wfb_pixmaps[i].multiply_factor = 0;
 			break;
 		}
 }
diff --git a/src/nv_type.h b/src/nv_type.h
index bec4851..0313415 100644
--- a/src/nv_type.h
+++ b/src/nv_type.h
@@ -413,6 +413,7 @@ typedef struct _NVRec {
 		bool tiled;
 		unsigned long start;
 		unsigned long end;
+		uint64_t multiply_factor;
 	} wfb_pixmaps[6];
 } NVRec;
 
-- 
1.6.2
