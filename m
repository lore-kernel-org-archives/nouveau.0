From: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Subject: [PATCH 9/9] dri2: Fix corner case crash for swaplimit > 1
Date: Thu, 16 Feb 2012 00:45:24 +0100
Message-ID: <1329349524-11650-10-git-send-email-mario.kleiner@tuebingen.mpg.de>
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

If a swaplimit > 1 is set on a server which
supports the swaplimit api (XOrg 1.12.0+),
the following can happen:

1. Client calls glXSwapBuffersMscOML() with a
   swap target > 1 vblank in the future, or a
   client calls glXSwapbuffers() while the swap
   interval is set to > 1 (unusual but possible).

2. nouveau_dri2_finish_swap() is therefore called
   only at the target vblank, instead of immediately.

3. Because of the deferred execution of
   nouveu_dri2_finish_swap(), the OpenGL client
   can call x-servers DRI2GetBuffersWithFormat()
   before nouveau_dri2_finish_swap() executes and
   it deletes pixmaps that would be needed by
   nouveau_dri2_finish_swap() --> Segfault --> Crash.

Prevent this: When a swap is scheduled into the
future, we temporarily reduce the swaplimit to 1
until nouveau_dri2_finish_swap() is done, then
restore it to its original value. This throttles
the client inside the server in DRI2ThrottleClient()
before it can call the evil DRI2GetbuffersWithFormat().

The client will still be released one video refresh
interval before swap completion, so there is still
some potential win.

This doesn't affect the common case of swapping at
the next vblank, where this throttling is not needed
or done.

Signed-off-by: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
---
 src/nouveau_dri2.c |   26 ++++++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/src/nouveau_dri2.c b/src/nouveau_dri2.c
index f0c7fec..7878a5a 100644
--- a/src/nouveau_dri2.c
+++ b/src/nouveau_dri2.c
@@ -445,6 +445,26 @@ nouveau_dri2_schedule_swap(ClientPtr client, DrawablePtr draw,
 		if (*target_msc == 0)
 			*target_msc = 1;
 
+#if DRI2INFOREC_VERSION >= 6
+		/* Is this a swap in the future, ie. the vblank event will
+		 * not be immediately dispatched, but only at a future vblank?
+		 * If so, we need to temporarily lower the swaplimit to 1, so
+		 * that DRI2GetBuffersWithFormat() requests from the client get
+		 * deferred in the x-server until the vblank event has been
+		 * dispatched to us and nouveau_dri2_finish_swap() is done. If
+		 * we wouldn't do this, DRI2GetBuffersWithFormat() would operate
+		 * on wrong (pre-swap) buffers, and cause a segfault later on in
+		 * nouveau_dri2_finish_swap(). Our vblank event handler restores
+		 * the old swaplimit immediately after nouveau_dri2_finish_swap()
+		 * is done, so we still get 1 video refresh cycle worth of
+		 * triple-buffering. For a swap at next vblank, dispatch of the
+		 * vblank event happens immediately, so there isn't any need
+		 * for this lowered swaplimit.
+		 */
+		if (current_msc < *target_msc - 1)
+			DRI2SwapLimit(draw, 1);
+#endif
+
 		/* Request a vblank event one frame before the target */
 		ret = nouveau_wait_vblank(draw, DRM_VBLANK_ABSOLUTE |
 					  DRM_VBLANK_EVENT,
@@ -557,6 +577,12 @@ nouveau_dri2_vblank_handler(int fd, unsigned int frame,
 	switch (s->action) {
 	case SWAP:
 		nouveau_dri2_finish_swap(draw, frame, tv_sec, tv_usec, s);
+#if DRI2INFOREC_VERSION >= 6
+		/* Restore real swap limit on drawable, now that it is safe. */
+		ScrnInfoPtr scrn = xf86Screens[draw->pScreen->myNum];
+		DRI2SwapLimit(draw, NVPTR(scrn)->swap_limit);
+#endif
+
 		break;
 
 	case WAIT:
-- 
1.7.5.4
