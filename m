From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH] nouveau/hmm: fix nouveau_dmem_chunk allocations
Date: Thu, 23 Apr 2020 09:17:44 -0300
Message-ID: <20200423121744.GY11945@mellanox.com>
References: <20200421231107.30958-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200421231107.30958-1-rcampbell@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: nouveau@lists.freedesktop.org, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Tue, Apr 21, 2020 at 04:11:07PM -0700, Ralph Campbell wrote:
> In nouveau_dmem_init(), a number of struct nouveau_dmem_chunk are allocated
> and put on the dmem->chunk_empty list. Then in nouveau_dmem_pages_alloc(),
> a nouveau_dmem_chunk is removed from the list and GPU memory is allocated.
> However, the nouveau_dmem_chunk is never removed from the chunk_empty
> list nor placed on the chunk_free or chunk_full lists. This results
> in only one chunk ever being actually used (2MB) and quickly leads to
> migration to device private memory failures.
> 
> Fix this by having just one list of free device private pages and if no
> pages are free, allocate a chunk of device private pages and GPU memory.
> 
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_dmem.c | 304 +++++++++----------------
>  1 file changed, 112 insertions(+), 192 deletions(-)

Does this generate any conflicts with my series to rework
hmm_range_fault?

Jason
