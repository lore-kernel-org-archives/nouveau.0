From: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 00/16] mm/hmm/nouveau: THP mapping and migration
Date: Mon, 22 Jun 2020 09:39:47 -0300
Message-ID: <20200622123947.GC2590509@mellanox.com>
References: <20200619215649.32297-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200619215649.32297-1-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, Jun 19, 2020 at 02:56:33PM -0700, Ralph Campbell wrote:
> These patches apply to linux-5.8.0-rc1. Patches 1-3 should probably go
> into 5.8, the others can be queued for 5.9. Patches 4-6 improve the HMM
> self tests. Patch 7-8 prepare nouveau for the meat of this series which
> adds support and testing for compound page mapping of system memory
> (patches 9-11) and compound page migration to device private memory
> (patches 12-16). Since these changes are split across mm core, nouveau,
> and testing, I'm guessing Jason Gunthorpe's HMM tree would be appropriate.

You need to break this up into parts that go where they need to
go. Nouveau rc changes should go to DRM or some series needs to
explain the linkage

> Ralph Campbell (16):
>   mm: fix migrate_vma_setup() src_owner and normal pages
>   nouveau: fix migrate page regression
>   nouveau: fix mixed normal and device private page migration
>   mm/hmm: fix test timeout on slower machines
>   mm/hmm/test: remove redundant page table invalidate
>   mm/hmm: test mixed normal and device private migrations
>   nouveau: make nvkm_vmm_ctor() and nvkm_mmu_ptp_get() static
>   nouveau/hmm: fault one page at a time
>   mm/hmm: add output flag for compound page mapping
>   nouveau/hmm: support mapping large sysmem pages
>   hmm: add tests for HMM_PFN_COMPOUND flag
>   mm/hmm: optimize migrate_vma_setup() for holes

Order things so it is hmm, test, noeveau

>   mm: support THP migration to device private memory
>   mm/thp: add THP allocation helper
>   mm/hmm/test: add self tests for THP migration
>   nouveau: support THP migration to private memory

This is another series, you should split it even if it has to go
through the hmm tree

Jason
