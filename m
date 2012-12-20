From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau/vm: fix memory corruption when pgt
	allocation fails
Date: Thu, 20 Dec 2012 23:37:09 +0100
Message-ID: <1356043034-25739-2-git-send-email-marcin.slusarz@gmail.com>
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

If we return freed vm, nouveau_drm_open will happily call nouveau_cli_destroy,
which will try to free it again.

Reported-by: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/subdev/vm/base.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/vm/base.c b/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
index 082c11b..77c67fc 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
@@ -352,7 +352,7 @@ nouveau_vm_create(struct nouveau_vmmgr *vmm, u64 offset, u64 length,
 	u64 mm_length = (offset + length) - mm_offset;
 	int ret;
 
-	vm = *pvm = kzalloc(sizeof(*vm), GFP_KERNEL);
+	vm = kzalloc(sizeof(*vm), GFP_KERNEL);
 	if (!vm)
 		return -ENOMEM;
 
@@ -376,6 +376,8 @@ nouveau_vm_create(struct nouveau_vmmgr *vmm, u64 offset, u64 length,
 		return ret;
 	}
 
+	*pvm = vm;
+
 	return 0;
 }
 
-- 
1.8.0.2
