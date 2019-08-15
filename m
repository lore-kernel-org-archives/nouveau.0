From: Christoph Hellwig <hch@lst.de>
Subject: Re: turn hmm migrate_vma upside down v3
Date: Thu, 15 Aug 2019 15:28:45 +0200
Message-ID: <20190815132845.GC12036@lst.de>
References: <20190814075928.23766-1-hch@lst.de> <8e3b17ef-0b9e-6866-128f-403c8ba3a322@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8e3b17ef-0b9e-6866-128f-403c8ba3a322@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: Christoph Hellwig <hch@lst.de>, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>, Bharata B Rao <bharata@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Wed, Aug 14, 2019 at 05:09:54PM -0700, Ralph Campbell wrote:
> Some of the patches seem to have been mangled in the mail.

Weird, I never had such a an issue with git-send-email.

But to be covered for such weird cases I also posted a git url
for exactly the tree I've been working on.

> I was able to edit them and apply to Jason's tree
> https://github.com/jgunthorpe/linux.git mmu_notifier branch.
> So for the series you can add:
>
> Tested-by: Ralph Campbell <rcampbell@nvidia.com>

Thanks!
