From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 01/10] mm: turn migrate_vma upside down
Date: Sat, 17 Aug 2019 13:31:28 +0200
Message-ID: <20190817113128.GA23295@lst.de>
References: <20190814075928.23766-1-hch@lst.de> <20190814075928.23766-2-hch@lst.de> <20190816171101.GK5412@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190816171101.GK5412@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@mellanox.com>
Cc: Christoph Hellwig <hch@lst.de>, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Fri, Aug 16, 2019 at 05:11:07PM +0000, Jason Gunthorpe wrote:
> -	if (args->cpages)
> -		migrate_vma_prepare(args);
> -	if (args->cpages)
> -		migrate_vma_unmap(args);
> +	if (!args->cpages)
> +		return 0;
> +
> +	migrate_vma_prepare(args);
> +	migrate_vma_unmap(args);

I don't think this is ok.  Both migrate_vma_prepare and migrate_vma_unmap
can reduce args->cpages, including possibly to 0.
