From: Christoph Hellwig <hch@lst.de>
Subject: Re: turn hmm migrate_vma upside down v3
Date: Fri, 16 Aug 2019 08:51:41 +0200
Message-ID: <20190816065141.GA6996@lst.de>
References: <20190814075928.23766-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190814075928.23766-1-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Cc: Ralph Campbell <rcampbell@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Jason,

are you going to look into picking this up?  Unfortunately there is
a hole pile in this area still pending, including the kvmppc secure
memory driver from Bharata that depends on the work.

mm folks:  migrate.c is mostly a classic MM file except for the hmm
additions.  Do you want to also look over this or just let it pass?
