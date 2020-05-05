From: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH hmm v2 2/5] mm/hmm: make hmm_range_fault return 0 or -1
Date: Mon, 4 May 2020 17:20:58 -0700
Message-ID: <9cf9f4f0-58b7-1992-6c6e-eed226ba42c0@nvidia.com>
References: <2-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg@mellanox.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@ziepe.ca>, linux-mm@kvack.org, Ralph Campbell <rcampbell@nvidia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, dri-devel@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>, Christoph Hellwig <hch@lst.de>, intel-gfx@lists.freedesktop.org, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, linux-kernel@vger.kernel.org, Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>, nouveau@lists.freedesktop.org, "Yang, Philip" <Philip.Yang@amd.com>
List-Id: nouveau.vger.kernel.org

On 2020-05-01 11:20, Jason Gunthorpe wrote:
> From: Jason Gunthorpe <jgg@mellanox.com>
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

Yes, this is also a nice simplification.

> ...
> @@ -590,10 +580,13 @@ long hmm_range_fault(struct hmm_range *range)
>   			return -EBUSY;
>   		ret = walk_page_range(mm, hmm_vma_walk.last, range->end,
>   				      &hmm_walk_ops, &hmm_vma_walk);
> +		/*
> +		 * When -EBUSY is returned the loop restarts with
> +		 * hmm_vma_walk.last set to an address that has not been stored
> +		 * in pfns. All entries < last in the pfn array are set to their
> +		 * output, and all >= are still at their input values.
> +		 */

I'm glad you added that comment. This is much easier to figure out with
that in place. After poking around this patch and eventually understanding the
.last handling, I wondered if you might like this slightly tweaked wording
instead:

		/*
		 * Each of the hmm_walk_ops routines returns -EBUSY if and only
		 * hmm_vma_walk.last has been set to an address that has not yet
		 * been stored in pfns. All entries < last in the pfn array are
		 * set to their output, and all >= are still at their input
		 * values.
		 */

Either way,

     Reviewed-by: John Hubbard <jhubbard@nvidia.com>

thanks,
-- 
John Hubbard
NVIDIA

>   	} while (ret == -EBUSY);
> -
> -	if (ret)
> -		return ret;
> -	return (hmm_vma_walk.last - range->start) >> PAGE_SHIFT;
> +	return ret;
>   }
>   EXPORT_SYMBOL(hmm_range_fault);
> 
