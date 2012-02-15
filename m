From: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Subject: [PATCH 7/9] dri2: Allow vblank controlled swaps for
	redirected windows. Part II
Date: Thu, 16 Feb 2012 00:45:22 +0100
Message-ID: <1329349524-11650-8-git-send-email-mario.kleiner@tuebingen.mpg.de>
References: <1329349524-11650-1-git-send-email-mario.kleiner@tuebingen.mpg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1329349524-11650-1-git-send-email-mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
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
Cc: xorg-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org
List-Id: nouveau.vger.kernel.org

This part implements proper throttling for clients. For
vblank synchronized blits, it defers DRI2SwapComplete()
until 1 vblank after the framebuffer blit is submitted to
the gpu.

Rationale:

For unredirected windows, this is the earliest time the
"blit swap" can complete, as blits are submitted one vblank
before the target vblank and synchronized with vblank in the
gpu. This makes swap completion timestamps at least reasonable.

For redirected windows, the compositor will probably pick
up the "blit swapped" frontbuffer pixmap of the window quickly,
but defer its own recomposition to the next vblank, at least
if sync to vblank for the compositor is on.

Signed-off-by: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
---
 src/nouveau_dri2.c |   32 +++++++++++++++++++++++++++++---
 1 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/src/nouveau_dri2.c b/src/nouveau_dri2.c
index 6a0800c..fdc5148 100644
--- a/src/nouveau_dri2.c
+++ b/src/nouveau_dri2.c
@@ -135,6 +135,7 @@ nouveau_dri2_copy_region(DrawablePtr pDraw, RegionPtr pRegion,
 struct nouveau_dri2_vblank_state {
 	enum {
 		SWAP,
+		BLIT,
 		WAIT
 	} action;
 
@@ -342,6 +343,22 @@ nouveau_dri2_finish_swap(DrawablePtr draw, unsigned int frame,
 
 		REGION_TRANSLATE(0, &reg, -draw->x, -draw->y);
 		nouveau_dri2_copy_region(draw, &reg, s->dst, s->src);
+
+		if (can_sync_to_vblank(draw)) {
+			/* Request a vblank event one vblank from now, the most
+			 * likely (optimistic?) time a direct framebuffer blit
+			 * will complete or a desktop compositor will update its
+			 * screen. This defers DRI2SwapComplete() to the earliest
+			 * likely time of real swap completion.
+			 */
+			s->action = BLIT;
+			ret = nouveau_wait_vblank(draw, DRM_VBLANK_EVENT |
+						  DRM_VBLANK_RELATIVE, 1,
+						  NULL, NULL, s);
+			/* Done, if success. Otherwise use fallback below. */
+			if (!ret)
+				return;
+		}
 	}
 
 	/*
@@ -351,8 +368,9 @@ nouveau_dri2_finish_swap(DrawablePtr draw, unsigned int frame,
 	 *
 	 * XXX - The DRI2SwapLimit() API allowed us to move this to
 	 *	 the flip handler with no FPS hit for page flipped swaps.
-	 *       It is still needed for copy swaps as we lack a method
-	 *       to detect true swap completion for DRI2_BLIT_COMPLETE.
+	 *       It is still needed as a fallback for some copy swaps as
+	 *       we lack a method to detect true swap completion for
+	 *       DRI2_BLIT_COMPLETE.
 	 */
 	DRI2SwapComplete(s->client, draw, frame, tv_sec, tv_usec,
 			 type, s->func, s->data);
@@ -505,8 +523,10 @@ nouveau_dri2_vblank_handler(int fd, unsigned int frame,
 
 	ret = dixLookupDrawable(&draw, s->draw, serverClient,
 				M_ANY, DixWriteAccess);
-	if (ret)
+	if (ret) {
+		free(s);
 		return;
+	}
 
 	switch (s->action) {
 	case SWAP:
@@ -517,6 +537,12 @@ nouveau_dri2_vblank_handler(int fd, unsigned int frame,
 		DRI2WaitMSCComplete(s->client, draw, frame, tv_sec, tv_usec);
 		free(s);
 		break;
+
+	case BLIT:
+		DRI2SwapComplete(s->client, draw, frame, tv_sec, tv_usec,
+				 DRI2_BLIT_COMPLETE, s->func, s->data);
+		free(s);
+		break;
 	}
 }
 
-- 
1.7.5.4
