From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: [PATCH hmm 3/5] drm/amdgpu: remove dead code after hmm_range_fault()
Date: Tue, 21 Apr 2020 21:21:44 -0300
Message-ID: <3-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com>
References: <0-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mm@kvack.org, Ralph Campbell <rcampbell@nvidia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, dri-devel@lists.freedesktop.org, "Kuehling, Felix" <Felix.Kuehling@amd.com>, Christoph Hellwig <hch@lst.de>, intel-gfx@lists.freedesktop.org, =?utf-8?b?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

From: Jason Gunthorpe <jgg@mellanox.com>

Since amdgpu does not use the snapshot mode of hmm_range_fault() a
successful return already proves that all entries in the pfns are
HMM_PFN_VALID, there is no need to check the return result of
hmm_device_entry_to_page().

Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index efc1329a019127..bff8e64701a547 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -862,17 +862,13 @@ int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, struct page **pages)
 		goto out_free_pfns;
 	}
 
-	for (i = 0; i < ttm->num_pages; i++) {
-		/* FIXME: The pages cannot be touched outside the notifier_lock */
+	/*
+	 * Due to default_flags, all pages are HMM_PFN_VALID or
+	 * hmm_range_fault() fails. FIXME: The pages cannot be touched outside
+	 * the notifier_lock, and mmu_interval_read_retry() must be done first.
+	 */
+	for (i = 0; i < ttm->num_pages; i++)
 		pages[i] = hmm_device_entry_to_page(range, range->pfns[i]);
-		if (unlikely(!pages[i])) {
-			pr_err("Page fault failed for pfn[%lu] = 0x%llx\n",
-			       i, range->pfns[i]);
-			r = -ENOMEM;
-
-			goto out_free_pfns;
-		}
-	}
 
 	gtt->range = range;
 	mmput(mm);
-- 
2.26.0
