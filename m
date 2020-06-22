From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RESEND PATCH 3/3] nouveau: make nvkm_vmm_ctor() and
 nvkm_mmu_ptp_get() static
Date: Mon, 22 Jun 2020 16:38:54 -0700
Message-ID: <20200622233854.10889-4-rcampbell@nvidia.com>
References: <20200622233854.10889-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200622233854.10889-1-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org

The functions nvkm_vmm_ctor() and nvkm_mmu_ptp_get() are not called outside
of the file defining them so make them static.

Signed-off-by: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c  | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h  | 3 ---
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
index ee11ccaf0563..de91e9a26172 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
@@ -61,7 +61,7 @@ nvkm_mmu_ptp_put(struct nvkm_mmu *mmu, bool force, struct nvkm_mmu_pt *pt)
 	kfree(pt);
 }
 
-struct nvkm_mmu_pt *
+static struct nvkm_mmu_pt *
 nvkm_mmu_ptp_get(struct nvkm_mmu *mmu, u32 size, bool zero)
 {
 	struct nvkm_mmu_pt *pt;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
index 199f94e15c5f..67b00dcef4b8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -1030,7 +1030,7 @@ nvkm_vmm_ctor_managed(struct nvkm_vmm *vmm, u64 addr, u64 size)
 	return 0;
 }
 
-int
+static int
 nvkm_vmm_ctor(const struct nvkm_vmm_func *func, struct nvkm_mmu *mmu,
 	      u32 pd_header, bool managed, u64 addr, u64 size,
 	      struct lock_class_key *key, const char *name,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
index d3f8f916d0db..a2b179568970 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
@@ -163,9 +163,6 @@ int nvkm_vmm_new_(const struct nvkm_vmm_func *, struct nvkm_mmu *,
 		  u32 pd_header, bool managed, u64 addr, u64 size,
 		  struct lock_class_key *, const char *name,
 		  struct nvkm_vmm **);
-int nvkm_vmm_ctor(const struct nvkm_vmm_func *, struct nvkm_mmu *,
-		  u32 pd_header, bool managed, u64 addr, u64 size,
-		  struct lock_class_key *, const char *name, struct nvkm_vmm *);
 struct nvkm_vma *nvkm_vmm_node_search(struct nvkm_vmm *, u64 addr);
 struct nvkm_vma *nvkm_vmm_node_split(struct nvkm_vmm *, struct nvkm_vma *,
 				     u64 addr, u64 size);
-- 
2.20.1
