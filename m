From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nouveau/gallium: use OUT_RINGp instead of several
	OUT_RINGs
Date: Tue, 22 Feb 2011 18:53:57 +0100
Message-ID: <20110222175357.GA9792@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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

It improves Warsow FPS by ~1.5%
---
 src/gallium/drivers/nv50/nv50_push.c |   18 +++---------------
 1 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_push.c b/src/gallium/drivers/nv50/nv50_push.c
index 380f694..bb429f2 100644
--- a/src/gallium/drivers/nv50/nv50_push.c
+++ b/src/gallium/drivers/nv50/nv50_push.c
@@ -40,31 +40,19 @@ emit_b32_1(struct nouveau_channel *chan, void *data)
 static void
 emit_b32_2(struct nouveau_channel *chan, void *data)
 {
-   uint32_t *v = data;
-
-   OUT_RING(chan, v[0]);
-   OUT_RING(chan, v[1]);
+   OUT_RINGp(chan, data, 2);
 }
 
 static void
 emit_b32_3(struct nouveau_channel *chan, void *data)
 {
-   uint32_t *v = data;
-
-   OUT_RING(chan, v[0]);
-   OUT_RING(chan, v[1]);
-   OUT_RING(chan, v[2]);
+   OUT_RINGp(chan, data, 3);
 }
 
 static void
 emit_b32_4(struct nouveau_channel *chan, void *data)
 {
-   uint32_t *v = data;
-
-   OUT_RING(chan, v[0]);
-   OUT_RING(chan, v[1]);
-   OUT_RING(chan, v[2]);
-   OUT_RING(chan, v[3]);
+   OUT_RINGp(chan, data, 4);
 }
 
 static void
-- 
1.7.4.rc3
