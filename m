From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] drm/nv41/vm: fix typo in type name
Date: Tue,  6 Nov 2012 22:48:49 +0100
Message-ID: <1352238533-14920-1-git-send-email-marcin.slusarz@gmail.com>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

It's a miracle it compiles at all - nv04_vm_priv does not exist
anywhere in the tree.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
v2: rebased on top of nouveau/master
---
 drivers/gpu/drm/nouveau/core/subdev/vm/nv41.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/vm/nv41.c b/drivers/gpu/drm/nouveau/core/subdev/vm/nv41.c
index 49050d9..9474cfc 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/vm/nv41.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/vm/nv41.c
@@ -67,7 +67,7 @@ nv41_vm_unmap(struct nouveau_gpuobj *pgt, u32 pte, u32 cnt)
 static void
 nv41_vm_flush(struct nouveau_vm *vm)
 {
-	struct nv04_vm_priv *priv = (void *)vm->vmm;
+	struct nv04_vmmgr_priv *priv = (void *)vm->vmm;
 
 	mutex_lock(&nv_subdev(priv)->mutex);
 	nv_wr32(priv, 0x100810, 0x00000022);
-- 
1.7.12
