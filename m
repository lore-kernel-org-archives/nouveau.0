From: Bernhard Steidl <BernhardSteidl-Mmb7MZpHnFY@public.gmane.org>
Subject: [Patch] added comments to nv_video.c
Date: Thu, 31 May 2007 01:51:20 +0200
Message-ID: <20070531015120.7d17daa4.BernhardSteidl@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="Multipart=_Thu__31_May_2007_01_51_20_+0200_VhEFSIFhCBVjMJ8F"
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


--Multipart=_Thu__31_May_2007_01_51_20_+0200_VhEFSIFhCBVjMJ8F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iD8DBQFGXg3pNkW11CB5VakRAs5UAJsF21smKOw7aoeOXOKdBkaEBjDf0gCfRh6p
ch8LKg7B2udPVR48lcJYMws=
=cx5v
-----END PGP SIGNATURE-----

--Multipart=_Thu__31_May_2007_01_51_20_+0200_VhEFSIFhCBVjMJ8F
Content-Type: text/x-patch;
 name="0002-added-comments.patch"
Content-Disposition: attachment;
 filename="0002-added-comments.patch"
Content-Transfer-Encoding: 7bit

From 82cdab89c2b46d0483da42be271cad496cb5c172 Mon Sep 17 00:00:00 2001
From: Bernhard Steidl <BernhardSteidl-Mmb7MZpHnFY@public.gmane.org>
Date: Thu, 31 May 2007 01:41:41 +0200
Subject: [PATCH] added comments

- added lots of comments, discussed comments with ahuillet and refined comments
- replaced two constants with MACROs
- no changes to actual code

diff --git a/src/nv_video.c b/src/nv_video.c
index cf4f88d..d9ee700 100644
--- a/src/nv_video.c
+++ b/src/nv_video.c
@@ -25,6 +25,15 @@
 #include "nv_include.h"
 #include "nv_dma.h"
 
+/*
+2046 is the maximum image size in one dimension.
+- why 2046 and not 2048? a hardware filter needs a one pixel bound at every edge
+- in some color spaces w may be rounded up to multiple of 4 and may thus exceed the maximum.
+  What happens then?
+*/
+#define IMAGE_MAX_W 2046
+#define IMAGE_MAX_H 2046
+
 #define OFF_DELAY 	500  /* milliseconds */
 #define FREE_DELAY 	5000
 
@@ -74,7 +83,7 @@ static XF86VideoEncodingRec DummyEncoding =
 { 
 	0,
 	"XV_IMAGE",
-	2046, 2046,
+	IMAGE_MAX_W, IMAGE_MAX_H,
 	{1, 1}
 };
 
@@ -140,6 +149,13 @@ static XF86ImageRec NVImages[NUM_IMAGES_ALL] =
 	XVIMAGE_RGB
 };
 
+/**
+ * NVSetPortDefaults
+ * set attributes of port "pPriv" to complied-in (except for colorKey) defaults
+ * 
+ * @param pScrnInfo screen to get the default colorKey from
+ * @param pPriv port to reset to defaults
+ */
 static void 
 NVSetPortDefaults (ScrnInfoPtr pScrnInfo, NVPortPrivPtr pPriv)
 {
@@ -155,9 +171,12 @@ NVSetPortDefaults (ScrnInfoPtr pScrnInfo, NVPortPrivPtr pPriv)
 	pPriv->iturbt_709		= FALSE;
 }
 
-
+/**
+ * NVResetVideo
+ * writes the current attributes from the overlay port to the hardware
+ */
 void 
-NVResetVideo (ScrnInfoPtr pScrnInfo)
+NVResetVideo(ScrnInfoPtr pScrnInfo)
 {
 	NVPtr          pNv     = NVPTR(pScrnInfo);
 	NVPortPrivPtr  pPriv   = GET_OVERLAY_PRIVATE(pNv);
@@ -184,8 +203,10 @@ NVResetVideo (ScrnInfoPtr pScrnInfo)
 	nvWriteVIDEO(pNv, NV_PVIDEO_COLOR_KEY, pPriv->colorKey);
 }
 
