From: Christoph Hellwig <hch@lst.de>
Subject: Re: ensure device private pages have an owner v2
Date: Thu, 19 Mar 2020 08:16:33 +0100
Message-ID: <20200319071633.GA32522@lst.de>
References: <20200316193216.920734-1-hch@lst.de> <20200319002849.GG20941@ziepe.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kvm-ppc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200319002849.GG20941@ziepe.ca>
Sender: kvm-ppc-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>, Bharata B Rao <bharata@linux.ibm.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Ben Skeggs <bskeggs@redhat.com>, Jerome Glisse <jglisse@redhat.com>, kvm-ppc@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-mm@kvack.org
List-Id: nouveau.vger.kernel.org

On Wed, Mar 18, 2020 at 09:28:49PM -0300, Jason Gunthorpe wrote:
> > Changes since v1:
> >  - split out the pgmap->owner addition into a separate patch
> >  - check pgmap->owner is set for device private mappings
> >  - rename the dev_private_owner field in struct migrate_vma to src_owner
> >  - refuse to migrate private pages if src_owner is not set
> >  - keep the non-fault device private handling in hmm_range_fault
> 
> I'm happy enough to take this, did you have plans for a v3?

I think the only open question is if merging 3 and 4 might make sense.
It's up to you if you want it resent that way or not.
