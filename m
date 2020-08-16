From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 1/2] drmmode: make event handler leave a note that
 there are stuck events
Date: Sat, 15 Aug 2020 23:23:35 -0400
Message-ID: <20200816032336.18964-1-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

We don't really expect to have too many events in the queue. If there
are, then the algorithm we use isn't appropriate. Add a warning when the
queue gets very long, as it's an indication of something having gone
wrong.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 src/drmmode_display.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/src/drmmode_display.c b/src/drmmode_display.c
index 2d3229c..45292c4 100644
--- a/src/drmmode_display.c
+++ b/src/drmmode_display.c
@@ -159,6 +159,8 @@ drmmode_events = {
 	.prev = &drmmode_events,
 };
 
+static bool warned = false;
+
 static void
 drmmode_event_handler(int fd, unsigned int frame, unsigned int tv_sec,
 		      unsigned int tv_usec, void *event_data)
@@ -166,7 +168,10 @@ drmmode_event_handler(int fd, unsigned int frame, unsigned int tv_sec,
 	const uint64_t ust = (uint64_t)tv_sec * 1000000 + tv_usec;
 	struct drmmode_event *e = event_data;
 
+	int counter = 0;
+
 	xorg_list_for_each_entry(e, &drmmode_events, head) {
+		counter++;
 		if (e == event_data) {
 			xorg_list_del(&e->head);
 			e->func((void *)(e + 1), e->name, ust, frame);
@@ -174,6 +179,12 @@ drmmode_event_handler(int fd, unsigned int frame, unsigned int tv_sec,
 			break;
 		}
 	}
+
+	if (counter > 100 && !warned) {
+		xf86DrvMsg(0, X_WARNING,
+			   "Event handler iterated %d times\n", counter);
+		warned = true;
+	}
 }
 
 void
-- 
2.26.2
