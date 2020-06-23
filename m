From: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [RESEND PATCH 3/3] nouveau: make nvkm_vmm_ctor() and
 nvkm_mmu_ptp_get() static
Date: Mon, 22 Jun 2020 17:57:31 -0700
Message-ID: <c4421e68-e585-30b4-a6c3-e78e9e15c27f@nvidia.com>
References: <20200622233854.10889-1-rcampbell@nvidia.com>
 <20200622233854.10889-4-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200622233854.10889-4-rcampbell@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jerome Glisse <jglisse@redhat.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On 2020-06-22 16:38, Ralph Campbell wrote:
> The functions nvkm_vmm_ctor() and nvkm_mmu_ptp_get() are not called outside
> of the file defining them so make them static.
> 
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c  | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h  | 3 ---
>   3 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
> index ee11ccaf0563..de91e9a26172 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
> @@ -61,7 +61,7 @@ nvkm_mmu_ptp_put(struct nvkm_mmu *mmu, bool force, struct nvkm_mmu_pt *pt)
>   	kfree(pt);
>   }
>   
> -struct nvkm_mmu_pt *
> +static struct nvkm_mmu_pt *
>   nvkm_mmu_ptp_get(struct nvkm_mmu *mmu, u32 size, bool zero)
>   {
>   	struct nvkm_mmu_pt *pt;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> index 199f94e15c5f..67b00dcef4b8 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> @@ -1030,7 +1030,7 @@ nvkm_vmm_ctor_managed(struct nvkm_vmm *vmm, u64 addr, u64 size)
>   	return 0;
>   }
>   
> -int
> +static int
>   nvkm_vmm_ctor(const struct nvkm_vmm_func *func, struct nvkm_mmu *mmu,
>   	      u32 pd_header, bool managed, u64 addr, u64 size,
>   	      struct lock_class_key *key, const char *name,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
> index d3f8f916d0db..a2b179568970 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
> @@ -163,9 +163,6 @@ int nvkm_vmm_new_(const struct nvkm_vmm_func *, struct nvkm_mmu *,
>   		  u32 pd_header, bool managed, u64 addr, u64 size,
>   		  struct lock_class_key *, const char *name,
>   		  struct nvkm_vmm **);
> -int nvkm_vmm_ctor(const struct nvkm_vmm_func *, struct nvkm_mmu *,
> -		  u32 pd_header, bool managed, u64 addr, u64 size,
> -		  struct lock_class_key *, const char *name, struct nvkm_vmm *);
>   struct nvkm_vma *nvkm_vmm_node_search(struct nvkm_vmm *, u64 addr);
>   struct nvkm_vma *nvkm_vmm_node_split(struct nvkm_vmm *, struct nvkm_vma *,
>   				     u64 addr, u64 size);
> 

Looks accurate: the order within vmm.c (now that there is no .h
declaration) is still good, and I found no other uses of either function
within the linux.git tree, so


Reviewed-by: John Hubbard <jhubbard@nvidia.com


thanks,
-- 
John Hubbard
NVIDIA
