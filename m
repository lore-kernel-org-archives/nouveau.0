From: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH 2/5] mm/migrate: add a direction parameter to migrate_vma
Date: Wed, 8 Jul 2020 18:49:11 +0530
Message-ID: <20200708131911.GC7902@in.ibm.com>
References: <20200706222347.32290-1-rcampbell@nvidia.com>
 <20200706222347.32290-3-rcampbell@nvidia.com>
Reply-To: bharata@linux.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kvm-ppc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200706222347.32290-3-rcampbell@nvidia.com>
Sender: kvm-ppc-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: linux-rdma@vger.kernel.org, linux-mm@kvack.org, nouveau@lists.freedesktop.org, kvm-ppc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Mon, Jul 06, 2020 at 03:23:44PM -0700, Ralph Campbell wrote:
> The src_owner field in struct migrate_vma is being used for two purposes,
> it implies the direction of the migration and it identifies device private
> pages owned by the caller. Split this into separate parameters so the
> src_owner field can be used just to identify device private pages owned
> by the caller of migrate_vma_setup().
> 
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> ---
>  arch/powerpc/kvm/book3s_hv_uvmem.c     |  2 ++
>  drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 ++
>  include/linux/migrate.h                | 12 +++++++++---
>  lib/test_hmm.c                         |  2 ++
>  mm/migrate.c                           |  5 +++--
>  5 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index 09d8119024db..acbf14cd2d72 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
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

Reviewed-by: Bharata B Rao <bharata@linux.ibm.com>

for the above kvmppc change.
