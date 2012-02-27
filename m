From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nv50/vm: Prevent kernel freeze
Date: Mon, 27 Feb 2012 21:01:41 +0000
Message-ID: <1330376501-15055-1-git-send-email-emil.l.velikov@gmail.com>
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

Commit 'drm/nv50-nvc0/vm: support unsnooped system memory' caused
a regression on certain nv50 IGP due to not passing the correct
target type to nv50_vm_addr()

Fixes: https://bugs.freedesktop.org/show_bug.cgi?id=45746
Reported-by: Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org>
Tested-by: Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org>
Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv50_vm.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nv50_vm.c b/drivers/gpu/drm/nouveau/nv50_vm.c
index f06f4ad..44fbac9 100644
--- a/drivers/gpu/drm/nouveau/nv50_vm.c
+++ b/drivers/gpu/drm/nouveau/nv50_vm.c
@@ -85,7 +85,7 @@ nv50_vm_map(struct nouveau_vma *vma, struct nouveau_gpuobj *pgt,
 		target = 3;
 	}
 
-	phys  = vm_addr(vma, phys, mem->memtype, 0);
+	phys  = vm_addr(vma, phys, mem->memtype, target);
 	pte <<= 3;
 	cnt <<= 3;
 
-- 
1.7.9.2
