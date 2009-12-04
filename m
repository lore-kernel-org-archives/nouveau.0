From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nouveau: avoid running out of relocs
Date: Fri,  4 Dec 2009 22:59:40 +0100
Message-ID: <1259963980-6698-1-git-send-email-madman2003@gmail.com>
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

Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/gallium/drivers/nouveau/nouveau_stateobj.h |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_stateobj.h b/src/gallium/drivers/nouveau/nouveau_stateobj.h
index b595405..28f483f 100644
--- a/src/gallium/drivers/nouveau/nouveau_stateobj.h
+++ b/src/gallium/drivers/nouveau/nouveau_stateobj.h
@@ -113,8 +113,10 @@ so_emit(struct nouveau_channel *chan, struct nouveau_stateobj *so)
 	unsigned nr, i;
 
 	nr = so->cur - so->push;
-	if (pb->remaining < nr)
-		nouveau_pushbuf_flush(chan, nr);
+	/* This will flush if we need space.
+	 * We don't actually need the marker.
+	 */
+	nouveau_pushbuf_marker_emit(chan, nr, so->cur_reloc);
 	pb->remaining -= nr;
 
 	memcpy(pb->cur, so->push, nr * 4);
@@ -138,8 +140,10 @@ so_emit_reloc_markers(struct nouveau_channel *chan, struct nouveau_stateobj *so)
 		return;
 
 	i = so->cur_reloc << 1;
-	if (pb->remaining < i)
-		nouveau_pushbuf_flush(chan, i);
+	/* This will flush if we need space.
+	 * We don't actually need the marker.
+	 */
+	nouveau_pushbuf_marker_emit(chan, i, i);
 	pb->remaining -= i;
 
 	for (i = 0; i < so->cur_reloc; i++) {
-- 
1.6.5.3
