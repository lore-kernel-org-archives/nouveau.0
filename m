From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v6 0/6] mm/hmm/test: add self tests for HMM
Date: Mon, 13 Jan 2020 14:46:57 -0800
Message-ID: <20200113224703.5917-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This series adds new functions to the mmu interval notifier API to
allow device drivers with MMUs to dynamically mirror a process' page
tables based on device faults and invalidation callbacks. The Nouveau
driver is updated to use the extended API and a set of stand alone self
tests is added to help validate and maintain correctness.

The patches are based on linux-5.5.0-rc6 and are for Jason's rdma/hmm tree
since I believe he is planning some interval notifier changes.

Changes v5 -> v6:
Rebase to linux-5.5.0-rc6
Refactored mmu interval notifier patches
Converted nouveau to use the new mmu interval notifier API

Changes v4 -> v5:
Added mmu interval notifier insert/remove/update callable from the
  invalidate() callback
Updated HMM tests to use the new core interval notifier API

Changes v1 -> v4:
https://lore.kernel.org/linux-mm/20191104222141.5173-1-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org

Ralph Campbell (6):
  mm/mmu_notifier: add mmu_interval_notifier_insert_safe()
  mm/mmu_notifier: add mmu_interval_notifier_put()
  mm/notifier: add mmu_interval_notifier_update()
  mm/mmu_notifier: add mmu_interval_notifier_find()
  nouveau: use new mmu interval notifiers
  mm/hmm/test: add self tests for HMM

 MAINTAINERS                            |    3 +
 drivers/gpu/drm/nouveau/nouveau_svm.c  |  313 ++++--
 include/linux/mmu_notifier.h           |   29 +
 lib/Kconfig.debug                      |   11 +
 lib/Makefile                           |    1 +
 lib/test_hmm.c                         | 1368 ++++++++++++++++++++++++
 mm/mmu_notifier.c                      |  223 +++-
 tools/testing/selftests/vm/.gitignore  |    1 +
 tools/testing/selftests/vm/Makefile    |    3 +
 tools/testing/selftests/vm/config      |    2 +
 tools/testing/selftests/vm/hmm-tests.c | 1354 +++++++++++++++++++++++
 tools/testing/selftests/vm/run_vmtests |   16 +
 tools/testing/selftests/vm/test_hmm.sh |   97 ++
 13 files changed, 3289 insertions(+), 132 deletions(-)
 create mode 100644 lib/test_hmm.c
 create mode 100644 tools/testing/selftests/vm/hmm-tests.c
 create mode 100755 tools/testing/selftests/vm/test_hmm.sh

--=20
2.20.1
