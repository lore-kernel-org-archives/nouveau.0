From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH hmm 5/5] mm/hmm: remove the customizable pfn format from
 hmm_range_fault
Date: Wed, 29 Apr 2020 19:41:27 -0300
Message-ID: <20200429224127.GB3824@ziepe.ca>
References: <5-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com>
 <ec276ac2-a346-5728-4ac6-9c9bd9ffcd41@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ec276ac2-a346-5728-4ac6-9c9bd9ffcd41@amd.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felix Kuehling <felix.kuehling@amd.com>
Cc: linux-mm@kvack.org, Ralph Campbell <rcampbell@nvidia.com>, "Yang, Philip" <Philip.Yang@amd.com>, Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>, intel-gfx@lists.freedesktop.org, =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Wed, Apr 22, 2020 at 01:52:32PM -0400, Felix Kuehling wrote:
> [+Philip Yang]
> 
> Am 2020-04-21 um 8:21 p.m. schrieb Jason Gunthorpe:
> > From: Jason Gunthorpe <jgg@mellanox.com>
> >
> > Presumably the intent here was that hmm_range_fault() could put the data
> > into some HW specific format and thus avoid some work. However, nothing
> > actually does that, and it isn't clear how anything actually could do that
> > as hmm_range_fault() provides CPU addresses which must be DMA mapped.
> >
> > Perhaps there is some special HW that does not need DMA mapping, but we
> > don't have any examples of this, and the theoretical performance win of
> > avoiding an extra scan over the pfns array doesn't seem worth the
> > complexity. Plus pfns needs to be scanned anyhow to sort out any
> > DEVICE_PRIVATE pages.
> >
> > This version replaces the uint64_t with an usigned long containing a pfn
> > and fix flags. On input flags is filled with the HMM_PFN_REQ_* values, on
> > successful output it is filled with HMM_PFN_* values, describing the state
> > of the pages.
> >
> > amdgpu is simple to convert, it doesn't use snapshot and doesn't use
> > per-page flags.
> >
> > nouveau uses only 16 hmm_pte entries at most (ie fits in a few cache
> > lines), and it sweeps over its pfns array a couple of times anyhow.
> >
> > Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Hi Jason,
> 
> I pointed out a typo in the documentation inline. Other than that, the
> series is
> 
> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> 
> I'll try to build it and run some basic tests later.

Got it, thanks! Let me know if there are problems

Jason
