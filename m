From: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH] nouveau/hmm: fix nouveau_dmem_chunk allocations
Date: Thu, 23 Apr 2020 11:32:31 -0700
Message-ID: <a4a405d7-c136-b479-2bbe-5a2304f59c99@nvidia.com>
References: <20200421231107.30958-1-rcampbell@nvidia.com>
 <20200423121744.GY11945@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200423121744.GY11945@mellanox.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@mellanox.com>
Cc: nouveau@lists.freedesktop.org, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org


On 4/23/20 5:17 AM, Jason Gunthorpe wrote:
> On Tue, Apr 21, 2020 at 04:11:07PM -0700, Ralph Campbell wrote:
>> In nouveau_dmem_init(), a number of struct nouveau_dmem_chunk are allocated
>> and put on the dmem->chunk_empty list. Then in nouveau_dmem_pages_alloc(),
>> a nouveau_dmem_chunk is removed from the list and GPU memory is allocated.
>> However, the nouveau_dmem_chunk is never removed from the chunk_empty
>> list nor placed on the chunk_free or chunk_full lists. This results
>> in only one chunk ever being actually used (2MB) and quickly leads to
>> migration to device private memory failures.
>>
>> Fix this by having just one list of free device private pages and if no
>> pages are free, allocate a chunk of device private pages and GPU memory.
>>
>> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
>> ---
>>   drivers/gpu/drm/nouveau/nouveau_dmem.c | 304 +++++++++----------------
>>   1 file changed, 112 insertions(+), 192 deletions(-)
> 
> Does this generate any conflicts with my series to rework
> hmm_range_fault?
> 
> Jason

I based it on top of your series and the patch that Ben already has queued
("nouveau/hmm: map pages after migration") so it shouldn't have any conflicts.

I guess I should have mentioned that in a cover letter.
