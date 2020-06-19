From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 00/16] mm/hmm/nouveau: THP mapping and migration
Date: Fri, 19 Jun 2020 14:56:33 -0700
Message-ID: <20200619215649.32297-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org

These patches apply to linux-5.8.0-rc1. Patches 1-3 should probably go
into 5.8, the others can be queued for 5.9. Patches 4-6 improve the HMM
self tests. Patch 7-8 prepare nouveau for the meat of this series which
adds support and testing for compound page mapping of system memory
(patches 9-11) and compound page migration to device private memory
(patches 12-16). Since these changes are split across mm core, nouveau,
and testing, I'm guessing Jason Gunthorpe's HMM tree would be appropriate.

Ralph Campbell (16):
  mm: fix migrate_vma_setup() src_owner and normal pages
  nouveau: fix migrate page regression
  nouveau: fix mixed normal and device private page migration
  mm/hmm: fix test timeout on slower machines
  mm/hmm/test: remove redundant page table invalidate
  mm/hmm: test mixed normal and device private migrations
  nouveau: make nvkm_vmm_ctor() and nvkm_mmu_ptp_get() static
  nouveau/hmm: fault one page at a time
  mm/hmm: add output flag for compound page mapping
  nouveau/hmm: support mapping large sysmem pages
  hmm: add tests for HMM_PFN_COMPOUND flag
  mm/hmm: optimize migrate_vma_setup() for holes
  mm: support THP migration to device private memory
  mm/thp: add THP allocation helper
  mm/hmm/test: add self tests for THP migration
  nouveau: support THP migration to private memory

 drivers/gpu/drm/nouveau/nouveau_dmem.c        | 177 +++++---
 drivers/gpu/drm/nouveau/nouveau_svm.c         | 241 +++++------
 drivers/gpu/drm/nouveau/nouveau_svm.h         |   3 +-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/base.c    |   6 +-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/priv.h    |   2 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c |  10 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |   3 -
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |  29 +-
 include/linux/gfp.h                           |  10 +
 include/linux/hmm.h                           |   4 +-
 include/linux/migrate.h                       |   1 +
 include/linux/mm.h                            |   1 +
 lib/test_hmm.c                                | 359 ++++++++++++----
 lib/test_hmm_uapi.h                           |   2 +
 mm/hmm.c                                      |  10 +-
 mm/huge_memory.c                              |  46 ++-
 mm/internal.h                                 |   1 -
 mm/memory.c                                   |  10 +-
 mm/memremap.c                                 |   9 +-
 mm/migrate.c                                  | 236 +++++++++--
 mm/page_alloc.c                               |   1 +
 tools/testing/selftests/vm/hmm-tests.c        | 388 +++++++++++++++++-
 22 files changed, 1203 insertions(+), 346 deletions(-)

-- 
2.20.1
