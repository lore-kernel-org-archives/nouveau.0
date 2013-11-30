From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 1/2] nouveau: avoid leaking fences while waiting
Date: Fri, 29 Nov 2013 23:33:42 -0500
Message-ID: <1385786023-24566-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "9.2 10.0" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This fixes a memory leak in some situations. Also avoids emitting an
extra fence if the kick handler does the call to nouveau_fence_next
itself.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "9.2 10.0" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
---

TBH I'm pretty confused by the whole fence refcounting logic and its
interaction with emits, updates, etc. However valgrind was happy with
this. But it wasn't happy when I was doing nouveau_fence_wait from
nv50_draw_elements, saying that the fence allocated by nouveau_fence_new was
leaked. (Note that the kick handler when doing vbo stuff does NOT do
nouveau_fence_next on its own... but adding that there still didn't fix all my
issues, nor is it likely desirable.)

 src/gallium/drivers/nouveau/nouveau_fence.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_fence.c b/src/gallium/drivers/nouveau/nouveau_fence.c
index dea146c..c686710 100644
--- a/src/gallium/drivers/nouveau/nouveau_fence.c
+++ b/src/gallium/drivers/nouveau/nouveau_fence.c
@@ -189,16 +189,15 @@ nouveau_fence_wait(struct nouveau_fence *fence)
    /* wtf, someone is waiting on a fence in flush_notify handler? */
    assert(fence->state != NOUVEAU_FENCE_STATE_EMITTING);
 
-   if (fence->state < NOUVEAU_FENCE_STATE_EMITTED) {
+   if (fence->state < NOUVEAU_FENCE_STATE_EMITTED)
       nouveau_fence_emit(fence);
 
-      if (fence == screen->fence.current)
-         nouveau_fence_new(screen, &screen->fence.current, FALSE);
-   }
-   if (fence->state < NOUVEAU_FENCE_STATE_FLUSHED) {
+   if (fence->state < NOUVEAU_FENCE_STATE_FLUSHED)
       if (nouveau_pushbuf_kick(screen->pushbuf, screen->pushbuf->channel))
          return FALSE;
-   }
+
+   if (fence == screen->fence.current)
+      nouveau_fence_next(screen);
 
    do {
       nouveau_fence_update(screen, FALSE);
-- 
1.8.3.2
