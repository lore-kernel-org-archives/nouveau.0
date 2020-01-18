From: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH -next] drm/nouveau/kms/nv50: remove set but not unused
 variable 'nv_connector'
Date: Fri, 17 Jan 2020 19:19:00 -0500
Message-ID: <c99174eefb65688c3db3fc25ddec819a58dccc6a.camel@redhat.com>
References: <20200117033642.50656-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200117033642.50656-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>, bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch, alexander.deucher@amd.com, sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Fri, 2020-01-17 at 11:36 +0800, YueHaibing wrote:
> drivers/gpu/drm/nouveau/dispnv50/disp.c: In function nv50_pior_enable:
> drivers/gpu/drm/nouveau/dispnv50/disp.c:1672:28: warning:
>  variable nv_connector set but not used [-Wunused-but-set-variable]
> 
> commit ac2d9275f371 ("drm/nouveau/kms/nv50-: Store the
> bpc we're using in nv50_head_atom") left behind this.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 5fabe2b..a82b354 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -1669,7 +1669,6 @@ nv50_pior_enable(struct drm_encoder *encoder)
>  {
>  	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
>  	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
> -	struct nouveau_connector *nv_connector;
>  	struct nv50_head_atom *asyh = nv50_head_atom(nv_crtc->base.state);
>  	struct nv50_core *core = nv50_disp(encoder->dev)->core;
>  	u8 owner = 1 << nv_crtc->index;
> @@ -1677,7 +1676,6 @@ nv50_pior_enable(struct drm_encoder *encoder)
>  
>  	nv50_outp_acquire(nv_encoder);
>  
> -	nv_connector = nouveau_encoder_connector_get(nv_encoder);
>  	switch (asyh->or.bpc) {
>  	case 10: asyh->or.depth = 0x6; break;
>  	case  8: asyh->or.depth = 0x5; break;
-- 
Cheers,
	Lyude Paul
