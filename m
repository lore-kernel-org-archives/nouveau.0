From: Victor Stinner <victor.stinner-XgyrR7WU8tJ8UrSeD/g0lQ@public.gmane.org>
Subject: [PATCH] Use more constants in nv50_transfer_rect_m2mf()
Date: Sat, 07 Mar 2009 00:47:53 +0100
Message-ID: <49B1B629.2000404@haypocalc.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------030401030702030802040708"
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

This is a multi-part message in MIME format.
--------------030401030702030802040708
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Short patch to replace 0x... by NV50_MEMORY_TO_MEMORY_FORMAT_...

I also attached a patch to renouveau.xml creating the required 
constants. marcheu told me that I should be able to commit to renouveau, 
i will try to do that this week-end.

--------------030401030702030802040708
Content-Type: text/x-patch;
 name="0004-Use-more-constants-in-nv50_transfer_rect_m2mf.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0004-Use-more-constants-in-nv50_transfer_rect_m2mf.patch"

From a1058f2d2d2f0f508fdd03e46be4456dad82fbc4 Mon Sep 17 00:00:00 2001
From: Victor Stinner <victor.stinner-XgyrR7WU8tJ8UrSeD/g0lQ@public.gmane.org>
Date: Sat, 7 Mar 2009 00:44:24 +0100
Subject: [PATCH] Use more constants in nv50_transfer_rect_m2mf()

---
 src/gallium/drivers/nv50/nv50_transfer.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_transfer.c b/src/gallium/drivers/nv50/nv50_transfer.c
index 747195b..8cc8af8 100644
--- a/src/gallium/drivers/nv50/nv50_transfer.c
+++ b/src/gallium/drivers/nv50/nv50_transfer.c
@@ -38,7 +38,7 @@ nv50_transfer_rect_m2mf(struct pipe_screen *pscreen, struct pipe_buffer *src,
 	if (!src_bo->tiled) {
 		BEGIN_RING(chan, m2mf, 0x0200, 1);
 		OUT_RING  (chan, 1);
-		BEGIN_RING(chan, m2mf, 0x0314, 1);
+		BEGIN_RING(chan, m2mf, NV50_MEMORY_TO_MEMORY_FORMAT_PITCH_IN, 1);
 		OUT_RING  (chan, src_pitch);
 		src_offset = (sy * src_pitch) + (sx * cpp);
 	} else {
@@ -54,7 +54,7 @@ nv50_transfer_rect_m2mf(struct pipe_screen *pscreen, struct pipe_buffer *src,
 	if (!dst_bo->tiled) {
 		BEGIN_RING(chan, m2mf, 0x021c, 1);
 		OUT_RING  (chan, 1);
-		BEGIN_RING(chan, m2mf, 0x0318, 1);
+		BEGIN_RING(chan, m2mf, NV50_MEMORY_TO_MEMORY_FORMAT_PITCH_OUT, 1);
 		OUT_RING  (chan, dst_pitch);
 		dst_offset = (dy * dst_pitch) + (dx * cpp);
 	} else {
@@ -71,10 +71,10 @@ nv50_transfer_rect_m2mf(struct pipe_screen *pscreen, struct pipe_buffer *src,
 		int line_count = height > 2047 ? 2047 : height;
 
 		WAIT_RING (chan, 15);
-		BEGIN_RING(chan, m2mf, 0x0238, 2);
+		BEGIN_RING(chan, m2mf, NV50_MEMORY_TO_MEMORY_FORMAT_OFFSET_IN_HIGH, 2);
 		OUT_RELOCh(chan, src_bo, src_offset, src_reloc);
 		OUT_RELOCh(chan, dst_bo, dst_offset, dst_reloc);
-		BEGIN_RING(chan, m2mf, 0x030c, 2);
+		BEGIN_RING(chan, m2mf, NV50_MEMORY_TO_MEMORY_FORMAT_OFFSET_IN, 2);
 		OUT_RELOCl(chan, src_bo, src_offset, src_reloc);
 		OUT_RELOCl(chan, dst_bo, dst_offset, dst_reloc);
 		if (src_bo->tiled) {
@@ -89,7 +89,7 @@ nv50_transfer_rect_m2mf(struct pipe_screen *pscreen, struct pipe_buffer *src,
 		} else {
 			dst_offset += (line_count * dst_pitch);
 		}
-		BEGIN_RING(chan, m2mf, 0x031c, 4);
+		BEGIN_RING(chan, m2mf, NV50_MEMORY_TO_MEMORY_FORMAT_LINE_LENGTH_IN, 4);
 		OUT_RING  (chan, width * cpp);
 		OUT_RING  (chan, line_count);
 		OUT_RING  (chan, 0x00000101);
-- 
1.5.6.3


--------------030401030702030802040708
Content-Type: text/x-patch;
 name="renouveau.xml.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="renouveau.xml.patch"

Index: renouveau.xml
===================================================================
RCS file: /cvsroot/nouveau/renouveau/renouveau.xml,v
retrieving revision 1.238
diff -u -b -r1.238 renouveau.xml
--- renouveau.xml	2 Sep 2008 01:40:10 -0000	1.238
+++ renouveau.xml	6 Mar 2009 23:43:05 -0000
@@ -4231,6 +4231,12 @@
     <reg32 offset="0x021c"/>
     <reg32 offset="0x0238" name="OFFSET_IN_HIGH" type="hexa"/>
     <reg32 offset="0x023c" name="OFFSET_OUT_HIGH" type="hexa"/>
+    <reg32 offset="0x030c" name="OFFSET_IN" type="hexa"/>
+    <reg32 offset="0x0310" name="OFFSET_OUT" type="hexa"/>
+    <reg32 offset="0x0314" name="PITCH_IN" type="int"/>
+    <reg32 offset="0x0318" name="PITCH_OUT" type="int"/>
+    <reg32 offset="0x031c" name="LINE_LENGTH_IN" type="int"/>
+    <reg32 offset="0x0320" name="LINE_COUNT" type="int"/>
   </object>
 
   <object id="0x5097" name="NV50TCL">

--------------030401030702030802040708
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------030401030702030802040708--
