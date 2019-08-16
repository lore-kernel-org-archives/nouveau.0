From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: turn hmm migrate_vma upside down v3
Date: Fri, 16 Aug 2019 14:23:26 -0300
Message-ID: <20190816172326.GI5398@ziepe.ca>
References: <20190814075928.23766-1-hch@lst.de>
 <20190816065141.GA6996@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190816065141.GA6996@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Fri, Aug 16, 2019 at 08:51:41AM +0200, Christoph Hellwig wrote:
> Jason,
> 
> are you going to look into picking this up?  Unfortunately there is
> a hole pile in this area still pending, including the kvmppc secure
> memory driver from Bharata that depends on the work.

Done,

Lets see if Dan will comment on the pagemap part (looks
straightforward to me), and then after we grab that I will declare
hmm.git non-rebasing and Bharata can build his series upon it.

As a reminder, please do not send hmm.git inside another pull request
to Linus without making it very clear in that cover letter and Cc'ing
me. Thanks.

Regards,
Jason
