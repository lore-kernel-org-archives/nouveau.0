From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/9] mm: turn migrate_vma upside down
Date: Thu, 1 Aug 2019 09:42:20 +0200
Message-ID: <20190801074220.GB16178@lst.de>
References: <20190729142843.22320-1-hch@lst.de> <20190729142843.22320-2-hch@lst.de> <33b82c28-74be-8767-08fa-e41516d11c7e@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <33b82c28-74be-8767-08fa-e41516d11c7e@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: Christoph Hellwig <hch@lst.de>, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>, Bharata B Rao <bharata@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Tue, Jul 30, 2019 at 06:46:25PM -0700, Ralph Campbell wrote:
>>   	for (i = 0; i < npages; i += c) {
>> -		unsigned long next;
>> -
>>   		c = min(SG_MAX_SINGLE_ALLOC, npages);
>> -		next = start + (c << PAGE_SHIFT);
>> -		ret = migrate_vma(&nouveau_dmem_migrate_ops, vma, start,
>> -				  next, src_pfns, dst_pfns, &migrate);
>> +		args.end = start + (c << PAGE_SHIFT);
>
> Since migrate_vma_setup() is called in a loop, either args.cpages and
> args.npages need to be cleared here or cleared in migrate_vma_setup().

I think clearing everything that is not used for argument passing in
migrate_vma_setup is a good idea.  I'll do that.

Btw, it seems like this was a fullquote just for the little comment
as far as I could tell from wading through it.  It would be very
appreciated to properly quote the replies.
