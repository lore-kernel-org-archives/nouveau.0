From: Ralph Campbell <rcampbell@nvidia.com>
Subject: [PATCH v3 2/4] nouveau/hmm: check for SVM initialized before migrating
Date: Tue, 3 Mar 2020 16:13:37 -0800
Message-ID: <20200304001339.8248-3-rcampbell@nvidia.com>
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

When migrating system memory to GPU memory, check that SVM has been
enabled. Even though most errors can be ignored since migration is
a performance optimization, return an error because this is a violation
of the API.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouvea=
u/nouveau_svm.c
index 169320409286..c567526b75b8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -171,6 +171,11 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
 	mm =3D get_task_mm(current);
 	down_read(&mm->mmap_sem);
=20
+	if (!cli->svm.svmm) {
+		up_read(&mm->mmap_sem);
+		return -EINVAL;
+	}
+
 	for (addr =3D args->va_start, end =3D args->va_start + size; addr < end;)=
 {
 		struct vm_area_struct *vma;
 		unsigned long next;
--=20
2.20.1
