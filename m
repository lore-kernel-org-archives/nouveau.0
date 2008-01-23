From: Roel Kluin <12o3l-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: [PATCH 1/1] '! x & y' priority mistake in
	nvsDumpInstruction(), nouveau_shader.c
Date: Wed, 23 Jan 2008 20:05:07 +0100
Message-ID: <47978FE3.7050304@tiscali.nl>
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

'!' has a higher priority than '&': bitanding has no effect.

Signed-off-by: Roel Kluin <12o3l-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
---
diff --git a/src/mesa/drivers/dri/nouveau/nouveau_shader.c b/src/mesa/drivers/dri/nouveau/nouveau_shader.c
index b6837c5..1118fdb 100644
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
