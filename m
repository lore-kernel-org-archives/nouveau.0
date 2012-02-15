From: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Subject: [PATCH 5/9] dri2: Fixes to swap scheduling.
Date: Thu, 16 Feb 2012 00:45:20 +0100
Message-ID: <1329349524-11650-6-git-send-email-mario.kleiner@tuebingen.mpg.de>
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

Fix some small off-by-one errors and a mismatch
between 32 bit kernel interfaces for vblank count
and 64 bit dri2 interfaces for target_msc et al.

Return corrected target_msc to swap scheduling in
x-server.

A revised version of the patch discussed here:
http://lists.freedesktop.org/archives/nouveau/2011-September/009143.html

Signed-off-by: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
---
 src/nouveau_dri2.c |   23 +++++++++++++++++++++--
 1 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/src/nouveau_dri2.c b/src/nouveau_dri2.c
index 8608678..719b3bb 100644
--- a/src/nouveau_dri2.c
+++ b/src/nouveau_dri2.c
@@ -387,11 +387,22 @@ nouveau_dri2_schedule_swap(ClientPtr client, DrawablePtr draw,
 		if (ret)
 			goto fail;
 
+		/* Truncate to match kernel interfaces; means occasional overflow
+		 * misses, but that's generally not a big deal.
+		 */
+		*target_msc &= 0xffffffff;
+		divisor &= 0xffffffff;
+		remainder &= 0xffffffff;
+
 		/* Calculate a swap target if we don't have one */
 		if (current_msc >= *target_msc && divisor)
 			*target_msc = current_msc + divisor
 				- (current_msc - remainder) % divisor;
 
+		/* Avoid underflow of unsigned value below */
+		if (*target_msc == 0)
+			*target_msc = 1;
+
 		/* Request a vblank event one frame before the target */
 		ret = nouveau_wait_vblank(draw, DRM_VBLANK_ABSOLUTE |
 					  DRM_VBLANK_EVENT,
@@ -399,7 +410,8 @@ nouveau_dri2_schedule_swap(ClientPtr client, DrawablePtr draw,
 					  &expect_msc, NULL, s);
 		if (ret)
 			goto fail;
-		s->frame = (unsigned int) expect_msc & 0xffffffff;
+		s->frame = 1 + ((unsigned int) expect_msc & 0xffffffff);
+		*target_msc = 1 + expect_msc;
 	} else {
 		/* We can't/don't want to sync to vblank, just swap. */
 		nouveau_dri2_finish_swap(draw, 0, 0, 0, s);
@@ -420,6 +432,13 @@ nouveau_dri2_schedule_wait(ClientPtr client, DrawablePtr draw,
 	CARD64 current_msc;
 	int ret;
 
+	/* Truncate to match kernel interfaces; means occasional overflow
+	 * misses, but that's generally not a big deal.
+	 */
+	target_msc &= 0xffffffff;
+	divisor &= 0xffffffff;
+	remainder &= 0xffffffff;
+
 	if (!can_sync_to_vblank(draw)) {
 		DRI2WaitMSCComplete(client, draw, target_msc, 0, 0);
 		return TRUE;
@@ -439,7 +458,7 @@ nouveau_dri2_schedule_wait(ClientPtr client, DrawablePtr draw,
 		goto fail;
 
 	/* Calculate a wait target if we don't have one */
-	if (current_msc > target_msc && divisor)
+	if (current_msc >= target_msc && divisor)
 		target_msc = current_msc + divisor
 			- (current_msc - remainder) % divisor;
 
-- 
1.7.5.4