-
-
+/**
+ * NVStopOverlay
+ * Tell the hardware to stop the overlay
+ */
 static void 
 NVStopOverlay (ScrnInfoPtr pScrnInfo)
 {
@@ -194,6 +215,30 @@ NVStopOverlay (ScrnInfoPtr pScrnInfo)
 	nvWriteVIDEO(pNv, NV_PVIDEO_STOP, 1);
 }
 
+/**
+ * NVAllocateOverlayMemory
+ * allocates memory
+ * 
+ * - why does the funciton have "Overlay" in its name? It does not
+ * have anything "Overlay"-specific in its function body and it is called by
+ * non-"Overlay"-specific functions.
+ * TODO: rename to something like NVAllocateVideoMemory or NVAllocateXvMemory
+ * - the function only (re-)allocates memory if it absolutely necessary,
+ * that is, if the requested size is larger than the current size. that means,
+ * that the size of allocated memory never shrinks, even if the requested
+ * does. from a performance point of view this is most likely the best
+ * alternative. but how often does the requested size of memory for video
+ * playback change? whenever video-size/scaling changes? probably not very
+ * often. so maybe sacrifice a tiny bit of performance (whenever the video is
+ * rescaled) and not waste (RAM-)resources?
+ * - the function makes assumptions about the XAA fb manager being used. isn't
+ * there a way to check? what aboaut EXA?
+ * 
+ * @param pScrn screen which requests the memory
+ * @param mem pointer to previously allocated memory for reallocation
+ * @param size size of requested memory segment
+ * @return pointer to the allocated memory
+ */
 static NVAllocRec *
 NVAllocateOverlayMemory(ScrnInfoPtr pScrn, NVAllocRec *mem, int size)
 {
@@ -206,7 +251,7 @@ NVAllocateOverlayMemory(ScrnInfoPtr pScrn, NVAllocRec *mem, int size)
 	size *= (pScrn->bitsPerPixel >> 3);
 
 	if(mem) {
-		if(mem->size >= size) 
+		if(mem->size >= size) // if(mem->size == size)
 			return mem;
 		NVFreeMemory(pNv, mem);
 	}
@@ -214,6 +259,13 @@ NVAllocateOverlayMemory(ScrnInfoPtr pScrn, NVAllocRec *mem, int size)
 	return NVAllocateMemory(pNv, NOUVEAU_MEM_FB, size); /* align 32? */
 }
 
+/**
+ * NVFreeOverlayMemory
+ * frees memory held by the overlay port
+ * this function (unlike NVAllocateOverlayMemory) is "Overlay"-specific
+ * 
+ * @param pScrnInfo screen whose overlay port wants to free memory
+ */
 static void
 NVFreeOverlayMemory(ScrnInfoPtr pScrnInfo)
 {
@@ -226,7 +278,12 @@ NVFreeOverlayMemory(ScrnInfoPtr pScrnInfo)
 	}
 }
 
-
+/**
+ * NVFreeBlitMemory
+ * frees memory held by the blit port
+ * 
+ * @param pScrnInfo screen whose blit port wants to free memory
+ */
 static void
 NVFreeBlitMemory(ScrnInfoPtr pScrnInfo)
 {
@@ -239,6 +296,11 @@ NVFreeBlitMemory(ScrnInfoPtr pScrnInfo)
 	}
 }
 
+/**
+ * NVVideoTimerCallback
+ * callback function which perform cleanup tasks (stop overlay, free memory).
+ * within the driver it is only called once from NVBlockHandler in nv_driver.c
+ */
 static void
 NVVideoTimerCallback(ScrnInfoPtr pScrnInfo, Time currentTime)
 {
@@ -291,6 +353,27 @@ NVVideoTimerCallback(ScrnInfoPtr pScrnInfo, Time currentTime)
 	pNv->VideoTimerCallback = needCallback ? NVVideoTimerCallback : NULL;
 }
 
