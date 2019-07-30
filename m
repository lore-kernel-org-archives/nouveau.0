From: Christoph Hellwig <hch@lst.de>
Subject: Re: turn the hmm migrate_vma upside down
Date: Tue, 30 Jul 2019 15:09:44 +0200
Message-ID: <20190730130944.GA4566@lst.de>
References: <20190729142843.22320-1-hch@lst.de> <20190730123218.GA24038@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190730123218.GA24038@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@mellanox.com>
Cc: Christoph Hellwig <hch@lst.de>, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Tue, Jul 30, 2019 at 12:32:24PM +0000, Jason Gunthorpe wrote:
> Does this only impact hmm users, or does migrate.c have a broader
> usage?

migrate.c really contains two things:  the traditional page migration
code implementing aops ->migrate semantics, and migrate_vma and its
callbacks.  The first part is broader, the second part is hmm specific
(and should probably have been in a file of its own, given that it is
guarded off CONFIG_MIGRATE_VMA_HELPER).  This series only touched the
latter part.
