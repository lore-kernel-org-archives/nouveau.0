From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/5] mm/hmm/nouveau: add PMD system memory mapping
Date: Tue, 30 Jun 2020 12:57:32 -0700
Message-ID: <20200630195737.8667-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

The goal for this series is to introduce the hmm_range_fault() output
array flags HMM_PFN_PMD and HMM_PFN_PUD. This allows a device driver to
know that a given 4K PFN is actually mapped by the CPU using either a
PMD sized or PUD sized CPU page table entry and therefore the device
driver can safely map system memory using larger device MMU PTEs.
The series is based on 5.8.0-rc3 and is intended for Jason Gunthorpe's
hmm tree. These were originally part of a larger series:
https://lore.kernel.org/linux-mm/20200619215649.32297-1-rcampbell-DDmLM1+adcphl2p70BpVqQ@public.gmane.org=
m/

Changes in v2:
Make the hmm_range_fault() API changes into a separate series and add
  two output flags for PMD/PUD instead of a single compund page flag as
  suggested by Jason Gunthorpe.
Make the nouveau page table changes a separate patch as suggested by
  Ben Skeggs.
Only add support for 2MB nouveau mappings initially since changing the
1:1 CPU/GPU page table size assumptions requires a bigger set of changes.
Rebase to 5.8.0-rc3.

Ralph Campbell (5):
  nouveau/hmm: fault one page at a time
  mm/hmm: add output flags for PMD/PUD page mapping
  nouveau: fix mapping 2MB sysmem pages
  nouveau/hmm: support mapping large sysmem pages
  hmm: add tests for HMM_PFN_PMD flag

 drivers/gpu/drm/nouveau/nouveau_svm.c         | 238 ++++++++----------
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c |   5 +-
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |  82 ++++++
 include/linux/hmm.h                           |  11 +-
 lib/test_hmm.c                                |   4 +
 lib/test_hmm_uapi.h                           |   4 +
 mm/hmm.c                                      |  13 +-
 tools/testing/selftests/vm/hmm-tests.c        |  76 ++++++
 8 files changed, 290 insertions(+), 143 deletions(-)

--=20
2.20.1
