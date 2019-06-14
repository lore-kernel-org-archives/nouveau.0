From: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH] drm/nouveau/dmem: missing mutex_lock in error path
Date: Thu, 13 Jun 2019 17:49:00 -0700
Message-ID: <1fc63655-985a-0d60-523f-00a51648dc38@nvidia.com>
References: <20190614001121.23950-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614001121.23950-1-rcampbell@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>, Jerome Glisse <jglisse@redhat.com>, David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: nouveau@lists.freedesktop.org, linux-mm@kvack.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On 6/13/19 5:11 PM, Ralph Campbell wrote:
> In nouveau_dmem_pages_alloc(), the drm->dmem->mutex is unlocked before
> calling nouveau_dmem_chunk_alloc().
> Reacquire the lock before continuing to the next page.
> 
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> ---
> 
> I found this while testing Jason Gunthorpe's hmm tree but this is
> independant of those changes. I guess it could go through
> David Airlie's tree for nouveau or Jason's tree.
> 

Hi Ralph,

btw, was this the fix for the crash you were seeing? It might be nice to
mention in the commit description, if you are seeing real symptoms.


>  drivers/gpu/drm/nouveau/nouveau_dmem.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 27aa4e72abe9..00f7236af1b9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -379,9 +379,10 @@ nouveau_dmem_pages_alloc(struct nouveau_drm *drm,
>  			ret = nouveau_dmem_chunk_alloc(drm);
>  			if (ret) {
>  				if (c)
> -					break;

Actually, the pre-existing code is a little concerning. Your change preserves
the behavior, but it seems questionable to be doing a "return 0" (whether
via the above break, or your change) when it's in this partially allocated
state. It's reporting success when it only allocates part of what was requested,
and it doesn't fill in the pages array either.



> +					return 0;
>  				return ret;
>  			}
> +			mutex_lock(&drm->dmem->mutex);
>  			continue;
>  		}
>  
> 

The above comment is about pre-existing potential problems, but your patch itself
looks correct, so:

Reviewed-by: John Hubbard <jhubbard@nvidia.com> 


thanks,
-- 
John Hubbard
NVIDIA
