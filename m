From: Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>
Subject: [PATCH] nv50: Fix broken assertion
Date: Tue,  7 Feb 2012 12:15:34 +0000
Message-ID: <1328616934-5287-1-git-send-email-daniel@fooishbar.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

The assertion added in f09910f3 broke nv50 completely by asserting that
the number of elements in a dereferenced pointer (i.e. 1) was greater
than i (which ranged up to six), rather than checking the number of
elements in the containing array.

Signed-off-by: Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>
---
 src/gallium/drivers/nv50/nv50_pc_regalloc.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_pc_regalloc.c b/src/gallium/drivers/nv50/nv50_pc_regalloc.c
index 72922cb..12a59cb 100644
--- a/src/gallium/drivers/nv50/nv50_pc_regalloc.c
+++ b/src/gallium/drivers/nv50/nv50_pc_regalloc.c
@@ -421,7 +421,7 @@ phi_opnd_for_bb(struct nv_instruction *phi, struct nv_basic_block *b,
    int i, j;
 
    for (j = -1, i = 0; i < 6 && phi->src[i]; ++i) {
-      assert(i < Elements(phi->src[i]));
+      assert(i < Elements(phi->src));
       srci = phi->src[i];
       /* if already replaced, check with original source first */
       if (srci->flags & NV_REF_FLAG_REGALLOC_PRIV)
-- 
1.7.9
