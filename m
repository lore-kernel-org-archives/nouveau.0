From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nv50: fix page faulting for 128MB page table
	sizes
Date: Sun,  6 Nov 2011 20:32:06 +0100
Message-ID: <1320607930-21794-4-git-send-email-marcin.slusarz@gmail.com>
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

This seems to be a typo...

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
BTW, shouldn't limiting only be applied to small pages?
(nv50-vm.txt says it's small-pages-only feature)

---
 drivers/gpu/drm/nouveau/nv50_vm.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv50_vm.c b/drivers/gpu/drm/nouveau/nv50_vm.c
index 40b84f2..6f38cea 100644
--- a/drivers/gpu/drm/nouveau/nv50_vm.c
+++ b/drivers/gpu/drm/nouveau/nv50_vm.c
@@ -48,7 +48,7 @@ nv50_vm_map_pgt(struct nouveau_gpuobj *pgd, u32 pde,
 			phys |= 0x60;
 		else if (coverage <= 64 * 1024 * 1024)
 			phys |= 0x40;
-		else if (coverage < 128 * 1024 * 1024)
+		else if (coverage <= 128 * 1024 * 1024)
 			phys |= 0x20;
 	}
 
-- 
1.7.7
