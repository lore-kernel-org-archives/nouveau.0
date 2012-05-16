From: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
Subject: [PATCH 2/3] nv30: Avoid Null-pointer deref with possible
	empty vtxbuf
Date: Wed, 16 May 2012 11:06:47 +0200
Message-ID: <1337159207-20167-3-git-send-email-r.spliet@student.tudelft.nl>
References: <1336790666.22856.2.camel@nisroch>
	<1337159207-20167-1-git-send-email-r.spliet@student.tudelft.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1337159207-20167-1-git-send-email-r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
---
 src/gallium/drivers/nv30/nv30_vbo.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/src/gallium/drivers/nv30/nv30_vbo.c b/src/gallium/drivers/nv30/nv30_vbo.c
index 43914f7..db25991 100644
--- a/src/gallium/drivers/nv30/nv30_vbo.c
+++ b/src/gallium/drivers/nv30/nv30_vbo.c
@@ -104,7 +104,7 @@ nv30_prevalidate_vbufs(struct nv30_context *nv30)
       buf = nv04_resource(vb->buffer);
 
       /* NOTE: user buffers with temporary storage count as mapped by GPU */
-      if (!nouveau_resource_mapped_by_gpu(vb->buffer)) {
+      if (buf && !nouveau_resource_mapped_by_gpu(vb->buffer)) {
          if (nv30->vbo_push_hint) {
             nv30->vbo_fifo = ~0;
             continue;
-- 
1.7.7.6
