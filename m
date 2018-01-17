From: Luis de Bethencourt <luisbg@kernel.org>
Subject: [PATCH] drm/nouveau/mmu: Fix trailing semicolon
Date: Wed, 17 Jan 2018 18:53:14 +0000
Message-ID: <20180117185315.26808-1-luisbg@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Joe Perches <joe@perches.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org, Luis de Bethencourt <luisbg@kernel.org>
List-Id: nouveau.vger.kernel.org

The trailing semicolon is an empty statement that does no operation.
Removing it since it doesn't do anything.

Signed-off-by: Luis de Bethencourt <luisbg@kernel.org>
---

Hi,

After fixing the same thing in drivers/staging/rtl8723bs/, Joe Perches
suggested I fix it treewide [0].

Best regards 
Luis


[0] http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2018-January/115410.html
[1] http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2018-January/115390.html

 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
index e35d3e17cd7c..93946dcee319 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -642,7 +642,7 @@ nvkm_vmm_ptes_sparse(struct nvkm_vmm *vmm, u64 addr, u64 size, bool ref)
 			else
 				block = (size >> page[i].shift) << page[i].shift;
 		} else {
-			block = (size >> page[i].shift) << page[i].shift;;
+			block = (size >> page[i].shift) << page[i].shift;
 		}
 
 		/* Perform operation. */
-- 
2.15.1
