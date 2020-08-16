From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 2/2] present: fix handling of drmWaitVBlank
 failures
Date: Sat, 15 Aug 2020 23:23:36 -0400
Message-ID: <20200816032336.18964-2-imirkin@alum.mit.edu>
References: <20200816032336.18964-1-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200816032336.18964-1-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

When drmWaitVBlank fails, make sure to remove the event from the queue.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

Note this needs a bit more testing, and also double-checking what the
"correct" way of dealing with these errors is. I was able to trigger
errors with "xset dpms force off", but perhaps there are also other
conditions.

 src/nouveau_present.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/src/nouveau_present.c b/src/nouveau_present.c
index 8167fd8..15516d6 100644
--- a/src/nouveau_present.c
+++ b/src/nouveau_present.c
@@ -113,8 +113,19 @@ nouveau_present_vblank_queue(RRCrtcPtr rrcrtc, uint64_t event_id, uint64_t msc)
 	args.request.signal = (unsigned long)token;
 
 	while ((ret = drmWaitVBlank(pNv->dev->fd, &args)) != 0) {
-		if (errno != EBUSY || drmmode_event_flush(crtc->scrn) < 0)
+		if (errno != EBUSY) {
+			xf86DrvMsg(crtc->scrn->scrnIndex, X_DEBUG,
+				   "PRESENT: Wait for VBlank failed: %s\n", strerror(errno));
+			drmmode_event_abort(crtc->scrn, event_id, false);
 			return BadAlloc;
+		}
+		ret = drmmode_event_flush(crtc->scrn);
+		if (ret < 0) {
+			xf86DrvMsg(crtc->scrn->scrnIndex, X_DEBUG,
+				   "PRESENT: Event flush failed\n");
+			drmmode_event_abort(crtc->scrn, event_id, false);
+			return BadAlloc;
+		}
 	}
 
 	return Success;
-- 
2.26.2
