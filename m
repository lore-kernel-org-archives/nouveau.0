From: Ralph Campbell <rcampbell@nvidia.com>
Subject: [PATCH v2] nouveau: fix the start/end range for migration
Date: Mon, 31 Aug 2020 13:31:11 -0700
Message-ID: <20200831203111.4940-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>
List-Id: nouveau.vger.kernel.org

The user level OpenCL code shouldn't have to align start and end
addresses to a page boundary. That is better handled in the nouveau
driver. The npages field is also redundant since it can be computed
from the start and end addresses.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---

This is for Ben Skegg's nouveau tree.

I have been working with Karol Herbst on the OpenCL mesa changes for
nouveau which will be merged upstream soon.
With or without those changes, the user visible effect of this patch
only extends the range by one page (round up vs. round down to page
boundary).

Changes in v2:
I changed the start/end check to require a size so start has to be less
than end.

 drivers/gpu/drm/nouveau/nouveau_svm.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouvea=
u/nouveau_svm.c
index 2df1c0460559..4f69e4c3dafd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -105,11 +105,11 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
 	struct nouveau_cli *cli =3D nouveau_cli(file_priv);
 	struct drm_nouveau_svm_bind *args =3D data;
 	unsigned target, cmd, priority;
-	unsigned long addr, end, size;
+	unsigned long addr, end;
 	struct mm_struct *mm;
=20
 	args->va_start &=3D PAGE_MASK;
-	args->va_end &=3D PAGE_MASK;
+	args->va_end =3D ALIGN(args->va_end, PAGE_SIZE);
=20
 	/* Sanity check arguments */
 	if (args->reserved0 || args->reserved1)
@@ -118,8 +118,6 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
 		return -EINVAL;
 	if (args->va_start >=3D args->va_end)
 		return -EINVAL;
-	if (!args->npages)
-		return -EINVAL;
=20
 	cmd =3D args->header >> NOUVEAU_SVM_BIND_COMMAND_SHIFT;
 	cmd &=3D NOUVEAU_SVM_BIND_COMMAND_MASK;
@@ -151,12 +149,6 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
 	if (args->stride)
 		return -EINVAL;
=20
-	size =3D ((unsigned long)args->npages) << PAGE_SHIFT;
-	if ((args->va_start + size) <=3D args->va_start)
-		return -EINVAL;
-	if ((args->va_start + size) > args->va_end)
-		return -EINVAL;
-
 	/*
 	 * Ok we are ask to do something sane, for now we only support migrate
 	 * commands but we will add things like memory policy (what to do on
@@ -171,7 +163,7 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
 		return -EINVAL;
 	}
=20
-	for (addr =3D args->va_start, end =3D args->va_start + size; addr < end;)=
 {
+	for (addr =3D args->va_start, end =3D args->va_end; addr < end;) {
 		struct vm_area_struct *vma;
 		unsigned long next;
=20
--=20
2.20.1
