From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] nv50, nvc0: initialize ctx->sample_mask to ~0
Date: Sun, 12 Jan 2014 15:01:29 -0500
Message-ID: <1389556889-25008-1-git-send-email-imirkin@alum.mit.edu>
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
Cc: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Commit 95bf222603b (cso_context: Fix cso_context::sample_mask initial
value.) fixed the cso sample mask to be initialized to ~0. The cso code
is also careful not to needlessly call set_sample_mask, so we ended up
with the ctx->sample_mask never being set. This broke a number of
EXT_framebuffer_multisample piglit tests.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 src/gallium/drivers/nouveau/nv50/nv50_state.c | 2 ++
 src/gallium/drivers/nouveau/nvc0/nvc0_state.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_state.c b/src/gallium/drivers/nouveau/nv50/nv50_state.c
index b6a180e..87dd07f 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_state.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_state.c
@@ -1123,4 +1123,6 @@ nv50_init_state_functions(struct nv50_context *nv50)
    pipe->create_stream_output_target = nv50_so_target_create;
    pipe->stream_output_target_destroy = nv50_so_target_destroy;
    pipe->set_stream_output_targets = nv50_set_stream_output_targets;
+
+   nv50->sample_mask = ~0;
 }
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_state.c b/src/gallium/drivers/nouveau/nvc0/nvc0_state.c
index 4b8632a..0213a8e 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_state.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_state.c
@@ -1229,4 +1229,6 @@ nvc0_init_state_functions(struct nvc0_context *nvc0)
    pipe->set_global_binding = nvc0_set_global_bindings;
    pipe->set_compute_resources = nvc0_set_compute_resources;
    pipe->set_shader_resources = nvc0_set_shader_resources;
+
+   nvc0->sample_mask = ~0;
 }
-- 
1.8.3.2
