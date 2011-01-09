From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [libdrm PATCH 1/3] nouveau: remove unused OUT_RELOC2 and
	OUT_RELOCr
Date: Sun,  9 Jan 2011 18:30:58 +0100
Message-ID: <1294594263-1862-1-git-send-email-marcin.slusarz@gmail.com>
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
List-Id: nouveau.vger.kernel.org

---
 nouveau/nouveau_pushbuf.h |   17 -----------------
 1 files changed, 0 insertions(+), 17 deletions(-)

diff --git a/nouveau/nouveau_pushbuf.h b/nouveau/nouveau_pushbuf.h
index 2a98789..70d0f28 100644
--- a/nouveau/nouveau_pushbuf.h
+++ b/nouveau/nouveau_pushbuf.h
@@ -109,15 +109,6 @@ OUT_RELOC(struct nouveau_channel *chan, struct nouveau_bo *bo,
 					  data, 0, flags, vor, tor);
 }
 
-static __inline__ int
-OUT_RELOC2(struct nouveau_channel *chan, struct nouveau_bo *bo,
-	   unsigned data, unsigned data2, unsigned flags,
-	   unsigned vor, unsigned tor)
-{
-	return nouveau_pushbuf_emit_reloc(chan, chan->cur++, bo,
-					  data, data2, flags, vor, tor);
-}
-
 /* Raw data + flags depending on FB/TT buffer */
 static __inline__ int
 OUT_RELOCd(struct nouveau_channel *chan, struct nouveau_bo *bo,
@@ -143,14 +134,6 @@ OUT_RELOCl(struct nouveau_channel *chan, struct nouveau_bo *bo,
 	return OUT_RELOC(chan, bo, delta, flags | NOUVEAU_BO_LOW, 0, 0);
 }
 
-/* Low 32-bits of offset + GPU linear access range info */
-static __inline__ int
-OUT_RELOCr(struct nouveau_channel *chan, struct nouveau_bo *bo,
-	   unsigned delta, unsigned size, unsigned flags)
-{
-	return OUT_RELOC2(chan, bo, delta, size, flags | NOUVEAU_BO_LOW, 0, 0);
-}
-
 /* High 32-bits of offset */
 static __inline__ int
 OUT_RELOCh(struct nouveau_channel *chan, struct nouveau_bo *bo,
-- 
1.7.3.3
