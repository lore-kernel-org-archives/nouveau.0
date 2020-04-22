From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: Re: [PATCH hmm 2/5] mm/hmm: make hmm_range_fault return 0
 or -1
Date: Wed, 22 Apr 2020 07:52:29 +0200
Message-ID: <20200422055229.GB22366@lst.de>
References: <0-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com>
 <2-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2-v1-4eb72686de3c+5062-hmm_no_flags_jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Jason Gunthorpe <jgg-uk2M96/98Pc@public.gmane.org>
Cc: "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, "Kuehling,
 Felix" <Felix.Kuehling-5C7GfCeVMHo@public.gmane.org>, Niranjana Vishwanathapura <niranjana.vishwanathapura-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Apr 21, 2020 at 09:21:43PM -0300, Jason Gunthorpe wrote:
> From: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> 
> hmm_vma_walk->last is supposed to be updated after every write to the
> pfns, so that it can be returned by hmm_range_fault(). However, this is
> not done consistently. Fortunately nothing checks the return code of
> hmm_range_fault() for anything other than error.
> 
> More importantly last must be set before returning -EBUSY as it is used to
> prevent reading an output pfn as an input flags when the loop restarts.
> 
> For clarity and simplicity make hmm_range_fault() return 0 or -ERRNO. Only
> set last when returning -EBUSY.
> 
> Signed-off-by: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/vm/hmm.rst                |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  4 ++--
>  drivers/gpu/drm/nouveau/nouveau_svm.c   |  6 +++---
>  include/linux/hmm.h                     |  2 +-
>  mm/hmm.c                                | 25 +++++++++----------------
>  5 files changed, 16 insertions(+), 23 deletions(-)
> 
> diff --git a/Documentation/vm/hmm.rst b/Documentation/vm/hmm.rst
> index 4e3e9362afeb10..9924f2caa0184c 100644
> --- a/Documentation/vm/hmm.rst
> +++ b/Documentation/vm/hmm.rst
> @@ -161,7 +161,7 @@ device must complete the update before the driver callback returns.
>  When the device driver wants to populate a range of virtual addresses, it can
>  use::
>  
> -  long hmm_range_fault(struct hmm_range *range);
> +  int hmm_range_fault(struct hmm_range *range);
>  
>  It will trigger a page fault on missing or read-only entries if write access is
>  requested (see below). Page faults use the generic mm page fault code path just
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 6309ff72bd7876..efc1329a019127 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -852,12 +852,12 @@ int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, struct page **pages)
>  	down_read(&mm->mmap_sem);
>  	r = hmm_range_fault(range);
>  	up_read(&mm->mmap_sem);
> -	if (unlikely(r <= 0)) {
> +	if (unlikely(r)) {
>  		/*
>  		 * FIXME: This timeout should encompass the retry from
>  		 * mmu_interval_read_retry() as well.
>  		 */
> -		if ((r == 0 || r == -EBUSY) && !time_after(jiffies, timeout))
> +		if ((r == -EBUSY) && !time_after(jiffies, timeout))

Please also kill the superflous inner braces here.

> + * Return: 0 or -ERRNO with one of the following status codes:

Maybe say something like:

    * Returns 0 on success or one of the following error codes:

Otherwise this looks good:

Reviewed-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
