From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/4] mm: simplify device private page handling in
 hmm_range_fault
Date: Wed, 18 Mar 2020 10:34:28 +0100
Message-ID: <20200318093428.GA6538@lst.de>
References: <20200316193216.920734-1-hch@lst.de> <20200316193216.920734-4-hch@lst.de> <7256f88d-809e-4aba-3c46-a223bd8cc521@nvidia.com> <20200317073454.GA5843@lst.de> <a8c5a33d-4c64-df74-2b98-26ddd5e6da00@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kvm-ppc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a8c5a33d-4c64-df74-2b98-26ddd5e6da00@nvidia.com>
Sender: kvm-ppc-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@ziepe.ca>, Dan Williams <dan.j.williams@intel.com>, Bharata B Rao <bharata@linux.ibm.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Ben Skeggs <bskeggs@redhat.com>, Jerome Glisse <jglisse@redhat.com>, kvm-ppc@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-mm@kvack.org
List-Id: nouveau.vger.kernel.org

On Tue, Mar 17, 2020 at 03:43:47PM -0700, Ralph Campbell wrote:
>> Obviously no driver cared for that so far.  Once we have test cases
>> for that and thus testable code we can add code to fault it in from
>> hmm_vma_handle_pte.
>>
>
> I'm OK with the series. I think I would have been less confused if I looked at
> patch 4 then 3.

I guess I could just merge 3 and 4 if it is too confusing otherwise.
