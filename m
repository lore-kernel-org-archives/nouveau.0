From: Ralph Campbell <rcampbell@nvidia.com>
Subject: [PATCH v2] nouveau: fix page fault on device private memory
Date: Fri, 26 Jun 2020 14:03:37 -0700
Message-ID: <20200626210337.20089-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>, stable@vger.kernel.org
List-Id: nouveau.vger.kernel.org

If system memory is migrated to device private memory and no GPU MMU
page table entry exists, the GPU will fault and call hmm_range_fault()
to get the PFN for the page. Since the .dev_private_owner pointer in
struct hmm_range is not set, hmm_range_fault returns an error which
results in the GPU program stopping with a fatal fault.
Fix this by setting .dev_private_owner appropriately.

Fixes: 08ddddda667b ("mm/hmm: check the device private page owner in hmm_ra=
nge_fault()")
Cc: stable@vger.kernel.org
Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>
---

This is based on Linux-5.8.0-rc2 and is for Ben Skeggs nouveau tree.
It doesn't depend on any of the other nouveau/HMM changes I have
recently posted.

Resending to include stable@vger.org and adding Jason's reviewed-by.

 drivers/gpu/drm/nouveau/nouveau_svm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouvea=
u/nouveau_svm.c
index ba9f9359c30e..6586d9d39874 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -562,6 +562,7 @@ static int nouveau_range_fault(struct nouveau_svmm *svm=
m,
 		.end =3D notifier->notifier.interval_tree.last + 1,
 		.pfn_flags_mask =3D HMM_PFN_REQ_FAULT | HMM_PFN_REQ_WRITE,
 		.hmm_pfns =3D hmm_pfns,
+		.dev_private_owner =3D drm->dev,
 	};
 	struct mm_struct *mm =3D notifier->notifier.mm;
 	int ret;
--=20
2.20.1
