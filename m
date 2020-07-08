From: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH 0/5] mm/migrate: avoid device private invalidations
Date: Wed, 8 Jul 2020 18:48:03 +0530
Message-ID: <20200708131803.GB7902@in.ibm.com>
References: <20200706222347.32290-1-rcampbell@nvidia.com>
Reply-To: bharata@linux.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200706222347.32290-1-rcampbell@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: linux-rdma@vger.kernel.org, linux-mm@kvack.org, nouveau@lists.freedesktop.org, kvm-ppc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Mon, Jul 06, 2020 at 03:23:42PM -0700, Ralph Campbell wrote:
> The goal for this series is to avoid device private memory TLB
> invalidations when migrating a range of addresses from system
> memory to device private memory and some of those pages have already
> been migrated. The approach taken is to introduce a new mmu notifier
> invalidation event type and use that in the device driver to skip
> invalidation callbacks from migrate_vma_setup(). The device driver is
> also then expected to handle device MMU invalidations as part of the
> migrate_vma_setup(), migrate_vma_pages(), migrate_vma_finalize() process.
> Note that this is opt-in. A device driver can simply invalidate its MMU
> in the mmu notifier callback and not handle MMU invalidations in the
> migration sequence.

In the kvmppc secure guest usecase,

1. We ensure that we don't issue migrate_vma() calls for pages that have
already been migrated to the device side (which is actually secure memory
for us that is managed by Ultravisor firmware)

2. The page table mappings on the device side (secure memory) are managed
transparent to the kernel by the Ultravisor firmware.

Hence I assume that no specific action would be required by the kvmppc
usecase due to this patchset. In fact, we never registered for this
mmu notifier events.

Regards,
Bharata.
