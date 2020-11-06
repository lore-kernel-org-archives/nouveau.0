From: Ralph Campbell <rcampbell@nvidia.com>
Subject: [PATCH v3 0/6] mm/hmm/nouveau: add THP migration to migrate_vma_*
Date: Thu, 5 Nov 2020 16:51:41 -0800
Message-ID: <20201106005147.20113-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
To: linux-mm@kvack.org, nouveau@lists.freedesktop.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Yang Shi <yang.shi@linux.alibaba.com>, Ben Skeggs <bskeggs@redhat.com>, Shuah Khan <shuah@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Ralph Campbell <rcampbell@nvidia.com>
List-Id: nouveau.vger.kernel.org

This series adds support for transparent huge page migration to
migrate_vma_*() and adds nouveau SVM and HMM selftests as consumers.
Earlier versions were posted previously [1] and [2].

The patches apply cleanly to the linux-mm 5.10.0-rc2 tree. There are a
lot of other THP patches being posted. I don't think there are any
semantic conflicts but there may be some merge conflicts depending on
the order Andrew applies these.

Changes in v3:
Sent the patch ("mm/thp: fix __split_huge_pmd_locked() for migration PMD")
as a separate patch from this series.

Rebased to linux-mm 5.10.0-rc2.

Changes in v2:
Added splitting a THP midway in the migration process:
i.e., in migrate_vma_pages().

[1] https://lore.kernel.org/linux-mm/20200619215649.32297-1-rcampbell@nvidi=
a.com
[2] https://lore.kernel.org/linux-mm/20200902165830.5367-1-rcampbell@nvidia=
.com

Ralph Campbell (6):
  mm/thp: add prep_transhuge_device_private_page()
  mm/migrate: move migrate_vma_collect_skip()
  mm: support THP migration to device private memory
  mm/thp: add THP allocation helper
  mm/hmm/test: add self tests for THP migration
  nouveau: support THP migration to private memory

 drivers/gpu/drm/nouveau/nouveau_dmem.c | 289 +++++++++++-----
 drivers/gpu/drm/nouveau/nouveau_svm.c  |  11 +-
 drivers/gpu/drm/nouveau/nouveau_svm.h  |   3 +-
 include/linux/gfp.h                    |  10 +
 include/linux/huge_mm.h                |  12 +
 include/linux/memremap.h               |   9 +
 include/linux/migrate.h                |   2 +
 lib/test_hmm.c                         | 437 +++++++++++++++++++++----
 lib/test_hmm_uapi.h                    |   3 +
 mm/huge_memory.c                       | 147 +++++++--
 mm/memcontrol.c                        |  25 +-
 mm/memory.c                            |  10 +-
 mm/memremap.c                          |   4 +-
 mm/migrate.c                           | 429 +++++++++++++++++++-----
 mm/rmap.c                              |   2 +-
 tools/testing/selftests/vm/hmm-tests.c | 404 +++++++++++++++++++++++
 16 files changed, 1522 insertions(+), 275 deletions(-)

--=20
2.20.1
