From: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH 4/5] nouveau: unlock mmap_sem on all errors from
 nouveau_range_fault
Date: Wed, 3 Jul 2019 13:46:02 -0700
Message-ID: <ec5e86a4-4a60-0dd5-797c-41b21e3a091a@nvidia.com>
References: <20190703184502.16234-1-hch@lst.de>
 <20190703184502.16234-5-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703184502.16234-5-hch@lst.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Cc: linux-mm@kvack.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org


On 7/3/19 11:45 AM, Christoph Hellwig wrote:
> Currently nouveau_svm_fault expects nouveau_range_fault to never unlock
> mmap_sem, but the latter unlocks it for a random selection of error
> codes. Fix this up by always unlocking mmap_sem for non-zero return
> values in nouveau_range_fault, and only unlocking it in the caller
> for successful returns.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>

> ---
>   drivers/gpu/drm/nouveau/nouveau_svm.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index e831f4184a17..c0cf7aeaefb3 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -500,8 +500,10 @@ nouveau_range_fault(struct hmm_mirror *mirror, struct hmm_range *range,

You can delete the comment "With the old API the driver must ..."
(not visible in the patch here).
I suggest moving the two assignments:
	range->default_flags = 0;
	range->pfn_flags_mask = -1UL;
to just above the "again:" where the other range.xxx fields are
initialized in nouveau_svm_fault().

>   	ret = hmm_range_register(range, mirror,
>   				 range->start, range->end,
>   				 PAGE_SHIFT);
> -	if (ret)
> +	if (ret) {
> +		up_read(&range->vma->vm_mm->mmap_sem; >   		return (int)ret;
> +	}
>   
>   	if (!hmm_range_wait_until_valid(range, NOUVEAU_RANGE_FAULT_TIMEOUT)) {
>   		/*

You can delete this comment (only the first line is visible here)
since it is about the "old API".
Also, it should return -EBUSY not -EAGAIN since it means there was a
range invalidation collision (similar to hmm_range_fault() if
!range->valid).

> @@ -515,15 +517,14 @@ nouveau_range_fault(struct hmm_mirror *mirror, struct hmm_range *range,
>   
>   	ret = hmm_range_fault(range, block);

nouveau_range_fault() is only called with "block = true" so
could eliminate the block parameter and pass true here.

>   	if (ret <= 0) {
> -		if (ret == -EBUSY || !ret) {
> -			/* Same as above, drop mmap_sem to match old API. */
> -			up_read(&range->vma->vm_mm->mmap_sem);
> -			ret = -EBUSY;
> -		} else if (ret == -EAGAIN)
> +		if (ret == 0)
>   			ret = -EBUSY;
> +		if (ret != -EAGAIN)
> +			up_read(&range->vma->vm_mm->mmap_sem);

Can ret == -EAGAIN happen if "block = true"?
Generally, I prefer the read_down()/read_up() in the same function
(i.e., nouveau_svm_fault()) but I can see why it should be here
if hmm_range_fault() can return with mmap_sem unlocked.

>   		hmm_range_unregister(range);
>   		return ret;
>   	}
> +
>   	return 0;
>   }
>   
> @@ -718,8 +719,8 @@ nouveau_svm_fault(struct nvif_notify *notify)
>   						NULL);
>   			svmm->vmm->vmm.object.client->super = false;
>   			mutex_unlock(&svmm->mutex);
> +			up_read(&svmm->mm->mmap_sem);
>   		}
> -		up_read(&svmm->mm->mmap_sem);
>   

The "else" case should check for -EBUSY and goto again.

>   		/* Cancel any faults in the window whose pages didn't manage
>   		 * to keep their valid bit, or stay writeable when required.
> 
