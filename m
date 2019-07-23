From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH 4/6] nouveau: unlock mmap_sem on all errors from
 nouveau_range_fault
Date: Tue, 23 Jul 2019 15:18:28 +0000
Message-ID: <20190723151824.GL15331@mellanox.com>
References: <20190722094426.18563-1-hch@lst.de>
 <20190722094426.18563-5-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722094426.18563-5-hch@lst.de>
Content-Language: en-US
Content-ID: <B925593E81AF184DBCA6A2F968BAEBF5@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Mon, Jul 22, 2019 at 11:44:24AM +0200, Christoph Hellwig wrote:
> Currently nouveau_svm_fault expects nouveau_range_fault to never unlock
> mmap_sem, but the latter unlocks it for a random selection of error
> codes. Fix this up by always unlocking mmap_sem for non-zero return
> values in nouveau_range_fault, and only unlocking it in the caller
> for successful returns.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
>  drivers/gpu/drm/nouveau/nouveau_svm.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouv=
eau/nouveau_svm.c
> index 5dd83a46578f..5de2d54b9782 100644
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -494,8 +494,10 @@ nouveau_range_fault(struct hmm_mirror *mirror, struc=
t hmm_range *range)
>  	ret =3D hmm_range_register(range, mirror,
>  				 range->start, range->end,
>  				 PAGE_SHIFT);
> -	if (ret)
> +	if (ret) {
> +		up_read(&range->vma->vm_mm->mmap_sem);
>  		return (int)ret;
> +	}
> =20
>  	if (!hmm_range_wait_until_valid(range, HMM_RANGE_DEFAULT_TIMEOUT)) {
>  		up_read(&range->vma->vm_mm->mmap_sem);
> @@ -504,11 +506,9 @@ nouveau_range_fault(struct hmm_mirror *mirror, struc=
t hmm_range *range)
> =20
>  	ret =3D hmm_range_fault(range, true);
>  	if (ret <=3D 0) {
> -		if (ret =3D=3D -EBUSY || !ret) {
> -			up_read(&range->vma->vm_mm->mmap_sem);
> -			ret =3D -EBUSY;
> -		} else if (ret =3D=3D -EAGAIN)
> +		if (ret =3D=3D 0)
>  			ret =3D -EBUSY;
> +		up_read(&range->vma->vm_mm->mmap_sem);
>  		hmm_range_unregister(range);
>  		return ret;

Hum..

The caller does this:

again:
		ret =3D nouveau_range_fault(&svmm->mirror, &range);
		if (ret =3D=3D 0) {
			mutex_lock(&svmm->mutex);
			if (!nouveau_range_done(&range)) {
				mutex_unlock(&svmm->mutex);
				goto again;

And we can't call nouveau_range_fault() -> hmm_range_fault() without
holding the mmap_sem, so we can't allow nouveau_range_fault to unlock
it.

Maybe this instead?=20

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouvea=
u/nouveau_svm.c
index a9c5c58d425b3d..92cf760a9bcc5d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -494,21 +494,16 @@ nouveau_range_fault(struct hmm_mirror *mirror, struct=
 hmm_range *range)
 	ret =3D hmm_range_register(range, mirror,
 				 range->start, range->end,
 				 PAGE_SHIFT);
-	if (ret) {
-		up_read(&range->vma->vm_mm->mmap_sem);
+	if (ret)
 		return (int)ret;
-	}
=20
-	if (!hmm_range_wait_until_valid(range, HMM_RANGE_DEFAULT_TIMEOUT)) {
-		up_read(&range->vma->vm_mm->mmap_sem);
+	if (!hmm_range_wait_until_valid(range, HMM_RANGE_DEFAULT_TIMEOUT))
 		return -EBUSY;
-	}
=20
 	ret =3D hmm_range_fault(range, true);
 	if (ret <=3D 0) {
 		if (ret =3D=3D 0)
 			ret =3D -EBUSY;
-		up_read(&range->vma->vm_mm->mmap_sem);
 		hmm_range_unregister(range);
 		return ret;
 	}
@@ -706,8 +701,8 @@ nouveau_svm_fault(struct nvif_notify *notify)
 						NULL);
 			svmm->vmm->vmm.object.client->super =3D false;
 			mutex_unlock(&svmm->mutex);
-			up_read(&svmm->mm->mmap_sem);
 		}
+		up_read(&svmm->mm->mmap_sem);
=20
 		/* Cancel any faults in the window whose pages didn't manage
 		 * to keep their valid bit, or stay writeable when required.
