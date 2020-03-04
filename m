From: Ralph Campbell <rcampbell@nvidia.com>
Subject: [PATCH v3 3/4] nouveau: remove useless SVM range check
Date: Tue, 3 Mar 2020 16:13:38 -0800
Message-ID: <20200304001339.8248-4-rcampbell@nvidia.com>
References: <20200304001339.8248-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200304001339.8248-1-rcampbell@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
Cc: Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, Andrew Morton <akpm@linux-foundation.org>, Ben Skeggs <bskeggs@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>
List-Id: nouveau.vger.kernel.org

When nouveau processes GPU faults, it checks to see if the fault address
falls within the "unmanaged" range which is reserved for fixed allocations
instead of addresses chosen by the core mm code. If start is greater than
or equal to svmm->unmanaged.limit, then limit will also be greater than
svmm->unmanaged.limit which is greater than svmm->unmanaged.start and the
start =3D max_t(u64, start, svmm->unmanaged.limit) will change nothing.
Just remove the useless lines of code.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouvea=
u/nouveau_svm.c
index c567526b75b8..8dfa5cb74826 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -663,9 +663,6 @@ nouveau_svm_fault(struct nvif_notify *notify)
 		limit =3D start + (ARRAY_SIZE(args.phys) << PAGE_SHIFT);
 		if (start < svmm->unmanaged.limit)
 			limit =3D min_t(u64, limit, svmm->unmanaged.start);
-		else
-		if (limit > svmm->unmanaged.start)
-			start =3D max_t(u64, start, svmm->unmanaged.limit);
 		SVMM_DBG(svmm, "wndw %016llx-%016llx", start, limit);
=20
 		mm =3D svmm->notifier.mm;
--=20
2.20.1
