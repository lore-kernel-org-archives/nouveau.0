From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] kms: Remove the one-off offset of connector names
	compared to the kernel.
Date: Wed, 23 Dec 2009 21:55:29 +0100
Message-ID: <1261601729-12539-1-git-send-email-madman2003@gmail.com>
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

- Seeing DVI-I-0 in xrandr and DVI-I-1 in the kernel logs can be a source of
confusion.

Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/drmmode_display.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/src/drmmode_display.c b/src/drmmode_display.c
index 759cdb8..e37e7c1 100644
--- a/src/drmmode_display.c
+++ b/src/drmmode_display.c
@@ -1019,7 +1019,7 @@ drmmode_output_init(ScrnInfoPtr pScrn, drmmode_ptr drmmode, int num)
 	}
 
 	snprintf(name, 32, "%s-%d", output_names[koutput->connector_type],
-		 koutput->connector_type_id - 1);
+		 koutput->connector_type_id);
 
 	output = xf86OutputCreate (pScrn, &drmmode_output_funcs, name);
 	if (!output) {
-- 
1.6.5.4
