From: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v4 6/6] mm/migrate: remove range invalidation in
 migrate_vma_pages()
Date: Tue, 28 Jul 2020 16:19:40 -0300
Message-ID: <20200728191940.GB159104@nvidia.com>
References: <20200723223004.9586-1-rcampbell@nvidia.com>
 <20200723223004.9586-7-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <kvm-ppc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200723223004.9586-7-rcampbell@nvidia.com>
Sender: kvm-ppc-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: linux-rdma@vger.kernel.org, linux-mm@kvack.org, nouveau@lists.freedesktop.org, kvm-ppc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, Ben Skeggs <bskeggs@redhat.com>, Bharata B Rao <bharata@linux.ibm.com>
List-Id: nouveau.vger.kernel.org

On Thu, Jul 23, 2020 at 03:30:04PM -0700, Ralph Campbell wrote:
> When migrating the special zero page, migrate_vma_pages() calls
> mmu_notifier_invalidate_range_start() before replacing the zero page
> PFN in the CPU page tables. This is unnecessary since the range was
> invalidated in migrate_vma_setup() and the page table entry is checked
> to be sure it hasn't changed between migrate_vma_setup() and
> migrate_vma_pages(). Therefore, remove the redundant invalidation.

I don't follow this logic, the purpose of the invalidation is also to
clear out anything that may be mirroring this VA, and "the page hasn't
changed" doesn't seem to rule out that case?

I'm also not sure I follow where the zero page came from?

Jason
