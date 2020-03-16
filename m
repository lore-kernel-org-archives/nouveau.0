From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 1/2] mm: handle multiple owners of device private pages
 in migrate_vma
Date: Mon, 16 Mar 2020 15:17:07 -0300
Message-ID: <20200316181707.GJ20941@ziepe.ca>
References: <20200316175259.908713-1-hch@lst.de>
 <20200316175259.908713-2-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kvm-ppc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200316175259.908713-2-hch@lst.de>
Sender: kvm-ppc-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Dan Williams <dan.j.williams@intel.com>, Bharata B Rao <bharata@linux.ibm.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Ben Skeggs <bskeggs@redhat.com>, Jerome Glisse <jglisse@redhat.com>, kvm-ppc@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-mm@kvack.org
List-Id: nouveau.vger.kernel.org

On Mon, Mar 16, 2020 at 06:52:58PM +0100, Christoph Hellwig wrote:
> Add a new opaque owner field to struct dev_pagemap, which will allow
> the hmm and migrate_vma code to identify who owns ZONE_DEVICE memory,
> and refuse to work on mappings not owned by the calling entity.

Using a pointer seems like a good solution to me.

Is this a bug fix? What is the downside for migrate on pages it
doesn't work? I'm not up to speed on migrate..

Jason
