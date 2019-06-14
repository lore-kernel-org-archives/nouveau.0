From: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 05/22] mm: export alloc_pages_vma
Date: Thu, 13 Jun 2019 18:47:57 -0700
Message-ID: <d83280b5-8cca-3b28-1727-58a70648e2b9@nvidia.com>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-6-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613094326.24093-6-hch@lst.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Cc: linux-mm@kvack.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-nvdimm@lists.01.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On 6/13/19 2:43 AM, Christoph Hellwig wrote:
> noveau is currently using this through an odd hmm wrapper, and I plan

  "nouveau"

> to switch it to the real thing later in this series.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

Reviewed-by: John Hubbard <jhubbard@nvidia.com> 

thanks,
-- 
John Hubbard
NVIDIA

>  mm/mempolicy.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index 01600d80ae01..f9023b5fba37 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -2098,6 +2098,7 @@ alloc_pages_vma(gfp_t gfp, int order, struct vm_area_struct *vma,
>  out:
>  	return page;
>  }
> +EXPORT_SYMBOL_GPL(alloc_pages_vma);
>  
>  /**
>   * 	alloc_pages_current - Allocate pages.
> 
