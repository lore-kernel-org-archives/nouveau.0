From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: Re: [PATCH v2] nouveau/hmm: map pages after migration
Date: Wed, 4 Mar 2020 17:27:52 +0100
Message-ID: <20200304162752.GB11616@lst.de>
References: <20200303010023.2983-1-rcampbell@nvidia.com> <20200303124229.GH26318@mellanox.com> <1f27ac9e-7ddf-6e4f-25ea-063ef6c78761@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1f27ac9e-7ddf-6e4f-25ea-063ef6c78761-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Mar 03, 2020 at 01:15:21PM -0800, Ralph Campbell wrote:
>>> +static inline struct nouveau_pfnmap_args *
>>> +nouveau_pfns_to_args(void *pfns)
>>
>> don't use static inline inside C files
>
> OK.
>
>>> +{
>>> +	struct nvif_vmm_pfnmap_v0 *p =
>>> +		container_of(pfns, struct nvif_vmm_pfnmap_v0, phys);
>>> +
>>> +	return container_of(p, struct nouveau_pfnmap_args, p);
>>
>> And this should just be
>>
>>     return container_of(pfns, struct nouveau_pfnmap_args, p.phys);
>
> Much simpler, thanks.

Btw, for the case where we just have an container_of wrapper I strongly
disagree with avoiding the inline - not inlining this would be stupid,
but unfortunately compilers often behave stupidly.  It also is a very
clear marker.
