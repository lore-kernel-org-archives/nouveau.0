From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/5] nouveau: Fix checkpatch.pl error messages
Date: Sat, 19 Mar 2011 23:31:53 +0000
Message-ID: <1300577514-6833-4-git-send-email-emil.l.velikov@gmail.com>
References: <1300577514-6833-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1300577514-6833-1-git-send-email-emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

Fix 'ERROR: that open brace { should be on the previous line'
Fix 'ERROR: else should follow close brace }'

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv04_crtc.c  |    3 +--
 drivers/gpu/drm/nouveau/nv04_graph.c |    6 ++----
 drivers/gpu/drm/nouveau/nv10_graph.c |    3 +--
 drivers/gpu/drm/nouveau/nv50_crtc.c  |    3 +--
 drivers/gpu/drm/nouveau/nv50_graph.c |    3 +--
 drivers/gpu/drm/nouveau/nv50_grctx.c |    4 +---
 6 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv04_crtc.c b/drivers/gpu/drm/nouveau/nv04_crtc.c
index a260fbb..5ffc5ba 100644
--- a/drivers/gpu/drm/nouveau/nv04_crtc.c
+++ b/drivers/gpu/drm/nouveau/nv04_crtc.c
@@ -790,8 +790,7 @@ nv04_crtc_do_mode_set_base(struct drm_crtc *crtc,
 	if (atomic) {
 		drm_fb = passed_fb;
 		fb = nouveau_framebuffer(passed_fb);
-	}
-	else {
+	} else {
 		/* If not atomic, we can go ahead and pin, and unpin the
 		 * old fb we were passed.
 		 */
diff --git a/drivers/gpu/drm/nouveau/nv04_graph.c b/drivers/gpu/drm/nouveau/nv04_graph.c
index c624ae9..055677a 100644
--- a/drivers/gpu/drm/nouveau/nv04_graph.c
+++ b/drivers/gpu/drm/nouveau/nv04_graph.c
@@ -1232,8 +1232,7 @@ static struct nouveau_bitfield nv04_graph_intr[] = {
 	{}
 };
 
-static struct nouveau_bitfield nv04_graph_nstatus[] =
-{
+static struct nouveau_bitfield nv04_graph_nstatus[] = {
 	{ NV04_PGRAPH_NSTATUS_STATE_IN_USE,       "STATE_IN_USE" },
 	{ NV04_PGRAPH_NSTATUS_INVALID_STATE,      "INVALID_STATE" },
 	{ NV04_PGRAPH_NSTATUS_BAD_ARGUMENT,       "BAD_ARGUMENT" },
@@ -1241,8 +1240,7 @@ static struct nouveau_bitfield nv04_graph_nstatus[] =
 	{}
 };
 
-struct nouveau_bitfield nv04_graph_nsource[] =
-{
+struct nouveau_bitfield nv04_graph_nsource[] = {
 	{ NV03_PGRAPH_NSOURCE_NOTIFICATION,       "NOTIFICATION" },
 	{ NV03_PGRAPH_NSOURCE_DATA_ERROR,         "DATA_ERROR" },
 	{ NV03_PGRAPH_NSOURCE_PROTECTION_ERROR,   "PROTECTION_ERROR" },
diff --git a/drivers/gpu/drm/nouveau/nv10_graph.c b/drivers/gpu/drm/nouveau/nv10_graph.c
index 8c92edb..531d7ba 100644
--- a/drivers/gpu/drm/nouveau/nv10_graph.c
+++ b/drivers/gpu/drm/nouveau/nv10_graph.c
@@ -1117,8 +1117,7 @@ struct nouveau_bitfield nv10_graph_intr[] = {
 	{}
 };
 
-struct nouveau_bitfield nv10_graph_nstatus[] =
-{
+struct nouveau_bitfield nv10_graph_nstatus[] = {
 	{ NV10_PGRAPH_NSTATUS_STATE_IN_USE,       "STATE_IN_USE" },
 	{ NV10_PGRAPH_NSTATUS_INVALID_STATE,      "INVALID_STATE" },
 	{ NV10_PGRAPH_NSTATUS_BAD_ARGUMENT,       "BAD_ARGUMENT" },
diff --git a/drivers/gpu/drm/nouveau/nv50_crtc.c b/drivers/gpu/drm/nouveau/nv50_crtc.c
index 2b99840..24607c7 100644
--- a/drivers/gpu/drm/nouveau/nv50_crtc.c
+++ b/drivers/gpu/drm/nouveau/nv50_crtc.c
@@ -535,8 +535,7 @@ nv50_crtc_do_mode_set_base(struct drm_crtc *crtc,
 	if (atomic) {
 		drm_fb = passed_fb;
 		fb = nouveau_framebuffer(passed_fb);
-	}
-	else {
+	} else {
 		/* If not atomic, we can go ahead and pin, and unpin the
 		 * old fb we were passed.
 		 */
diff --git a/drivers/gpu/drm/nouveau/nv50_graph.c b/drivers/gpu/drm/nouveau/nv50_graph.c
index 8675b00..614177c 100644
--- a/drivers/gpu/drm/nouveau/nv50_graph.c
+++ b/drivers/gpu/drm/nouveau/nv50_graph.c
@@ -548,8 +548,7 @@ nv86_graph_tlb_flush(struct drm_device *dev)
 	spin_unlock_irqrestore(&dev_priv->context_switch_lock, flags);
 }
 
-static struct nouveau_enum nv50_mp_exec_error_names[] =
-{
+static struct nouveau_enum nv50_mp_exec_error_names[] = {
 	{ 3, "STACK_UNDERFLOW", NULL },
 	{ 4, "QUADON_ACTIVE", NULL },
 	{ 8, "TIMEOUT", NULL },
diff --git a/drivers/gpu/drm/nouveau/nv50_grctx.c b/drivers/gpu/drm/nouveau/nv50_grctx.c
index 871a6d8..da10934 100644
--- a/drivers/gpu/drm/nouveau/nv50_grctx.c
+++ b/drivers/gpu/drm/nouveau/nv50_grctx.c
@@ -1804,9 +1804,7 @@ nv50_graph_construct_gene_unk24xx(struct nouveau_grctx *ctx)
 		xf_emit(ctx, 1, 0);	/* 1ff */
 		xf_emit(ctx, 8, 0);	/* 0? */
 		xf_emit(ctx, 9, 0);	/* ffffffff, 7ff */
-	}
-	else
-	{
+	} else {
 		xf_emit(ctx, 0xc, 0);	/* RO */
 		/* SEEK */
 		xf_emit(ctx, 0xe10, 0); /* 190 * 9: 8*ffffffff, 7ff */
-- 
1.7.1
