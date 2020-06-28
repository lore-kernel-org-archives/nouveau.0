From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [PATCH v2] nouveau: fix page fault on device private memory
Date: Mon, 29 Jun 2020 08:40:22 +1000
Message-ID: <CACAvsv4Oho1pKzPU7er2Sed5qyy0d2JZKsNoHvrZhvhtBygPjg@mail.gmail.com>
References: <20200626210337.20089-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200626210337.20089-1-rcampbell@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: ML nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
List-Id: nouveau.vger.kernel.org

On Sat, 27 Jun 2020 at 07:04, Ralph Campbell <rcampbell@nvidia.com> wrote:
>
> If system memory is migrated to device private memory and no GPU MMU
> page table entry exists, the GPU will fault and call hmm_range_fault()
> to get the PFN for the page. Since the .dev_private_owner pointer in
> struct hmm_range is not set, hmm_range_fault returns an error which
> results in the GPU program stopping with a fatal fault.
> Fix this by setting .dev_private_owner appropriately.
>
> Fixes: 08ddddda667b ("mm/hmm: check the device private page owner in hmm_range_fault()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>
> ---
>
> This is based on Linux-5.8.0-rc2 and is for Ben Skeggs nouveau tree.
> It doesn't depend on any of the other nouveau/HMM changes I have
> recently posted.
>
> Resending to include stable@vger.org and adding Jason's reviewed-by.
Thanks Ralph,

I've got the patch locally, and will push it out later on today.

Ben.

>
>  drivers/gpu/drm/nouveau/nouveau_svm.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index ba9f9359c30e..6586d9d39874 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -562,6 +562,7 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
>                 .end = notifier->notifier.interval_tree.last + 1,
>                 .pfn_flags_mask = HMM_PFN_REQ_FAULT | HMM_PFN_REQ_WRITE,
>                 .hmm_pfns = hmm_pfns,
> +               .dev_private_owner = drm->dev,
>         };
>         struct mm_struct *mm = notifier->notifier.mm;
>         int ret;
> --
> 2.20.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
