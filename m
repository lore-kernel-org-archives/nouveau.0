From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nv50/exa: wait for enough space for at least one
	composite operation
Date: Sun,  6 Nov 2011 20:32:09 +0100
Message-ID: <1320607930-21794-7-git-send-email-marcin.slusarz@gmail.com>
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
 src/nv50_exa.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/nv50_exa.c b/src/nv50_exa.c
index b6094ae..6f753f2 100644
--- a/src/nv50_exa.c
+++ b/src/nv50_exa.c
@@ -838,7 +838,7 @@ NV50EXAPrepareComposite(int op,
 	NV50EXA_LOCALS(pspix);
 	const unsigned shd_flags = NOUVEAU_BO_VRAM | NOUVEAU_BO_RD;
 
-	if (MARK_RING (chan, 128, 4 + 2 + 2 * 10))
+	if (MARK_RING (chan, 144, 4 + 2 + 2 * 10))
 		NOUVEAU_FALLBACK("ring space\n");
 
 	BEGIN_RING(chan, eng2d, 0x0110, 1);
@@ -949,7 +949,7 @@ NV50EXAComposite(PixmapPtr pdpix, int sx, int sy, int mx, int my,
 	NV50EXA_LOCALS(pdpix);
 	float sX0, sX1, sX2, sY0, sY1, sY2;
 
-	WAIT_RING (chan, 64);
+	WAIT_RING (chan, 28);
 	BEGIN_RING(chan, tesla, NV50TCL_SCISSOR_HORIZ(0), 2);
 	OUT_RING  (chan, (dx + w) << 16 | dx);
 	OUT_RING  (chan, (dy + h) << 16 | dy);
-- 
1.7.7
