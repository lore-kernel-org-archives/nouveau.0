From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/4] nv50: borrow some flushing code from the ddx
Date: Sun, 16 Aug 2009 04:14:20 +0200
Message-ID: <1250388860-11109-4-git-send-email-madman2003@gmail.com>
References: <1250388860-11109-1-git-send-email-madman2003@gmail.com>
	<1250388860-11109-2-git-send-email-madman2003@gmail.com>
	<1250388860-11109-3-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250388860-11109-3-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

- This fixes neverball corruption.
- I'm unsure what we're actually flushing here.
---
 src/gallium/drivers/nv50/nv50_context.c |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_context.c b/src/gallium/drivers/nv50/nv50_context.c
index a2222d8..bdff968 100644
--- a/src/gallium/drivers/nv50/nv50_context.c
+++ b/src/gallium/drivers/nv50/nv50_context.c
@@ -32,8 +32,16 @@ nv50_flush(struct pipe_context *pipe, unsigned flags,
 	   struct pipe_fence_handle **fence)
 {
 	struct nv50_context *nv50 = (struct nv50_context *)pipe;
-	
-	FIRE_RING(nv50->screen->base.channel);
+	struct nouveau_channel *chan = nv50->screen->base.channel;
+	struct nouveau_grobj *eng2d = nv50->screen->eng2d;
+
+	/* We need this in the ddx for reliable composite, not sure what we're
+	 * actually flushing. We generate all our own flushes with flags = 0. */
+	WAIT_RING(chan, 3);
+	BEGIN_RING(chan, eng2d, 0x0110, 1);
+	OUT_RING  (chan, 0);
+
+	FIRE_RING(chan);
 }
 
 static void
-- 
1.6.4
