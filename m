From: Jason Gunthorpe <jgg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/5] mm/migrate: add a direction parameter to
 migrate_vma
Date: Mon, 20 Jul 2020 15:36:43 -0300
Message-ID: <20200720183643.GA3028737@nvidia.com>
References: <20200713172149.2310-1-rcampbell@nvidia.com>
 <20200713172149.2310-3-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200713172149.2310-3-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, kvm-ppc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Bharata B Rao <bharata-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Jul 13, 2020 at 10:21:46AM -0700, Ralph Campbell wrote:
> The src_owner field in struct migrate_vma is being used for two purposes,
> it implies the direction of the migration and it identifies device private
> pages owned by the caller. Split this into separate parameters so the
> src_owner field can be used just to identify device private pages owned
> by the caller of migrate_vma_setup().
> 
> Signed-off-by: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Bharata B Rao <bharata-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>
>  arch/powerpc/kvm/book3s_hv_uvmem.c     |  2 ++
>  drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 ++
>  include/linux/migrate.h                | 12 +++++++++---
>  lib/test_hmm.c                         |  2 ++
>  mm/migrate.c                           |  5 +++--
>  5 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index 09d8119024db..acbf14cd2d72 100644
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -400,6 +400,7 @@ kvmppc_svm_page_in(struct vm_area_struct *vma, unsigned long start,
>  	mig.end = end;
>  	mig.src = &src_pfn;
>  	mig.dst = &dst_pfn;
> +	mig.dir = MIGRATE_VMA_FROM_SYSTEM;
>  
>  	/*
>  	 * We come here with mmap_lock write lock held just for
> @@ -578,6 +579,7 @@ kvmppc_svm_page_out(struct vm_area_struct *vma, unsigned long start,
>  	mig.src = &src_pfn;
>  	mig.dst = &dst_pfn;
>  	mig.src_owner = &kvmppc_uvmem_pgmap;
> +	mig.dir = MIGRATE_VMA_FROM_DEVICE_PRIVATE;
>  
>  	mutex_lock(&kvm->arch.uvmem_lock);
>  	/* The requested page is already paged-out, nothing to do */
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index e5c230d9ae24..e5c83b8ee82e 100644
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -183,6 +183,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
>  		.src		= &src,
>  		.dst		= &dst,
>  		.src_owner	= drm->dev,
> +		.dir		= MIGRATE_VMA_FROM_DEVICE_PRIVATE,
>  	};
>  
>  	/*
> @@ -615,6 +616,7 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
>  	struct migrate_vma args = {
>  		.vma		= vma,
>  		.start		= start,
> +		.dir		= MIGRATE_VMA_FROM_SYSTEM,
>  	};
>  	unsigned long i;
>  	u64 *pfns;
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index 3e546cbf03dd..620f2235d7d4 100644
> +++ b/include/linux/migrate.h
> @@ -180,6 +180,11 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
>  	return (pfn << MIGRATE_PFN_SHIFT) | MIGRATE_PFN_VALID;
>  }
>  
> +enum migrate_vma_direction {
> +	MIGRATE_VMA_FROM_SYSTEM,
> +	MIGRATE_VMA_FROM_DEVICE_PRIVATE,
> +};

I would have guessed this is more natural as _FROM_DEVICE_ and
TO_DEVICE_ ?

All the callers of this API are device drivers managing their
DEVICE_PRIVATE, right?

Jason
