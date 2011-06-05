From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [mesa PATCH] nv50: fix nv50_sampler_state_delete array
	overflow
Date: Sun, 5 Jun 2011 21:00:28 +0200
Message-ID: <20110605190028.GA22091@joi.lan>
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

num_samplers is array of 3 elements, not 5
---
 src/gallium/drivers/nv50/nv50_state.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_state.c b/src/gallium/drivers/nv50/nv50_state.c
index 799f496..8b54d9f 100644
--- a/src/gallium/drivers/nv50/nv50_state.c
+++ b/src/gallium/drivers/nv50/nv50_state.c
@@ -478,7 +478,7 @@ nv50_sampler_state_delete(struct pipe_context *pipe, void *hwcso)
 {
    unsigned s, i;
 
-   for (s = 0; s < 5; ++s)
+   for (s = 0; s < 3; ++s)
       for (i = 0; i < nv50_context(pipe)->num_samplers[s]; ++i)
          if (nv50_context(pipe)->samplers[s][i] == hwcso)
             nv50_context(pipe)->samplers[s][i] = NULL;
-- 
1.7.4.1
