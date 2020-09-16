From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] mm: remove extra ZONE_DEVICE struct page refcount
Date: Wed, 16 Sep 2020 08:10:54 +0200
Message-ID: <20200916061054.GC7321@lst.de>
References: <20200914224509.17699-1-rcampbell@nvidia.com> <CAPcyv4gVJuWsOtejrKvWgByq=c1niwQOZ0HHYaSo4h6vc-Xw+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kvm-ppc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAPcyv4gVJuWsOtejrKvWgByq=c1niwQOZ0HHYaSo4h6vc-Xw+Q@mail.gmail.com>
Sender: kvm-ppc-owner@vger.kernel.org
To: Dan Williams <dan.j.williams@intel.com>
Cc: Ralph Campbell <rcampbell@nvidia.com>, Linux MM <linux-mm@kvack.org>, kvm-ppc@vger.kernel.org, nouveau@lists.freedesktop.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, Matthew Wilcox <willy@infradead.org>, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Yang Shi <yang.shi@linux.alibaba.com>, Paul Mackerras <paulus@ozlabs.org>, Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: nouveau.vger.kernel.org

On Mon, Sep 14, 2020 at 04:10:38PM -0700, Dan Williams wrote:
> You also need to fix up ext4_break_layouts() and
> xfs_break_dax_layouts() to expect ->_refcount is 0 instead of 1. This
> also needs some fstests exposure.

While we're at it, can we add a wait_fsdax_unref helper macro that hides
the _refcount access from the file systems?
