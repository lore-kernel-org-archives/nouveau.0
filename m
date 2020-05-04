From: Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] drm/nouveau/mmu: remove unneeded semicolon
Date: Mon, 4 May 2020 19:32:40 +0800
Message-ID: <20200504113240.40683-1-yanaijie@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jason Yan <yanaijie@huawei.com>
List-Id: nouveau.vger.kernel.org

Fix the following coccicheck warning:

drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h:307:2-3: Unneeded
semicolon
drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:583:2-3: Unneeded
semicolon

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
index 41640e0584ac..199f94e15c5f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -580,7 +580,7 @@ nvkm_vmm_iter(struct nvkm_vmm *vmm, const struct nvkm_vmm_page *page,
 				it.pte[it.lvl]++;
 			}
 		}
-	};
+	}
 
 	nvkm_vmm_flush(&it);
 	return ~0ULL;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
index 5e55ecbd8005..d3f8f916d0db 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
@@ -304,7 +304,7 @@ int tu102_vmm_new(struct nvkm_mmu *, bool, u64, u64, void *, u32,
 		FILL(VMM, PT, PTEI, _ptes, MAP, _addr);                        \
 		PTEI += _ptes;                                                 \
 		PTEN -= _ptes;                                                 \
-	};                                                                     \
+	}                                                                      \
 	nvkm_done((PT)->memory);                                               \
 } while(0)
 
-- 
2.21.1
