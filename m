From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH v2] nouveau/hmm: map pages after migration
Date: Tue, 3 Mar 2020 08:42:29 -0400
Message-ID: <20200303124229.GH26318@mellanox.com>
References: <20200303010023.2983-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200303010023.2983-1-rcampbell@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Mon, Mar 02, 2020 at 05:00:23PM -0800, Ralph Campbell wrote:
> When memory is migrated to the GPU, it is likely to be accessed by GPU
> code soon afterwards. Instead of waiting for a GPU fault, map the
> migrated memory into the GPU page tables with the same access permissions
> as the source CPU page table entries. This preserves copy on write
> semantics.
> 
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Jason Gunthorpe <jgg@mellanox.com>
> Cc: "Jérôme Glisse" <jglisse@redhat.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> ---
> 
> Originally this patch was targeted for Jason's rdma tree since other HMM
> related changes were queued there. Now that those have been merged, this
> patch just contains changes to nouveau so it could go through any tree.
> I guess Ben Skeggs' tree would be appropriate.

Yep

> +static inline struct nouveau_pfnmap_args *
> +nouveau_pfns_to_args(void *pfns)

don't use static inline inside C files

> +{
> +	struct nvif_vmm_pfnmap_v0 *p =
> +		container_of(pfns, struct nvif_vmm_pfnmap_v0, phys);
> +
> +	return container_of(p, struct nouveau_pfnmap_args, p);

And this should just be 

   return container_of(pfns, struct nouveau_pfnmap_args, p.phys);

> +static struct nouveau_svmm *
> +nouveau_find_svmm(struct nouveau_svm *svm, struct mm_struct *mm)
> +{
> +	struct nouveau_ivmm *ivmm;
> +
> +	list_for_each_entry(ivmm, &svm->inst, head) {
> +		if (ivmm->svmm->notifier.mm == mm)
> +			return ivmm->svmm;
> +	}
> +	return NULL;
> +}

Is this re-implementing mmu_notifier_get() ?

Jason
