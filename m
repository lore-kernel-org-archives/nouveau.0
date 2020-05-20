From: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH] nouveau/hmm: fix migrate zero page to GPU
Date: Wed, 20 May 2020 14:05:08 -0700
Message-ID: <0ef69e08-7f5d-7a3d-c657-55b3a8df1dfe@nvidia.com>
References: <20200520183652.21633-1-rcampbell@nvidia.com>
 <20200520192045.GH24561@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200520192045.GH24561@mellanox.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@mellanox.com>
Cc: nouveau@lists.freedesktop.org, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org


On 5/20/20 12:20 PM, Jason Gunthorpe wrote:
> On Wed, May 20, 2020 at 11:36:52AM -0700, Ralph Campbell wrote:
>> When calling OpenCL clEnqueueSVMMigrateMem() on a region of memory that
>> is backed by pte_none() or zero pages, migrate_vma_setup() will fill the
>> source PFN array with an entry indicating the source page is zero.
>> Use this to optimize migration to device private memory by allocating
>> GPU memory and zero filling it instead of failing to migrate the page.
>>
>> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
>>
>> This patch applies cleanly to Jason's Gunthorpe's hmm tree plus two
>> patches I posted earlier. The first is queued in Ben Skegg's nouveau
>> tree and the second is still pending review/not queued.
>> [1] ("nouveau/hmm: map pages after migration")
>> https://lore.kernel.org/linux-mm/20200304001339.8248-5-rcampbell@nvidia.com/
>> [2] ("nouveau/hmm: fix nouveau_dmem_chunk allocations")
>> https://lore.kernel.org/lkml/20200421231107.30958-1-rcampbell@nvidia.com/
> 
> It would be best if it goes through Ben's tree if it doesn't have
> conflicts with the hunks I have in the hmm tree.. Is it the case?
> 
> Jason

I think there might be some merge conflicts even though it is semantically
independent of the other changes. I guess since we are at 5.7-rc6 and not
far from the merge window, I can rebase after 5.8-rc1 and resend.
I posted this mostly to get some review and as a "heads up" of the issue.
