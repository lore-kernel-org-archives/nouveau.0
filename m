From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 11/19] nv50: GP_REG_ALLOC_RESULT must be positive
Date: Mon, 13 Jan 2014 14:19:27 -0500
Message-ID: <1389640775-25046-12-git-send-email-imirkin@alum.mit.edu>
References: <1389640775-25046-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1389640775-25046-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Set max_out to 1 when there are no outputs.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 src/gallium/drivers/nouveau/nv50/nv50_program.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_program.c b/src/gallium/drivers/nouveau/nv50/nv50_program.c
index f46f240..813795f 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_program.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_program.c
@@ -118,6 +118,8 @@ nv50_vertprog_assign_slots(struct nv50_ir_prog_info *info)
    }
    prog->out_nr = info->numOutputs;
    prog->max_out = n;
+   if (!prog->max_out)
+      prog->max_out = 1;
 
    if (prog->vp.psiz < info->numOutputs)
       prog->vp.psiz = prog->out[prog->vp.psiz].hw;
-- 
1.8.3.2
