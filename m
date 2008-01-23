From: Roel Kluin <12o3l-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: [PATCH 1/1] [same+another] two typos in nouveau_shader.c
Date: Wed, 23 Jan 2008 22:54:26 +0100
Message-ID: <4797B792.8030803@tiscali.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

There appears to be another typo in the file (this patch includes both fixes):
--
Fix two typos

Signed-off-by: Roel Kluin <12o3l-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
---
diff --git a/src/mesa/drivers/dri/nouveau/nouveau_shader.c b/src/mesa/drivers/dri/nouveau/nouveau_shader.c
index b6837c5..f0196e9 100644
--- a/src/mesa/drivers/dri/nouveau/nouveau_shader.c
+++ b/src/mesa/drivers/dri/nouveau/nouveau_shader.c
@@ -554,7 +554,7 @@ nvsDumpInstruction(nvsInstruction * inst, int slot, int lvl)
    nvsDumpIndent(lvl);
    printf("%s ", opr->name);
 
-   if (!opr->flags & NODS) {
+   if (!(opr->flags & NODS)) {
       switch (inst->dest.file) {
       case NVS_FILE_RESULT:
 	 printf("result.%s", SFR_STRING(inst->dest.index));
@@ -635,7 +635,7 @@ nvsDisasmHWShaderOp(nvsFunc * shader, int merged)
 
    printf("%s", opi->name);
    if (shader->GetPrecision &&
-       (!(opi->flags & BRANCH_ALL)) && (!(opi->flags * NODS)) &&
+       (!(opi->flags & BRANCH_ALL)) && (!(opi->flags & NODS)) &&
        (op != NVS_OP_NOP))
       printf("%s", NVS_PREC_STRING(shader->GetPrecision(shader)));
    if (shader->SupportsConditional && shader->SupportsConditional(shader)) {
