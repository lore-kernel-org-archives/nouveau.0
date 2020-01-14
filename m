From: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v6 5/6] nouveau: use new mmu interval notifiers
Date: Tue, 14 Jan 2020 13:00:01 +0000
Message-ID: <20200114125957.GO20978@mellanox.com>
References: <20200113224703.5917-1-rcampbell@nvidia.com>
 <20200113224703.5917-6-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200113224703.5917-6-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Content-ID: <A033709EA4F95043BAEBE4C09070BEF0-wNKe6lTLrGecE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
Sender: linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org" <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Jan 13, 2020 at 02:47:02PM -0800, Ralph Campbell wrote:
>  void
>  nouveau_svmm_fini(struct nouveau_svmm **psvmm)
>  {
>  	struct nouveau_svmm *svmm =3D *psvmm;
> +	struct mmu_interval_notifier *mni;
> +
>  	if (svmm) {
>  		mutex_lock(&svmm->mutex);
> +		while (true) {
> +			mni =3D mmu_interval_notifier_find(svmm->mm,
> +					&nouveau_svm_mni_ops, 0UL, ~0UL);
> +			if (!mni)
> +				break;
> +			mmu_interval_notifier_put(mni);

Oh, now I really don't like the name 'put'. It looks like mni is
refcounted here, and it isn't. put should be called 'remove_deferred'

And then you also need a way to barrier this scheme on driver unload.

> +		}
>  		svmm->vmm =3D NULL;
>  		mutex_unlock(&svmm->mutex);
> -		mmu_notifier_put(&svmm->notifier);

While here it was actually a refcount.

> +static void nouveau_svmm_do_unmap(struct mmu_interval_notifier *mni,
> +				 const struct mmu_notifier_range *range)
> +{
> +	struct svmm_interval *smi =3D
> +		container_of(mni, struct svmm_interval, notifier);
> +	struct nouveau_svmm *svmm =3D smi->svmm;
> +	unsigned long start =3D mmu_interval_notifier_start(mni);
> +	unsigned long last =3D mmu_interval_notifier_last(mni);

This whole algorithm only works if it is protected by the read side of
the interval tree lock. Deserves at least a comment if not an
assertion too.

>  static int nouveau_range_fault(struct nouveau_svmm *svmm,
>  			       struct nouveau_drm *drm, void *data, u32 size,
> -			       u64 *pfns, struct svm_notifier *notifier)
> +			       u64 *pfns, u64 start, u64 end)
>  {
>  	unsigned long timeout =3D
>  		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
>  	/* Have HMM fault pages within the fault window to the GPU. */
>  	struct hmm_range range =3D {
> -		.notifier =3D &notifier->notifier,
> -		.start =3D notifier->notifier.interval_tree.start,
> -		.end =3D notifier->notifier.interval_tree.last + 1,
> +		.start =3D start,
> +		.end =3D end,
>  		.pfns =3D pfns,
>  		.flags =3D nouveau_svm_pfn_flags,
>  		.values =3D nouveau_svm_pfn_values,
> +		.default_flags =3D 0,
> +		.pfn_flags_mask =3D ~0UL,
>  		.pfn_shift =3D NVIF_VMM_PFNMAP_V0_ADDR_SHIFT,
>  	};
> -	struct mm_struct *mm =3D notifier->notifier.mm;
> +	struct mm_struct *mm =3D svmm->mm;
>  	long ret;
> =20
>  	while (true) {
>  		if (time_after(jiffies, timeout))
>  			return -EBUSY;
> =20
> -		range.notifier_seq =3D mmu_interval_read_begin(range.notifier);
> -		range.default_flags =3D 0;
> -		range.pfn_flags_mask =3D -1UL;
>  		down_read(&mm->mmap_sem);

mmap sem doesn't have to be held for the interval search, and again we
have lifetime issues with the membership here.

> +		ret =3D nouveau_svmm_interval_find(svmm, &range);
> +		if (ret) {
> +			up_read(&mm->mmap_sem);
> +			return ret;
> +		}
> +		range.notifier_seq =3D mmu_interval_read_begin(range.notifier);
>  		ret =3D hmm_range_fault(&range, 0);
>  		up_read(&mm->mmap_sem);
>  		if (ret <=3D 0) {

I'm still not sure this is a better approach than what ODP does. It
looks very expensive on the fault path..

Jason
