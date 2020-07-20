From: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 2/5] mm/migrate: add a direction parameter to
 migrate_vma
Date: Mon, 20 Jul 2020 16:59:43 -0300
Message-ID: <20200720195943.GH2021234@nvidia.com>
References: <20200713172149.2310-1-rcampbell@nvidia.com>
 <20200713172149.2310-3-rcampbell@nvidia.com>
 <20200720183643.GA3028737@nvidia.com>
 <2e775a5d-9d62-de52-6799-3bbb09c88c5a@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <kvm-ppc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2e775a5d-9d62-de52-6799-3bbb09c88c5a@nvidia.com>
Sender: kvm-ppc-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: linux-rdma@vger.kernel.org, linux-mm@kvack.org, nouveau@lists.freedesktop.org, kvm-ppc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, Ben Skeggs <bskeggs@redhat.com>, Bharata B Rao <bharata@linux.ibm.com>
List-Id: nouveau.vger.kernel.org

On Mon, Jul 20, 2020 at 12:54:53PM -0700, Ralph Campbell wrote:
> > > diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> > > index 3e546cbf03dd..620f2235d7d4 100644
> > > +++ b/include/linux/migrate.h
> > > @@ -180,6 +180,11 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
> > >   	return (pfn << MIGRATE_PFN_SHIFT) | MIGRATE_PFN_VALID;
> > >   }
> > > +enum migrate_vma_direction {
> > > +	MIGRATE_VMA_FROM_SYSTEM,
> > > +	MIGRATE_VMA_FROM_DEVICE_PRIVATE,
> > > +};
> > 
> > I would have guessed this is more natural as _FROM_DEVICE_ and
> > TO_DEVICE_ ?
> 
> The caller controls where the destination memory is allocated so it isn't
> necessarily device private memory, it could be from system to system.
> The use case for system to system memory migration is for hardware
> like ARM SMMU or PCIe ATS where a single set of page tables is shared by
> the device and a CPU process over a coherent system memory bus.
> Also many integrated GPUs in SOCs fall into this category too.

Maybe just TO/FROM_DEIVCE then? Even though the memory is not
DEVICE_PRIVATE it is still device owned pages right?

> So to me, it makes more sense to specify the direction based on the
> source location.

It feels strange because the driver doesn't always know or control the
source?

Jason
