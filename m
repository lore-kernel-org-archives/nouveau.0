From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: ensure device private pages have an owner v2
Date: Wed, 18 Mar 2020 21:28:49 -0300
Message-ID: <20200319002849.GG20941@ziepe.ca>
References: <20200316193216.920734-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kvm-ppc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200316193216.920734-1-hch@lst.de>
Sender: kvm-ppc-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Dan Williams <dan.j.williams@intel.com>, Bharata B Rao <bharata@linux.ibm.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Ben Skeggs <bskeggs@redhat.com>, Jerome Glisse <jglisse@redhat.com>, kvm-ppc@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-mm@kvack.org
List-Id: nouveau.vger.kernel.org

On Mon, Mar 16, 2020 at 08:32:12PM +0100, Christoph Hellwig wrote:
> When acting on device private mappings a driver needs to know if the
> device (or other entity in case of kvmppc) actually owns this private
> mapping.  This series adds an owner field and converts the migrate_vma
> code over to check it.  I looked into doing the same for
> hmm_range_fault, but as far as I can tell that code has never been
> wired up to actually work for device private memory, so instead of
> trying to fix some unused code the second patch just remove the code.
> We can add it back once we have a working and fully tested code, and
> then should pass the expected owner in the hmm_range structure.
> 
> Changes since v1:
>  - split out the pgmap->owner addition into a separate patch
>  - check pgmap->owner is set for device private mappings
>  - rename the dev_private_owner field in struct migrate_vma to src_owner
>  - refuse to migrate private pages if src_owner is not set
>  - keep the non-fault device private handling in hmm_range_fault

I'm happy enough to take this, did you have plans for a v3?

Thanks,
Jason
