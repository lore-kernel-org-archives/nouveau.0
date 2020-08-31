From: Jason Gunthorpe <jgg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] nouveau: fix the start/end range for migration
Date: Mon, 31 Aug 2020 08:51:17 -0300
Message-ID: <20200831115117.GU1152540@nvidia.com>
References: <20200827213744.14074-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200827213744.14074-1-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Aug 27, 2020 at 02:37:44PM -0700, Ralph Campbell wrote:
> The user level OpenCL code shouldn't have to align start and end
> addresses to a page boundary. That is better handled in the nouveau
> driver. The npages field is also redundant since it can be computed
> from the start and end addresses.
> 
> Signed-off-by: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This is for Ben Skegg's nouveau tree.
> 
> I have been working with Karol Herbst on the OpenCL mesa changes for
> nouveau which will be merged upstream soon.
> With or without those changes, the user visible effect of this patch
> only extends the range by one page (round up vs. round down to page
> boundary).
> 
>  drivers/gpu/drm/nouveau/nouveau_svm.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index 2df1c0460559..888aa0908c5a 100644
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -105,11 +105,14 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
>  	struct nouveau_cli *cli = nouveau_cli(file_priv);
>  	struct drm_nouveau_svm_bind *args = data;
>  	unsigned target, cmd, priority;
> -	unsigned long addr, end, size;
> +	unsigned long addr, end;
>  	struct mm_struct *mm;
>  
>  	args->va_start &= PAGE_MASK;
> -	args->va_end &= PAGE_MASK;
> +	args->va_end = ALIGN(args->va_end, PAGE_SIZE);
> +	/* If no end address is given, assume a single page. */
> +	if (args->va_end == 0)
> +		args->va_end = args->va_start + PAGE_SIZE;

That is really weird, how is it useful for the kernel to map a region
of unknown size and alignment to the GPU?

Jason
