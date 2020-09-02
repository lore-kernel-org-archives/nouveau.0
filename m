From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/7] mm/hmm/nouveau: add THP migration to
 migrate_vma_*
Date: Wed, 2 Sep 2020 09:58:23 -0700
Message-ID: <20200902165830.5367-1-rcampbell@nvidia.com>
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
To: linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alistair Popple <apopple-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bharata B Rao <bharata-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jason Gunthorpe <jgg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This series adds support for transparent huge page migration to
migrate_vma_*() and adds nouveau SVM and HMM selftests as consumers.
An earlier version was posted previously [1]. This version now
supports splitting a THP midway in the migration process which
led to a number of changes.

The patches apply cleanly to the current linux-mm tree. Since there
are a couple of patches in linux-mm from Dan Williams that modify
lib/test_hmm.c and drivers/gpu/drm/nouveau/nouveau_dmem.c, it might
be easiest if Andrew could take these through the linux-mm tree
assuming that's OK with other maintainers like Ben Skeggs.

[1] https://lore.kernel.org/linux-mm/20200619215649.32297-1-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org

Ralph Campbell (7):
  mm/thp: fix __split_huge_pmd_locked() for migration PMD
  mm/migrate: move migrate_vma_collect_skip()
  mm: support THP migration to device private memory
  mm/thp: add prep_transhuge_device_private_page()
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
 lib/test_hmm.c                         | 439 +++++++++++++++++++++----
 lib/test_hmm_uapi.h                    |   3 +
 mm/huge_memory.c                       | 177 +++++++---
 mm/memory.c                            |  10 +-
 mm/migrate.c                           | 429 +++++++++++++++++++-----
 mm/rmap.c                              |   2 +-
 tools/testing/selftests/vm/hmm-tests.c | 404 +++++++++++++++++++++++
 14 files changed, 1519 insertions(+), 281 deletions(-)

-- 
2.20.1
