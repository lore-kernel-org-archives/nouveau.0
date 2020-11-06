From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v3 1/6] mm/thp: add prep_transhuge_device_private_page()
Date: Fri, 6 Nov 2020 08:55:54 +0100
Message-ID: <20201106075554.GA31341@lst.de>
References: <20201106005147.20113-1-rcampbell@nvidia.com> <20201106005147.20113-2-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20201106005147.20113-2-rcampbell@nvidia.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: linux-mm@kvack.org, nouveau@lists.freedesktop.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Yang Shi <yang.shi@linux.alibaba.com>, Ben Skeggs <bskeggs@redhat.com>, Shuah Khan <shuah@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
List-Id: nouveau.vger.kernel.org

On Thu, Nov 05, 2020 at 04:51:42PM -0800, Ralph Campbell wrote:
> +extern void prep_transhuge_device_private_page(struct page *page);

No need for the extern.

> +static inline void prep_transhuge_device_private_page(struct page *page)
> +{
> +}

Is the code to call this even reachable if THP support is configured
out?  If not just declaring it unconditionally and letting dead code
elimination do its job might be a tad cleaner.

> +void prep_transhuge_device_private_page(struct page *page)

I think a kerneldoc comment explaining what this function is useful for
would be helpful.
