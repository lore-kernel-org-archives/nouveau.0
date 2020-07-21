From: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH -next] drm/nouveau/kms/nvd9-: Fix file release memory
 leak
Date: Tue, 21 Jul 2020 11:50:20 -0400
Message-ID: <4e90a54c61e3ecb19802d7ea811c58a51ac457ed.camel@redhat.com>
References: <20200721151701.51412-1-weiyongjun1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20200721151701.51412-1-weiyongjun1@huawei.com>
Sender: kernel-janitors-owner@vger.kernel.org
To: Wei Yongjun <weiyongjun1@huawei.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
List-Id: nouveau.vger.kernel.org

Reviewed-by: Lyude Paul <lyude@redhat.com>

Thanks!

On Tue, 2020-07-21 at 15:17 +0000, Wei Yongjun wrote:
> When using single_open() for opening, single_release() should be
> used instead of seq_release(), otherwise there is a memory leak.
> 
> Fixes: 12885ecbfe62 ("drm/nouveau/kms/nvd9-: Add CRC support")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/crc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c
> b/drivers/gpu/drm/nouveau/dispnv50/crc.c
> index f17fb6d56757..4971a1042415 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
> @@ -706,6 +706,7 @@ static const struct file_operations
> nv50_crc_flip_threshold_fops = {
>  	.open = nv50_crc_debugfs_flip_threshold_open,
>  	.read = seq_read,
>  	.write = nv50_crc_debugfs_flip_threshold_set,
> +	.release = single_release,
>  };
>  
>  int nv50_head_crc_late_register(struct nv50_head *head)
> 
> 
> 
-- 
Cheers,
	Lyude Paul (she/her)
	Software Engineer at Red Hat
