From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 01/12] nv50,
	nvc0: always pull out bufctx on context destruction
Date: Tue, 20 May 2014 19:39:55 -0400
Message-ID: <1400629206-4447-2-git-send-email-imirkin@alum.mit.edu>
References: <1400629206-4447-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1400629206-4447-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: "10.2" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Christoph Bumiller <christoph.bumiller-D4IDLmZPRBc@public.gmane.org>
List-Id: nouveau.vger.kernel.org

From: Christoph Bumiller <christoph.bumiller-D4IDLmZPRBc@public.gmane.org>

Reviewed-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "10.2" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
---
 src/gallium/drivers/nouveau/nv50/nv50_context.c | 7 ++-----
 src/gallium/drivers/nouveau/nvc0/nvc0_context.c | 9 +++++----
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_context.c b/src/gallium/drivers/nouveau/nv50/nv50_context.c
index 52e14bf..f844592 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_context.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_context.c
@@ -122,12 +122,9 @@ nv50_destroy(struct pipe_context *pipe)
 {
    struct nv50_context *nv50 = nv50_context(pipe);
 
-   if (nv50_context_screen(nv50)->cur_ctx == nv50) {
-      nv50->base.pushbuf->kick_notify = NULL;
+   if (nv50_context_screen(nv50)->cur_ctx == nv50)
       nv50_context_screen(nv50)->cur_ctx = NULL;
-      nouveau_pushbuf_bufctx(nv50->base.pushbuf, NULL);
-   }
-   /* need to flush before destroying the bufctx */
+   nouveau_pushbuf_bufctx(nv50->base.pushbuf, NULL);
    nouveau_pushbuf_kick(nv50->base.pushbuf, nv50->base.pushbuf->channel);
 
    nv50_context_unreference_resources(nv50);
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_context.c b/src/gallium/drivers/nouveau/nvc0/nvc0_context.c
index 83c8c34..e5040c4 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_context.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_context.c
@@ -123,11 +123,12 @@ nvc0_destroy(struct pipe_context *pipe)
 {
    struct nvc0_context *nvc0 = nvc0_context(pipe);
 
-   if (nvc0->screen->cur_ctx == nvc0) {
-      nvc0->base.pushbuf->kick_notify = NULL;
+   if (nvc0->screen->cur_ctx == nvc0)
       nvc0->screen->cur_ctx = NULL;
-      nouveau_pushbuf_bufctx(nvc0->base.pushbuf, NULL);
-   }
+   /* Unset bufctx, we don't want to revalidate any resources after the flush.
+    * Other contexts will always set their bufctx again on action calls.
+    */
+   nouveau_pushbuf_bufctx(nvc0->base.pushbuf, NULL);
    nouveau_pushbuf_kick(nvc0->base.pushbuf, nvc0->base.pushbuf->channel);
 
    nvc0_context_unreference_resources(nvc0);
-- 
1.8.5.5
