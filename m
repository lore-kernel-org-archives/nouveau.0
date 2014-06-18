From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 2/2] nv30: avoid dangling references to deleted
	contexts
Date: Tue, 17 Jun 2014 22:39:32 -0400
Message-ID: <1403059172-27689-2-git-send-email-imirkin@alum.mit.edu>
References: <1403059172-27689-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1403059172-27689-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: "10.2" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "10.2" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
---
 src/gallium/drivers/nouveau/nv30/nv30_context.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/src/gallium/drivers/nouveau/nv30/nv30_context.c b/src/gallium/drivers/nouveau/nv30/nv30_context.c
index f325c5c..617b088 100644
--- a/src/gallium/drivers/nouveau/nv30/nv30_context.c
+++ b/src/gallium/drivers/nouveau/nv30/nv30_context.c
@@ -165,6 +165,9 @@ nv30_context_destroy(struct pipe_context *pipe)
    if (nv30->draw)
       draw_destroy(nv30->draw);
 
+   if (nv30->screen->base.pushbuf->user_priv == &nv30->bufctx)
+      nv30->screen->base.pushbuf->user_priv = NULL;
+
    nouveau_bufctx_del(&nv30->bufctx);
 
    if (nv30->screen->cur_ctx == nv30)
-- 
1.8.5.5
