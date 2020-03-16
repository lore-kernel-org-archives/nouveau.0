From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 4/4] mm: check the device private page owner in
 hmm_range_fault
Date: Mon, 16 Mar 2020 16:49:20 -0300
Message-ID: <20200316194920.GA20010@ziepe.ca>
References: <20200316193216.920734-1-hch@lst.de>
 <20200316193216.920734-5-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kvm-ppc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200316193216.920734-5-hch@lst.de>
Sender: kvm-ppc-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Dan Williams <dan.j.williams@intel.com>, Bharata B Rao <bharata@linux.ibm.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Ben Skeggs <bskeggs@redhat.com>, Jerome Glisse <jglisse@redhat.com>, kvm-ppc@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-mm@kvack.org
List-Id: nouveau.vger.kernel.org

On Mon, Mar 16, 2020 at 08:32:16PM +0100, Christoph Hellwig wrote:
> Hmm range fault will succeed for any kind of device private memory,
> even if it doesn't belong to the calling entity.  While nouveau
> has some crude checks for that, they are broken because they assume
> nouveau is the only user of device private memory.  Fix this by
> passing in an expected pgmap owner in the hmm_range_fault structure.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Fixes: 4ef589dc9b10 ("mm/hmm/devmem: device memory hotplug using ZONE_DEVICE")
> ---
>  drivers/gpu/drm/nouveau/nouveau_dmem.c | 12 ------------
>  include/linux/hmm.h                    |  2 ++
>  mm/hmm.c                               | 10 +++++++++-
>  3 files changed, 11 insertions(+), 13 deletions(-)

Nice

Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>

Jason
