From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: [PATCH hmm v2 0/5] Adjust hmm_range_fault() API
Date: Fri,  1 May 2020 15:20:43 -0300
Message-ID: <0-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mm@kvack.org, Ralph Campbell <rcampbell@nvidia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, dri-devel@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>, Christoph Hellwig <hch@lst.de>, intel-gfx@lists.freedesktop.org, =?utf-8?b?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>, nouveau@lists.freedesktop.org, "Yang, Philip" <Philip.Yang@amd.com>
List-Id: nouveau.vger.kernel.org

From: Jason Gunthorpe <jgg@mellanox.com>

The API is a bit complicated for the uses we actually have, and
disucssions for simplifying have come up a number of times.

This small series removes the customizable pfn format and simplifies the
return code of hmm_range_fault()

All the drivers are adjusted to process in the simplified format.
I would appreciated tested-by's for the two drivers, thanks!

v2:
 - Move call chain to commit message
 - Fix typo of HMM_PFN_REQ_FAULT
 - Move nouveau_hmm_convert_pfn() to nouveau_svm.c
 - Add acks and tested-bys
v1: https://lore.kernel.org/r/0-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com

Cc: Christoph Hellwig <hch@lst.de>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: nouveau@lists.freedesktop.org
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "David (ChunMing) Zhou" <David1.Zhou@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: "Yang, Philip" <Philip.Yang@amd.com>
To: linux-mm@kvack.org

Jason Gunthorpe (5):
  mm/hmm: make CONFIG_DEVICE_PRIVATE into a select
  mm/hmm: make hmm_range_fault return 0 or -1
  drm/amdgpu: remove dead code after hmm_range_fault()
  mm/hmm: remove HMM_PFN_SPECIAL
  mm/hmm: remove the customizable pfn format from hmm_range_fault

 Documentation/vm/hmm.rst                |  28 ++--
 arch/powerpc/Kconfig                    |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  56 +++----
 drivers/gpu/drm/nouveau/Kconfig         |   2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c  |  27 +---
 drivers/gpu/drm/nouveau/nouveau_dmem.h  |   3 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c   |  94 ++++++++----
 include/linux/hmm.h                     | 109 +++++---------
 mm/Kconfig                              |   7 +-
 mm/hmm.c                                | 185 +++++++++++-------------
 10 files changed, 217 insertions(+), 296 deletions(-)

-- 
2.26.2
