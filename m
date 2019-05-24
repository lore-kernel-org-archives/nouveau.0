From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] drm/nouveau/mmu: use struct_size() helper
Date: Fri, 24 May 2019 12:15:36 -0500
Message-ID: <20190524171536.GA20883@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: nouveau.vger.kernel.org

Make use of the struct_size() helper instead of an open-coded version
in order to avoid any potential type mistakes, in particular in the
context in which this code is being used.

So, replace the following form:

sizeof(*kind) + sizeof(*kind->data) * mmu->kind_nr;

with:

struct_size(kind, data, mmu->kind_nr)

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/gpu/drm/nouveau/nvif/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvif/mmu.c b/drivers/gpu/drm/nouveau/nvif/mmu.c
index ae08a1ca8044..5641bda2046d 100644
--- a/drivers/gpu/drm/nouveau/nvif/mmu.c
+++ b/drivers/gpu/drm/nouveau/nvif/mmu.c
@@ -110,7 +110,7 @@ nvif_mmu_init(struct nvif_object *parent, s32 oclass, struct nvif_mmu *mmu)
 
 	if (mmu->kind_nr) {
 		struct nvif_mmu_kind_v0 *kind;
-		u32 argc = sizeof(*kind) + sizeof(*kind->data) * mmu->kind_nr;
+		size_t argc = struct_size(kind, data, mmu->kind_nr);
 
 		if (ret = -ENOMEM, !(kind = kmalloc(argc, GFP_KERNEL)))
 			goto done;
-- 
2.21.0