+/**
+ * NVPutOverlayImage
+ * program hardware to overlay image into front buffer
+ * 
+ * @param pScrnInfo screen
+ * @param src_offset
+ * @param id colorspace of image
+ * @param src_pitch
+ * @param dstBox
+ * @param x1
+ * @param y1
+ * @param x2
+ * @param y2
+ * @param width
+ * @param height
+ * @param src_w
+ * @param src_h
+ * @param drw_w
+ * @param drw_h
+ * @param clipBoxes
+ */
 static void
 NVPutOverlayImage(ScrnInfoPtr pScrnInfo, int offset, int id,
 		  int dstPitch, BoxPtr dstBox,
@@ -358,6 +441,30 @@ extern Bool exaPixmapIsOffscreen(PixmapPtr p);
 extern void exaMoveInPixmap(PixmapPtr pPixmap);
 #endif
 
+/**
+ * NVPutBlitImage
+ * uses the DMA controller of the GPU to blit
+ * (block transfer) image from an offscreen buffer into
+ * the color buffer
+ * 
+ * @param pScrnInfo screen
+ * @param src_offset
+ * @param id colorspace of image
+ * @param src_pitch
+ * @param dstBox
+ * @param x1
+ * @param y1
+ * @param x2
+ * @param y2
+ * @param width
+ * @param height
+ * @param src_w
+ * @param src_h
+ * @param drw_w
+ * @param drw_h
+ * @param clipBoxes
+ * @param pDraw
+ */
 static void
 NVPutBlitImage(ScrnInfoPtr pScrnInfo, int src_offset, int id,
 	       int src_pitch, BoxPtr dstBox,
@@ -530,11 +637,29 @@ NVStopOverlayVideo(ScrnInfoPtr pScrnInfo, pointer data, Bool Exit)
 	}
 }
 
+/**
+ * NVStopBlitVideo
+ * TODO ?
+ */
 static void
 NVStopBlitVideo(ScrnInfoPtr pScrnInfo, pointer data, Bool Exit)
 {
 }
 
+/**
+ * NVSetOverlayPortAttribute
+ * sets the attribute "attribute" of port "data" to value "value"
+ * calls NVResetVideo(pScrnInfo) to apply changes to hardware
+ * 
+ * @param pScrenInfo
+ * @param attribute attribute to set
+ * @param value value to which attribute is to be set
+ * @param data port from which the attribute is to be set
+ * 
+ * @return Success, if setting is successful
+ * BadValue/BadMatch, if value/attribute are invalid
+ * @see NVResetVideo(ScrnInfoPtr pScrnInfo)
+ */
 static int
 NVSetOverlayPortAttribute(ScrnInfoPtr pScrnInfo, Atom attribute,
 			  INT32 value, pointer data)
@@ -590,7 +715,15 @@ NVSetOverlayPortAttribute(ScrnInfoPtr pScrnInfo, Atom attribute,
 	return Success;
 }
 
-
+/**
+ * NVGetOverlayPortAttribute
+ * 
+ * @param pScrnInfo unused
+ * @param attribute attribute to be read
+ * @param value value of attribute will be stored in this pointer
+ * @param data port from which attribute will be read
+ * @return Success, if queried attribute exists
+ */
 static int
 NVGetOverlayPortAttribute(ScrnInfoPtr pScrnInfo, Atom attribute,
 			  INT32 *value, pointer data)
@@ -619,6 +752,21 @@ NVGetOverlayPortAttribute(ScrnInfoPtr pScrnInfo, Atom attribute,
 	return Success;
 }
 
+/**
+ * NVSetBlitPortAttribute
+ * sets the attribute "attribute" of port "data" to value "value"
+ * supported attributes:
+ * - xvSyncToVBlank (values: 0,1)
+ * - xvSetDefaults (values: NA; SyncToVBlank will be set, if hardware supports it)
+ * 
+ * @param pScrenInfo
+ * @param attribute attribute to set
+ * @param value value to which attribute is to be set
+ * @param data port from which the attribute is to be set
+ * 
+ * @return Success, if setting is successful
+ * BadValue/BadMatch, if value/attribute are invalid
+ */
 static int
 NVSetBlitPortAttribute(ScrnInfoPtr pScrnInfo, Atom attribute,
 		       INT32 value, pointer data)
@@ -639,6 +787,17 @@ NVSetBlitPortAttribute(ScrnInfoPtr pScrnInfo, Atom attribute,
 	return Success;
 }
 
