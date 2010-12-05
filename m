From: Xavier Chantry <chantry.xavier@gmail.com>
Subject: [PATCH 3/3] gallium/trace: check
	bind_vertex_sampler_states and set_vertex_sampler_views
Date: Sun,  5 Dec 2010 01:16:30 +0100
Message-ID: <1291508190-10771-3-git-send-email-chantry.xavier@gmail.com>
References: <1291508190-10771-1-git-send-email-chantry.xavier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
In-Reply-To: <1291508190-10771-1-git-send-email-chantry.xavier@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: nouveau@lists.freedesktop.org
Cc: mesa-dev@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

cso_cache_delete checks if pipe has bind_vertex_sampler_states and
set_vertex_sampler_views so do the same in tr_context.

This avoids a segfault when tracing nvfx driver on piglit
glx-destroycontext-2
---
 src/gallium/drivers/trace/tr_context.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/src/gallium/drivers/trace/tr_context.c b/src/gallium/drivers/trace/tr_context.c
index 2fdb6c9..eaabae8 100644
--- a/src/gallium/drivers/trace/tr_context.c
+++ b/src/gallium/drivers/trace/tr_context.c
@@ -314,6 +314,9 @@ trace_context_bind_vertex_sampler_states(struct pipe_context *_pipe,
    struct trace_context *tr_ctx = trace_context(_pipe);
    struct pipe_context *pipe = tr_ctx->pipe;
 
+   if (!pipe->bind_vertex_sampler_states)
+      return;
+
    trace_dump_call_begin("pipe_context", "bind_vertex_sampler_states");
 
    trace_dump_arg(ptr, pipe);
@@ -980,6 +983,9 @@ trace_context_set_vertex_sampler_views(struct pipe_context *_pipe,
    struct pipe_sampler_view *unwrapped_views[PIPE_MAX_VERTEX_SAMPLERS];
    unsigned i;
 
+   if (!pipe->set_vertex_sampler_views)
+      return;
+
    for(i = 0; i < num; ++i) {
       tr_view = trace_sampler_view(views[i]);
       unwrapped_views[i] = tr_view ? tr_view->sampler_view : NULL;
-- 
1.7.3.2
