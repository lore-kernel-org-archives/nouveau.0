From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: hmm_range_fault related fixes and legacy API removal v2
Date: Fri, 5 Jul 2019 09:33:36 -0300
Message-ID: <20190705123336.GA31543@ziepe.ca>
References: <20190703220214.28319-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190703220214.28319-1-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>, linux-mm@kvack.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Wed, Jul 03, 2019 at 03:02:08PM -0700, Christoph Hellwig wrote:
> Hi Jérôme, Ben and Jason,
> 
> below is a series against the hmm tree which fixes up the mmap_sem
> locking in nouveau and while at it also removes leftover legacy HMM APIs
> only used by nouveau.

As much as I like this series, it won't make it to this merge window,
sorry.

Let's revisit it in a few weeks at rc1.

Regards,
Jason