+/**
+ * NVGetBlitPortAttribute
+ * reads the value of attribute "attribute" from port "data" into INT32 "*value"
+ * currently only one attribute supported: xvSyncToVBlank
+ * 
+ * @param pScrnInfo unused
+ * @param attribute attribute to be read
+ * @param value value of attribute will be stored here
+ * @param data port from which attribute will be read
+ * @return Success, if queried attribute exists
+ */
 static int
 NVGetBlitPortAttribute(ScrnInfoPtr pScrnInfo, Atom attribute,
 		       INT32 *value, pointer data)
@@ -654,8 +813,28 @@ NVGetBlitPortAttribute(ScrnInfoPtr pScrnInfo, Atom attribute,
 }
 
 
-/*
+/**
  * QueryBestSize
+ * used by client applications to ask the driver:
+ * how would you actually scale a video of dimensions
+ * vid_w, vid_h, if i wanted you to scale it to dimensions
+ * drw_w, drw_h?
+ * function stores actual scaling size in pointers p_w, p_h.
+ * 
+ * - currently the image cannot be scaled to less than
+ * 1/8th of the original size in either dimension. why?
+ * - what happens if the client requests a scaling to a larger value than
+ * the hardware is capable of (IMAGE_MAX_W, IMAGE_MAX_H)?
+ * 
+ * @param pScrnInfo unused
+ * @param motion unused
+ * @param vid_w width of source video
+ * @param vid_h height of source video
+ * @param drw_w desired scaled width as requested by client
+ * @param drw_h desired scaled height as requested by client
+ * @param p_w actual scaled width as the driver is capable of
+ * @param p_h actual scaled height as the driver is capable of
+ * @param data unused
  */
 static void
 NVQueryBestSize(ScrnInfoPtr pScrnInfo, Bool motion,
@@ -673,6 +852,22 @@ NVQueryBestSize(ScrnInfoPtr pScrnInfo, Bool motion,
 	*p_h = drw_h; 
 }
 
+/**
+ * NVCopyData420
+ * TODO: use DMA instead of CPU copy
+ * used by NVPutImage() function to copy (image)data from
+ * system RAM to VRAM and change data order.
+ * 
+ * @param src1 source buffer (luma ?)
+ * @param src2 source buffer (chroma1 ?)
+ * @param src3 source buffer (chroma2 ?)
+ * @param dst1 destination buffer
+ * @param srcPitch pitch of src1
+ * @param srcPitch2 pitch of src2, src3
+ * @param dstPitch pitch of dst1
+ * @param h number of lines to copy
+ * @param w length of lines to copy
+ */
 static void NVCopyData420(unsigned char *src1, unsigned char *src2,
 			  unsigned char *src3, unsigned char *dst1,
 			  int srcPitch, int srcPitch2,
@@ -690,7 +885,7 @@ static void NVCopyData420(unsigned char *src1, unsigned char *src2,
 		s1 = src1;  s2 = src2;  s3 = src3;
 		i = w;
 
-		while (i > 4) {
+		while (i > 4) { // wouldn't it be better to write (i >= 4) ?
 #if X_BYTE_ORDER == X_BIG_ENDIAN
 		dst[0] = (s1[0] << 24) | (s1[1] << 8) | (s3[0] << 16) | s2[0];
 		dst[1] = (s1[2] << 24) | (s1[3] << 8) | (s3[1] << 16) | s2[1];
@@ -725,7 +920,15 @@ static void NVCopyData420(unsigned char *src1, unsigned char *src2,
 	}
 }
 
-
+/**
+ * NVMoveDWORDS
+ * TODO: use DMA instead of CPU copy
+ * copy "dwords" * 32 bits from "src" to "dest"
+ * 
+ * @param dest destination pointer
+ * @param src source pointer
+ * @param dwords size (32bit units)
+ */
 static void
 NVMoveDWORDS(CARD32* dest, CARD32* src, int dwords)
 {
@@ -753,6 +956,15 @@ NVMoveDWORDS(CARD32* dest, CARD32* src, int dwords)
 }
 
 #if X_BYTE_ORDER == X_BIG_ENDIAN
+/**
+ * NVMoveDWORDSSwapped
+ * TODO: use DMA instead of CPU copy
+ * copy "dwords" * 32 bits from "src" to "dest" on big endian plattforms
+ * 
+ * @param dest destination pointer
+ * @param src source pointer
+ * @param dwords size (32bit units)
+ */
 static void
 NVMoveDWORDSSwapped(CARD32* dest, CARD8* src, int dwords)
 {
@@ -763,6 +975,19 @@ NVMoveDWORDSSwapped(CARD32* dest, CARD8* src, int dwords)
 }
 #endif
 
+/**
+ * NVCopyData422
+ * TODO: use DMA instead of CPU copy
+ * used by NVPutImage() function to copy (image)data from
+ * system RAM to VRAM.
+ * 
+ * @param src source buffer 
+ * @param dst destination buffer
+ * @param srcPitch pitch of src
+ * @param dstPitch pitch of dst
+ * @param h number of lines to copy
+ * @param w length of lines to copy
+ */
 static void
 NVCopyData422(unsigned char *src, unsigned char *dst,
 	      int srcPitch, int dstPitch,
@@ -776,6 +1001,19 @@ NVCopyData422(unsigned char *src, unsigned char *dst,
 	}
 }
 
+/**
+ * NVCopyDataRGB
+ * TODO: use DMA instead of CPU copy
+ * used by NVPutImage() function to copy (image)data from
+ * system RAM to VRAM.
+ * 
+ * @param src source buffer 
+ * @param dst destination buffer
+ * @param srcPitch pitch of src
+ * @param dstPitch pitch of dst
+ * @param h number of lines to copy
+ * @param w length of lines to copy
+ */
 static void
 NVCopyDataRGB(unsigned char *src, unsigned char *dst,
 	      int srcPitch, int dstPitch,
@@ -793,8 +1031,30 @@ NVCopyDataRGB(unsigned char *src, unsigned char *dst,
 }
 
 
-/*
- * PutImage
+/**
+ * NVPutImage
+ * PutImage is "the" important function of the Xv extention.
+ * a client (e.g. video player) calls this function for every
+ * image (of the video) to be displayed. this function then
+ * scales and displays the image.
+ * 
+ * @param pScrnInfo screen which hold the port where the image is put
+ * @param src_x
+ * @param src_y
+ * @param src_w
+ * @param src_h
+ * @param drw_x
+ * @param drw_y
+ * @param drw_w
+ * @param drw_h
+ * @param id colorspace of image
+ * @param buf pointer to buffer containing the source image
+ * @param width
+ * @param height
+ * @param Sync unused
+ * @param clipBoxes
+ * @param data pointer to port 
+ * @param pDraw
  */
 static int
 NVPutImage(ScrnInfoPtr  pScrnInfo, short src_x, short src_y,
@@ -863,7 +1123,10 @@ NVPutImage(ScrnInfoPtr  pScrnInfo, short src_x, short src_y,
 		dstBox.y2 -= pScrnInfo->frameY0;
 	}
 
-	bpp = pScrnInfo->bitsPerPixel >> 3;
+	
+	/* determine required memory size */
+	
+	bpp = pScrnInfo->bitsPerPixel >> 3; // bytes per pixel
 
 	switch(id) {
 	case FOURCC_YV12:
@@ -886,15 +1149,21 @@ NVPutImage(ScrnInfoPtr  pScrnInfo, short src_x, short src_y,
 	default:
 		return BadImplementation;
 	}
+	/* dstPitch = number of bytes (used + padding) per row
+	 * so dstPitch / bpp = number of pixels (used + padding) per row
+	 * so newSize = number of pixels for which we have to allocate RAM */
 	newSize = height * dstPitch / bpp;
 
-	if (pPriv->doubleBuffer)
-		newSize <<= 1;
+	if (pPriv->doubleBuffer) // double buffering ...
+		newSize <<= 1; // ... means double the amount of RAM needed
 
+	/* here we allocate RAM for "newSize" pixels, the function will make
+	 * automatically make this right amount of bytes */
 	pPriv->video_mem = NVAllocateOverlayMemory(pScrnInfo, pPriv->video_mem, 
 							      newSize);
 	if (!pPriv->video_mem)
 		return BadAlloc;
+	/* allocating finished */
 
 	offset = pPriv->video_mem->offset;
 	if (pPriv->doubleBuffer) {
@@ -1004,8 +1273,28 @@ NVPutImage(ScrnInfoPtr  pScrnInfo, short src_x, short src_y,
 
 	return Success;
 }
-/*
+
+/**
  * QueryImageAttributes
+ * 
+ * calculates
+ * - size (memory required to store image),
+ * - pitches,
+ * - offsets
+ * of image
+ * depending on colorspace (id) and dimensions (w,h) of image
+ * values of
+ * - w,
+ * - h
+ * may be adjusted as needed
+ * 
+ * @param pScrnInfo unused
+ * @param id colorspace of image
+ * @param w pointer to width of image
+ * @param h pointer to height of image
+ * @param pitches pitches[i] = length of a scanline in plane[i]
+ * @param offsets offsets[i] = offset of plane i from the beginning of the image
+ * @return size of the memory required for the XvImage queried
  */
 static int
 NVQueryImageAttributes(ScrnInfoPtr pScrnInfo, int id, 
@@ -1014,46 +1303,46 @@ NVQueryImageAttributes(ScrnInfoPtr pScrnInfo, int id,
 {
 	int size, tmp;
 
-	if (*w > 2046)
-		*w = 2046;
-	if (*h > 2046)
-		*h = 2046;
+	if (*w > IMAGE_MAX_W)
+		*w = IMAGE_MAX_W;
+	if (*h > IMAGE_MAX_H)
+		*h = IMAGE_MAX_H;
 
-	*w = (*w + 1) & ~1;
+	*w = (*w + 1) & ~1; // width rounded up to an even number
 	if (offsets)
 		offsets[0] = 0;
 
 	switch (id) {
 	case FOURCC_YV12:
 	case FOURCC_I420:
-		*h = (*h + 1) & ~1;
-		size = (*w + 3) & ~3;
+		*h = (*h + 1) & ~1; // height rounded up to an even number
+		size = (*w + 3) & ~3; // width rounded up to a multiple of 4
 		if (pitches)
-			pitches[0] = size;
+			pitches[0] = size; // width rounded up to a multiple of 4
 		size *= *h;
 		if (offsets)
-			offsets[1] = size;
-		tmp = ((*w >> 1) + 3) & ~3;
+			offsets[1] = size; // number of pixels in "rounded up" image
+		tmp = ((*w >> 1) + 3) & ~3; // width/2 rounded up to a multiple of 4
 		if (pitches)
-			pitches[1] = pitches[2] = tmp;
-		tmp *= (*h >> 1);
-		size += tmp;
+			pitches[1] = pitches[2] = tmp; // width/2 rounded up to a multiple of 4
+		tmp *= (*h >> 1); // 1/4*number of pixels in "rounded up" image
+		size += tmp; // 5/4*number of pixels in "rounded up" image
 		if (offsets)
-			offsets[2] = size;
-		size += tmp;
+			offsets[2] = size; // 5/4*number of pixels in "rounded up" image
+		size += tmp; // = 3/2*number of pixels in "rounded up" image
 		break;
 	case FOURCC_UYVY:
 	case FOURCC_YUY2:
-		size = *w << 1;
+		size = *w << 1; // 2*width
 		if (pitches)
-			pitches[0] = size;
-		size *= *h;
+			pitches[0] = size; // 2*width
+		size *= *h; // 2*width*height
 		break;
 	case FOURCC_RGB:
-		size = *w << 2;
+		size = *w << 2; // 4*width (32 bit per pixel)
 		if (pitches)
-			pitches[0] = size;
-		size *= *h;
+			pitches[0] = size; // 4*width
+		size *= *h; // 4*width*height
 		break;
 	default:
 		*w = *h = size = 0;
@@ -1080,7 +1369,7 @@ NVAllocSurface(ScrnInfoPtr pScrnInfo, int id,
 	if (pPriv->grabbedByV4L)
 		return BadAlloc;
 
-	if ((w > 2046) || (h > 2046))
+	if ((w > IMAGE_MAX_W) || (h > IMAGE_MAX_H))
 		return BadValue;
 
 	w = (w + 1) & ~1;
@@ -1210,6 +1499,12 @@ NVDisplaySurface(XF86SurfacePtr surface,
 	return Success;
 }
 
+/**
+ * NVSetupBlitVideo
+ * this function does all the work setting up a blit port
+ * 
+ * @return blit port
+ */
 static XF86VideoAdaptorPtr
 NVSetupBlitVideo (ScreenPtr pScreen)
 {
@@ -1272,6 +1567,13 @@ NVSetupBlitVideo (ScreenPtr pScreen)
 	return adapt;
 }
 
+/**
+ * NV10SetupOverlayVideo
+ * this function does all the work setting up an overlay port
+ * 
+ * @return overlay port
+ * @see NVResetVideo(ScrnInfoPtr pScrnInfo)
+ */
 static XF86VideoAdaptorPtr 
 NV10SetupOverlayVideo(ScreenPtr pScreen)
 {
@@ -1351,7 +1653,7 @@ XF86OffscreenImageRec NVOffscreenImages[2] = {
 		NVStopSurface,
 		NVGetSurfaceAttribute,
 		NVSetSurfaceAttribute,
-		2046, 2046,
+		IMAGE_MAX_W, IMAGE_MAX_H,
 		NUM_OVERLAY_ATTRIBUTES - 1,
 		&NVOverlayAttributes[1]
 	},
@@ -1364,7 +1666,7 @@ XF86OffscreenImageRec NVOffscreenImages[2] = {
 		NVStopSurface,
 		NVGetSurfaceAttribute,
 		NVSetSurfaceAttribute,
-		2046, 2046,
+		IMAGE_MAX_W, IMAGE_MAX_H,
 		NUM_OVERLAY_ATTRIBUTES - 1,
 		&NVOverlayAttributes[1]
 	}
@@ -1376,6 +1678,15 @@ NVInitOffscreenImages (ScreenPtr pScreen)
 	xf86XVRegisterOffscreenImages(pScreen, NVOffscreenImages, 2);
 }
 
+/**
+ * NVChipsetHasOverlay
+ * 
+ * newer chips don't support overlay anymore.
+ * overlay feature is emulated via textures.
+ * 
+ * @param pNv 
+ * @return true, if chipset supports overlay
+ */
 static Bool
 NVChipsetHasOverlay(NVPtr pNv)
 {
@@ -1395,6 +1706,16 @@ NVChipsetHasOverlay(NVPtr pNv)
 	return FALSE;
 }
 
+/**
+ * NVSetupOverlayVideo
+ * check if chipset supports Overlay and CompositeExtension is disabled.
+ * if so, setup overlay port
+ * 
+ * @return overlay port
+ * @see NVChipsetHasOverlay(NVPtr pNv)
+ * @see NV10SetupOverlayVideo(ScreenPtr pScreen)
+ * @see NVInitOffscreenImages(ScreenPtr pScreen)
+ */
 static XF86VideoAdaptorPtr
 NVSetupOverlayVideo(ScreenPtr pScreen)
 {
@@ -1423,6 +1744,15 @@ NVSetupOverlayVideo(ScreenPtr pScreen)
 	return overlayAdaptor;
 }
 
+/**
+ * NVInitVideo
+ * tries to initialize one new overlay port and one new blit port
+ * and add them to the list of ports on screen "pScreen".
+ * 
+ * @param pScreen
+ * @see NVSetupOverlayVideo(ScreenPtr pScreen)
+ * @see NVSetupBlitVideo(ScreenPtr pScreen)
+ */
 void NVInitVideo (ScreenPtr pScreen)
 {
 	ScrnInfoPtr          pScrn = xf86Screens[pScreen->myNum];
-- 
1.5.0.7


--Multipart=_Thu__31_May_2007_01_51_20_+0200_VhEFSIFhCBVjMJ8F
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--Multipart=_Thu__31_May_2007_01_51_20_+0200_VhEFSIFhCBVjMJ8F--
