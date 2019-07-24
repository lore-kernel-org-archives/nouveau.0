From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] mm/hmm: replace hmm_update with mmu_notifier_range
Date: Wed, 24 Jul 2019 09:05:53 +0200
Message-ID: <20190724070553.GA2523@lst.de>
References: <20190723210506.25127-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190723210506.25127-1-rcampbell@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Christoph Hellwig <hch@lst.de>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

One comment on a related cleanup:

>  	list_for_each_entry(mirror, &hmm->mirrors, list) {
>  		int rc;
>  
> -		rc = mirror->ops->sync_cpu_device_pagetables(mirror, &update);
> +		rc = mirror->ops->sync_cpu_device_pagetables(mirror, nrange);
>  		if (rc) {
> -			if (WARN_ON(update.blockable || rc != -EAGAIN))
> +			if (WARN_ON(mmu_notifier_range_blockable(nrange) ||
> +			    rc != -EAGAIN))
>  				continue;
>  			ret = -EAGAIN;
>  			break;

This magic handling of error seems odd.  I think we should merge rc and
ret into one variable and just break out if any error happens instead
or claiming in the comments -EAGAIN is the only valid error and then
ignoring all others here.
