From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/2] mm: handle multiple owners of device private pages
 in migrate_vma
Date: Mon, 16 Mar 2020 19:20:39 +0100
Message-ID: <20200316182039.GA24736@lst.de>
References: <20200316175259.908713-1-hch@lst.de> <20200316175259.908713-2-hch@lst.de> <20200316181707.GJ20941@ziepe.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kvm-ppc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200316181707.GJ20941@ziepe.ca>
Sender: kvm-ppc-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>, Bharata B Rao <bharata@linux.ibm.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Ben Skeggs <bskeggs@redhat.com>, Jerome Glisse <jglisse@redhat.com>, kvm-ppc@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-mm@kvack.org
List-Id: nouveau.vger.kernel.org

On Mon, Mar 16, 2020 at 03:17:07PM -0300, Jason Gunthorpe wrote:
> On Mon, Mar 16, 2020 at 06:52:58PM +0100, Christoph Hellwig wrote:
> > Add a new opaque owner field to struct dev_pagemap, which will allow
> > the hmm and migrate_vma code to identify who owns ZONE_DEVICE memory,
> > and refuse to work on mappings not owned by the calling entity.
> 
> Using a pointer seems like a good solution to me.
> 
> Is this a bug fix? What is the downside for migrate on pages it
> doesn't work? I'm not up to speed on migrate..

migrating private pages not owned by driver simply won't work, as
the device can't access it.  Even inside the same driver say
GPU A can't just migrate CPU B's memory.  In that sense it is
a bug fix for the rather unlikely case of using the experimental
nouveau with multiple GPUs, or in a power secure VM (if that is
even possible).
