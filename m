From: Ralph Campbell <rcampbell@nvidia.com>
Subject: [PATCH 0/5] mm/migrate: avoid device private invalidations
Date: Mon, 6 Jul 2020 15:23:42 -0700
Message-ID: <20200706222347.32290-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <kvm-ppc-owner@vger.kernel.org>
Sender: kvm-ppc-owner@vger.kernel.org
To: linux-rdma@vger.kernel.org, linux-mm@kvack.org, nouveau@lists.freedesktop.org, kvm-ppc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, Ben Skeggs <bskeggs@redhat.com>, Bharata B Rao <bharata@linux.ibm.com>, Ralph Campbell <rcampbell@nvidia.com>
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

This series is based on linux-5.8.0-rc4 and the patches I sent for
("mm/hmm/nouveau: add PMD system memory mapping")
https://lore.kernel.org/linux-mm/20200701225352.9649-1-rcampbell@nvidia.com
There are no logical dependencies, but there would be merge conflicts
which could be resolved if this were to be applied before the other
series.

Also, this replaces the need for the following two patches I sent:
("mm: fix migrate_vma_setup() src_owner and normal pages")
https://lore.kernel.org/linux-mm/20200622222008.9971-1-rcampbell@nvidia.com
("nouveau: fix mixed normal and device private page migration")
https://lore.kernel.org/lkml/20200622233854.10889-3-rcampbell@nvidia.com

Ralph Campbell (5):
  nouveau: fix storing invalid ptes
  mm/migrate: add a direction parameter to migrate_vma
  mm/notifier: add migration invalidation type
  nouveau/svm: use the new migration invalidation
  mm/hmm/test: use the new migration invalidation

 arch/powerpc/kvm/book3s_hv_uvmem.c            |  2 ++
 drivers/gpu/drm/nouveau/nouveau_dmem.c        | 13 ++++++--
 drivers/gpu/drm/nouveau/nouveau_svm.c         | 10 +++++-
 drivers/gpu/drm/nouveau/nouveau_svm.h         |  1 +
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    | 13 +++++---
 include/linux/migrate.h                       | 12 +++++--
 include/linux/mmu_notifier.h                  |  7 ++++
 lib/test_hmm.c                                | 33 +++++++++++--------
 mm/migrate.c                                  | 13 ++++++--
 9 files changed, 77 insertions(+), 27 deletions(-)

--=20
2.20.1
