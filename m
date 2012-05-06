From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [mesa PATCH] nv50: handle VP without inputs
Date: Sun, 6 May 2012 20:53:08 +0200
Message-ID: <20120506185308.GC4311@joi.lan>
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

Fixes 3 piglit tests:
general/pos-array
shaders/glsl-novertexdata
shaders/glsl-vs-point-size
and makes shaders/vp-ignore-input not trigger PGRAPH DATA_ERROR
---
It's a bit ugly... If there's a way to fix it properly, I'm open to suggestions.
---
 src/gallium/drivers/nv50/nv50_program.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index 48e8db3..c44f537 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -53,6 +53,13 @@ nv50_vertprog_assign_slots(struct nv50_ir_prog_info *info)
          if (info->in[i].mask & (1 << c))
             info->in[i].slot[c] = n++;
    }
+
+   // Corner case: VP has no inputs, but we will still need to submit data to
+   // draw it. HW will shout at us and won't draw anything if we don't enable
+   // any input, so let's just pretend it's the first one.
+   if (info->numInputs == 0)
+      prog->vp.attrs[0] |= 0xf;
+
    prog->in_nr = info->numInputs;
 
    for (i = 0; i < info->numSysVals; ++i) {
-- 
1.7.8.5
