From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 0/6] mm/migrate: avoid device private
 invalidations
Date: Thu, 23 Jul 2020 15:29:58 -0700
Message-ID: <20200723223004.9586-1-rcampbell@nvidia.com>
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
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, kvm-ppc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bharata B Rao <bharata-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org

The goal for this series is to avoid device private memory TLB
invalidations when migrating a range of addresses from system
memory to device private memory and some of those pages have already
been migrated. The approach taken is to introduce a new mmu notifier
invalidation event type and use that in the device driver to skip
invalidation callbacks from migrate_vma_setup(). The device driver is
also then expected to handle device MMU invalidations as part of the
migrate_vma_setup(), migrate_vma_pages(), migrate_vma_finalize() process.
Note that this is opt-in. A device driver can simply invalidate its MMU
in the mmu notifier callback and not handle MMU invalidations in the
migration sequence.

This series is based on Jason Gunthorpe's HMM tree (linux-5.8.0-rc4).

Also, this replaces the need for the following two patches I sent:
("mm: fix migrate_vma_setup() src_owner and normal pages")
https://lore.kernel.org/linux-mm/20200622222008.9971-1-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
("nouveau: fix mixed normal and device private page migration")
https://lore.kernel.org/lkml/20200622233854.10889-3-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org

Changes in v4:
Added reviewed-by from Bharata B Rao.
Removed dead code checking for source device private page in lib/test_hmm.c
  dmirror_migrate_alloc_and_copy() since the source filter flag guarantees
  that.
Added patch 6 to remove a redundant invalidation in migrate_vma_pages().

Changes in v3:
Changed the direction field "dir" to a "flags" field and renamed
  src_owner to pgmap_owner.
Fixed a locking issue in nouveau for the migration invalidation.
Added a HMM selftest test case to exercise the HMM test driver
  invalidation changes.
Removed reviewed-by Bharata B Rao since this version is moderately
  changed.

Changes in v2:
Rebase to Jason Gunthorpe's HMM tree.
Added reviewed-by from Bharata B Rao.
Rename the mmu_notifier_range::data field to migrate_pgmap_owner as
  suggested by Jason Gunthorpe.

Ralph Campbell (6):
  nouveau: fix storing invalid ptes
  mm/migrate: add a flags parameter to migrate_vma
  mm/notifier: add migration invalidation type
  nouveau/svm: use the new migration invalidation
  mm/hmm/test: use the new migration invalidation
  mm/migrate: remove range invalidation in migrate_vma_pages()

 arch/powerpc/kvm/book3s_hv_uvmem.c            |  4 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c        | 19 ++++++--
 drivers/gpu/drm/nouveau/nouveau_svm.c         | 21 ++++-----
 drivers/gpu/drm/nouveau/nouveau_svm.h         | 13 +++++-
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    | 13 ++++--
 include/linux/migrate.h                       | 16 +++++--
 include/linux/mmu_notifier.h                  |  7 +++
 lib/test_hmm.c                                | 43 +++++++++----------
 mm/migrate.c                                  | 34 +++++----------
 tools/testing/selftests/vm/hmm-tests.c        | 18 ++++++--
 10 files changed, 112 insertions(+), 76 deletions(-)

-- 
2.20.1
